#ifndef GAMETIMER_H
#define GAMETIMER_H

#include <QElapsedTimer>
#include <QObject>

class GameTimer : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int elapsedTime MEMBER m_elapsedTime NOTIFY elapsedTimeChanged)
    Q_PROPERTY(bool running MEMBER m_running NOTIFY runningChanged)

public:
    explicit GameTimer(QObject *parent = nullptr);

signals:

    void elapsedTimeChanged(int elapsed);
    void runningChanged(bool running);

public slots:

    void start();
    void stop();

private:

    QElapsedTimer m_timer;
    int m_elapsedTime;
    bool m_running;
};

#endif // GAMETIMER_H
