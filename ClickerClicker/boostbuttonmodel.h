#ifndef BOOSTBUTTONMODEL_H
#define BOOSTBUTTONMODEL_H

#include <QObject>

#include "gametimer.h"

class BoostButtonModel : public QObject
{
    Q_OBJECT

public:
    explicit BoostButtonModel(QObject *parent = nullptr);

    int             getActiveBoostTime();

    GameTimer *     getGameTimer();
    GameTimer *     getCooldownTimer();

    bool            getBoosting();

signals:

    void            changedBoostTime(int boostTime);

    void            changedGameTimer(GameTimer * timer);
    void            changedCooldownTimer(GameTimer * timer);

    void            changedBoosting(bool boosting);

    void            boostFinished();

public slots:

    void            setActiveBoostTime(int boostTime);

    void            setGameTimer(GameTimer * timer);
    void            setCooldownTimer(GameTimer * timer);

    void            setBoosting(bool boosting);

    void            boosting();

private:

    int             m_activeBoostTime;

    GameTimer *     m_gameTimer;
    GameTimer *     m_cooldownTimer;

    bool            m_boosting;

};

#endif // BOOSTBUTTONMODEL_H
