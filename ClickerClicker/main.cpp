#include <QApplication>
#include <VPApplication>

#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "gamebuttonmodel.h"
#include "gametimer.h"
#include "settingsmodel.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    VPApplication vplay;

    qmlRegisterType<GameButtonModel>("GameButton", 1, 0, "GameButtonModel");
    qmlRegisterType<GameTimer>("GameTimer", 1, 0, "GameTimer");
    qmlRegisterType<SettingsModel>("SettingsModel", 1, 0, "SettingsModel");

    QQmlApplicationEngine engine;
    vplay.initialize(&engine);
    vplay.setMainQmlFileName(QStringLiteral("qml/Main.qml"));
    engine.load(QUrl(vplay.mainQmlFileName()));

    return app.exec();
}
