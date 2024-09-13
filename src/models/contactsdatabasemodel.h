#ifndef CONTACTSDATABASEMODEL_H
#define CONTACTSDATABASEMODEL_H

#include <optional>

#include <QList>
#include <QObject>

#include <dto/contact.h>

class ContactsDatabaseModel : public QObject
{
    Q_OBJECT

public:
    explicit ContactsDatabaseModel(QObject *parent = nullptr);

    std::optional<Contact> find(qint64 userId) const;
    QList<Contact> list() const;

private:
    QList<Contact> m_contacts;

};

#endif // CONTACTSDATABASEMODEL_H
