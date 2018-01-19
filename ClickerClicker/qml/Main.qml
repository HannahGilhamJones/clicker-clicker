import VPlay 2.0
import QtQuick 2.0

GameWindow {
    id: gameWindow

    property int numberofClicks : 0

    activeScene: scene

    screenWidth: 960
    screenHeight: 640

    Scene {
        id: scene

        width: 480
        height: 320

        Rectangle {
            id: rectangle
            anchors.fill: scene.gameWindowAnchorItem
            color: "blue"
        }

        Text {
            id: clicks

            anchors.horizontalCenter: scene.horizontalCenter
            anchors.top: scene.top

            text: "Clicks : " + numberofClicks
        }

        Rectangle {
            id: clickableObject

            anchors.centerIn: scene

            width: 200
            height: 200

            color: "red"

            MouseArea {
                id: clickableMouseArea

                anchors.fill: clickableObject

                onClicked: addClick()
            }
        }
    }

    function addClick()
    {
        ++numberofClicks
    }
}
