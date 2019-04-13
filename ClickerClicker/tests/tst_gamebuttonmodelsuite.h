#ifndef TST_GAMEBUTTONMODELSUITE_H
#define TST_GAMEBUTTONMODELSUITE_H

#include <QTest>

class GameButtonModelSuite : public QObject
{
    Q_OBJECT

private slots:

    void initTestCase();
    void cleanupTestCase();

    void test_case1();

};

#endif // TST_GAMEBUTTONMODELSUITE_H
