import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Dialog {
    id: root

    Binding {
        target: _abonentCardViewModel
        property: "name"
        value: name.text
    }

    Binding {
        target: _abonentCardViewModel
        property: "telephoneNumber"
        value: telephoneNumber.text
    }

    Binding {
        target: _abonentCardViewModel
        property: "emailAddress"
        value: emailAddress.text
    }

    SilicaFlickable {
        objectName: "flickable"
        anchors {
            left: parent.left
            right: parent.right
            topMargin: Theme.paddingLarge
            top: parent.top
            bottom: parent.bottom
        }
        contentHeight: layout.height + Theme.paddingLarge
        clip: true

        VerticalScrollDecorator {}

        Column {
            id: layout
            objectName: "layout"
            anchors {
                leftMargin: Theme.horizontalPageMargin
                left: parent.left
                rightMargin: Theme.horizontalPageMargin
                right: parent.right
            }
            spacing: Theme.paddingLarge

            // INFO: Аватар
            Image {
                id: avatar
                sourceSize.width: Theme.itemSizeHuge
                sourceSize.height: Theme.itemSizeHuge
                anchors.horizontalCenter: parent.horizontalCenter
                source: Qt.resolvedUrl("icons/AvatarFree.svg")
            }

            Rectangle {
                id: nameArea
                width: parent.width
                height: columnName.height + 2.0 * Theme.paddingLarge
                color: palette.highlightColor
                radius: 20

                Column {
                    id: columnName
                    width: parent.width - 2.0 * Theme.horizontalPageMargin
                    height: childrenRect.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    spacing: Theme.paddingLarge

                    Label {
                        id: nameText
                        anchors {leftMargin: Theme.horizontalPageMargin; left: parent.left}
                        text: qsTr("Name") + " :"
                        color: palette.highlightDimmerColor
                    }

                    TextField {
                        id: name
                        anchors {leftMargin: Theme.horizontalPageMargin; left: parent.left}
                        color: palette.secondaryColor
                        inputMethodHints: Qt.ImhNoAutoUppercase
                        EnterKey.enabled: text.length > 0
                        EnterKey.iconSource: "image://theme/icon-m-enter-next"
                        EnterKey.onClicked: telephoneNumber.focus = true
                    }
                }
            }

            Rectangle {
                id: telephoneNumberArea
                width: parent.width
                height: columnTelephoneNumber.height + 2.0 * Theme.paddingLarge
                color: palette.highlightColor
                radius: 20

                Column {
                    id: columnTelephoneNumber
                    width: parent.width - 2.0 * Theme.horizontalPageMargin
                    height: childrenRect.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    spacing: Theme.paddingLarge

                    Label {
                        id: telephoneNumberText
                        anchors {leftMargin: Theme.horizontalPageMargin; left: parent.left}
                        text: qsTr("Telephone number") + " :"
                        color: palette.highlightDimmerColor
                    }

                    TextField {
                        id: telephoneNumber
                        anchors {leftMargin: Theme.horizontalPageMargin; left: parent.left}
                        color: palette.secondaryColor
                        inputMethodHints: Qt.ImhDialableCharactersOnly
                        EnterKey.enabled: text.length > 0
                        EnterKey.iconSource: "image://theme/icon-m-enter-next"
                        EnterKey.onClicked: emailAddress.focus = true
                    }
                }
            }

            Rectangle {
                id: emailAddressArea
                width: parent.width
                height: columnEmailAddress.height + 2.0 * Theme.paddingLarge
                color: palette.highlightColor
                radius: 20

                Column {
                    id: columnEmailAddress
                    width: parent.width - 2.0 * Theme.horizontalPageMargin
                    height: childrenRect.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    spacing: Theme.paddingLarge

                    Label {
                        id: emailAddressText
                        anchors {leftMargin: Theme.horizontalPageMargin; left: parent.left}
                        text: qsTr("Email address") + " :"
                        color: palette.highlightDimmerColor
                    }

                    TextField {
                        id: emailAddress
                        anchors {leftMargin: Theme.horizontalPageMargin; left: parent.left}
                        color: palette.secondaryColor
                        inputMethodHints: Qt.ImhEmailCharactersOnly
                        EnterKey.enabled: text.length > 0
                        EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    }
                }
            }
        }
    }
}
