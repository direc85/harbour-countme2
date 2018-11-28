import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "cover"

ApplicationWindow
{
    allowedOrientations: Orientation.Portrait
    initialPage: MainPage {id: doublePage }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
}
