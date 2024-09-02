import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Rectangle {
    id: root
    width: parent.width
    height: Theme.itemSizeLarge
    color: palette.secondaryColor

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

        Column {
            Layout.fillWidth: true
            height: parent.height

            Item {
                id: topRectangle
                width: parent.width
                height: parent.height / 2.0

                Label {
                    id: nameSurname
                    text: "Name Surname"
                    font.pixelSize: Theme.fontSizeMedium
                    font.italic: true
                    color: palette.secondaryColor
                    truncationMode: TruncationMode.Elide
                }
            }

            Item {
                id: bottomRectangle
                width: parent.width
                height: parent.height / 2.0

                Label {
                    id: telephoneNumber
                    text: "8(999)333-44-55"
                    font.pixelSize: Theme.fontSizeMedium
                    font.italic: true
                    color: palette.secondaryColor
                    truncationMode: TruncationMode.Elide
                }
            }
        }
    }
}
