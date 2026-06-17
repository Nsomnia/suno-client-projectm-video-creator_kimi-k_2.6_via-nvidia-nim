import QtQuick
import QtQuick.Controls
import "../components"

Rectangle {
    id: root
    objectName: "TimelineView"
    color: Theme.bgPrimary

    Text {
        anchors.centerIn: parent
        text: "Timeline / Export"
        font.pixelSize: Theme.fontSizeHeadline
        color: Theme.textPrimary
    }

    Text {
        anchors.top: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: Theme.spaceM
        text: "Track strip, markers, and export controls"
        font.pixelSize: Theme.fontSizeBody
        color: Theme.textSecondary
    }
}