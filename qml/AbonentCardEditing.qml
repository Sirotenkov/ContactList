import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    id: root
    anchors.fill: parent
    showNavigationIndicator: false

    property int userId: _abonentCardViewModel.userId

    Component.onCompleted: {
        console.log("Current User id: ", userId)
    }

    Text {
        id: txt
        text: _abonentCardViewModel.name
        color: "red"
        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: Theme.paddingLarge
            top: parent.top
        }
    }

    Text {
        id: txt1
        text: _abonentCardViewModel.telephoneNumber
        color: "red"
        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: Theme.paddingLarge
            top: txt.bottom
        }
    }

    Text {
        id: txt2
        text: _abonentCardViewModel.emailAddress
        color: "red"
        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: Theme.paddingLarge
            top: txt1.bottom
        }
    }
}
