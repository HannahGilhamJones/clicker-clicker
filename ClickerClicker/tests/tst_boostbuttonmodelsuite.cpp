#include "tst_boostbuttonmodelsuite.h"

#include "boostbuttonmodel.h"

void BoostButtonModelSuite::initTestCase()
{
    m_boostButtonModel = new BoostButtonModel();
}

void BoostButtonModelSuite::cleanupTestCase()
{
    m_boostButtonModel->deleteLater();
}

void BoostButtonModelSuite::test_case1()
{

}
