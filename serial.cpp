#include "serial.h"
#include <QString>
#include <QSerialPortInfo>
#include <QList>
#include <QtDebug>
#include <iterator>
#include <QTextCodec>




serial::serial(QObject *qmlobj):mserial(new QSerialPort(this)),
                                qml(qmlobj),
                                serialtext(new QTextStream),
                                //serialtext(new QDataStream),
                                seriallist(new QList<serialset>),
                                file(new QFile),
                                buff(new QString)
{

  connect(qml,SIGNAL(initserial()),this,SLOT(getsinfor()));
  connect(qml,SIGNAL(linkserial()),this,SLOT(setserial()));
  connect(qml,SIGNAL(disconnect()),this,SLOT(stopserial()));
  connect(qml,SIGNAL(scode(qint32)),this,SLOT(codechang(qint32)));
  connect(qml,SIGNAL(filen(QString)),this,SLOT(filename(QString)));
  connect(mserial, &QSerialPort::readyRead, this, &serial::serialread);

}


serial::~serial()
{

    stopserial();
    delete mserial;
    delete serialtext;
    delete seriallist;
    delete file;
    delete buff;
    //delete serialinfo;
}

void serial::getsinfor()
{


    const auto infos = QSerialPortInfo::availablePorts();
    for (const QSerialPortInfo &info : infos) {
        //QStringList list;
        serialset temp;
        temp.name=info.portName();
        //qDebug()<<temp.name;
        //comlist[0]=portname;
        //qDebug()<<comlist[0];
        temp.description = info.description();
        //qDebug()<<description;
        //manufacturer = info.manufacturer();
        //qDebug()<<manufacturer;
        QList<serialset>::iterator i;
         bool a=false;
        for (i = seriallist->begin(); i != seriallist->end(); ++i)
        {
            if((*i).name==temp.name) a=true;

         }
        if(a)
        {
            a=false;
            continue;
        }

        seriallist->append(temp);
        QVariant reval;
        QVariant avg=temp.name;
        QMetaObject::invokeMethod(qml,"addcomlist",Q_RETURN_ARG(QVariant,reval),Q_ARG(QVariant,avg));

    }


}

void serial::setserial()
{

        int comnum=qml->property("name").toInt();
        int temp=qml->property("baudrate").toInt();
        switch (temp) {
        case 0:
            (*seriallist)[comnum].baudRate=9600;
            break;
        case 1:
            (*seriallist)[comnum].baudRate=19200;
            break;
        case 2:
            (*seriallist)[comnum].baudRate=38400;
            break;
        case 3:
            (*seriallist)[comnum].baudRate=115200;
            break;
        default:
            (*seriallist)[comnum].baudRate=9600;
            break;
        }
        qDebug()<<(*seriallist)[comnum].baudRate;
        temp=qml->property("databit").toInt();
        switch (temp) {
        case 0:
            (*seriallist)[comnum].dataBits=QSerialPort::Data5;
            break;
        case 1:
            (*seriallist)[comnum].dataBits=QSerialPort::Data6;
            break;
        case 2:
            (*seriallist)[comnum].dataBits=QSerialPort::Data7;
            break;
        case 3:
            (*seriallist)[comnum].dataBits=QSerialPort::Data8;
            break;
        default:
            (*seriallist)[comnum].dataBits=QSerialPort::Data8;
            break;
        }
        qDebug()<<(*seriallist)[comnum].dataBits;
        temp=qml->property("parity").toInt();
        switch (temp) {
        case 0:
            (*seriallist)[comnum].parity=QSerialPort::NoParity;
            break;
        case 1:
            (*seriallist)[comnum].parity=QSerialPort::EvenParity;
            break;
        case 2:
            (*seriallist)[comnum].parity=QSerialPort::OddParity;
            break;
        case 3:
            (*seriallist)[comnum].parity=QSerialPort::MarkParity;
            break;
        case 4:
            (*seriallist)[comnum].parity=QSerialPort::SpaceParity;
            break;
        default:
            (*seriallist)[comnum].parity=QSerialPort::NoParity;
            break;
        }
        qDebug()<<(*seriallist)[comnum].parity;
        temp=qml->property("stop").toInt();
        switch (temp) {
        case 0:
            (*seriallist)[comnum].stopBits=QSerialPort::OneStop;
            break;
        case 1:
            (*seriallist)[comnum].stopBits=QSerialPort::OneAndHalfStop;
            break;
        case 2:
            (*seriallist)[comnum].stopBits=QSerialPort::TwoStop;
            break;
        default:
            (*seriallist)[comnum].stopBits=QSerialPort::OneStop;
            break;
        }
        qDebug()<<(*seriallist)[comnum].stopBits;
        temp=qml->property("flow").toInt();
        switch (temp) {
        case 0:
            (*seriallist)[comnum].flowControl=QSerialPort::NoFlowControl;
            break;
        case 1:
            (*seriallist)[comnum].flowControl=QSerialPort::HardwareControl;
            break;
        case 2:
           (*seriallist)[comnum].flowControl=QSerialPort::SoftwareControl;
            break;
        default:
            (*seriallist)[comnum].flowControl=QSerialPort::NoFlowControl;
            break;
        }
        qDebug()<<(*seriallist)[comnum].flowControl;

        mserial->setPortName((*seriallist)[comnum].name);
        mserial->setBaudRate((*seriallist)[comnum].baudRate);
        mserial->setDataBits((*seriallist)[comnum].dataBits);
        mserial->setParity((*seriallist)[comnum].parity);
        mserial->setStopBits((*seriallist)[comnum].stopBits);
        mserial->setFlowControl((*seriallist)[comnum].flowControl);
        qDebug()<<(*seriallist)[comnum].description;
        if(mserial->open(QIODevice::ReadWrite)) isopen=true;
        qml->setProperty("serialinfo","连接设备:"+(*seriallist)[comnum].description);
        mserial->clear();
}

