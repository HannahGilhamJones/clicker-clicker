#include <QtTest>

#include "gamebuttonmodel.h"

class TestGameButtonModel : public QObject
{
    Q_OBJECT

private slots:

    void initTestCase();
    void cleanupTestCase();

private:

    GameButtonModel * m_gameButton;

};



void TestGameButtonModel::initTestCase()
{
    m_gameButton = new GameButtonModel();
}

void TestGameButtonModel::cleanupTestCase()
{
    delete m_gameButton;
}

#include "testgamebuttonmodel.moc"
