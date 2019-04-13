import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import GameButtonModel 1.0

Item {
    id: root

    anchors.horizontalCenter: parent.horizontalCenter

    width: parent.width - 50
    height: 50

    ///////////////////////////////////////////////////////////////////////////
    //MAIN BUTTON

    Rectangle {
        id: timerBar
        anchors.centerIn: parent
        anchors.fill: parent

        radius: 5
        color: "#f4d742"

        Rectangle {
            id: timerCooldown
            height: parent.height
            width: 0
            radius: parent.radius
        }

        LinearGradient {
            anchors.fill: timerCooldown

            start: Qt.point(0, 0)
            end: Qt.point(timerCooldown.width, 0)

            source: timerCooldown

            gradient : Gradient {
                GradientStop { position: 0; color: "#fcdb00" }
                GradientStop { position: 1; color: "#fff8c8" }
            }
        }
    }

    PropertyAnimation{
        id: buttonCooldownAnimation

        target: timerCooldown
        property: "width"
        from: 0
        to: timerBar.width
        duration: buttonCooldown.interval
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
