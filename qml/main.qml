import QtQuick 2.0
import QtQuick.Layouts 1.1
import Sailfish.Silica 1.0

Page {
    id: page
    objectName: "MainPage"
    allowedOrientations: Orientation.All
    anchors.fill: parent

    Header {
        id: header
        width: parent.width
    }

    SilicaListView {
        id: listView
        anchors.top: header.bottom
        anchors.bottom: footer.top
        anchors.left: parent.left
        anchors.right: parent.right
        clip: true

        VerticalScrollDecorator {}

        model: _viewModel

        delegate: ContactsDelegate {
            width: ListView.view.width
            name: model.name
            telephoneNumber: model.telephoneNumber
            emailAddress: model.emailAddress
            onClicked: {
                console.log("Open Abonent Card %1".arg(index+1))
                console.log("Open Abonent UserId %1".arg(model.userId))
                pageStack.push(Qt.resolvedUrl("AbonentCard.qml"), {userId: model.userId})
//                pageStack.push(Qt.resolvedUrl("AbonentCard.qml"), {"chatId": model.chatId})
            }
        }
    }

    Footer {
        id: footer
        width: parent.width
    }
}
