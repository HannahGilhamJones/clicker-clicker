import VPlay 2.0
import QtQuick 2.0

SceneBase {
    id: gameScene

    property int numberofClicks : 0

    Text {
        id: clicks

        anchors.horizontalCenter: gameScene.horizontalCenter
        anchors.top: gameScene.top

        text: "Clicks : " + numberofClicks
    }

    Item {

        id: moonContainer

        width: gameScene.width / 3
        height: width

        anchors.centerIn: gameScene

        Image {
            id: moon

            anchors.fill: moonContainer

            source: "qrc:/Moon.svg"

            MouseArea {
                id: clickableMouseArea

                anchors.fill: moon

                onClicked: addClick()
            }
        }
    }

    Button {
       text: "Back"
       anchors.right: gameScene.gameWindowAnchorItem.right
       anchors.rightMargin: 10
       anchors.top: gameScene.gameWindowAnchorItem.top
       anchors.topMargin: 10
       onClicked: returntoMenu()
     }

    Timer {
        id: timer

        interval: 1000; running: true; repeat: true

        onTriggered: addClick()
    }

    function addClick()
    {
        ++numberofClicks
    }
}
