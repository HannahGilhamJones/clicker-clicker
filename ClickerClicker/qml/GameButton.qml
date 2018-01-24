import QtQuick 2.0
import VPlay 2.0

Item {
    id: gameButton

    signal clicked
    signal pressed
    signal released

    property alias text: buttonText.text
    property string currentColor: mouseArea.enabled ? "#f4d742" : "#cdcdcd"

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
        id: mouseArea

        anchors.fill: background

        onPressed: gameButton.pressed()
        onReleased: gameButton.released()
        onClicked: gameButton.clicked()
    }

    Rectangle {
        id: amountToBuy

        property int toBuy : Math.floor(numberofClicks / gameButton.cost)
        property int numberBuying : 0

        width: 20
        height: 20

        radius: 10

        anchors.right: parent.left
        anchors.verticalCenter: parent.top

        Text {
            anchors.centerIn: parent
            text : "x" + amountToBuy.toBuy;
        }

        MouseArea {
            id: buy

            anchors.fill: parent

            enabled: amountToBuy.toBuy > 0 ? true : false

            onClicked: {
                numberBuying = amountToBuy.toBuy

                gameScene.numberofClicks -= gameButton.cost;
                gameButton.amount += numberBuying
            }
        }
    }

    Timer {
        id: buttonCooldown

        interval: initialScore * 100; running: false; repeat: false

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
