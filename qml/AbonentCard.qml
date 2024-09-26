import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    id: root
    anchors.fill: parent
    showNavigationIndicator: false

    states: [
        State {
            name: "editState"; when: editing
            PropertyChanges { target: editSaveButton; text: qsTr("Save") }
            PropertyChanges { target: editSaveButton; onClicked: {
                    editing = !editing; _abonentCardViewModel.update();} }

            PropertyChanges { target: label; readOnly: false }
            PropertyChanges { target: label; focus: true }
            PropertyChanges { target: telephoneNumberValue; readOnly: false }
            PropertyChanges { target: emailAddressValue; readOnly: false }
        },
        State {
            name: "readState"; when: !editing
            PropertyChanges { target: editSaveButton; text: qsTr("Edit") }
            PropertyChanges { target: editSaveButton; onClicked: {
                    editing = !editing} }

            PropertyChanges { target: label; readOnly: true }
            PropertyChanges { target: label; focus: false }
            PropertyChanges { target: telephoneNumberValue; readOnly: true }
            PropertyChanges { target: emailAddressValue; readOnly: true }
        }
    ]

    property bool editing: false

    property int userId
    onUserIdChanged: {
        _abonentCardViewModel.userId = userId
        console.log("User id changed", userId)
    }

    Binding {
        target: _abonentCardViewModel
        property: "name"
        value: label.text
    }

    Binding {
        target: _abonentCardViewModel
        property: "telephoneNumber"
        value: telephoneNumberValue.text
    }

    Binding {
        target: _abonentCardViewModel
        property: "emailAddress"
        value: emailAddressValue.text
    }

    // INFO: Верхний элемент с двумя кнопками управления
    Item {
        id: headerElement
        anchors {
            leftMargin: Theme.horizontalPageMargin
            left: parent.left
            rightMargin: Theme.horizontalPageMargin
            right: parent.right
            topMargin: Theme.paddingLarge
            top: parent.top
            bottomMargin: Theme.paddingLarge
        }

        width: parent.width
        height: back.height + 2.0 * Theme.paddingLarge

        Button {
            id: back
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            preferredWidth: Theme.buttonWidthExtraSmall
            text: qsTr("Back")
            backgroundColor: palette.secondaryHighlightColor
            onClicked: pageStack.pop()
        }

        Item {
            id: bufferElement
            Layout.fillWidth: true
        }

        Button {
            id: editSaveButton
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            preferredWidth: Theme.buttonWidthExtraSmall
            backgroundColor: palette.secondaryHighlightColor
        }
    }

    // INFO: Область карточки абонента (с возможностью скролла в случае,
    // если контент не помещается в области экрана)
    SilicaFlickable {
        objectName: "flickable"
        anchors {
            left: parent.left
            right: parent.right
            topMargin: Theme.paddingLarge
            top: headerElement.bottom
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

            // INFO: Текстовое поле с личными данными абонента (ФИО/никнейм)
            TextField {
                id: label
                readOnly: true
                text: _abonentCardViewModel.name
                color: palette.primaryColor
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
                font.pixelSize: Theme.fontSizeHuge
                font.bold: true
                font.italic: true
            }

            // INFO: Область отображения данных номера телефона
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
                        id: telephoneNumberValue
                        readOnly: true
                        anchors {leftMargin: Theme.horizontalPageMargin; left: parent.left}
                        text: _abonentCardViewModel.telephoneNumber
                        color: palette.secondaryColor
                        inputMethodHints: Qt.ImhDialableCharactersOnly
                    }
                }
            }

            // INFO: Область отображения данных адреса электронной почты
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
                        text: "email :"
                        color: palette.highlightDimmerColor
                    }

                    TextField {
                        id: emailAddressValue
                        readOnly: true
                        anchors {leftMargin: Theme.horizontalPageMargin; left: parent.left}
                        text: _abonentCardViewModel.emailAddress
                        color: palette.secondaryColor
                        inputMethodHints: Qt.ImhEmailCharactersOnly
                    }
                }
            }
        }
    }
}
