import VPlay 2.0
import QtQuick 2.0

Scene {
  id: sceneBase

  opacity: 0
  visible: opacity > 0
  enabled: visible

  //Common background for all scenes
  Rectangle {
      id: rectangle
      anchors.fill: parent.gameWindowAnchorItem
      color: "#cccccc"
  }
}
