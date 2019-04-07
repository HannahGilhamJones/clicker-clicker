#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

#include "global.h"
#include "style.h"

#include "gamebuttonmodel.h"
#include "gametimer.h"
#include "settingsmodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterUncreatableType<Style>("Style", 1, 0, "Style", "Style is an attached property");

    qmlRegisterUncreatableType<ComponentType>("ComponentType", 1, 0, "ComponentType", "Cannot create ComponentType in QML");
    qmlRegisterUncreatableType<ThemeType>("ThemeType", 1, 0, "ThemeType", "Cannot create ThemeType in QML");

    QQuickStyle::setStyle(":/components");
    QQuickStyle::setFallbackStyle("Material");

    qmlRegisterType<GameButtonModel>("GameButton", 1, 0, "GameButtonModel");
    qmlRegisterType<GameTimer>("GameTimer", 1, 0, "GameTimer");
    qmlRegisterType<SettingsModel>("SettingsModel", 1, 0, "SettingsModel");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
