import QtQuick 2.0
import VPlay 2.0

Item {
    id: gameButton

    signal clicked
    signal pressed
    signal released

    property alias text: buttonText.text
    property int score

    anchors.horizontalCenter: parent.horizontalCenter

    width: parent.width - 50
    height: 50

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#f4d742"
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

    onPressed: {
        opacity = 0.5
    }

    onReleased: {
        opacity = 1.0
    }
}
