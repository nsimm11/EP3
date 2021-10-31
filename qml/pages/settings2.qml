import QtQuick 2.0
import QtQuick.Controls 2.11
import "../../qml/controls"
import QtQuick.Layouts 1.0
import QtQml 2.15
import QtQuick.Controls.Styles 1.0



Item {
    id: item1
    Timer {
        interval: 1000; running: true; repeat: true;
        onTriggered: {
            labelDate.text = Qt.formatDate(new Date(), "MM/dd/yy");
            labelTime.text = Qt.formatTime(new Date(), "hh:mm:ss");
        }
    }

    Rectangle {
        id: rectangle
        width: 1200
        height: 700
        color: "#3f4243"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        property bool fileCheck: false



        Rectangle {
            id: homeContents
            color: "#343434"
            radius: 20
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: imageHolder.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.bottomMargin: 50
            anchors.topMargin: 30

            Item {
                id: settings3
                visible: true
                anchors.fill: parent
                property bool isClose3: false

                Text {
                id: text2
                y: 10
                height: 43
                color: "#47ff25"
                text: qsTr("Settings - Component Settings")
                anchors.left: parent.left
                anchors.right: parent.right
                font.pixelSize: 20
                anchors.leftMargin: 12
                anchors.rightMargin: 1596
                font.bold: true
            }

            RadioButton {
                id: rbhour12
                x: 511
                y: 100
                height: 59
                display: AbstractButton.TextOnly
                font.pointSize: 12
                onToggled: {
                     rbhour3.font.bold = win.getBold([ rbhour3.text,  rbhour12.text])
                     rbhour6.font.bold = win.getBold([ rbhour6.text,  rbhour12.text])
                     rbhour12.font.bold = win.getBold([ rbhour12.text,  rbhour12.text])
                }
            }

            RadioButton {
                id: rbhour6
                x: 265
                y: 100
                height: 59
                font.pointSize: 12
                onToggled: {
                     rbhour3.font.bold = win.getBold([ rbhour3.text,  rbhour6.text])
                     rbhour6.font.bold = win.getBold([ rbhour6.text,  rbhour6.text])
                     rbhour12.font.bold = win.getBold([ rbhour12.text,  rbhour6.text])
                }
            }

            RadioButton {
                id: rbhour3
                x: 393
                y: 100
                height: 59
                font.pointSize: 12
                onToggled: {
                     rbhour3.font.bold = win.getBold([ rbhour3.text,  rbhour3.text])
                     rbhour6.font.bold = win.getBold([ rbhour6.text,  rbhour3.text])
                     rbhour12.font.bold = win.getBold([ rbhour12.text,  rbhour3.text])
                }
            }

            Slider {
                id: sWaveLength
                x: 653
                y: 90
                width: 301
                height: 87
                value: 0.25
                onValueChanged: {
                   tWaveLength.text = win.getValueWaveLength(sWaveLength.value)
                }
            }

            Switch {
                id: swLight
                x: 36
                y: 97
                height: 65
                text: qsTr("")
                display: AbstractButton.IconOnly
                checked: false
                font.pointSize: 12
                ButtonStyle {
                    label: {
                        color: "white"
                    }
                }
                onToggled: {
                    tLightOF.text = win.getOF(["swLight", tLightOF.text])
                }
            }

            Text {
                id: tLWLength
                x: 667
                y: 65
                width: 179
                height: 31
                color: "#47ff25"
                text: qsTr(" Light Wave Length:")
                font.pixelSize: 20
            }

            Text {
                id: text5
                x: 46
                y: 58
                width: 76
                height: 45
                color: "#47ff25"
                text: qsTr("Light Switch")
                font.pixelSize: 20
            }

            Button {
                id: bNextPage4
                x: 968
                y: 435
                text: qsTr("Submit Settings")
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                font.pointSize: 15
                anchors.rightMargin: 26
                anchors.bottomMargin: 20
                onClicked: {
                    onClicked: {
                        win.submitSettings(bNextPage4.text)
                        stackView.push(Qt.resolvedUrl("mainSequence1.qml"))
                    }}
            }

            Text {
                id: tWaveLength
                x: 869
                y: 67
                width: 60
                height: 31
                color: "#fffefe"
                text: qsTr("720 nm")
                font.pixelSize: 16
            }

            Switch {
                id: swFan
                x: 9
                y: 229
                width: 129
                height: 66
                font.pointSize: 12
                checked: false
                onToggled: {
                    tFanOF.text = win.getOF(tFanOF.text)
                }
            }

            Text {
                id: text8
                y: 193
                height: 45
                color: "#47ff25"
                text: qsTr("Fan Switch")
                anchors.left: parent.left
                anchors.right: parent.right
                font.pixelSize: 20
                anchors.rightMargin: 1654
                anchors.leftMargin: 20
            }

            RadioButton {
                id: rbFanSpeedH
                x: 260
                y: 224
                width: 61
                height: 62
                anchors.leftMargin: 0
                font.pointSize: 12
                onToggled: {
                     tFanSpeedH.font.bold = win.getBold([ tFanSpeedH.text,  tFanSpeedH.text])
                     tFanSpeedM.font.bold = win.getBold([ tFanSpeedM.text,  tFanSpeedH.text])
                     tFanSpeedL.font.bold = win.getBold([ tFanSpeedL.text,  tFanSpeedH.text])
                }
            }

            RadioButton {
                id: rbFanSpeedM
                x: 382
                y: 224
                width: 67
                height: 62
                anchors.leftMargin: 0
                font.pointSize: 12
                onToggled: {
                     tFanSpeedH.font.bold = win.getBold([ tFanSpeedH.text,  tFanSpeedM.text])
                     tFanSpeedM.font.bold = win.getBold([ tFanSpeedM.text,  tFanSpeedM.text])
                     tFanSpeedL.font.bold = win.getBold([ tFanSpeedL.text,  tFanSpeedM.text])
                }
            }

            RadioButton {
                id: rbFanSpeedL
                x: 499
                y: 224
                width: 60
                height: 62
                anchors.leftMargin: 0
                font.pointSize: 12
                onToggled: {
                     tFanSpeedH.font.bold = win.getBold([ tFanSpeedH.text,  tFanSpeedL.text])
                     tFanSpeedM.font.bold = win.getBold([ tFanSpeedM.text,  tFanSpeedL.text])
                     tFanSpeedL.font.bold = win.getBold([ tFanSpeedL.text,  tFanSpeedL.text])
                }
            }


            Text {
                id: text9
                x: 178
                y: 193
                width: 149
                height: 44
                color: "#47ff25"
                text: qsTr("Fan Speed")
                font.pixelSize: 20
            }

            Slider {
                id: slider2
                x: 667
                y: 215
                width: 296
                height: 93
                value: 0.80
            }

            Text {
                id: text10
                x: 667
                y: 199
                width: 212
                height: 31
                color: "#47ff25"
                text: qsTr("Mass Flow Controller Setpoint:")
                font.pixelSize: 20
            }

            Text {
                id: text11
                x: 954
                y: 199
                width: 60
                height: 31
                color: "#fffefe"
                text: qsTr(" 1 L/min")
                font.pixelSize: 16
            }


                       Text {
                           id: text13
                           x: 257
                           y: 59
                           width: 149
                           height: 44
                           color: "#47ff25"
                           text: qsTr(" Light Cycle Length")
                           font.pixelSize: 20
                       }



                   Slider {
                       id: sChillerSetpoint
                       y: 349
                       width: 349
                       height: 93
                       anchors.left: parent.left
                       anchors.leftMargin: 81
                       value: 0.5
                       onValueChanged: {
                           tChillerSetpoint.text = win.getValueChillerTemp(sChillerSetpoint.value)
                       }
                   }

                   Text {
                       id: tChillerTitle
                       y: 325
                       height: 31
                       color: "#47ff25"
                       text: qsTr("Chiller Setpoint:")
                       anchors.left: parent.left
                       font.pixelSize: 20
                       anchors.leftMargin: 87
                   }

                   Slider {
                       id: sHeaterSetpoint
                       x: 602
                       y: 349
                       width: 369
                       height: 88
                       anchors.right: parent.right
                       anchors.rightMargin: 129
                       value: 0.5
                       onValueChanged: {
                           tHeaterSetpoint.text = win.getValueHeaterTemp(sHeaterSetpoint.value)
                       }
                   }

                   Text {
                       id: tHeaterTitle
                       y: 328
                       height: 31
                       color: "#47ff25"
                       text: qsTr("Heater Setpoint:")
                       anchors.right: parent.right
                       font.pixelSize: 20
                       anchors.rightMargin: 213
                   }

                   Text {
                       id: tHeaterSetpoint
                       x: 954
                       y: 331
                       width: 60
                       height: 25
                       color: "#fffefe"
                       text: qsTr("100 C")
                       anchors.right: parent.right
                       font.pixelSize: 16
                       anchors.rightMargin: 86
                   }

                   Text {
                       id: tChillerSetpoint
                       x: 256
                       y: 328
                       width: 60
                       height: 31
                       color: "#fffefe"
                       text: qsTr("2 C")
                       font.pixelSize: 16
                   }

                   Text {
                       id: tLight12
                       x: 317
                       y: 118
                       width: 60
                       height: 31
                       color: "#fffefe"
                       text: qsTr("12 Hour")
                       font.pixelSize: 16
                       anchors.leftMargin: 0
                   }

                   Text {
                       id: tLight3
                       x: 563
                       y: 118
                       width: 60
                       height: 31
                       color: "#fffefe"
                       text: qsTr("3 Hour")
                       font.pixelSize: 16
                       anchors.leftMargin: 0
                   }

                   Text {
                       id: tLight6
                       x: 451
                       y: 118
                       width: 60
                       height: 31
                       color: "#fffefe"
                       text: qsTr("6 Hour")
                       font.pixelSize: 16
                       anchors.leftMargin: 0
                   }

                   Text {
                       id: tLightOF
                       x: 116
                       y: 118
                       width: 60
                       height: 31
                       color: "#fffefe"
                       text: qsTr("OFF")
                       font.pixelSize: 16
                   }

                   Text {
                       id: tFanOF
                       x: 116
                       y: 250
                       width: 60
                       height: 36
                       color: "#fffefe"
                       text: qsTr("OFF")
                       font.pixelSize: 16
                   }

                   Text {
                       id: tFanSpeedH
                       x: 335
                       y: 243
                       width: 60
                       height: 31
                       color: "#fffefe"
                       text: qsTr("High")
                       font.pixelSize: 16
                       anchors.leftMargin: 0
                   }

                   Text {
                       id: tFanSpeedM
                       x: 441
                       y: 243
                       width: 70
                       height: 31
                       color: "#fffefe"
                       text: qsTr("Medium")
                       font.pixelSize: 16
                       anchors.leftMargin: 0
                   }

                   Text {
                       id: tFanSpeedL
                       x: 563
                       y: 242
                       width: 60
                       height: 31
                       color: "#fffefe"
                       text: qsTr("Low")
                       font.pixelSize: 16
                       anchors.leftMargin: 0
                       rotation: -1.874
                   }
           }

        }

        Rectangle {
            id: imageHolder
            x: 40
            y: 45
            height: 100
            color: "#3f4243"
            radius: 20
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 20
            anchors.leftMargin: 20

            Rectangle {
                id: timeHolder
                x: 976
                width: 153
                color: "#3b3e3f"
                radius: 10
                border.width: 0
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 11
                anchors.rightMargin: 31

                Label {
                    id: labelDate
                    x: 171
                    y: 8
                    width: 120
                    height: 25
                    color: "#c1b9b9"
                    text: "00/00/0000"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    //font.family: "Ticking Timebomb BB"
                    font.pointSize: 18
                }

                Label {
                    id: labelTime
                    x: 33
                    y: 34
                    width: 120
                    height: 44
                    color: "#7fe759"
                    text: "00:00:00"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    //font.family: "Ticking Timebomb BB"
                    font.weight: Font.DemiBold
                    font.pointSize: 28
                }
            }

            Image {
                id: image
                height: 97
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                source: "../../images/electro-pi-title.png"
                smooth: true
                mirror: false
                anchors.rightMargin: 8
                anchors.leftMargin: 12
                anchors.topMargin: 11
                fillMode: Image.PreserveAspectFit
            }

            anchors.topMargin: 25
        }

    }

}





/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:700;width:1200}D{i:4}
}
##^##*/
