import VPlay 2.0
import QtQuick 2.0

GameWindow {
    id: gameWindow

    property int numberofClicks : 0

    activeScene: scene

    screenWidth: 1136
    screenHeight: 640

    Scene {
        id: scene

        width: 480
        height: 320

        Rectangle {
            id: rectangle
            anchors.fill: scene.gameWindowAnchorItem
            color: "#cccccc"
        }

        Text {
            id: clicks

            anchors.horizontalCenter: scene.horizontalCenter
            anchors.top: scene.top

            text: "Clicks : " + numberofClicks
        }

        Item {

            id: moonContainer

            width: scene.width / 3
            height: width

            anchors.centerIn: scene

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
