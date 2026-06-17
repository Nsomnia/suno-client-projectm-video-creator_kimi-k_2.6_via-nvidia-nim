import QtQuick
import QtQuick.Controls
import "../components"

Rectangle {
    id: root
    objectName: "LibraryView"
    color: Theme.bgPrimary

    Text {
        anchors.centerIn: parent
        text: "Music Library"
        font.pixelSize: Theme.fontSizeHeadline
        color: Theme.textPrimary
    }
}