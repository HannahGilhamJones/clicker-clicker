#include "gamebuttonmodel.h"

#include <QDebug>

GameButtonModel::GameButtonModel(QObject * parent) :
    QObject(parent),
    m_name(""),
    m_initialScore(0),
    m_amount(1),
    m_costToAutomate(0),
    m_elapsedTime(0)
{
    m_score = m_initialScore * m_amount;
    m_cost = 3 * m_score;
    m_cooldown = m_initialScore * 100;
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
        m_score = m_initialScore * m_amount;
        m_cost = 3 * m_score;
        m_cooldown = m_initialScore * 100;
        emit this->initialScoreChanged(m_initialScore);
    }
}

void GameButtonModel::setScore(int score)
{
    if(score != m_score)
    {
        m_score = score;
        m_cost = 3 * m_score;
        m_cooldown = m_initialScore * 100;
        emit this->scoreChanged(m_score);
    }
}

void GameButtonModel::setAmount(int amount)
{
    if(amount > 0)
    {
        m_amount += amount;
        m_score = m_initialScore * m_amount;
        m_cost = 3 * m_score;
        m_cooldown = m_initialScore * 100;
        emit this->amountChanged(m_amount);
    }
}

void GameButtonModel::setCooldown(int cooldown)
{
    if(cooldown != m_cooldown)
    {
        m_cooldown = cooldown;
        m_score = m_initialScore * m_amount;
        m_cost = 3 * m_score;
        m_cooldown = m_initialScore * 100;
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

void GameButtonModel::buyButton(int amount)
{
    if(amount > 0)
    {
        this->setAmount(amount);
        this->setScore(m_initialScore * m_amount);
        this->setCost(3 * m_score);
    }
}
