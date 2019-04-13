#include "gamebuttonmodel.h"

#include <QDebug>
#include <QtMath>

#include "gamemanager.h"

GameButtonModel::GameButtonModel(QObject * parent) :
    QObject(parent),
    m_name(""),
    m_initialScore(0),
    m_amount(1),
    m_costToAutomate(0),
    m_elapsedTime(0)
{
    this->updateScore();
    this->updateCost();
    this->updateCooldown();

    connect(GameManager::instance(), &GameManager::gameScoreChanged, this, [ = ]() {
        this->amountToBuy();
        emit this->amountToBuyChanged();
    });
}

GameButtonModel *GameButtonModel::qmlAttachedProperties(QObject *object)
{
    return new GameButtonModel(object);
}

QString GameButtonModel::name() const
{
    return m_name;
}

int GameButtonModel::cost() const
{
    return m_cost;
}

int GameButtonModel::initialScore() const
{
    return m_initialScore;
}

int GameButtonModel::score() const
{
    return m_score;
}

int GameButtonModel::amount() const
{
    return m_amount;
}

int GameButtonModel::cooldown() const
{
    return m_cooldown;
}

int GameButtonModel::costToAutomate() const
{
    return m_costToAutomate;
}

int GameButtonModel::elapsedTime() const
{
    return m_elapsedTime;
}

void GameButtonModel::saveButton() const
{

}

void GameButtonModel::setName(const QString &name)
{
    if(name != m_name)
    {
        m_name = name;
        emit this->nameChanged(m_name);
    }
}

void GameButtonModel::setCost(int cost)
{
    if(cost != m_cost)
    {
        m_cost = cost;
        emit this->costChanged(m_cost);
    }
}

void GameButtonModel::setInitialScore(int initialScore)
{
    if(initialScore != m_initialScore)
    {
        m_initialScore = initialScore;
        this->updateScore();
        this->updateCooldown();

        emit this->initialScoreChanged(m_initialScore);
    }
}

void GameButtonModel::setScore(int score)
{
    if(score != m_score)
    {
        m_score = score;
        this->updateCost();

        emit this->scoreChanged(m_score);
    }
}

void GameButtonModel::setAmount(int amount)
{
    if(amount > 0)
    {
        m_amount += amount;

        this->updateScore();
        this->updateCost();

        emit this->amountChanged(m_amount);
    }
}

void GameButtonModel::setCooldown(int cooldown)
{
    if(cooldown != m_cooldown)
    {
        m_cooldown = cooldown;
        emit this->cooldownChanged(m_cooldown);
    }
}

void GameButtonModel::setCostToAutomate(int costToAutomate)
{
    if(costToAutomate != m_costToAutomate)
    {
        m_costToAutomate = costToAutomate;
        emit this->costToAutomateChanged(m_costToAutomate);
    }
}

void GameButtonModel::setElapsedTime(int elapsedTime)
{
    if(elapsedTime != m_elapsedTime)
    {
        m_elapsedTime = elapsedTime;
        emit this->elapsedTimeChanged(m_elapsedTime);
    }
}

int GameButtonModel::amountToBuy() const
{
    if (GameManager::instance()->gameScore() == 0) {
        return 0;
    }

    return qFloor(GameManager::instance()->gameScore() / m_cost);
}

void GameButtonModel::buyButton(int amount)
{
    if(amount > 0)
    {
        GameManager::instance()->updateGameScore(-(m_cost * amount));

        this->setAmount(amount);
        this->setScore(m_initialScore * m_amount);
        this->setCost(3 * m_score);
    }
}

void GameButtonModel::updateScore()
{
    this->setScore(m_initialScore * m_amount);
}

void GameButtonModel::updateCooldown()
{
    this->setCooldown(m_initialScore * 100);
}

void GameButtonModel::updateCost()
{
    this->setCost(3 * m_score);
}
