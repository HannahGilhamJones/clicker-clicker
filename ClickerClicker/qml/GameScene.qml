import VPlay 2.0
import QtQuick 2.0

SceneBase {
    id: gameScene

    signal returntoMenu

    property int totalNumberofClicks : 0

    Text {
        id: totalClicksText

        anchors.horizontalCenter: gameScene.horizontalCenter
        anchors.top: gameScene.top

        text: "Clicks : " + totalNumberofClicks
    }

    Column {
        id: leftColumn

        anchors.verticalCenter: gameScene.verticalCenter
        anchors.left: gameScene.left

        width: gameScene.width * 0.3
        spacing: 10

        Repeater {
            model: 3

            GameButton {

                initialScore: {
                    if(index == 0)
                    {
                        initialScore = (index + 1) * 5
                    }
                    else
                    {
                        initialScore = (index * 10) * 3
                    }
                }
            }
        }
    }

    Column {
        id: rightColumn

        anchors.verticalCenter: gameScene.verticalCenter
        anchors.right: gameScene.right

        width: gameScene.width * 0.3

        spacing: 10

        Repeater {
            model: 3

            GameButton {
                initialScore: {
                    if(index == 0)
                    {
                        initialScore = (index + 100) * 2
                    }
                    else
                    {
                        initialScore = (index * 5) * 100
                    }
                }
            }
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

    ////////////////////////////////////////////////////////

    function addClick(score)
    {
        totalNumberofClicks += score
    }
}
