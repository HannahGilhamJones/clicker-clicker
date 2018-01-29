import QtQuick 2.0
import VPlay 2.0

import GameButton 1.0

Item {
    id: gameButton

    signal clicked
    signal pressed
    signal released

    property alias text: buttonText.text
    property string currentColor: buttonMouseArea.enabled ? "#f4d742" : "#cdcdcd"

    property int initialScore
    property int score : initialScore * amount
    property int cost : 2.71828 * score
    property int amount : 1

    anchors.horizontalCenter: parent.horizontalCenter

    width: parent.width - 50
    height: 50

    Rectangle {
        id: background
        anchors.fill: parent
        color: currentColor
    }

    Text {
        id: buttonText
        anchors.centerIn: background
    }

    MouseArea {
        id: buttonMouseArea

        anchors.fill: background

        onPressed: gameButton.pressed()
        onReleased: gameButton.released()
        onClicked: gameButton.clicked()
    }

    Rectangle {
        id: amountToBuy

        property int canBuy : Math.floor(totalNumberofClicks / gameButton.cost)
        property int numberBuying : 0
        property string currentColor: toBuyMouseArea.enabled ? "#f4d742" : "#cdcdcd"

        anchors.right: parent.left
        anchors.verticalCenter: parent.top

        width: 20
        height: 20
        radius: 10

        color: currentColor

        Text {
            anchors.centerIn: parent
            text : "x" + amountToBuy.canBuy
        }

        MouseArea {
            id: toBuyMouseArea

            anchors.fill: parent

            enabled: amountToBuy.canBuy > 0 ? true : false

            onClicked: {
                gameButtonModel.setAmount(amountToBuy.canBuy)
                gameButtonModel.setCost(gameButton.cost)
                gameButtonModel.setCurrentScore(gameButton.initialScore * gameButton.score)

                amountToBuy.numberBuying = amountToBuy.canBuy
                gameScene.totalNumberofClicks -= gameButton.cost
                gameButton.amount += amountToBuy.numberBuying
            }
        }
    }

    Text {
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        text: "Amount : " + gameButton.amount
    }

    Text {
        anchors.right: parent.right
        anchors.top: parent.top

        text: "Cost : " + gameButton.cost * amountToBuy.canBuy
    }

    Timer {
        id: buttonCooldown

        property int startTime

        interval: initialScore * 100; running: false; repeat: false

        onRunningChanged: {
            buttonMouseArea.enabled = true
            background.color = currentColor
        }
    }

    GameButtonModel {
        id: gameButtonModel


        onCurrentScoreChanged: {
            console.log("Score changed : " << score)
        }

        onInitialScoreChanged: {
            console.log("Initial score changed : " << initialScore)
        }

        onAmountChanged: {
            console.log("Amount changed : " << amount)
        }
    }

    /////////////////////////////////////////////////////////////////

    onClicked: {
        gameScene.addClick(score)
        buttonCooldown.start()
        buttonMouseArea.enabled = false
        background.color = currentColor
    }

    onPressed: {
        opacity = 0.5
    }

    onReleased: {
        opacity = 1.0
    }
}
