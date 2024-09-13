#ifndef CONTACT_H
#define CONTACT_H

#include <QString>

struct Contact {
    qint64 userId;
    QString name;
    QString telephoneNumber;
    QString emailAddress;
};

#endif // CONTACT_H
