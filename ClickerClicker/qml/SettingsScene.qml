import VPlay 2.0
import QtQuick 2.0

import QtQuick.Controls 1.4

import SettingsModel 1.0

SceneBase {
    id: settingsScene

    signal returntoMenu

    Text {
        anchors.horizontalCenter: settingsScene.horizontalCenter
        anchors.top: settingsScene.top

        text: "Settings"
    }

    /////////////////////////////////////////////////////////////////

    SettingsModel {
        id: settingsModel

        volume: 100;
    }

    Column {
        anchors.centerIn: parent
        spacing: 5

        Text {
            id: volumeLabel

            text: "Volume"
        }

        Slider {
            width: settingsScene.width * 0.75

            maximumValue: 100
            minimumValue: 0
            stepSize: 1

            value: settingsModel.volume
        }

        Text {
            id: resolutionLabel

            text: "Resolution"
        }

        ComboBox {
            editable: false

            model: ["1920 x 1080"]
        }

        Text {
            id: fullScreenMode

            text: "Fullscreen"
        }

        CheckBox {
            checked: settingsModel.fullscreenState
        }
    }

    ////////////////////////////////////////////////////////////////

    Button {
       text: "Back"

       anchors.right: settingsScene.gameWindowAnchorItem.right
       anchors.rightMargin: 10
       anchors.top: settingsScene.gameWindowAnchorItem.top
       anchors.topMargin: 10

       onClicked: returntoMenu()
    }
}
