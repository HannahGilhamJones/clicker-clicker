#include <QtTest>

#include "boostbuttonmodel.h"

class TestBoostButtonModel : public QObject
{
    Q_OBJECT

private slots:

    void initTestCase();
    void cleanupTestCase();

    void getActiveBoostTime();
    void changeActiveBoostTime();

    void checkBoosting();

private:

    BoostButtonModel * m_boostButtonModel;

};

void TestBoostButtonModel::initTestCase()
{
    m_boostButtonModel = new BoostButtonModel();
}

void TestBoostButtonModel::cleanupTestCase()
{
    delete m_boostButtonModel;
}

void TestBoostButtonModel::getActiveBoostTime()
{
    const int activeBoostTime = m_boostButtonModel->getActiveBoostTime();
    QVERIFY(activeBoostTime == 10);
}

void TestBoostButtonModel::changeActiveBoostTime()
{
    const int activeTime = 20;
    m_boostButtonModel->setActiveBoostTime(activeTime);

    QVERIFY(activeTime == m_boostButtonModel->getActiveBoostTime());
}

void TestBoostButtonModel::checkBoosting()
{
    const bool boosting = m_boostButtonModel->getBoosting();
    QVERIFY(!boosting);
}

#include "testboostbuttonmodel.moc"
