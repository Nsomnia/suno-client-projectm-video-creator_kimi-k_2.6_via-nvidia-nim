import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Rectangle {
    id: root
    objectName: "SettingsView"
    color: Theme.bgPrimary

    Text {
        anchors.centerIn: parent
        text: "Settings"
        font.pixelSize: Theme.fontSizeHeadline
        color: Theme.textPrimary
    }

    Text {
        anchors.top: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: Theme.spaceM
        text: "Preferences, toggles, and theme selection (Placeholder)"
        font.pixelSize: Theme.fontSizeBody
        color: Theme.textSecondary
    }
}