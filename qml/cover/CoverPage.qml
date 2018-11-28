import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {

//    PageHeader {
//        title: "CountMe"
//        anchors.horizontalCenter: parent.horizontalCenter
//    }
    Label {
        text: "CountMe"
        font.pixelSize: parent.height / 9
        y: parent.height / 9
        anchors.horizontalCenter: parent.horizontalCenter
        color: Theme.highlightColor
    }

    Image {
        width: parent.width / 3
        height: parent.width / 3
        anchors.right: parent.left
        anchors.rightMargin: -(width*0.75)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: width
        source: "image://theme/icon-l-add"
        opacity: 0.5
    }
    Image {
        width: parent.width / 3.5
        height: parent.width / 3.5
        anchors.left: parent.right
        anchors.leftMargin: -(width*0.75)
        anchors.top: parent.top
        anchors.topMargin: width*1.5
        source: "image://theme/icon-m-remove"
        opacity: 0.5
    }

    Label {
        id: countLabelLeft
        anchors.centerIn: parent
        text: doublePage.countLeft + "\n"
        font.pixelSize: Theme.fontSizeHuge
        font.bold: true
    }

    Label {
        id: countLabelRight
        anchors.centerIn: parent
        text: "\n" + doublePage.countRight
        font.pixelSize: Theme.fontSizeHuge
        font.bold: true
    }

    CoverActionList {
        id: coverAction

        CoverAction {
            //iconSource:  { mainPage.countSignLeft === "+" ? "image://theme/icon-m-add" : "image://theme/icon-m-remove" }
            //onTriggered: { mainPage.countSignLeft === "+" ? mainPage.countLeft += 1         : mainPage.countLeft -= 1 }
            iconSource: "image://theme/icon-cover-new"
            onTriggered: doublePage.countLeft += 1
        }

        CoverAction {
            //iconSource:  { mainPage.countSignRight === "+" ? "image://theme/icon-m-remove" : "image://theme/icon-m-remove" }
            //onTriggered: { mainPage.countSignRight === "+" ? mainPage.countRight += 1       : mainPage.countRight -= 1 }
            iconSource: "image://theme/icon-cover-new"
            onTriggered: doublePage.countRight += 1
        }
    }
}

