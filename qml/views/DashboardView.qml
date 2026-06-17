import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

/*!
    \qmltype DashboardView
    \brief Home screen with mock statistics and recent activity.
*/
Rectangle {
    id: root
    objectName: "DashboardView"
    color: Theme.bgPrimary

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width

        ColumnLayout {
            width: parent.width
            spacing: Theme.spaceM
            anchors.margins: Theme.spaceM

            Text {
                text: "Dashboard"
                font.pixelSize: Theme.fontSizeHeadline
                font.bold: true
                color: Theme.textPrimary
            }

            // Mock stats row
            RowLayout {
                Layout.fillWidth: true
                spacing: Theme.spaceM

                Repeater {
                    model: [
                        { label: "Tracks",  value: "12,405" },
                        { label: "Vis",     value: "89" },
                        { label: "Exports", value: "3,201" }
                    ]

                    delegate: Rectangle {
                        Layout.fillWidth: true
                        height: 80
                        color: Theme.bgSecondary
                        border.color: Theme.borderSubtle
                        border.width: 1
                        radius: Theme.borderRadiusMedium

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: Theme.spaceXS

                            Text {
                                text: modelData.value
                                font.pixelSize: Theme.fontSizeHeadline
                                font.bold: true
                                color: Theme.accentCyan
                                horizontalAlignment: Text.AlignHCenter
                            }

                            Text {
                                text: modelData.label
                                font.pixelSize: Theme.fontSizeSmall
                                color: Theme.textSecondary
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }
                    }
                }
            }

            // Recent activity placeholder
            Rectangle {
                Layout.fillWidth: true
                height: 200
                color: Theme.bgSecondary
                border.color: Theme.borderSubtle
                border.width: 1
                radius: Theme.borderRadiusMedium

                Text {
                    anchors.centerIn: parent
                    text: "Recent Activity (Mock Data)"
                    font.pixelSize: Theme.fontSizeBody
                    color: Theme.textSecondary
                }
            }
        }
    }
}