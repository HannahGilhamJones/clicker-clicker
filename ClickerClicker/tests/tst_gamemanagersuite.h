#ifndef TST_GAMEMANAGERSUITE_H
#define TST_GAMEMANAGERSUITE_H

#include <QTest>

class GameManager;

class GameManagerSuite : public QObject
{
    Q_OBJECT

private slots:

    void initTestCase();
    void cleanupTestCase();

    void gameScore();
    void setGameScore();
    void updateGameScore();
};

#endif // TST_GAMEMANAGERSUITE_H
