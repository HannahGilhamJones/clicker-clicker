import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
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

    ///////////////////////////////////////////////////////////////////////////
    //MAIN BUTTON

    ProgressBar {
        id: timerBar

        anchors.centerIn: parent
        height: parent.height
        width: parent.width

        value: 0
        clip: true

        background: Rectangle {
            radius: 5
            color: "#f4d742"
            border.color: "#cdcdcd"
            border.width: 2
        }

        //Background
        LinearGradient {
            anchors.fill: timerBar

            start: Qt.point(0, 0)
            end: Qt.point(timerBar.width, 0)

            source: timerBar

            gradient : Gradient {
                GradientStop { position: 0.0; color: "#f4d742" }
                GradientStop { id: timerGrad; position: 0.5; color: Qt.lighter("#f4d742", 2) }
                GradientStop { position: 1.0; color: "#cdcdcd" }
            }
            PropertyAnimation {
                id: buttonCooldownAnimation

                target: timerGrad
                property: "position"
                from: 0.0
                to: 1.0
                duration: buttonCooldown.interval
            }
        }

        //Name of the button
        Text {
            id: buttonText

            anchors.centerIn: timerBar
        }

        //Amount
        Text {
            anchors.right: timerBar.right
            anchors.bottom: timerBar.bottom

            text: "Amount : " + gameButton.amount
        }

        //Cost
        Text {
            anchors.right: timerBar.right
            anchors.top: timerBar.top

            text: "Cost : " + gameButton.cost * amountToBuy.canBuy
        }

        MouseArea {
            id: buttonMouseArea

            anchors.fill: timerBar

            onPressed: gameButton.pressed()
            onReleased: gameButton.released()
            onClicked: gameButton.clicked()
        }


        //Button cooldown
        Timer {
            id: buttonCooldown

            property int startTime

            interval: initialScore * 100; running: false; repeat: false

            onRunningChanged: {
                buttonMouseArea.enabled = true
                buttonCooldown.running ? buttonCooldownAnimation.running = true :
                                         buttonCooldownAnimation.running = false
            }
        }
    }

    ///////////////////////////////////////////////////////////////////////////
    //BUYING OPTION

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

    ///////////////////////////////////////////////////////////////////////////
    //MODEL

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

    ///////////////////////////////////////////////////////////////////////////
    //FUNCTIONS

    onClicked: {
        gameScene.addClick(score)
        buttonCooldown.start()
        buttonMouseArea.enabled = false
    }

    onPressed: {
        opacity = 0.5
    }

    onReleased: {
        opacity = 1.0
    }
}
