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
        width: 600
        height: 400
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
                    position: 0.00
                    color: "#00ff00"
                }
                GradientStop {
                    position: 1.00
                    color: "#00803f"
                }
            }
        }

        Image {
            id: ball
            x: 0
            y: root.height - height
            source: "images/soccer_ball.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ball.x = 0
                    ball.y = root.height - ball.height
                    ball.rotation = 0
                    anim.restart()
                }
            }
        }

        ParallelAnimation {
            id: anim
            SequentialAnimation {
                NumberAnimation {
                    target: ball
                    properties: "y"
                    to: 20
                    duration: root.duration * 0.4
                    easing.type: Easing.OutCirc
                }
                NumberAnimation {
                    target: ball
                    properties: "y"
                    to: root.height - ball.height
                    duration: root.duration * 0.6
                    easing.type: Easing.OutBounce
                }
            }
            NumberAnimation {
                target: ball
                properties: "x"
                to: root.width - ball.width
                duration: root.duration
            }
            RotationAnimation {
                target: ball
                properties: "rotation"
                to: 720
                duration: root.duration
            }
        }
    }
}
