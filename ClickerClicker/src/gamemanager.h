#ifndef GAMEMANAGER_H
#define GAMEMANAGER_H

#include <QObject>

class GameManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int gameScore READ gameScore WRITE setGameScore NOTIFY gameScoreChanged)

public:

    explicit GameManager(QObject *parent = nullptr);

    int gameScore() const;
    void setGameScore(int points);

public slots:

    void updateGameScore(int points);

signals:

    void gameScoreChanged();

private:

    int m_gameScore;
};

#endif // GAMEMANAGER_H
