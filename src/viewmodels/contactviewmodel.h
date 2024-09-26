#ifndef CONTACTVIEWMODEL_H
#define CONTACTVIEWMODEL_H

#include <QAbstractListModel>
#include <QObject>
#include <QString>

#include "dto/contact.h"
#include "dao/databasecontacts.h"

class ContactViewModel : public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY(QList<DatabaseStruct> contacts READ contacts WRITE setContacts NOTIFY contactsChanged FINAL)

public:
    explicit ContactViewModel(DatabaseContacts* model = nullptr, QObject *parent = nullptr);

    enum ContactModelRole {
        UserId = Qt::UserRole + 1,
        NameRole = Qt::UserRole + 2,
        TelephoneNumberRole = Qt::UserRole + 3,
        EmailAddressRole = Qt::UserRole + 4,
    };

    QHash<int, QByteArray> roleNames() const override;
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;

    const QList<DatabaseStruct> &contacts() const;
    void setContacts(const QList<DatabaseStruct> &newContacts);
    Q_INVOKABLE void remove(qint64 userId);

signals:
    void contactsChanged();

private slots:
    void onDatabaseUpdated(qint64 userId);
    void onDatabaseInserted(qint64 userId);
    void onDatabaseRemoved(qint64 userId);

private:
    QList <DatabaseStruct> m_contacts;
    DatabaseContacts *m_model = nullptr;
};

#endif // CONTACTVIEWMODEL_H
