import VPlay 2.0
import QtQuick 2.0

SceneBase {
  id:menuScene

  signal selectGameScene
  signal selectRestartGame
  signal selectQuitGame

  Rectangle {
      id: titleBackground

      anchors.horizontalCenter: parent.horizontalCenter
      anchors.top: parent.top

      width: titleText.width + 20
      height: titleText.height + 20

      color: "#f4d742"

    Text {
        id: titleText

        anchors.centerIn: titleBackground

        font.pixelSize: 30
        color: "#e9e9e9"
        text: "Clicker Clicker"
    }
  }

  // Menu Options

  Column {
      anchors.centerIn: parent
      spacing: 5

    Button {
        anchors.horizontalCenter: parent.horizontalCenter

        text: "Start Game"
        onClicked: selectGameScene()
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter

        text: "Restart Game"
        onClicked: selectRestartGame()
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter

        text: "Quit Game"
        onClicked: selectQuitGame()
    }
  }
}
