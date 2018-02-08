import VPlay 2.0
import QtQuick 2.0

import GameTimer 1.0

GameWindow {
  id: gameWindow

  screenWidth: 1136
  screenHeight: 640

  state: "menu"

  MainMenuScene {
    id: menuScene

    anchors.fill: parent

    onSelectGameScene: {
        playTime.start()
        gameWindow.state = "game"
    }
    onSelectRestartGame: gameWindow.state = "restart"
    onSelectAchievementsScene: gameWindow.state = "achievements"
    onSelectSettingsScene: gameWindow.state = "settings"
    onSelectQuitGame: gameWindow.state = "quit"
  }

  GameScene {
    id: gameScene

    anchors.fill: parent

    onReturntoMenu: {
        playTime.stop()
        gameWindow.state = "menu"
    }
  }

  states: [
       State {
         name: "menu"
         PropertyChanges {target: menuScene; opacity: 1}
         PropertyChanges {target: gameWindow; activeScene: menuScene}
         PropertyChanges {target: menuScene; elapsedTime: playTime.elapsedTime}
       },
      State {
        name: "restart"
        PropertyChanges {target: gameScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: gameScene}
        PropertyChanges {target: gameScene; totalNumberofClicks: 0}
      },
       State {
         name: "game"
         PropertyChanges {target: gameScene; opacity: 1}
         PropertyChanges {target: gameWindow; activeScene: gameScene}
       },
      State {
          name: "achievements"
          PropertyChanges {target: menuScene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: menuScene}
      },
      State {
          name: "settings"
          PropertyChanges {target: menuScene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: menuScene}
      },
      State {
        name: "quit"
      }
     ]


  GameTimer {
      id: playTime
  }
}
