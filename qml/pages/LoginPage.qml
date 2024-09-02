import QtQuick 2.0
import QtQuick.Layouts 1.1
import Sailfish.Silica 1.0

import "../elements"

Page {
    objectName: "LoginPage"
    allowedOrientations: Orientation.All

//    SilicaFlickable {
//        objectName: "flickable"
//        anchors.fill: parent
//        contentHeight: layout.height + Theme.paddingLarge

//        Column {
//            id: layout
//            objectName: "layout"
//            width: parent.width

            PageHeader {
                objectName: "loginPage"
                title: qsTr("Login Page")
            }

            Label {
                objectName: "descriptionText"
                anchors { left: parent.left; right: parent.right; margins: Theme.horizontalPageMargin }
                color: palette.highlightColor
                font.pixelSize: Theme.fontSizeSmall
                textFormat: Text.RichText
                wrapMode: Text.WordWrap
                text: qsTr("Login page")
            }

//            SectionHeader {
//                objectName: "licenseHeader"
//                text: qsTr("3-Clause BSD License")
//            }

//            Label {
//                objectName: "licenseText"
//                anchors { left: parent.left; right: parent.right; margins: Theme.horizontalPageMargin }
//                color: palette.highlightColor
//                font.pixelSize: Theme.fontSizeSmall
//                textFormat: Text.RichText
//                wrapMode: Text.WordWrap
//                text: qsTr("#licenseText")
//            }


//            Connections {
//                target: _loginPageViewModel
//                onPinAccepted: pageRouter.jump("MessengerPage")
//                onPinRejected: popupManager.push(qsTr("Invalid PIN code"), "LockedState")
//            }

//            Connections {
//                target: _loginPageViewModel
//                onAuthorizationSuccess: popupManager.push(qsTr("Authorized on server side"), "SuccessState")
//                onAuthorizationFailure: popupManager.push(qsTr("Failed to authorize on server side"), "LockedState")
//            }

//            Rectangle {
//                id: background
//                anchors.fill: parent
//                color: Theme.secondaryHighlightColor //"#FFFFFF"
//            }

            Item {
                id: center
                anchors.fill: parent

                anchors {
                    topMargin: 20
                    rightMargin: 40
                    bottomMargin: 20
                    leftMargin: 40
                }

                Column {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.centerIn: parent
                    spacing: (isLandscape) ? Theme.paddingMedium : Theme.paddingLarge * 2.0

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("PIN code")
                        font.pixelSize: Theme.fontSizeExtraLarge
                        font.bold: true
                        color: palette.highlightColor
                    }

                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: Theme.paddingLarge * 1.5

                        Repeater {
                            model: 5

                            Circle {
                                radius: Theme.iconSizeExtraSmall / 1.5
//                                color: Theme.lightSecondaryColor //"#4BB2F9" /*index < _loginPageViewModel.pinDigits ? "#4BB2F9" : "transparent"*/
                                color: palette.highlightColor
                                border {
                                    width: 1
                                    color: palette.highlightDimmerColor
                                }
                            }
                        }
                    }

                    GridLayout {
                        anchors.horizontalCenter: parent.horizontalCenter
                        columns: 3
                        rows: 4
                        columnSpacing: (isLandscape) ? Theme.paddingMedium : Theme.paddingLarge * 1.5
                        rowSpacing: (isLandscape) ? Theme.paddingMedium : Theme.paddingLarge * 1.5

                        Repeater {
                            model: 10

                            Circle {
                                radius: Theme.iconSizeSmallPlus
                                color: palette.secondaryHighlightColor

                                border {
                                    width: 1.0
//                                    color: Theme.highlightDimmerColor
                                    color: palette.highlightColor
                                }

                                label {
                                    text: (index + 1) % 10
                                    font.pixelSize: Theme.fontSizeLarge
                                    font.bold: true
                                    color: Theme.highlightDimmerColor
                                }

//                            onClicked: _loginPageViewModel.pushPinDigit(label.text)
                            }

                            Component.onCompleted: {
                                itemAt(9).Layout.row = 3
                                itemAt(9).Layout.column = 1
                            }
                        }

                        Circle {
                            id: backspaceButton
                            Layout.row: 3
                            Layout.column: 2
                            radius: Theme.iconSizeSmallPlus
                            color: palette.secondaryHighlightColor

                            border {
                                width: 1.0
//                                color: Theme.highlightDimmerColor
                                color: palette.highlightColor
                            }

////                    Image {
//                    IconButton {
//                        anchors.centerIn: parent
////                        sourceSize.width: Theme.iconSizeSmallPlus
////                        sourceSize.height: Theme.iconSizeSmallPlus
//                        width: Theme.iconSizeSmallPlus
//                        height: Theme.iconSizeSmallPlus
////                        source: Qt.resolvedUrl("../icons/Backspace.svg")
//                        icon.source: "image://theme/icon-m-back.svg" // icon-m-backspace-keypad.svg // icon-m-back.svg // icon-m-backspace.svg
//                        icon.scale: 0.25
//                    }

                            label {
                                text: " < "
                                font.pixelSize: Theme.fontSizeLarge
                                font.bold: true
                                color: Theme.highlightDimmerColor
                            }


//                            onClicked: _loginPageViewModel.popPinDigit(label.text)
                        }
                    }
                }
            }

            Text {
                anchors.bottom: page.bottom
                anchors.bottomMargin: Theme.paddingLarge
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Version") + ": "  //+ _registerPageViewModel.productVersion
                font.pixelSize: Theme.fontSizeSmall
                color: palette.highlightColor
            }



//        }
//    }
}
