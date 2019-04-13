import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import GameButtonModel 1.0

Item {
    id: root

    GameButtonModel.initialScore: 0
    GameButtonModel.amount: 0

    property alias text: buttonText.text

    anchors.horizontalCenter: parent.horizontalCenter

    width: parent.width - 50
    height: 50

    ///////////////////////////////////////////////////////////////////////////
    //MAIN BUTTON

    Rectangle {
        id: timerBar

        anchors.centerIn: parent
        height: parent.height
        width: parent.width

        radius: 5
        color: "#f4d742"
        border.color: "#cdcdcd"
        border.width: 2

        //Background
        LinearGradient {
            anchors.fill: timerBar

            start: Qt.point(0, 0)
            end: Qt.point(this.width, 0)

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

            text: "Add " + root.GameButtonModel.score

        }

        //Amount
        Text {
            anchors.right: timerBar.right
            anchors.bottom: timerBar.bottom

            text: "Amount : " + root.GameButtonModel.amount
        }

        //Cost
        Text {
            anchors.right: timerBar.right
            anchors.top: timerBar.top

            text: "Cost : " + root.GameButtonModel.cost
        }

        MouseArea {
            id: buttonMouseArea

            anchors.fill: timerBar
            enabled: buttonCooldown.running ? false : true

            onClicked: {
                GameManager.updateGameScore(root.GameButtonModel.score)
                buttonCooldown.start()
            }
        }

        //Button cooldown
        Timer {
            id: buttonCooldown

            interval: root.GameButtonModel.cooldown; running: false; repeat: false

            onRunningChanged: {
                buttonCooldown.running ? buttonCooldownAnimation.running = true :
                                         buttonCooldownAnimation.running = false
            }
        }
    }

    ///////////////////////////////////////////////////////////////////////////
    //BUYING OPTION

    Rectangle {
        id: amountToBuy

        anchors.right: parent.left
        anchors.verticalCenter: parent.top

        width: 20
        height: 20
        radius: 10

        color: toBuyMouseArea.enabled ? "#f4d742" : "#cdcdcd"

        Text {
            anchors.centerIn: parent
            text : "x" + root.GameButtonModel.amountToBuy
        }

        MouseArea {
            id: toBuyMouseArea

            anchors.fill: parent

            enabled: root.GameButtonModel.amountToBuy > 0 ? true : false

            onClicked: root.GameButtonModel.buyButton(root.GameButtonModel.amountToBuy)
        }
    }
}
