import QtQuick 2.12
import QtQuick.Controls 2.5

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

       anchors.right: achievementScene.right
       anchors.rightMargin: 10
       anchors.top: achievementScene.top
       anchors.topMargin: 10

       onClicked: returntoMenu()
    }
}
