import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Clicker Clicker")

    Loader {
        id: loader
        anchors.fill: parent

        sourceComponent: MainMenuScene {
            anchors.fill: parent
            onSelectGameScene: loader.source = "GameScene.qml"
        }
    }
}
