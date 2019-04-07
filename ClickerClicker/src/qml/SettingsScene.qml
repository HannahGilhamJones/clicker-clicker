import QtQuick 2.12
import QtQuick.Controls 2.5

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

            to: 100
            from: 0
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

       anchors.right: settingsScene.right
       anchors.rightMargin: 10
       anchors.top: settingsScene.top
       anchors.topMargin: 10

       onClicked: returntoMenu()
    }
}
