#ifndef CONTACTVIEWMODEL_H
#define CONTACTVIEWMODEL_H

#include <QAbstractListModel>
#include <QObject>
#include <QString>

#include <models/contactmodel.h>
#include <models/contactsdatabasemodel.h>

class ContactViewModel : public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY(QList<Contact> contacts READ contacts WRITE setContacts NOTIFY contactsChanged FINAL)

public:
    explicit ContactViewModel(ContactsDatabaseModel* model = nullptr, QObject *parent = nullptr);

    enum ContactModelRole {
        UserId = Qt::UserRole + 1,
        NameRole = Qt::UserRole + 2,
        TelephoneNumberRole = Qt::UserRole + 3,
        EmailAddressRole = Qt::UserRole + 4,
    };

    QHash<int, QByteArray> roleNames() const override;
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;

    const QList<Contact> &contacts() const;
    void setContacts(const QList<Contact> &newContacts);

signals:
    void contactsChanged();

private:
    QList <Contact> m_contacts;

};

#endif // CONTACTVIEWMODEL_H
