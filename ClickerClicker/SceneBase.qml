import QtQuick 2.0

Item {
  id: sceneBase

  opacity: 1
  visible: opacity > 0
  enabled: visible

  //Common background for all scenes
  Rectangle {
      id: rectangle
      anchors.fill: parent
      color: "#cccccc"
  }
}
