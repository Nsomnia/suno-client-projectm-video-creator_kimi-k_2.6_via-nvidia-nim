import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

/*!
    \qmltype MainWindow
    \brief Root application window containing the cyberpunk-themed shell.
*/
ApplicationWindow {
    id: rootWindow
    visible: true
    width: 1280
    height: 800
    minimumWidth: 960
    minimumHeight: 640
    title: "Suno Client + projectM Video Creator"

    color: Theme.bgPrimary

    // ------------------------------------------------------------------
    // Top Bar
    // ------------------------------------------------------------------
    Rectangle {
        id: topBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 48
        color: Theme.bgSecondary
        border.color: Theme.borderSubtle
        border.width: 1

        RowLayout {
            anchors.fill: parent
            anchors.margins: Theme.spaceS
            spacing: Theme.spaceM

            Text {
                text: "Suno Client + projectM"
                font.pixelSize: Theme.fontSizeTitle
                font.bold: true
                color: Theme.textPrimary
            }

            Item { Layout.fillWidth: true }

            Button {
                text: "_"
                flat: true
                contentItem: Text {
                    text: parent.text
                    color: Theme.textPrimary
                    font.pixelSize: Theme.fontSizeBody
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                    color: parent.down ? Theme.bgElevated : "transparent"
                    border.color: Theme.borderSubtle
                    border.width: 1
                    radius: Theme.borderRadiusSmall
                }
                onClicked: rootWindow.showMinimized()
            }

            Button {
                text: "X"
                flat: true
                contentItem: Text {
                    text: parent.text
                    color: Theme.accentMagenta
                    font.pixelSize: Theme.fontSizeBody
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                    color: parent.down ? Theme.bgElevated : "transparent"
                    border.color: Theme.borderSubtle
                    border.width: 1
                    radius: Theme.borderRadiusSmall
                }
                onClicked: Qt.quit()
            }
        }
    }

    // ------------------------------------------------------------------
    // Side Navigation
    // ------------------------------------------------------------------
    Rectangle {
        id: sideNav
        anchors.top: topBar.bottom
        anchors.bottom: statusBar.top
        anchors.left: parent.left
        width: 200
        color: Theme.bgSecondary
        border.color: Theme.borderSubtle
        border.width: 1

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: Theme.spaceS
            spacing: Theme.spaceXS

            Repeater {
                model: [
                    { label: "Dashboard",  view: "DashboardView" },
                    { label: "Library",    view: "LibraryView" },
                    { label: "Visualizer", view: "VisualizerView" },
                    { label: "Suno",       view: "SunoView" },
                    { label: "Timeline",   view: "TimelineView" },
                    { label: "Settings",   view: "SettingsView" }
                ]

                delegate: Button {
                    id: navBtn
                    Layout.fillWidth: true
                    text: modelData.label
                    flat: true
                    highlighted: stackView.currentItem && stackView.currentItem.objectName === modelData.view

                    contentItem: Text {
                        text: navBtn.text
                        font.pixelSize: Theme.fontSizeBody
                        color: navBtn.highlighted ? Theme.accentCyan : Theme.textPrimary
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }

                    background: Rectangle {
                        color: navBtn.highlighted ? Theme.bgElevated : "transparent"
                        border.color: navBtn.highlighted ? Theme.borderHighlight : "transparent"
                        border.width: 1
                        radius: Theme.borderRadiusSmall
                    }

                    onClicked: {
                        if (stackView.currentItem && stackView.currentItem.objectName === modelData.view) {
                            return;
                        }
                        stackView.replace("views/" + modelData.view + ".qml",
                                          StackView.Immediate);
                    }
                }
            }

            Item { Layout.fillHeight: true }
        }
    }

    // ------------------------------------------------------------------
    // Central Content Area
    // ------------------------------------------------------------------
    StackView {
        id: stackView
        anchors.top: topBar.bottom
        anchors.bottom: statusBar.top
        anchors.left: sideNav.right
        anchors.right: parent.right
        initialItem: "views/DashboardView.qml"
    }

    // ------------------------------------------------------------------
    // Status / Footer Bar
    // ------------------------------------------------------------------
    Rectangle {
        id: statusBar
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 24
        color: Theme.bgSecondary
        border.color: Theme.borderSubtle
        border.width: 1

        RowLayout {
            anchors.fill: parent
            anchors.margins: Theme.spaceS
            spacing: Theme.spaceM

            Text {
                text: "Ready"
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.textSecondary
            }

            Item { Layout.fillWidth: true }

            Text {
                text: "v0.1.0-dev"
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.textDisabled
            }
        }
    }
}