import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true

    //    MainForm {
    //        anchors.fill: parent
    //        mouseArea.onClicked: {
    //            Qt.quit();
    //        }

    //    }
    Item {
        id: root
        width: 480
        height: 300
        property int duration: 3000

        Rectangle {
            id: sky
            width: parent.width
            height: 200
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#0080FF"
                }
                GradientStop {
                    position: 1.0
                    color: "#66CCFF"
                }
            }
        }
        Rectangle {
            id: ground
            anchors.top: sky.bottom
            anchors.bottom: root.bottom
            width: parent.width
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#00FF00"
                }
                GradientStop {
                    position: 1.0
                    color: "#00803F"
                }
            }
        }
    }
}
