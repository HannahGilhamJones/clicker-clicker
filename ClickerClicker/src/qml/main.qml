import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Clicker Clicker")

    property bool returnToMenu : false

    Component {
        id: mainMenuComponent
        MainMenuScene {
            anchors.fill: parent
            onSelectGameScene: loader.sourceComponent = gameSceneComponent
            onSelectAchievementsScene: loader.sourceComponent = achievementSceneComponent
            onSelectQuitGame: Qt.quit()
            onSelectRestartGame: loader.sourceComponent = gameSceneComponent
            onSelectSettingsScene: loader.sourceComponent = settingsSceneComponent
        }
    }

    Component {
        id: achievementSceneComponent
        AchievementScene {
            anchors.fill: parent
            onReturntoMenu: loader.sourceComponent = mainMenuComponent
        }
    }

    Component {
        id: gameSceneComponent
        GameScene {
            anchors.fill: parent
            onReturntoMenu: loader.sourceComponent = mainMenuComponent
        }
    }

    Component {
        id: settingsSceneComponent
        SettingsScene {
            anchors.fill: parent
            onReturntoMenu: loader.sourceComponent = mainMenuComponent
        }
    }

    Loader {
        id: loader

        anchors.fill: parent
        sourceComponent: mainMenuComponent
    }
}
