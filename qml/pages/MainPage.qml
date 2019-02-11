import QtQuick 2.0
import QtMultimedia 5.0
import Sailfish.Silica 1.0
import "../components"

Page {
    id: doublePage

    property string countSignLeft: "+"
    property string countSignRight: "+"

    property int countLeft: 0
    property int countRight: 0

    property bool sound: false
    property bool vibra: true

    function resetCounters() {
        countLeft = 0
        countRight = 0
        countSignLeft = "+"
        countSignRight = "+"
    }

    SoundEffect {
        id: soundEffect
        source: "/usr/share/sounds/jolla-ambient/stereo/pulldown_lock.wav"
    }

    KeepAlive {
        id: keepAlive
    }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        id: pageFlickable
        anchors.fill: doublePage

        RemorsePopup {
            id: remorse
            onTriggered: resetCounters()
        }

        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push("../pages/AboutPage.qml")
            }
            MenuItem {
                text: qsTr("Reset")
                onClicked: remorse.execute(qsTr("Reseting counters"))
            }
        }


        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            spacing: Theme.paddingLarge
            width: doublePage.width

            PageHeader {
                title: "CountMe 2"
            }
            Row {
                id: counterRow
                width: column.width
                //height: counterLeft.height
                Column {
                    id: counterLeftColumn
                    width: counterRow.width / 2
                    Label {
                        id: counterLeft
                        anchors.topMargin: Theme.paddingMedium
                        anchors.horizontalCenter: counterLeftColumn.horizontalCenter

                        text: countLeft
                        //font.family: "Source Sans Pro Light"
                        font.pixelSize: Theme.fontSizeHuge
                        font.bold: true
                        color: Theme.primaryColor
                    }
                }
                Column {
                    id: counterRightColumn
                    width: counterRow.width / 2
                    Label {
                        id: counterRight
                        anchors.topMargin: Theme.paddingMedium
                        anchors.horizontalCenter: counterRightColumn.horizontalCenter

                        text: countRight
                        //font.family: "Source Sans Pro Light"
                        font.pixelSize: Theme.fontSizeHuge
                        font.bold: true
                        color: Theme.primaryColor
                    }
                }
            }

            Row {
                id: minusRow
                width: column.width
                //height: clickAreaMinusLeft.height

                // Left minus button container
                Column {
                    id: minusLeftColumn
                    width: minusRow.width / 2
                    Rectangle {
                        id: countClickAreaMinusLeft
                        anchors.horizontalCenter: minusLeftColumn.horizontalCenter

                        height: doublePage.width / 3
                        width: doublePage.width / 3
                        radius: width / 2

                        border.width: 2
                        border.color: Theme.secondaryHighlightColor
                        color: clickAreaMinusLeft.pressed ? Theme.secondaryHighlightColor : "transparent"

                        Image {
                            anchors.centerIn: countClickAreaMinusLeft
                            source: "image://theme/icon-m-remove"
                        }

                        MouseArea {
                            id: clickAreaMinusLeft
                            anchors.fill: countClickAreaMinusLeft
                            onClicked: {
                                if(sound){soundEffect.play()}
                                if(countLeft > -999999){countLeft -= 1}
                                countSignLeft = "-"
                            }
                        }
                    }
                }

                // Right minus button container
                Column {
                    id: minusRightColumn
                    width: minusRow.width / 2
                    Rectangle {
                        id: countClickAreaMinusRight
                        anchors.horizontalCenter: minusRightColumn.horizontalCenter

                        height: doublePage.width / 3
                        width: doublePage.width / 3
                        radius: width / 2

                        border.width: 2
                        border.color: Theme.secondaryHighlightColor
                        color: clickAreaMinusRight.pressed ? Theme.secondaryHighlightColor : "transparent"

                        Image {
                            anchors.centerIn: countClickAreaMinusRight
                            source: "image://theme/icon-m-remove"
                        }

                        MouseArea {
                            id: clickAreaMinusRight
                            anchors.fill: countClickAreaMinusRight
                            onClicked: {
                                if(sound){soundEffect.play()}
                                if(countRight > -999999){countRight -= 1}
                                countSignRight = "-"
                            }
                        }
                    }
                }
            }
            Row {
                id: plusRow
                width: column.width
                Column {
                    id: plusLeftColumn
                    width: plusRow.width / 2
                    Rectangle {
                        id: countClickAreaPlusLeft
                        anchors.horizontalCenter: plusLeftColumn.horizontalCenter

                        height: doublePage.width / 2.2
                        width: doublePage.width / 2.2
                        radius: width / 2

                        border.width: 2
                        border.color: Theme.secondaryHighlightColor
                        color: clickAreaPlusLeft.pressed ? Theme.secondaryHighlightColor : "transparent"

                        Image {
                            anchors.centerIn: countClickAreaPlusLeft
                            source: "image://theme/icon-l-add"
                        }

                        MouseArea {
                            id: clickAreaPlusLeft
                            anchors.fill: countClickAreaPlusLeft
                            onClicked: {
                                if(sound){soundEffect.play()}
                                if(countLeft < 999999){countLeft += 1}
                                countSignLeft = "+"
                            }
                        }
                    }
                }
                Column {
                    id: plusRightColumn
                    width: plusRow.width / 2
                    Rectangle {
                        id: countClickAreaPlusRight
                        anchors.horizontalCenter: plusRightColumn.horizontalCenter

                        height: doublePage.width / 2.2
                        width: doublePage.width / 2.2
                        radius: width / 2

                        border.width: 2
                        border.color: Theme.secondaryHighlightColor
                        color: clickAreaPlusRight.pressed ? Theme.secondaryHighlightColor : "transparent"

                        Image {
                            anchors.centerIn: countClickAreaPlusRight
                            source: "image://theme/icon-l-add"
                        }

                        MouseArea {
                            id: clickAreaPlusRight
                            anchors.fill: countClickAreaPlusRight
                            onClicked: {
                                if(sound){soundEffect.play()}
                                if(countRight < 999999){countRight += 1}
                                countSignRight = "+"
                            }
                        }
                    }
                }
            }
            Row {
                width: column.width
                height: Theme.paddingMedium
            }
            Row {
                id: switchRow
                width: column.width
                Column {
                    id: switchLeftColumn
                    width: switchRow.width / 2
                    Switch {
                        id: soundButton
                        anchors.horizontalCenter: switchLeftColumn.horizontalCenter
                        checked: sound ? true : false
                        iconSource: "image://theme/icon-m-speaker"
                        onClicked: sound ? sound = false : sound = true
                    }
                }
                Column {
                    id: switchRightColumn
                    width: switchRow.width / 2
                    Switch {
                        id: screenButton
                        anchors.horizontalCenter: switchRightColumn.horizontalCenter
                        checked: keepAlive.enabled
                        iconSource: "image://theme/icon-m-screenlock"
                        onClicked: keepAlive.enabled = !keepAlive.enabled
                    }
                }
            }
        }
    }
}

