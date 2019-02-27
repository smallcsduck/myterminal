#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QFont>
#include <QQmlComponent>
#include "serial.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QFont *font=new QFont("微软雅黑 Light",10);
 //   font.setWeight(QFont::Normal);

    QGuiApplication app(argc, argv);
    QGuiApplication::setFont(*font);
    QQuickStyle::setStyle("Material");



    QQmlApplicationEngine *engine=new QQmlApplicationEngine();
    QQmlComponent *component=new QQmlComponent(engine,QString("qrc:/myapp.qml"));
    QObject *object=component->create();
//    engine->load(QUrl(QStringLiteral("qrc:/main.qml")));
//    if (engine->rootObjects().isEmpty())
//        return -1;

   serial * myserial=new serial(object);
    //QObject::connect(object,SIGNAL(initserial()),mserial,SLOT(getsinfor()));



    return app.exec();
}
