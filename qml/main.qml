import QtQuick 2.0
import QtQuick.Layouts 1.1
import Sailfish.Silica 1.0

Page {
    id: page
    objectName: "MainPage"
    allowedOrientations: Orientation.All
    anchors.fill: parent

    PageHeader {
        id: header
        title: qsTr("Контакты")
        anchors.horizontalCenter: parent.horizontalCenter
        description: qsTr("Список контактов")
    }

    SilicaListView {
        id: listView
        anchors.top: header.bottom
        anchors.bottom: parent.bottom // footer.top
        anchors.left: parent.left
        anchors.right: parent.right
        clip: true

        VerticalScrollDecorator {}

        model: _viewModel

        delegate: ContactsDelegate {
            width: ListView.view.width
            name: model.name
            telephoneNumber: model.telephoneNumber
            onClicked: {
                console.log("Open Abonent Card %1".arg(index+1))
                console.log("Open Abonent UserId %1".arg(model.userId))
                pageStack.push(Qt.resolvedUrl("AbonentCard.qml"), {userId: model.userId})
            }

            menu: ContextMenu {
                id: contextMenu
                closeOnActivation: true

                MenuItem {
                    text: qsTr("Изменить")
                    onClicked: {
                        var dialog = pageStack.push("AbonentCard.qml", {userId: model.userId})
                        console.log("Press Edit button context menu")
                    }
                }

                MenuItem {
                    text: qsTr("Удалить")
                    onClicked: {
                        console.log("Press Delete button context menu")
                            _viewModel.remove(model.userId);
                    }
                }
            }
        }

        PullDownMenu {
            MenuItem {
                text: qsTr("Добавить контакт")
                onClicked: {
                    console.log("Press Add Contact button pulldown menu")
                    var dialog = pageStack.push("AbonentCardEditing.qml")
                    dialog.accepted.connect(function() {
                        _abonentCardViewModel.insert();
                    })
                }
            }
        }
    }
}
