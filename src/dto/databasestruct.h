#ifndef DATABASESTRUCT_H
#define DATABASESTRUCT_H

#include <QObject>
#include <QString>
#include <QDateTime>

struct DatabaseStruct {

    Q_GADGET

public:

    explicit DatabaseStruct(qint64 userId, QString name, QString telephoneNumber, QString emailAddress, QDateTime timeCreation, QDateTime timeChange)
        : userId(userId), name(name), telephoneNumber(telephoneNumber), emailAddress(emailAddress), timeCreation(timeCreation), timeChange(timeChange)
    {

    }

    qint64 userId = 0;
    QString name;
    QString telephoneNumber;
    QString emailAddress;
    QDateTime timeCreation = QDateTime::currentDateTime();
    QDateTime timeChange = QDateTime::currentDateTime();
};

#endif // DATABASESTRUCT_H
