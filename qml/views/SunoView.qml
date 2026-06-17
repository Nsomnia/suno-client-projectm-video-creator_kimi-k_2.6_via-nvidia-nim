import QtQuick
import QtQuick.Controls
import "../components"

Rectangle {
    id: root
    objectName: "SunoView"
    color: Theme.bgPrimary

    Text {
        anchors.centerIn: parent
        text: "Suno Integration"
        font.pixelSize: Theme.fontSizeHeadline
        color: Theme.textPrimary
    }

    Text {
        anchors.top: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: Theme.spaceM
        text: "Direct POST API controls and generation history"
        font.pixelSize: Theme.fontSizeBody
        color: Theme.textSecondary
    }
}