#include "gamebuttonmodel.h"


GameButtonModel::GameButtonModel(QObject * parent) :
    QObject(parent),
    m_name(""),
    m_cost(0),
    m_initialScore(0),
    m_amount(0),
    m_cooldown(0),
    m_costToAutomate(0),
    m_elapsedTime(0)
{
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
        emit this->nameChanged(m_cost);
    }
}

void GameButtonModel::setInitialScore(int initialScore)
{
    if(initialScore != m_initialScore)
    {
        m_initialScore = initialScore;
        emit this->nameChanged(m_initialScore);
    }
}

void GameButtonModel::setScore(int score)
{
    if(score != m_score)
    {
        m_score = score;
        emit this->nameChanged(m_score);
    }
}

void GameButtonModel::setAmount(int amount)
{
    if(amount != m_amount)
    {
        m_amount = amount;
        emit this->nameChanged(m_amount);
    }
}

void GameButtonModel::setCooldown(int cooldown)
{
    if(cooldown != m_cooldown)
    {
        m_cooldown = cooldown;
        emit this->nameChanged(m_cooldown);
    }
}

void GameButtonModel::setCostToAutomate(int costToAutomate)
{
    if(costToAutomate != m_costToAutomate)
    {
        m_costToAutomate = costToAutomate;
        emit this->nameChanged(m_costToAutomate);
    }
}

void GameButtonModel::setElapsedTime(int elapsedTime)
{
    if(elapsedTime != m_elapsedTime)
    {
        m_elapsedTime = elapsedTime;
        emit this->nameChanged(m_elapsedTime);
    }
}
