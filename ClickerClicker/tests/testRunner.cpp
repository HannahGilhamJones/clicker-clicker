#include <QTest>

#include "tst_boostbuttonmodelsuite.h"
#include "tst_gamebuttonmodelsuite.h"
#include "tst_gamemanagersuite.h"
#include "tst_gametimersuite.h"
#include "tst_settingssuite.h"

int main(int argc, char *argv[])
{
    int status = 0;
    {
        BoostButtonModelSuite suite;
        status |= QTest::qExec(&suite, argc, argv);

    }
    {
        GameButtonModelSuite suite;
        status |= QTest::qExec(&suite, argc, argv);
    }
    {
        GameManagerSuite suite;
        status |= QTest::qExec(&suite, argc, argv);
    }
    {
        GameTimerSuite suite;
        status |= QTest::qExec(&suite, argc, argv);
    }
    {
        SettingsSuite suite;
        status |= QTest::qExec(&suite, argc, argv);
    }

    return status;
}
