import QtQuick 2.6
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.0

//import Qt.labs.platform 1.1
Item {
    id: serial

    property alias name: comboBox.currentIndex
    property alias baudrate: comboBox1.currentIndex
    property alias databit: comboBox2.currentIndex
    property alias parity: comboBox3.currentIndex
    property alias stop: comboBox4.currentIndex
    property alias flow: comboBox5.currentIndex
    property alias strcode: comboBox6.currentIndex
    property alias serialmodlist: comlist
    property alias serialtextArea: mydata
    property alias button: button
    property alias button1: button1
    property alias button2: button2
    property alias label7: label7.text
    property alias comboBox6: comboBox6
    property alias comboBox: comboBox
    property alias saveDialog: saveDialog
    property alias fileinput: fileinput
    property alias listView: listView

    MenuBar {
        id: menu
        height: 40
        contentHeight: 40
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Menu {
            title: qsTr("文件")
            Action {
                text: qsTr("保存屏幕内容")
                onTriggered: saveDialog.open()
            }
        }
    }
    Dialog {
        id: saveDialog
        height: 400
        width: 400
        parent: serial
        title: qsTr("保存")

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        standardButtons: Dialog.Yes | Dialog.No

        ColumnLayout {
            spacing: 20
            anchors.fill: parent
            Label {
                text: qsTr("输入文件名。文件保存在当前目录下。")
            }
            TextField {
                id: fileinput

                //focus: true
                Layout.fillWidth: true
            }
        }
    }

    RowLayout {
        id: rowLayout
        anchors.bottomMargin: 5
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        anchors.topMargin: 40
        spacing: 5
        anchors.fill: parent

        ColumnLayout {
            id: columnLayout
            width: 100
            height: 100
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: 800
            Layout.minimumWidth: 140
            Layout.maximumHeight: 1200
            Layout.maximumWidth: 250

            Label {
                id: label
                text: qsTr("串口端口")
                wrapMode: Text.WordWrap
                font.pointSize: 10
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.maximumHeight: 40
                Layout.maximumWidth: 100
                Layout.minimumHeight: 20
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            ComboBox {
                id: comboBox
                currentIndex: 0
                leftPadding: 40
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.maximumHeight: 40
                Layout.maximumWidth: 140
                Layout.minimumHeight: 30
                Layout.minimumWidth: 100
                flat: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                textRole: "key"
                model: ListModel {
                    id: comlist
                }
            }

            Label {
                id: label1
                text: qsTr("波特率")
                Layout.maximumHeight: 40
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 10
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                Layout.maximumWidth: 100
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
            }

            ComboBox {
                id: comboBox1
                leftPadding: 40
                Layout.maximumHeight: 40
                Layout.minimumHeight: 30
                Layout.fillWidth: true
                Layout.maximumWidth: 140
                Layout.minimumWidth: 100
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
                flat: true
                model: ["9600", "19200", "38400", "115200"]
            }

            Label {
                id: label2
                text: qsTr("数据位")
                Layout.maximumHeight: 40
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 10
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                Layout.maximumWidth: 100
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
            }

            ComboBox {
                id: comboBox2
                leftPadding: 50
                Layout.maximumHeight: 40
                Layout.minimumHeight: 30
                Layout.fillWidth: true
                Layout.maximumWidth: 140
                Layout.minimumWidth: 100
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
                model: ["5", "6", "7", "8"]
                flat: true
                currentIndex: 3
            }

            Label {
                id: label3
                text: qsTr("奇偶位")
                Layout.maximumHeight: 40
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 10
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                Layout.maximumWidth: 100
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
            }

            ComboBox {
                id: comboBox3
                leftPadding: 40
                Layout.maximumHeight: 40
                Layout.minimumHeight: 30
                Layout.fillWidth: true
                Layout.maximumWidth: 140
                Layout.minimumWidth: 100
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
                flat: true
                model: ["None", "Even", "Odd", "Mark", "Space"]
            }

            Label {
                id: label4
                text: qsTr("停止位")
                Layout.maximumHeight: 40
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 10
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                Layout.maximumWidth: 100
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
            }

            ComboBox {
                id: comboBox4
                leftPadding: 50
                Layout.maximumHeight: 40
                Layout.minimumHeight: 30
                Layout.fillWidth: true
                Layout.maximumWidth: 140
                Layout.minimumWidth: 100
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
                model: ["1", "1.5", "2"]
                flat: true
            }

            Label {
                id: label5
                text: qsTr("流控")
                Layout.maximumHeight: 40
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 10
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                Layout.maximumWidth: 100
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
            }

            ComboBox {
                id: comboBox5
                leftPadding: 40
                Layout.maximumHeight: 40
                Layout.minimumHeight: 30
                Layout.fillWidth: true
                Layout.maximumWidth: 140
                Layout.minimumWidth: 100
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
                model: ["None", "RTS/CTS", "XON/XOFF"]
                flat: true
            }

            Label {
                id: label6
                text: qsTr("字符编码")
                Layout.maximumHeight: 40
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 10
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                Layout.maximumWidth: 100
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
            }

            ComboBox {
                id: comboBox6
                //displayText: "UTF-8"
                leftPadding: 30
                flat: true
                Layout.maximumHeight: 40
                Layout.minimumHeight: 30
                Layout.fillWidth: true
                Layout.maximumWidth: 140
                Layout.minimumWidth: 100
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
                model: ["  UTF-8", "GB18030"]
            }

            Button {
                id: button
                text: qsTr("初始化")
                font.pointSize: 10
                highlighted: true
                flat: true
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.maximumHeight: 40
                Layout.maximumWidth: 100
                Layout.minimumHeight: 20
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            Button {
                id: button1
                text: qsTr("连接")
                Layout.maximumHeight: 40
                highlighted: true
                font.pointSize: 10
                flat: true
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                Layout.maximumWidth: 100
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
                //                onClicked: {
                //                    window.linkserial()
                //                }
            }

            Button {
                id: button2
                text: qsTr("断开")
                Layout.maximumHeight: 40
                highlighted: true
                font.pointSize: 10
                flat: true
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                Layout.maximumWidth: 100
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
            }

            Button {
                id: button3
                text: qsTr("清除屏幕")
                visible: false
                Layout.maximumHeight: 40
                highlighted: true
                font.pointSize: 10
                flat: true
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                Layout.maximumWidth: 100
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true
                onClicked: {
                    textArea.clear()
                }
            }

            Label {
                id: label7
                //                text: qsTr("Label")
                Layout.maximumHeight: 40
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 10
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                Layout.maximumWidth: 100
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
            }

            Label {
                id: label8
                text: qsTr("Label")
                visible: false
                Layout.maximumHeight: 40
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 10
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                Layout.maximumWidth: 100
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
            }

            Label {
                id: label9
                text: qsTr("Label")
                visible: false
                Layout.maximumHeight: 40
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 10
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                Layout.maximumWidth: 100
                Layout.minimumWidth: 50
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
            }
        }

        ColumnLayout {
            id: columnLayout1
            width: 100
            height: 100
            Layout.alignment: Qt.AlignRight | Qt.AlignTop

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: 400
            Layout.minimumWidth: 400
            Layout.maximumHeight: 1200
            Layout.maximumWidth: 1200

            ScrollView {
                id: scrollView
                width: 200
                height: 200
                Layout.maximumHeight: 1200
                Layout.maximumWidth: 1200
                Layout.minimumHeight: 400
                Layout.minimumWidth: 400
                Layout.fillHeight: true
                Layout.fillWidth: true

                ListView {
                    id: listView
                    x: 0
                    y: -955
                    width: 110
                    height: 160
                    spacing: 0
                    layoutDirection: Qt.LeftToRight
                    flickableDirection: Flickable.VerticalFlick
                    Layout.maximumHeight: 1200
                    Layout.maximumWidth: 1200
                    Layout.minimumHeight: 400
                    Layout.minimumWidth: 400
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    model: ListModel {
                        id: mydata
                    }
                    delegate: Item {

                        width: parent.width
                        height: 30
                        Text {
                            color: "#ffffff"
                            text: str
                            width: parent.width
                            //                        font.family: "宋体"
                            font.pointSize: 10
                            anchors.verticalCenter: parent.verticalCenter
                            wrapMode: Text.Wrap
                            //                            style: Text.Outline
                            //                            styleColor: "red"
                        }
                    }
                    Component.onCompleted: positionViewAtEnd()
                }
            }
            //            Flickable {
            //                id: flickable
            //                flickableDirection: Flickable.VerticalFlick
            //                Layout.fillHeight: true
            //                Layout.fillWidth: true
            //                Layout.maximumHeight: 1200
            //                Layout.maximumWidth: 1300
            //                Layout.alignment: Qt.AlignLeft | Qt.AlignTop

            //                Layout.minimumHeight: 400
            //                Layout.minimumWidth: 400
            //                TextArea.flickable: TextArea {
            //                    id: textArea
            //                    textFormat: Qt.RichText
            //                    wrapMode: TextArea.Wrap
            //                    focus: true
            //                    selectByMouse: true
            //                    persistentSelection: true
            //                    // Different styles have different padding and background
            //                    // decorations, but since this editor is almost taking up the
            //                    // entire window, we don't need them.
            //                    leftPadding: 6
            //                    rightPadding: 6
            //                    topPadding: 0
            //                    bottomPadding: 0
            //                    background: null

            //                    MouseArea {
            //                        acceptedButtons: Qt.RightButton
            //                        anchors.fill: parent
            //                        onClicked: contextMenu.open()
            //                    }

            //                    onLinkActivated: Qt.openUrlExternally(link)
            //                }

            //                ScrollBar.vertical: ScrollBar {
            //                }
            //            }

            //            Flickable {
            //                id: flick
            //                width: 200
            //                height: 200
            //                //                contentWidth: parent.width
            //                //                boundsBehavior: Flickable.StopAtBounds
            //                flickableDirection: Flickable.VerticalFlick
            //                Layout.fillHeight: true
            //                Layout.fillWidth: true
            //                Layout.maximumHeight: 1200
            //                Layout.maximumWidth: 1300
            //                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            //                Layout.minimumHeight: 400
            //                Layout.minimumWidth: 400

            //                //                ScrollBar.vertical: ScrollBar {
            //                //                }
            //                //                TextArea.flickable:
            //                Label {
            //                    id: textArea
            //                    text: qsTr("Text Area")
            //                    //                    clip: false
            //                    anchors.fill: parent
            //                    //                    Layout.fillHeight: true
            //                    //                    Layout.fillWidth: true
            //                    //                    Layout.maximumHeight: 1200
            //                    //                    Layout.maximumWidth: 1300
            //                    //                    Layout.minimumHeight: 400
            //                    //                    Layout.minimumWidth: 400
            //                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            //                    wrapMode: Text.WordWrap
            //                }
            //            }
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:1200;width:1500}
}
 ##^##*/

