import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    id: root
    width: 100
    height: 100
    color: mouseArea.containsPress ? Qt.darker("#0000000d", 1.2) : "#0000000d"

    readonly property alias label: text
    signal clicked()

    onRadiusChanged: {
        width = radius * 2.0
        height = radius * 2.0
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: root.clicked();
    }

    Text {
        id: text
        anchors.centerIn: parent
    }
}
