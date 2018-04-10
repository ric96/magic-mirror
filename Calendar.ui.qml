import QtQuick 2.10
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.3
import QtQml 2.2

Calendar {
    id: calendar
    antialiasing: true
    weekNumbersVisible: false
    anchors.rightMargin: 67
    anchors.leftMargin: 67
    anchors.bottomMargin: 32
    anchors.topMargin: 62
    anchors.fill: parent
    
    style: CalendarStyle {
        gridVisible: false
        dayDelegate: Rectangle {
            gradient: Gradient {
                GradientStop {
                    position: 0.00
                    color: styleData.selected ? "#111" : (styleData.visibleMonth && styleData.valid ? "#444" : "#666");
                }
                
            }
            
            Label {
                //text: styleData.date.getDate()
                anchors.centerIn: parent
                color: styleData.valid ? "white" : "black"
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
