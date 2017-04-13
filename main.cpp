#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "damierdyn.h"
#include <iostream>
using namespace std;

int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);

    DamierDyn unDamier(4,4,2);
    unDamier.Initialisation();

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("vueObjetDam", &unDamier);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();



}
