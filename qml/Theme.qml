pragma Singleton
import QtQuick

/*!
    \qmltype Theme
    \brief Singleton providing design tokens for the cyberpunk dark theme.

    All colours, typography, and spacing values are centralised here
    so that every view and component consumes them rather than
    hard-coding values.
*/
QtObject {
    // ------------------------------------------------------------------
    // Palette
    // ------------------------------------------------------------------
    readonly property color bgPrimary:        "#0a0a0f"
    readonly property color bgSecondary:      "#11111a"
    readonly property color bgTertiary:       "#1a1a2e"
    readonly property color bgElevated:       "#24243e"

    readonly property color accentCyan:       "#00f0ff"
    readonly property color accentMagenta:    "#ff00aa"
    readonly property color accentYellow:     "#f0e800"
    readonly property color accentGreen:      "#00ff66"

    readonly property color textPrimary:      "#e0e0e0"
    readonly property color textSecondary:    "#a0a0b0"
    readonly property color textDisabled:     "#606070"

    readonly property color borderSubtle:     "#2a2a3e"
    readonly property color borderHighlight:  "#00f0ff"

    // ------------------------------------------------------------------
    // Typography
    // ------------------------------------------------------------------
    readonly property string fontFamily:      "Segoe UI, Roboto, Helvetica, Arial, sans-serif"
    readonly property int fontSizeSmall:      11
    readonly property int fontSizeBody:       13
    readonly property int fontSizeTitle:      18
    readonly property int fontSizeHeadline:   24

    // ------------------------------------------------------------------
    // Spacing
    // ------------------------------------------------------------------
    readonly property int spaceXS:            4
    readonly property int spaceS:             8
    readonly property int spaceM:             16
    readonly property int spaceL:             24
    readonly property int spaceXL:            32

    // ------------------------------------------------------------------
    // Misc
    // ------------------------------------------------------------------
    readonly property int borderRadiusSmall:  4
    readonly property int borderRadiusMedium: 8
    readonly property int borderRadiusLarge:  12
}