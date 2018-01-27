#include "gamebuttonmodel.h"

#include <QDebug>

GameButtonModel::GameButtonModel(QObject *parent) :
    QObject(parent),
    m_amount(0),
    m_initialScore(0),
    m_score(0),
    m_cost(0)
{
    /*
     * NOTE: Never reach into QML
     */
}

int GameButtonModel::getCurrentScore()
{
    return m_score;
}

int GameButtonModel::getInitialScore()
{
    return m_initialScore;
}

int GameButtonModel::getAmount()
{
    return m_amount;
}

int GameButtonModel::getCost()
{
    return m_cost;
}

void GameButtonModel::setCurrentScore(int score)
{
    if(m_score != score)
    {
        m_score = score;
    }

    emit this->currentScoreChanged(m_score);
}

void GameButtonModel::setInitialScore(int initialScore)
{
    if(m_initialScore != initialScore)
    {
        m_initialScore = initialScore;
    }

    emit this->initialScoreChanged(m_initialScore);
}

void GameButtonModel::setAmount(int amount)
{
    if(amount != 0)
    {
        qInfo() << "The amount is : " << m_amount;

        m_amount += amount;

        qInfo() << "The new amount is : " << m_amount;
    }

    emit this->amountChanged(m_amount);
}

void GameButtonModel::setCost(int cost)
{
    if(m_cost != cost)
    {
        m_cost = cost;
    }

    emit this->costChanged(m_cost);
}
