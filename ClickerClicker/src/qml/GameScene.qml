import QtQuick 2.12
import QtQuick.Controls 2.5

import GameButtonModel 1.0

SceneBase {
    id: gameScene

    signal returntoMenu

    Text {
        id: totalScoreText

        anchors.horizontalCenter: gameScene.horizontalCenter
        anchors.top: gameScene.top

        text: "Score : " + GameManager.gameScore
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
                GameButtonModel.initialScore: index == 0 ? (index + 1) * 5 : (index * 10) * 3
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
                GameButtonModel.initialScore: index == 0 ? (index + 100) * 2 : (index * 5) * 100
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

            source: "qrc:/Moon.png"

            MouseArea {
                anchors.fill: moon

                onClicked: GameManager.updateGameScore(1)
            }
        }
    }

    Button {
       text: "Back"

       anchors.right: gameScene.right
       anchors.rightMargin: 10
       anchors.top: gameScene.top
       anchors.topMargin: 10

       onClicked: returntoMenu()
    }
}
