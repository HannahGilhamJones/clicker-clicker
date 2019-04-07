#include "boostbuttonmodel.h"

BoostButtonModel::BoostButtonModel(QObject * parent) :
    QObject(parent),
    m_activeBoostTime(10),
    m_gameTimer(nullptr),
    m_cooldownTimer(nullptr),
    m_boosting(false)
{
}

int BoostButtonModel::getActiveBoostTime()
{
    return m_activeBoostTime;
}

GameTimer * BoostButtonModel::getGameTimer()
{
    return m_gameTimer;
}

GameTimer * BoostButtonModel::getCooldownTimer()
{
    return m_cooldownTimer;
}

bool BoostButtonModel::getBoosting()
{
    return m_boosting;
}

void BoostButtonModel::setActiveBoostTime(int boostTime)
{
    if(boostTime != m_activeBoostTime)
    {
        m_activeBoostTime = boostTime;
        emit this->changedBoostTime(m_activeBoostTime);
    }
}

void BoostButtonModel::setGameTimer(GameTimer * timer)
{
    if(timer != m_gameTimer)
    {
        m_gameTimer = timer;
        emit this->changedGameTimer(m_gameTimer);
    }
}

void BoostButtonModel::setCooldownTimer(GameTimer * timer)
{
    if(timer != m_cooldownTimer)
    {
        m_cooldownTimer = timer;
        emit this->changedCooldownTimer(m_cooldownTimer);
    }
}

void BoostButtonModel::setBoosting(bool boosting)
{
    if(boosting != m_boosting)
    {
        m_boosting = boosting;
        emit this->changedBoosting(m_boosting);
    }
}

void BoostButtonModel::boosting()
{
    /*
     * Set boosting to be true
     * Start the timer on the cooldown timer
     */
}
