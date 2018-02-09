import VPlay 2.0
import QtQuick 2.0

SceneBase {
    id: settingsScene

    signal returntoMenu

    Text {
        anchors.horizontalCenter: settingsScene.horizontalCenter
        anchors.top: settingsScene.top

        text: "Settings"
    }

    Button {
       text: "Back"

       anchors.right: settingsScene.gameWindowAnchorItem.right
       anchors.rightMargin: 10
       anchors.top: settingsScene.gameWindowAnchorItem.top
       anchors.topMargin: 10

       onClicked: returntoMenu()
    }
}
