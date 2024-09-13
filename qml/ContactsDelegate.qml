import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

    ListItem {
    id: root
//    width: parent.width
//    height: Theme.itemSizeLarge

    property string name
    property string telephoneNumber
    property string emailAddress

    RowLayout {
        spacing: Theme.paddingMedium
        anchors {
            leftMargin: Theme.paddingMedium
            rightMargin: Theme.paddingMedium
            topMargin: Theme.paddingMedium
            bottomMargin: Theme.paddingMedium
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        Image {
            id: avatar
            source: Qt.resolvedUrl("../qml/icons/AvatarFree.svg")
            sourceSize.height: parent.height
            sourceSize.width: parent.width
        }

        ColumnLayout {
            anchors {
                left: avatar.right
                leftMargin: Theme.horizontalPageMargin
                right: parent.right
                rightMargin: Theme.horizontalPageMargin
            }


            Label {
                id: nameSurname
                width: parent.width
                text: name
                font.pixelSize: Theme.fontSizeMedium
                font.italic: true
                color: palette.secondaryColor
                horizontalAlignment: Qt.AlignHCenter
                truncationMode: TruncationMode.Elide
            }

            Label {
                id: telephoneNumberID
                width: parent.width
                text: telephoneNumber // + emailAddress
                font.pixelSize: Theme.fontSizeMedium
                font.italic: true
                color: palette.secondaryColor
                horizontalAlignment: Qt.AlignHCenter
                truncationMode: TruncationMode.Elide
            }
        }
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
