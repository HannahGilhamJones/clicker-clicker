import QtQuick 2.12
import QtQuick.Controls 2.5

import GameTimer 1.0 as GameTimer

SceneBase {
    signal selectGameScene
    signal selectRestartGame
    signal selectAchievementsScene
    signal selectSettingsScene
    signal selectQuitGame

    property string elapsedTime

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

      Text {
          id: elapsedTimeText

          anchors.horizontalCenter: titleBackground.horizontalCenter
          anchors.top: titleBackground.bottom

          text: "You played for " + elapsedTime + " seconds"
      }

    }

    // Menu Options

    Column {
        anchors.centerIn: parent
        spacing: 5

      MenuButton {
          anchors.horizontalCenter: parent.horizontalCenter

          text: "Start Game"
          onClicked: {
              selectGameScene()
          }
      }

      MenuButton {
          anchors.horizontalCenter: parent.horizontalCenter

          text: "Restart Game"
          onClicked: selectRestartGame()
      }

      MenuButton {
          anchors.horizontalCenter: parent.horizontalCenter

          text: "Achievements"
          onClicked: selectAchievementsScene()
      }

      MenuButton {
          anchors.horizontalCenter: parent.horizontalCenter

          text: "Settings"
          onClicked: selectSettingsScene()
      }

      MenuButton {
          anchors.horizontalCenter: parent.horizontalCenter

          text: "Quit Game"
          onClicked: selectQuitGame()
      }
    }
}
