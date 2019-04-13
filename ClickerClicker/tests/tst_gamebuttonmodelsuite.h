#ifndef TST_GAMEBUTTONMODELSUITE_H
#define TST_GAMEBUTTONMODELSUITE_H

#include <QTest>

class GameButtonModel;

class GameButtonModelSuite : public QObject
{
    Q_OBJECT

private slots:

    void initTestCase();
    void cleanupTestCase();

    void test_case1();

private:

    GameButtonModel * m_gameButtonModel;

};

#endif // TST_GAMEBUTTONMODELSUITE_H
