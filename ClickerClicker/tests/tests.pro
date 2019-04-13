QT += testlib
QT -= gui

CONFIG += qt console warn_on depend_includepath testcase
CONFIG -= app_bundle

TEMPLATE = app

SOURCES +=  tst_gamebuttonmodelsuite.cpp \
    tst_boostbuttonmodelsuite.cpp \
    tst_gamemanagersuite.cpp \
    tst_settingssuite.cpp \
    tst_gametimersuite.cpp \
    testrunner.cpp \
    ../src/boostbuttonmodel.cpp \
    ../src/gametimer.cpp

HEADERS += tst_boostbuttonmodelsuite.h \
    tst_gamebuttonmodelsuite.h \
    tst_gamemanagersuite.h \
    tst_gametimersuite.h \
    tst_settingssuite.h \
    ../src/boostbuttonmodel.h \
    ../src/gametimer.h

INCLUDEPATH += ../src
