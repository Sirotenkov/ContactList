import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    id: root
    color: "transparent"
    width: parent.width
    height: Theme.itemSizeExtraSmall

    property alias textField: textField
    readonly property bool valid: !textField.text.length || textField.acceptableInput

    Rectangle {
        width: textField.width + Theme.paddingMedium
        height: textField.height + Theme.paddingMedium
        anchors.verticalCenter: textField.verticalCenter
        anchors.horizontalCenter: textField.horizontalCenter
        radius: 30
        color: "#d4edfe"
        visible: (textField.focus && valid) ? true : false
    }

    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        radius: 20
//        color: "white"
//        color: palette.highlightColor
        color: palette.secondaryHighlightColor
        border.color: (textField.focus) ? (valid) ? "#4BB2F9" : "#FDA29B" : "gray"
        border.width: 2
    }

    PasswordField {
        id: textField
        width: parent.width
        height: parent.height
//        placeholderColor: (focus) ? "black" : "#667085"
        placeholderColor: (focus) ? palette.highlightColor : palette.secondaryColor
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: Theme.fontSizeSmall
        labelVisible: false
        color: "#80000000"
        textLeftMargin: 1.0
        textRightMargin: 1.0

        inputMethodHints: Qt.ImhDigitsOnly
        passwordEchoMode: TextInput.Password
        showEchoModeToggle: true

        rightItem: IconButton {
            icon {
                source: (valid) ? Qt.resolvedUrl("../icons/Help.svg") : Qt.resolvedUrl("../icons/Error.svg")
                sourceSize.width: Theme.iconSizeSmall
                sourceSize.height: Theme.iconSizeSmall
                color: (valid) ? "#98A2B3" : "#F04438"
            }
        }

        Text {
            verticalAlignment: Text.AlignVCenter
//            color: palette.highlightDimmerColor
            color: palette.secondaryColor
        }

        background: Item {

        }

        backgroundStyle: TextEditor.FilledBackground

        onClicked: {
            focus = true
            backgroundRect.visible = true
        }
    }
}
