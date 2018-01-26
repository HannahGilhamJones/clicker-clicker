#ifndef GAMEBUTTON_H
#define GAMEBUTTON_H

#include <QObject>

class GameButton : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int score READ getScore WRITE setScore NOTIFY scoreChanged)

public:
    explicit GameButton(QObject *parent = nullptr);

    int getScore();
    void setScore(int score);

signals:

    void scoreChanged();

public slots:

private:

    int m_score;
};

#endif // GAMEBUTTON_H
