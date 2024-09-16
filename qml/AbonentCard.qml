import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    id: root
    anchors.fill: parent
    showNavigationIndicator: false

    property int userId
    onUserIdChanged: {
        _abonentCardViewModel.userId = userId
        console.log("User id changed", userId)
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
            id: edit
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            preferredWidth: Theme.buttonWidthExtraSmall
            text: qsTr("Edit")
            backgroundColor: palette.secondaryHighlightColor
            onClicked: {

            }
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
            Label {
//            TextField {
                id: label
//                readOnly: true
                text: _abonentCardViewModel.name
                color: palette.primaryColor
//            anchors { left: parent.left; right: parent.right; margins: Theme.horizontalPageMargin }
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: Theme.fontSizeHuge
                font.bold: true
                font.italic: true
                truncationMode: TruncationMode.Elide
            }

            // INFO: Область отображения данных номера телефона
            Rectangle {
                id: telephoneNumberArea
                width: parent.width
//                anchors { left: parent.left; right: parent.right; margins: Theme.horizontalPageMargin }
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

                    Label {
//                    TextField {
                        id: telephoneNumberValue
                        anchors {leftMargin: Theme.horizontalPageMargin; left: parent.left}
                        text: _abonentCardViewModel.telephoneNumber
                        color: palette.secondaryColor
//                        inputMethodHints: Qt.ImhNoAutoUppercase
//                        EnterKey.enabled: text.length > 0
//                        EnterKey.iconSource: "image://theme/icon-m-enter-next"
//                        EnterKey.onClicked: emailAddressValue.focus = true // console.log(text)
                    }
                }
            }

            // INFO: Область отображения данных адреса электронной почты
            Rectangle {
                id: emailAddressArea
                width: parent.width
//                anchors { left: parent.left; right: parent.right; margins: Theme.horizontalPageMargin }
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

                    Label {
//                    TextField {
                        id: emailAddressValue
                        anchors {leftMargin: Theme.horizontalPageMargin; left: parent.left}
                        text: _abonentCardViewModel.emailAddress
                        color: palette.secondaryColor
//                        inputMethodHints: Qt.ImhNoAutoUppercase
//                        EnterKey.enabled: text.length > 0
//                        EnterKey.iconSource: "image://theme/icon-m-enter-next"
//                        EnterKey.onClicked: notesValue.focus = true // console.log(text)
                    }
                }
            }

            // INFO: Область отображения заметки
            Rectangle {
                id: notesArea
                width: parent.width
//                anchors { left: parent.left; right: parent.right; margins: Theme.horizontalPageMargin }
                height: columnNotes.height + 2.0 * Theme.paddingLarge
                color: palette.highlightColor
                radius: 20

                Column {
                    id: columnNotes
                    width: parent.width - 2.0 * Theme.horizontalPageMargin
                    height: childrenRect.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    spacing: Theme.paddingLarge

                    Label {
                        id: notesText
                        anchors {leftMargin: Theme.horizontalPageMargin; left: parent.left}
                        text: qsTr("Notes") + " :"
                        color: palette.highlightDimmerColor
                    }

                    Label {
//                    TextArea {
                        id: notesValue
//                        placeholderText: qsTr("Text note")
//                        placeholderColor: palette.primaryColor
                        anchors {leftMargin: Theme.horizontalPageMargin; left: parent.left}
//                        height: Theme.itemSizeHuge * 10.0
//                        height: contentHeight
                        color: palette.secondaryColor
//                        inputMethodHints: Qt.ImhNoAutoUppercase
//                        EnterKey.enabled: text.length > 0
//                        EnterKey.iconSource: "image://theme/icon-m-enter-next"
//                        EnterKey.onClicked: console.log(text)
                        wrapMode: TextEdit.Wrap
                    }
                }
            }
        }
    }
}
