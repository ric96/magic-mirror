import QtQuick 2.10
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.3
import QtQml 2.2

Page {
    width: 1080
    height: 1920
    property alias calendar: calendar

    Rectangle {
        id: rectangle
        color: "#000000"
        anchors.fill: parent

        Label {
            id: label
            color: "#ffffff"
            text: qsTr("Calendar")
            font.italic: false
            anchors.topMargin: 5
            anchors.bottomMargin: 343
            anchors.leftMargin: 13
            anchors.fill: parent
            font.family: "Cantarell"
            font.pointSize: 28
            font.bold: false
            styleColor: "#ffffff"
        }

        Item {
            id: clock
            z: 1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent

            Column {
                anchors.bottomMargin: 289
                anchors.rightMargin: 0
                anchors.topMargin: 53
                anchors.fill: parent

                Text {
                    id: text1
                    color: "#ffffff"
                    styleColor: "#ffffff"
                    font {
                        family: "Cantarell"
                        pixelSize: 80
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: text2
                    color: "#ffffff"
                    styleColor: "#ffffff"
                    font {
                        family: "Cantarell"
                        pixelSize: 40
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Timer {
                interval: 500
                running: true
                repeat: true

                onTriggered: {
                    var date = new Date()
                    text1.text = date.toLocaleTimeString(Qt.locale("en_US"), "hh:mm:ss ap")
                }
                }


        }

        Calendar {
            id: calendar
            antialiasing: true
            weekNumbersVisible: false
            anchors.rightMargin: 67
            anchors.leftMargin: 67
            anchors.bottomMargin: 29
            anchors.topMargin: 149
            anchors.fill: parent

            style: CalendarStyle {
                gridVisible: false

                navigationBar: Rectangle {
                        color: "#f9f9f9"
                        height: dateText.height * 2

                        Rectangle {
                            color: Qt.rgba(1, 1, 1, 0.6)
                            height: 1
                            width: parent.width
                        }

                        Rectangle {
                            anchors.bottom: parent.bottom
                            height: 1
                            width: parent.width
                            color: "#ddd"
                        }

                    Label {
                            id: dateText
                            text: styleData.title
                            font.pixelSize: 40
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.left: previousMonth.right
                            anchors.leftMargin: 2
                            anchors.right: nextMonth.left
                            anchors.rightMargin: 2
                        }
                }

                dayDelegate: Rectangle {
                    gradient: Gradient {
                        GradientStop {
                            position: 0.00
                            color: styleData.selected ? "white" : (styleData.visibleMonth && styleData.valid ? "black" : "black");
                        }

                    }

                    Label {
                        text: styleData.date.getDate()
                        anchors.centerIn: parent
                        //color: styleData.valid ? "white" : "black"
                        //color: styleData.selcted ? "black" : "white"
                        color: styleData.selected ? "black" : (styleData.visibleMonth && styleData.valid ? "white" : "grey");
                        font.bold: true
                        font.pointSize: 25
                        font.family: "Cantarell"
                    }



                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#555"
                        anchors.bottom: parent.bottom
                    }

                    Rectangle {
                        width: 1
                        height: parent.height
                        color: "#555"
                        anchors.right: parent.right
                    }
                }
            }
        }


    }

}
