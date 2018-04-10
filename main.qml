import QtQuick 2.10
import QtQuick.Controls 2.3

ApplicationWindow {
    visible: true
    width: 720
    height: 1280
    title: qsTr("Tabs")
    flags: Qt.FramelessWindowHint | Qt.Window

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
        }

        Page2Form {
        }
        Page3Form {

        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Calander")
        }
        TabButton {
            text: qsTr("Weather")
        }
        TabButton {
            text: qsTr("Weather2")
        }
    }
}
