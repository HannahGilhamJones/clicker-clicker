import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import GameButton 1.0

Item {
    id: gameButton

    signal clicked
    signal pressed
    signal released

    property alias text: buttonText.text
    property string currentColor: buttonMouseArea.enabled ? "#f4d742" : "#cdcdcd"

    property int initialScore

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

            text: "Add " + gameButtonModel.score

            anchors.centerIn: timerBar
        }

        //Amount
        Text {
            anchors.right: timerBar.right
            anchors.bottom: timerBar.bottom

            text: "Amount : " + gameButtonModel.amount
        }

        //Cost
        Text {
            anchors.right: timerBar.right
            anchors.top: timerBar.top

            text: "Cost : " + gameButtonModel.cost * amountToBuy.canBuy
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

            interval: gameButtonModel.cooldown; running: false; repeat: false

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

        property int canBuy : Math.floor(totalNumberofClicks / gameButtonModel.cost)
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
                amountToBuy.numberBuying = amountToBuy.canBuy
                gameScene.totalNumberofClicks -= gameButtonModel.cost * amountToBuy.numberBuying
                gameButtonModel.buyButton(amountToBuy.numberBuying)
            }
        }
    }

    ///////////////////////////////////////////////////////////////////////////
    //MODEL

    GameButtonModel {
        id: gameButtonModel

        Component.onCompleted: {
            setInitialScore(gameButton.initialScore)
            setAmount(1);
            setScore(gameButton.initialScore * amount)
            setCost(2.71828 * score)
            setCooldown(gameButton.initialScore * 100)
        }
    }

    ///////////////////////////////////////////////////////////////////////////
    //FUNCTIONS

    onClicked: {
        gameScene.addClick(gameButtonModel.score)
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
