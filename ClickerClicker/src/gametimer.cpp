#include "gametimer.h"

GameTimer::GameTimer(QObject *parent) :
    QObject(parent),
    m_timer(QElapsedTimer()),
    m_elapsedTime(0),
    m_running(false)
{
}

void GameTimer::start()
{
    /*
     * On starting the timer, we want to change running to be true
     * We want to start the elapsed timer
     * We want to emit this change
     */

    this->m_running = true;
    this->m_timer.start();

    emit this->runningChanged(m_running);
}

void GameTimer::stop()
{
    /*
     * On stopping the timer, we want to change running to be false
     * We want to emit the running change
     * We want to emit the elapsed time
     */

    this->m_running = false;
    this->m_elapsedTime = (m_timer.elapsed() / 1000);

    emit this->runningChanged(m_running);
    emit this->elapsedTimeChanged(m_elapsedTime);
}
