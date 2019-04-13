import QtQuick 2.0

Image {
    id: moon

    source: "qrc:/Moon.png"

    MouseArea {
        anchors.fill: moon

        onClicked: GameManager.updateGameScore(1)
    }
}
