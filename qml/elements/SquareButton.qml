import QtQuick 2.0
import Sailfish.Silica 1.0
import QtGraphicalEffects 1.0

Item {
    id: root
    width: Theme.buttonWidthTiny
    height: Theme.buttonWidthTiny

    property alias imageSource: image.source
    property real imageSize: buttonSize * 0.375
    readonly property real buttonSize: Math.min(width, height)
    readonly property real buttonRadius: buttonSize * 0.25

    signal clicked()

    Rectangle {
        id: button
        anchors.fill: parent
        radius: buttonRadius
//        color: "#D3E4FF"
        color: palette.highlightBackgroundColor
        clip: true

        Image {
            id: image
            sourceSize.width: imageSize
            sourceSize.height: imageSize
            anchors.centerIn: parent
        }

        MouseArea {
            id: mAreaSearch
            anchors.fill: parent

            onPressed: button.color = Qt.darker(button.color, 1.2)
            onReleased: button.color = Qt.lighter(button.color, 1.2)
            onClicked: root.clicked()
        }
    }

    DropShadow {
        id: rectShadow
        anchors.fill: button
        horizontalOffset: 0
        verticalOffset: 4
        radius: buttonRadius * 0.5
        samples: 17
        spread: 0
//        color: "#50000000"
        color: palette.secondaryHighlightColor
        smooth: true
        source: button
    }
}

/*
\*
Подключение кнопки
\*
SquareButton {
    id: geoBasisButton
    anchors.left: parent.left
    anchors.leftMargin: Theme.paddingLarge
    anchors.bottom: parent.bottom
    anchors.bottomMargin: Theme.paddingLarge
    imageSource: Qt.resolvedUrl("../icons/elements/LayersButton.svg")
    imageSize: height * 0.5
    visible: !geoBasisPanel.visible && !_selectionViewModel.isSelected
    onClicked: geoBasisPanel.height = parent.height * 0.5
}
*/

