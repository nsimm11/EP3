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
            tempPlot.source = ""
            tempPlot.source = "TempPlot.jpg"
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
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
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
            
            Image {
                id: tempPlot
                x: 120
                anchors.top: parent.top
                source: "TempPlot.jpg"
                anchors.topMargin: 94
                cache: false
            }

            Text {
                id: text1
                x: 299
                width: 282
                height: 46
                color: "#ffffff"
                text: qsTr("Temperature Plot")
                anchors.top: parent.top
                font.pixelSize: 35
                horizontalAlignment: Text.AlignHCenter
                anchors.topMargin: 42
            }

            Row {
                id: row
                x: 329
                y: 767
                anchors.bottom: parent.bottom
                spacing: 20
                Button {
                    id: bNextPage4
                    x: 50
                    width: 258
                    height: 40
                    text: qsTr("Page 1")
                    anchors.bottom: parent.bottom
                    font.pointSize: 15
                    onClicked: {
                                    onClicked: {
                                        stackView.push(Qt.resolvedUrl("mainSequence1.qml"))
                                    }}
                    anchors.bottomMargin: 0
                }

                Button {
                    id: bNextPage5
                    x: 308
                    width: 258
                    height: 40
                    text: qsTr("Page 2")
                    font.pointSize: 15
                    onClicked: {
                                    onClicked: {
                                        stackView.push(Qt.resolvedUrl("mainSequence2.qml"))
                                    }}
                }

                Button {
                    id: bNextPage6
                    x: 566
                    width: 258
                    height: 40
                    text: qsTr("Page 3")
                    font.pointSize: 15
                    onClicked: {
                                    onClicked: {
                                        stackView.push(Qt.resolvedUrl("mainSequence3.qml"))
                                    }}
                }

                Button {
                    id: bNextPage7
                    x: 824
                    width: 258
                    height: 40
                    text: qsTr("Page 4")
                    font.pointSize: 15
                    onClicked: {
                                    onClicked: {
                            stackView.push(Qt.resolvedUrl("mainSequence4.qml"))
                        }}
                }
                anchors.bottomMargin: 8
            }

            Image {
                id: tempPlot1
                x: 990
                anchors.top: parent.top
                source: "TempPlot.jpg"
                cache: false
                anchors.topMargin: 94
            }

            Text {
                id: text2
                x: 1169
                width: 282
                height: 46
                color: "#ffffff"
                text: qsTr("Different Plot")
                anchors.top: parent.top
                font.pixelSize: 35
                horizontalAlignment: Text.AlignHCenter
                anchors.topMargin: 42
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
    D{i:0;autoSize:true;formeditorZoom:0.5;height:1020;width:1850}D{i:4}D{i:5}D{i:6}
}
##^##*/
