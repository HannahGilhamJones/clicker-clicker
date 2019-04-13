#include "gamemanager.h"

#include <QDebug>

GameManager::GameManager(QObject *parent) :
    QObject(parent),
    m_gameScore(0)
{
}

int GameManager::gameScore() const
{
    return m_gameScore;
}

void GameManager::setGameScore(int points) {
    if (m_gameScore == points) {
        return;
    }

    m_gameScore = points;

    emit this->gameScoreChanged();
}

void GameManager::updateGameScore(int points)
{
    m_gameScore += points;

    if (m_gameScore < 0){
        m_gameScore = 0;
    }

    emit this->gameScoreChanged();
}
