import QtQuick 2.0
import QtQuick.Controls 2.4
import "../../qml/controls"
import QtQuick.Layouts 1.0
import QtQml 2.11



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
                id: settings2
                property bool isClose2: false
                anchors.fill: parent

                        Text {
                            id: leftlabel12
                            x: 26
                            y: 14
                            color: "#33ff25"
                            text: "Batch Setup - Admin Settings"
                            font.bold: true
                            font.pointSize: 20
                            Layout.alignment: Qt.AlignHCenter
                            Layout.preferredHeight: 100
                        }

                        Button {
                            id: bSubmitAdminFields
                            x: 112
                            y: 428
                            text: qsTr("SUBMIT")
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 27
                            onClicked: {
                                win.getBatchId(tfBatchID.text)
                                win.getDate(tfDate.text)
                                win.getNotes(tfNotes.text)
                            }
                        }

                        Button {
                            id: button111
                            x: 942
                            y: 424
                            text: qsTr("Next Page")
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            font.pointSize: 15
                            anchors.rightMargin: 53
                            anchors.bottomMargin: 27
                            onClicked: {
                                stackView.push(Qt.resolvedUrl("settings2.qml"))
                            }
                        }

                        TextField {
                            id: tfNotes
                            y: 259
                            height: 125
                            text: qsTr("Notes")
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 286
                            anchors.rightMargin: 214
                        }

                        TextField {
                            id: tfDate
                            y: 171
                            height: 40
                            text: qsTr("Date (MM/DD/YY)")
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 290
                            anchors.rightMargin: 214
                        }

                        TextField {
                            id: tfBatchID
                            y: 99
                            height: 28
                            text: qsTr("Batch Id")
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 286
                            anchors.rightMargin: 214
                            scale: 1
                        }

                        Text {
                            id: text111
                            y: 99
                            width: 146
                            height: 28
                            color: "#33ff25"
                            text: qsTr("BATCH ID")
                            anchors.left: parent.left
                            font.pixelSize: 20
                            anchors.leftMargin: 112
                        }

                        Text {
                            id: text21
                            x: 112
                            y: 171
                            width: 146
                            height: 28
                            color: "#33ff25"
                            text: qsTr("DATE")
                            font.pixelSize: 20
                        }

                        Text {
                            id: text31
                            x: 112
                            y: 259
                            width: 146
                            height: 28
                            color: "#33ff25"
                            text: qsTr("NOTES")
                            font.pixelSize: 20
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
                    font.pointSize: 16
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
                    font.pointSize: 23
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
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 10
                fillMode: Image.PreserveAspectFit
            }

            anchors.topMargin: 25
        }

    }

}





/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.33;height:700;width:1200}D{i:4}
}
##^##*/
