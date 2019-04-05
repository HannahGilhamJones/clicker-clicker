#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "gamebuttonmodel.h"
#include "gametimer.h"
#include "settingsmodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<GameButtonModel>("GameButton", 1, 0, "GameButtonModel");
    qmlRegisterType<GameTimer>("GameTimer", 1, 0, "GameTimer");
    qmlRegisterType<SettingsModel>("SettingsModel", 1, 0, "SettingsModel");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
