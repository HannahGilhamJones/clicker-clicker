#ifndef TST_GAMEMANAGERSUITE_H
#define TST_GAMEMANAGERSUITE_H

#include <QTest>

class GameManagerSuite : public QObject
{
    Q_OBJECT

private slots:

    void initTestCase();
    void cleanupTestCase();

    void test_case1();

};

#endif // TST_GAMEMANAGERSUITE_H
