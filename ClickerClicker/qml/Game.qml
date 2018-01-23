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
            id: fiveButton

            text: "Add " + score
            initialScore: 5

            Rectangle {
                id: amountToBuy

                property int toBuy : Math.floor(numberofClicks / fiveButton.score)

                width: 20
                height: 20

                radius: 10

                anchors.right: parent.left
                anchors.verticalCenter: parent.top

                Text {
                    anchors.centerIn: parent
                    text : "x" + amountToBuy.toBuy;
                }

                MouseArea {
                    id: buy

                    anchors.fill: parent

                    onClicked: {
                        if(amountToBuy.toBuy > 0)
                        {
                            gameScene.numberofClicks = gameScene.numberofClicks - amountToBuy.toBuy
                            fiveButton.score = fiveButton.score * amountToBuy.toBuy
                        }
                    }
                }
            }
        }

        GameButton {
            text: "Add " + score
            initialScore: 10
        }

        GameButton {
            text: "Add " + score
            initialScore: 100
        }
    }

    Column {
        id: rightColumn

        anchors.verticalCenter: gameScene.verticalCenter

        anchors.right: gameScene.right

        width: gameScene.width * 0.3

        spacing: 10

        GameButton {
            text: "Add " + score
            initialScore: 200
        }

        GameButton {
            text: "Add " + score
            initialScore: 500
        }

        GameButton {
            text: "Add " + score
            initialScore: 1000
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
