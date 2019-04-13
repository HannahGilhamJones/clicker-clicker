#include "tst_gamemanagersuite.h"

#include "gamemanager.h"

void GameManagerSuite::initTestCase()
{
}

void GameManagerSuite::cleanupTestCase()
{
}

void GameManagerSuite::gameScore()
{
    // Expectation: When we initalise a game manager (not on a game load),
    // we should have 0 points
    Q_ASSERT(GameManager::instance()->gameScore() == 0);
}

void GameManagerSuite::setGameScore()
{
    // Expectation: We should be able to set the game score to a number
    // and receive that number right back
    GameManager::instance()->setGameScore(400);
    Q_ASSERT(GameManager::instance()->gameScore() == 400);
}

void GameManagerSuite::updateGameScore()
{
    // Expectation : We can add and remove points from the score but,
    // the score should never go below 0

    QList<int> pointsToAdd = {0, 100, -200, 10, 346, -67};

    for (int points : pointsToAdd) {
        const int originalScore = GameManager::instance()->gameScore();
        GameManager::instance()->updateGameScore(points);
        const int newScore = GameManager::instance()->gameScore();

        qInfo() << "Started with " << originalScore << " added " << points;
        qInfo() << "Ended with " << newScore;

        Q_ASSERT(newScore >= 0);

        // Don't run the next assertion, if we had recieved a negative number
        // this assertion will fail but that is okay
        if (newScore == 0) {
            return;
        }

        Q_ASSERT(newScore == (originalScore + points));
    }

}
