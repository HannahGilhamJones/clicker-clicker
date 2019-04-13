#include "tst_gamemanagersuite.h"

#include "gamemanager.h"

void GameManagerSuite::initTestCase()
{
    m_gameManager = new GameManager();
}

void GameManagerSuite::cleanupTestCase()
{
    m_gameManager->deleteLater();
}

void GameManagerSuite::gameScore()
{
    // Expectation: When we initalise a game manager (not on a game load),
    // we should have 0 points
    Q_ASSERT(m_gameManager->gameScore() == 0);
}

void GameManagerSuite::setGameScore()
{
    // Expectation: We should be able to set the game score to a number
    // and receive that number right back
    m_gameManager->setGameScore(400);
    Q_ASSERT(m_gameManager->gameScore() == 400);
}

void GameManagerSuite::updateGameScore()
{
    // Expectation : We can add and remove points from the score but,
    // the score should never go below 0

    QList<int> pointsToAdd = {0, 100, -200, 10, 346, -67};

    for (int points : pointsToAdd) {
        const int originalScore = m_gameManager->gameScore();
        m_gameManager->updateGameScore(points);
        const int newScore = m_gameManager->gameScore();

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
