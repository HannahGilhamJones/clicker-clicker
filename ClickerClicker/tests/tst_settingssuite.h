#ifndef TST_SETTINGSSUITE_H
#define TST_SETTINGSSUITE_H

#include <QTest>

class SettingsSuite : public QObject
{
    Q_OBJECT

public:
    SettingsSuite();
    ~SettingsSuite();

private slots:
    void test_case1();

};

#endif // TST_SETTINGSSUITE_H
