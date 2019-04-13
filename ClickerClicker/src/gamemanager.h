#ifndef GAMEMANAGER_H
#define GAMEMANAGER_H

#include <QObject>

class GameManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int gameScore READ gameScore WRITE setGameScore NOTIFY gameScoreChanged)

public:

    static GameManager * instance();

    int gameScore() const;
    void setGameScore(int points);

public slots:

    void updateGameScore(int points);

signals:

    void gameScoreChanged();

protected:

    explicit GameManager(QObject *parent = nullptr);

private:

    int m_gameScore;
};

#endif // GAMEMANAGER_H
