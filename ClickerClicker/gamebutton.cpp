#include "gamebutton.h"

GameButton::GameButton(QObject *parent) :
    QObject(parent),
    m_score(0)
{

}

int GameButton::getScore()
{
    return m_score;
}

void GameButton::setScore(int score)
{
    if(m_score != score)
    {
        m_score = score;
    }

    emit this->scoreChanged();
}