void serial::serialread()
{

    if(mserial->canReadLine())
    {

       // QString
        QByteArray test = mserial->readLine(1024);
        QTextCodec *codec;
        switch (textcode) {
        case 0:
            codec = QTextCodec::codecForName("UTF-8");
            break;
        case 1:
            codec = QTextCodec::codecForName("GB18030");
            break;
        default:
            codec = QTextCodec::codecForName("UTF-8");
            break;
        }
        //QTextCodec *codec = QTextCodec::codecForName("KOI8-R");
        QString utext = codec->toUnicode(test);

        //(*serialtext)<<utext;
        utext=utext.trimmed();


        QVariant back;

        QMetaObject::invokeMethod(qml,"addtext",Q_RETURN_ARG(QVariant,back),Q_ARG(QVariant,utext));
        utext.append('\n');
        buff->append(utext);
        return;

    }
//    char buf[1024];
//    mserial->readLine(buf,sizeof(buf));
//    qDebug()<<buf;
//    QVariant back;
//    //(*serialtext)<<mserial->readLine();
//    QMetaObject::invokeMethod(qml,"addtext",Q_RETURN_ARG(QVariant,back),Q_ARG(QVariant,buf));
    return;

}

void serial::stopserial()
{
    if(isopen)
    {
    mserial->clear();
    mserial->close();

    isopen=false;
    return;
    }

    return;

}

void serial::codechang(qint32 index)
{
    textcode=index;
    //int i,ii;
//    int ii=index;
//    //i=qml->property("strcode").toInt();
//    //qDebug()<<i;
//    switch (ii) {
//    case 0:

//        break;
//    case 1:

//        break;
//    default:
//        break;
//    }
    //    qDebug()<<ii;
}

void serial::filename(QString filename)
{
  //qDebug()<<filename;
  file->setFileName(filename);
   if (file->open(QFile::WriteOnly| QFile::Text))//| QFile::Text
   {
       //serialtext->setCodec("UTF-8");
       serialtext->setDevice(file);
       serialtext->setCodec("UTF-8");
       (*serialtext)<<(*buff);
       file->close();

   }
}

//void serial::save()
//{
//  qDebug()<<"save";
//}


