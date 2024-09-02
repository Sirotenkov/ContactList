import QtQuick 2.0
import Sailfish.Silica 1.0

ApplicationWindow {
    objectName: "applicationWindow"
//    initialPage: Qt.resolvedUrl("pages/RegisterPage.qml")
//    initialPage: Qt.resolvedUrl("ContactsDelegate.qml")
    initialPage: Qt.resolvedUrl("AbonentCard.qml")
    cover: Qt.resolvedUrl("cover/DefaultCoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
