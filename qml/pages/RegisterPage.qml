import QtQuick 2.0
import QtQuick.Layouts 1.1
import Sailfish.Silica 1.0

import "../elements"

Page {
    objectName: "RegisterPage"
    allowedOrientations: Orientation.All

//    extraContent.children: [
//        IconButton {
//            objectName: "aboutButton"
//            icon.source: "image://theme/icon-m-about"
//            anchors.verticalCenter: parent.verticalCenter

//            onClicked: pageStack.push(Qt.resolvedUrl("ContactList.qml"))
//        }
//    ]

    PageHeader {
        objectName: "registerPage"
        title: qsTr("Register page")
    }

    Label {
        objectName: "descriptionText"
        anchors { left: parent.left; right: parent.right; margins: Theme.horizontalPageMargin }
        color: palette.highlightColor
        font.pixelSize: Theme.fontSizeSmall
        textFormat: Text.RichText
        wrapMode: Text.WordWrap
        text: qsTr("Register page")
    }

    anchors {
        leftMargin: Theme.horizontalPageMargin * 2.0
        rightMargin: Theme.horizontalPageMargin * 2.0
        topMargin: Theme.paddingMedium
        bottomMargin: Theme.paddingMedium
    }

    Column {
        width: parent.width - 2 * Theme.horizontalPageMargin
        height: parent.height / 2.0 - 4 * Theme.paddingLarge
        anchors.centerIn: parent
        spacing: Theme.paddingLarge

        Label {
            id: labelPage
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Registration")
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter
            font.bold: true
            font.weight: Font.Bold
            font.pixelSize: Theme.fontSizeHuge
            font.letterSpacing: 1.0
            minimumPixelSize: 10
            color: palette.secondaryColor
        }

        Rectangle {
            width: parent.width
            height: Theme.itemSizeLarge / 4.0
            color: "transparent"
        }

        TextFieldCustom {
            id: textNickName
            textField.placeholderText: qsTr("Nickname")
            textField.maximumLength: 32
            textField.validator: RegExpValidator {
                regExp: /^[\w]{2,32}$/
            }
        }

        PasswordFieldCustom {
            id: textPassword
            textField.placeholderText: qsTr("PIN code")
            textField.maximumLength: 5
            textField.validator: RegExpValidator {
                regExp: /\d{5}/
            }

            // NOTE: запретить ввод других символов кроме validator
            textField.strictValidation: true
        }

        Rectangle {
            width: parent.width
            height: Theme.itemSizeLarge / 1.5
            color: "transparent"
        }

        Button {
            id: buttonRegistration
            preferredWidth: parent.width
            height: Theme.itemSizeLarge
            anchors.horizontalCenter: parent.horizontalCenter
            backgroundColor: palette.highlightBackgroundColor

            Text {
                text: qsTr("Register")
                font.pixelSize: Theme.fontSizeMedium
                anchors.centerIn: parent
                color: "white"
                font.bold: false
                font.weight: Font.Medium
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {

                }
            }
        }
    }

    Text {
        anchors.bottom: page.bottom
        anchors.bottomMargin: Theme.paddingLarge
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Version") + ": "  //+ _registerPageViewModel.productVersion
        font.pixelSize: Theme.fontSizeSmall
        color: palette.highlightColor
    }
}
