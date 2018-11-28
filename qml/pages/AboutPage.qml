import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: aboutPage
    anchors.fill: parent

    PageHeader {
        id: header
        title: "CountMe 2.0"
    }

    Column {
        anchors.top: header.bottom
        width: parent.width
        spacing: Theme.paddingMedium

        Label {
            x: Theme.paddingLarge
            text: qsTr("Authors")
            color: Theme.highlightColor

            font.pixelSize: Theme.fontSizeLarge
        }
        Label {
            x: Theme.paddingLarge*2
            text: "Gabriel Böhme\nMatti Viljanen"
            color: Theme.primaryColor

            font.pixelSize: Theme.fontSizeMedium
        }
        Label {
            x: Theme.paddingLarge
            text: qsTr("License")
            color: Theme.highlightColor

            font.pixelSize: Theme.fontSizeLarge
        }
        Label {
            x: Theme.paddingLarge*2
            text: "GNU General Public Licence 3.0"
            color: Theme.primaryColor17

            font.pixelSize: Theme.fontSizeMedium
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Code and feedback")
            onClicked: Qt.openUrlExternally("http://www.github.com/direc85/CountMe_SailfishOS_Qt5")
        }
    }
}

