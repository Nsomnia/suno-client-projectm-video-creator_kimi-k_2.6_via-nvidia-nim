import QtQuick
import QtQuick.Controls
import "../components"

Rectangle {
    id: root
    objectName: "VisualizerView"
    color: Theme.bgPrimary

    Text {
        anchors.centerIn: parent
        text: "projectM Visualizer"
        font.pixelSize: Theme.fontSizeHeadline
        color: Theme.textPrimary
    }

    Text {
        anchors.top: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: Theme.spaceM
        text: "Placeholder canvas for future projectM integration"
        font.pixelSize: Theme.fontSizeBody
        color: Theme.textSecondary
    }
}