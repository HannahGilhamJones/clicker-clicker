import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtGraphicalEffects 1.0

import ComponentType 1.0
import Style 1.0
import ThemeType 1.0

T.Button {
    id: control

    Style.theme: ThemeType.Base
    Style.type: ComponentType.Button

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topInset: 6
    bottomInset: 6
    padding: 12
    horizontalPadding: padding - 4
    spacing: 6

    onClicked: control.Style.theme = ThemeType.BloodMoon

    icon.width: 24
    icon.height: 24
    icon.color: !enabled ? control.Style.accentTextColor :
        flat && highlighted ? control.Style.accentColor :
        highlighted ? control.Style.accentTextColor : control.Style.primaryTextColor

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: !enabled ? control.Style.accentTextColor :
                          flat && highlighted ? control.Style.accentColor :
                          highlighted ? control.Style.accentTextColor : control.Style.primaryTextColor
    }

    background: Rectangle {
        implicitWidth: 64
        implicitHeight: 46

        radius: 4
        color: control.enabled ? control.hovered ? control.Style.accentColor :  control.Style.primaryColor : control.Style.disabledColor

        PaddedRectangle {
            y: parent.height - 4
            width: parent.width
            height: 4
            radius: 2
            topPadding: -2
            clip: true
            visible: control.checkable && (!control.highlighted || control.flat)
            color: control.checked && control.enabled ? control.Style.accentColor : control.Style.accentTextColor
        }
    }
}
