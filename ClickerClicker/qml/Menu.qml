import VPlay 2.0
import QtQuick 2.0

SceneBase {
  id:menuScene

  signal selectGameScene
  signal selectRestartGame
  signal selectQuitGame

  Text {
    anchors.horizontalCenter: parent.horizontalCenter
    y: 30
    font.pixelSize: 30
    color: "#e9e9e9"
    text: "MultiSceneMultiLevel"
  }

  Column {
    anchors.centerIn: parent

    Button {
      text: "Start Game"
      onClicked: selectGameScene()
    }

    Button {
      text: "Restart Game"
      onClicked: selectRestartGame()
    }

    Button {
        text: "Quit Game"
        onClicked: selectQuitGame()
    }
  }
}
