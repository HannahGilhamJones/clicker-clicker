import QtQuick 2.0

Rectangle {
  id: menuButton

  property int paddingHorizontal: 10
  property int paddingVertical: 5

  property alias text: buttonText.text

  signal clicked

  width: buttonText.width + paddingHorizontal * 2
  height: buttonText.height + paddingVertical * 2

  anchors.horizontalCenter: parent.horizontalCenter

  color: "#f4d742"

  Text {
    id: buttonText

    anchors.centerIn: menuButton
    font.pixelSize: 18
    color: "black"
  }

  MouseArea {
    id: mouseArea

    anchors.fill: menuButton
    hoverEnabled: true

    onClicked: menuButton.clicked()
    onPressed: menuButton.opacity = 0.5
    onReleased: menuButton.opacity = 1
  }
}
