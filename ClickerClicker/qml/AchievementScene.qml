import VPlay 2.0
import QtQuick 2.0

SceneBase {
    id: achievementScene

    signal returntoMenu

    Text {
        anchors.horizontalCenter: achievementScene.horizontalCenter
        anchors.top: achievementScene.top

        text: "Achievements"
    }

    Button {
       text: "Back"

       anchors.right: achievementScene.gameWindowAnchorItem.right
       anchors.rightMargin: 10
       anchors.top: achievementScene.gameWindowAnchorItem.top
       anchors.topMargin: 10

       onClicked: returntoMenu()
    }
}
