import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    objectName: "defaultCover"

    CoverTemplate {
        objectName: "applicationCover"
        primaryText: "Contact list"
        secondaryText: qsTr("Contact list")
        icon {
            source: Qt.resolvedUrl("../icons/ContactList.svg")
            sourceSize { width: icon.width; height: icon.height }
        }
    }
}
