QT += testlib
QT -= gui

CONFIG += qt console warn_on depend_includepath testcase
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += \ 
    ..\src\boostbuttonmodel.cpp \
    ..\src\gametimer.cpp \
    testboostbuttonmodel.cpp \
    testgamebuttonmodel.cpp \
    ..\src\gamebuttonmodel.cpp \
    testRunner.cpp

HEADERS += \
    ..\src\boostbuttonmodel.h \
    ..\src\gametimer.h \
    ..\src\gamebuttonmodel.h

INCLUDEPATH += \
    ..\src
    ..\tests
