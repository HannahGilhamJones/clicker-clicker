#ifndef TST_GAMETIMERSUITE_H
#define TST_GAMETIMERSUITE_H

#include <QTest>

class GameTimerSuite : public QObject
{
    Q_OBJECT

private slots:

    void initTestCase();
    void cleanupTestCase();

    void test_case1();

};

#endif // TST_GAMETIMERSUITE_H
