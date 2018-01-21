import VPlay 2.0
import QtQuick 2.0

GameWindow {
  id: gameWindow

  screenWidth: 1136
  screenHeight: 640

  state: "menu"

  Menu {
    id: menuScene

    anchors.fill: parent

    onSelectGameScene: gameWindow.state = "game"
    onSelectRestartGame: gameWindow.state = "restart"
    onSelectQuitGame: gameWindow.state = "quit"
  }

  Game {
    id: gameScene

    anchors.fill: parent

    onReturntoMenu: gameWindow.state = "menu"
  }

  states: [
       State {
         name: "menu"
         PropertyChanges {target: menuScene; opacity: 1}
         PropertyChanges {target: gameWindow; activeScene: menuScene}
       },
      State {
        name: "restart"
        PropertyChanges {target: gameScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: gameScene}
        PropertyChanges {target: gameScene; numberofClicks: 0}
      },
       State {
         name: "game"
         PropertyChanges {target: gameScene; opacity: 1}
         PropertyChanges {target: gameWindow; activeScene: gameScene}
       },
      State {
        name: "quit"
      }
     ]
}
