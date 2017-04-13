import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id: plateau
    width: 550
    height: 600
    property alias textScore1: textScore1
    property alias text16: text16
    property alias text15: text15
    property alias text14: text14
    property alias text13: text13
    property alias text12: text12
    property alias text9: text9
    property alias text6: text6
    property alias text3: text3
    property alias text11: text11
    property alias text8: text8
    property alias text5: text5
    property alias text2: text2
    property alias text10: text10
    property alias text7: text7
    property alias text4: text4
    property alias case4: case4
    property alias text1: text1
    property alias fond: fond
    property alias mouseArea: mouseArea
    property alias textNouvellePartie: textNouvellePartie
    property alias textScore: textScore
    opacity: 1
    property alias case16: case16
    property alias case15: case15
    property alias case14: case14
    property alias case13: case13
    property alias case12: case12
    property alias case9: case9
    property alias case6: case6
    property alias case3: case3
    property alias case11: case11
    property alias case8: case8
    property alias case5: case5
    property alias case2: case2
    property alias case10: case10
    property alias case7: case7
    property alias case1: case1
    property alias grille: grille
    property alias score1: score1
    property alias score: score
    property alias nouvellePartie: nouvellePartie

    Rectangle {
        id: fond
        x: 3
        y: 6
        width: 480
        height: 580
        color: "#faf8ee"
        anchors.topMargin: 8
        anchors.leftMargin: 44
        anchors.top: parent.top
        anchors.left: parent.left

        Rectangle {
            id: nouvellePartie
            x: 0
            y: 0
            width: 200
            height: 75
            color: "#faf8ee"
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20

            Text {
                id: textNouvellePartie
                width: 200
                height: 75
                text: qsTr("Nouvelle partie")
                style: Text.Outline
                font.pixelSize: 23
                font.italic: false
                font.bold: false
                fontSizeMode: Text.FixedSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            MouseArea {
                id: mouseArea
                width: 200
                height: 75
                visible: false
                onClicked : vueObjetDam.Initialisation()
            }
        }

        Rectangle {
            id: score
            x: 435
            y: 0
            width: 75
            height: 75
            color: "#baad9e"
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20

            Text {
                id: textScore
                width: 75
                height: 75
                text: qsTr("Best\n0")
                font.family: "Courier"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
            }
        }

        Rectangle {
            id: score1
            x: 320
            y: 0
            width: 75
            height: 75
            color: "#baad9e"
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.rightMargin: 40
            anchors.right: score.left

            Text {
                id: textScore1
                width: 75
                height: 75
                text: qsTr("Score\n0")
                font.pixelSize: 20
                font.capitalization: Font.SmallCaps
                font.family: "Courier"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Rectangle {
            id: grille
            x: 130
            width: 248
            height: 248
            color: "#bbad9f"
            radius: 5
            anchors.top: nouvellePartie.bottom
            anchors.topMargin: 150

            Rectangle {
                id: case1
                width: 52
                height: 52
                color: vueObjetDam.colQML[0];
                radius: 5
                anchors.left: parent.left
                anchors.leftMargin: 8
                anchors.top: parent.top
                anchors.topMargin: 8

                Text {
                    id: text1
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[0]
                    verticalAlignment: Text.AlignVCenter
                    textFormat: Text.AutoText
                    font.family: "Courier"
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 25
                }
            }

            Rectangle {
                id: case4
                x: -140
                y: -138
                width: 52
                height: 52
                color: vueObjetDam.colQML[3]
                radius: 5
                anchors.left: case3.right
                anchors.top: parent.top
                anchors.topMargin: 8
                anchors.leftMargin: 8

                Text {
                    id: text4
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[3]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case7
                x: -133
                width: 52
                height: 52
                color: vueObjetDam.colQML[6]
                radius: 5
                anchors.left: case6.right
                anchors.top: case3.bottom
                anchors.leftMargin: 8
                anchors.topMargin: 8

                Text {
                    id: text7
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[6]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case10
                x: -141
                width: 52
                height: 52
                color: vueObjetDam.colQML[9]
                radius: 5
                anchors.left: case9.right
                anchors.top: case6.bottom
                anchors.topMargin: 8
                anchors.leftMargin: 8

                Text {
                    id: text10
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[9]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case2
                x: 0
                y: 20
                width: 52
                height: 52
                color: vueObjetDam.colQML[1]
                radius: 5
                anchors.left: case1.right
                anchors.top: parent.top
                anchors.topMargin: 8
                anchors.leftMargin: 8

                Text {
                    id: text2
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[1]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case5
                x: -149
                y: -147
                width: 52
                height: 52
                color: vueObjetDam.colQML[4]
                radius: 5
                anchors.left: parent.left
                anchors.top: case1.bottom
                anchors.leftMargin: 8
                anchors.topMargin: 8

                Text {
                    id: text5
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[4]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case8
                x: -142
                y: -9
                width: 52
                height: 52
                color: vueObjetDam.colQML[7]
                radius: 5
                anchors.left: case7.right
                anchors.top: case4.bottom
                anchors.topMargin: 8
                anchors.leftMargin: 8

                Text {
                    id: text8
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[7]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case11
                x: -150
                y: -9
                width: 52
                height: 52
                color: vueObjetDam.colQML[10]
                radius: 5
                anchors.left: case10.right
                anchors.top: case7.bottom
                anchors.leftMargin: 8
                anchors.topMargin: 8

                Text {
                    id: text11
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[10]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case3
                x: 6
                y: 6
                width: 52
                height: 52
                color: vueObjetDam.colQML[2]
                radius: 5
                anchors.left: case2.right
                anchors.top: parent.top
                anchors.topMargin: 8
                anchors.leftMargin: 8

                Text {
                    id: text3
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[2]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case6
                x: -134
                y: -132
                width: 52
                height: 52
                color: vueObjetDam.colQML[5]
                radius: 5
                anchors.left: case5.right
                anchors.top: case2.bottom
                anchors.leftMargin: 8
                anchors.topMargin: 8

                Text {
                    id: text6
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[5]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case9
                x: -127
                y: 6
                width: 52
                height: 52
                color: vueObjetDam.colQML[8]
                radius: 5
                clip: true
                anchors.left: parent.left
                anchors.top: case5.bottom
                anchors.topMargin: 8
                anchors.leftMargin: 8

                Text {
                    id: text9
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[8]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case12
                x: -135
                y: 6
                width: 52
                height: 52
                color: vueObjetDam.colQML[11]
                radius: 5
                anchors.left: case11.right
                anchors.top: case8.bottom
                anchors.leftMargin: 8
                anchors.topMargin: 8

                Text {
                    id: text12
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[11]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case13
                x: 1
                y: 1
                width: 52
                height: 52
                color: vueObjetDam.colQML[12]
                radius: 5
                anchors.left: parent.left
                anchors.top: case9.bottom
                anchors.topMargin: 8
                anchors.leftMargin: 8

                Text {
                    id: text13
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[12]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case14
                x: -139
                y: -137
                width: 52
                height: 52
                color: vueObjetDam.colQML[13]
                radius: 5
                anchors.left: case13.right
                anchors.top: case10.bottom
                anchors.leftMargin: 8
                anchors.topMargin: 8

                Text {
                    id: text14
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[13]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case15
                x: -132
                y: 1
                width: 52
                height: 52
                color: vueObjetDam.colQML[14]
                radius: 5
                anchors.left: case14.right
                anchors.top: case11.bottom
                anchors.topMargin: 8
                anchors.leftMargin: 8

                Text {
                    id: text15
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[14]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }

            Rectangle {
                id: case16
                x: -140
                y: 1
                width: 52
                height: 52
                color: vueObjetDam.colQML[15]
                radius: 5
                anchors.left: case15.right
                anchors.top: case12.bottom
                anchors.leftMargin: 8
                anchors.topMargin: 8

                Text {
                    id: text16
                    width: 52
                    height: 52
                    text: vueObjetDam.damQML[15]
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    textFormat: Text.AutoText
                }
            }
            focus: true
            Keys.onPressed: {
                switch (event.key) {
                  case Qt.Key_Left:
                    vueObjetDam.flecheGauche();
                    break;
                  case Qt.Key_Right:
                    vueObjetDam.flecheDroite();
                    break;
                  case Qt.Key_Up:
                    vueObjetDam.flecheHaut();
                    break;
                  case Qt.Key_Down:
                    vueObjetDam.flecheBas();
                    break;


                }
             }
        }

        Text {
            id: issue_partie
            x: 130
            y: 153
            width: 248
            height: 47
            text: vueObjetDam.issueQML
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 30
        }
    }
}
