// This DBus-based screen blanking component is a modifided version of the following file:
// https://github.com/jgibbon/slumber/blob/774d52c50435c78c2d7e768928efebff05620ecc/qml/lib/ScreenBlank.qml
// Original code by jgibbon 26 Dec 2018
// Modifications by direc85 11 Feb 2019

import QtQuick 2.0
import Nemo.DBus 2.0

Item {
    id: keepAlive
    property bool enabled: false
    function _tick(){
        var method = "req_display" + (enabled && (Qt.application.state === Qt.ApplicationActive) ? "" : "_cancel" ) + "_blanking_pause";
        console.log(method)
        dbusInterface.call(method, [])
    }

    Timer {
        id: timer
        interval: 14000 // Minimum setting: 15s
        repeat: true
        running: keepAlive.enabled && (Qt.application.state === Qt.ApplicationActive)
        onTriggered: {
            if(keepAlive.enabled) {
                keepAlive._tick()
            }
        }
        onRunningChanged: {
            if(running === false) {
                keepAlive._tick()
            }
        }
    }

    DBusInterface {
        id: dbusInterface

        service: "com.nokia.mce"
        path: "/com/nokia/mce/request"
        iface: "com.nokia.mce.request"

        bus: DBusInterface.SystemBus
    }

    Component.onDestruction: {
        if(enabled){
            enabled = false
        }
    }
}
