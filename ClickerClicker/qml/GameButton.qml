import QtQuick 2.0
import VPlay 2.0

Item {
    id: gameButton

    signal clicked
    signal pressed
    signal released

    property alias text: buttonText.text
    property int score
    property string currentColor: mouseArea.enabled ? "#f4d742" : "#cdcdcd"

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
        id: mouseArea

        anchors.fill: background

        onPressed: gameButton.pressed()
        onReleased: gameButton.released()
        onClicked: gameButton.clicked()
    }

    Timer {
        id: buttonCooldown

        interval: score * 100; running: false; repeat: false

        onRunningChanged: {
            mouseArea.enabled = true
            background.color = currentColor
        }
    }

    onClicked: {
        gameScene.addClick(score)
        buttonCooldown.start()
        mouseArea.enabled = false
        background.color = currentColor
    }

    onPressed: {
        opacity = 0.5
    }

    onReleased: {
        opacity = 1.0
    }
}
