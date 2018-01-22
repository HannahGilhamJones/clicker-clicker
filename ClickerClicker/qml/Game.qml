import VPlay 2.0
import QtQuick 2.0

SceneBase {
    id: gameScene

    signal returntoMenu

    property int numberofClicks : 0
    property int padding : 10

    Text {
        id: clicks

        anchors.horizontalCenter: gameScene.horizontalCenter
        anchors.top: gameScene.top

        text: "Clicks : " + numberofClicks
    }

    Column {
        id: leftColumn

        anchors.verticalCenter: gameScene.verticalCenter

        anchors.left: gameScene.left

        width: gameScene.width * 0.3

        spacing: 10

        GameButton {
            text: "Add " + score
            score: 5
        }

        GameButton {
            text: "Add " + score
            score: 10
        }

        GameButton {
            id: hundredButton

            text: "Add " + score
            score: 100
        }
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

                onClicked: addClick(1)
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

        onTriggered: addClick(1)
    }

    function addClick(score)
    {
        numberofClicks += score
    }
}
