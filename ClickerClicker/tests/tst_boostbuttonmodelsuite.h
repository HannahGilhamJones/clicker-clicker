#ifndef TST_BOOSTBUTTONMODEL_H
#define TST_BOOSTBUTTONMODEL_H

#include <QTest>

class BoostButtonModel;

class BoostButtonModelSuite : public QObject
{
    Q_OBJECT

private slots:

    void initTestCase();
    void cleanupTestCase();

    void test_case1();

private:

    BoostButtonModel * m_boostButtonModel;
};

#endif // TST_BOOSTBUTTONMODEL_H
