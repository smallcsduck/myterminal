import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: window
    visible: true
    width: 1000
    height: 920
    title: qsTr("终端")

    Material.theme: Material.Dark
    Material.accent: Material.Purple

    property int name: myserial.name
    property int baudrate: myserial.baudrate
    property int databit: myserial.databit
    property int parity: myserial.parity
    property int stop: myserial.stop
    property int flow: myserial.flow
    property int strcode: myserial.strcode
    //property alias serialinfo: myserial.label7
    property alias serialinfo: label.text

    signal initserial
    signal linkserial
    signal disconnect
    signal scode(int index)
    signal filen(string name)

    //signal savefile
    Connections {
        target: myserial.button
        onClicked: initserial()
    }

    Connections {
        target: myserial.button1
        onClicked: {
            if (myserial.serialmodlist.count) {
                linkserial()
            }
        }
    }

    Connections {
        target: myserial.button2
        onClicked: {
            if (myserial.serialmodlist.count) {
                disconnect()
            }
        }
    }

    Connections {
        target: myserial.comboBox6
        onActivated: scode(index)
    }

    Connections {
        target: myserial.saveDialog
        onAccepted: {
            filen(myserial.fileinput.text)
            //savefile()
        }
    }

    //    Connections {
    //        target: myserial.fileinput
    //        onReleased: filen(myserial.fileinput.text)
    //    }
    function addcomlist(String) {
        myserial.serialmodlist.append({
                                          "key": String
                                      })
        return Boolean
    }

    function addtext(String) {
        myserial.serialtextArea.append({
                                           "str": String
                                       })
        myserial.listView.positionViewAtEnd()

        return Boolean
    }

    header: TabBar {
        id: bar
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        font.pointSize: 10
        contentHeight: 40
        TabButton {
            text: qsTr("串口终端")
        }
        TabButton {
            text: qsTr("固件上传")
        }
    }

    //    footer: RowLayout{

    //    }
    StackLayout {
        //id: stackLayout
        anchors.bottomMargin: 40
        anchors.topMargin: 0
        anchors.fill: parent
        currentIndex: bar.currentIndex

        Item {
            id: first
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: 240
            Layout.minimumWidth: 250
            Layout.maximumHeight: 1240
            Layout.maximumWidth: 1500
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Serial {
                id: myserial
                anchors.fill: parent
            }
        }
        Item {
            id: scecond
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: 200
            Layout.minimumWidth: 250
            Layout.maximumHeight: 1200
            Layout.maximumWidth: 1500
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
    }
    footer: RowLayout {
        id: rowLayout

        //        anchors.top: parent.top
        //        anchors.topMargin: 880
        //        anchors.left: parent.left
        //        anchors.leftMargin: 0
        //        anchors.right: parent.right
        //        anchors.rightMargin: 0
        //        anchors.bottom: parent.bottom
        //        anchors.bottomMargin: 0
        Label {
            id: label
            text: qsTr("连接设备")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.minimumWidth: 200
            Layout.maximumHeight: 40
            Layout.maximumWidth: 300
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredHeight: 40
            Layout.preferredWidth: 100
            Layout.minimumHeight: 40
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Label {
            id: label1
            text: qsTr("Label")
            Layout.fillHeight: true
            Layout.fillWidth: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.maximumHeight: 40
            Layout.maximumWidth: 300
            Layout.minimumHeight: 40
            Layout.minimumWidth: 200
        }

        Label {
            id: label2
            text: qsTr("Label")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: 40
            Layout.maximumWidth: 300
            Layout.minimumHeight: 40
            Layout.minimumWidth: 200
        }
    }
}

/*##^## Designer {
    D{i:4;anchors_height:100;anchors_width:100}
}
 ##^##*/

