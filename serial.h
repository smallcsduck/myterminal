#ifndef SERIAL_H
#define SERIAL_H

#include <QObject>
#include <QSerialPort>
#include <QList>
#include <QTextStream>
#include <QFile>
#include <QDataStream>

class serial:public QObject
{
     Q_OBJECT
public:
    serial(QObject* qmlobj);
    ~serial();
    bool init();
    //QString comlist[2];


public slots:
    void getsinfor();
    void setserial();
    void serialread();
    void stopserial();
    void codechang(qint32);
    void filename(QString);
//    void save();
private:

    QSerialPort* mserial;
    QObject* qml;
    QTextStream *serialtext;
    //QDataStream *serialtext;
    bool isopen=false;

    //QStringList *serialinfo;
    struct serialset {
        QString name;
        QString description;
        qint32 baudRate;
        QString stringBaudRate;
        QSerialPort::DataBits dataBits;
        QString stringDataBits;
        QSerialPort::Parity parity;
        QString stringParity;
        QSerialPort::StopBits stopBits;
        QString stringStopBits;
        QSerialPort::FlowControl flowControl;
        QString stringFlowControl;
        bool localEchoEnabled;
    };
    QList<serialset> *seriallist;
    int textcode=0;
    QFile *file;
    QString *buff;
};

#endif // SERIAL_H
