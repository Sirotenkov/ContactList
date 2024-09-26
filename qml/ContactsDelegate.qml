import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

ListItem {
    id: root
    anchors {
        leftMargin: Theme.horizontalPageMargin
        left: parent.left
        rightMargin: Theme.horizontalPageMargin
        right: parent.right
    }

    property string name
    property string telephoneNumber
    property string emailAddress

    RowLayout {
        spacing: Theme.paddingMedium
        Layout.fillWidth: true
        Layout.fillHeight: true

        Image {
            id: avatar
            height: parent.height
            width: height
            source: Qt.resolvedUrl("../qml/icons/AvatarFree.svg")
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Label {
                id: nameID
                text: name
                font.pixelSize: Theme.fontSizeMedium
                font.italic: true
                color: palette.secondaryColor
                truncationMode: TruncationMode.None
            }

            Label {
                id: telephoneNumberID
                text: telephoneNumber
                font.pixelSize: Theme.fontSizeMedium
                font.italic: true
                color: palette.secondaryColor
                truncationMode: TruncationMode.Elide
            }
        }
    }

    Rectangle {
        id: underline
        width: parent.width
        height: 1.0
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
        }
        color: palette.secondaryColor
    }

    menu: ContextMenu {
        id: contextMenu

        MenuItem {
            text: qsTr("Редактировать")
            onClicked: console.log("Clicked \"Edit\" Abonent card with UserId: %1".arg(model.userId))
        }

        MenuItem {
            text: qsTr("Удалить")
            onClicked: console.log("Clicked \"Delete\" Abonent card with UserId: %1".arg(model.userId))
        }
    }
}
