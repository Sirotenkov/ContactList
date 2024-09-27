#include <QDebug>
#include <QModelIndex>

#include "contactviewmodel.h"
#include "dao/databasecontacts.h"

ContactViewModel::ContactViewModel(DatabaseContacts* model, QObject *parent)
    : QAbstractListModel{parent}
    , m_model(model)
{
    connect(m_model, &DatabaseContacts::updated,
            this, &ContactViewModel::onDatabaseUpdated);
    connect(m_model, &DatabaseContacts::inserted,
            this, &ContactViewModel::onDatabaseInserted);
    connect(m_model, &DatabaseContacts::removed,
            this, &ContactViewModel::onDatabaseRemoved);

    m_contacts = m_model->list();
}

void ContactViewModel::onDatabaseUpdated(qint64 userId)
{
    qDebug() << userId;

    std::optional<DatabaseStruct> const databaseStruct = m_model->find(userId);
    if(!databaseStruct)
    {
        qDebug() << "No such user found with id" << userId;
        return;
    }

    for (auto i = 0; i < m_contacts.size(); ++i) {
        if (m_contacts[i].userId == userId) {
            m_contacts[i] = *databaseStruct;
            emit dataChanged(index(i, 0), index(i, 0), {NameRole, TelephoneNumberRole, EmailAddressRole});
            break;
        }
    }
}

void ContactViewModel::onDatabaseInserted(qint64 userId)
{
    qDebug() << userId;

    std::optional<DatabaseStruct> const databaseStruct = m_model->find(userId);
    if(!databaseStruct)
    {
        qDebug() << "No such user found with id" << userId;
        return;
    }

    beginInsertRows(QModelIndex(), 0, 0);
    m_contacts.prepend(*databaseStruct);
    endInsertRows();
}

void ContactViewModel::onDatabaseRemoved(qint64 userId)
{
    qDebug() << userId;

    for (auto i = 0; i < m_contacts.size(); ++i) {
        if (m_contacts[i].userId == userId) {

            beginRemoveRows(QModelIndex(), i, i);
            m_contacts.removeAt(i);
            endRemoveRows();

            qDebug() << "Row remove";
            break;
        }
    }
}

int ContactViewModel::rowCount(const QModelIndex &parent) const
{
    return m_contacts.size();
}

QVariant ContactViewModel::data(const QModelIndex &index, int role) const
{
    auto const i = index.row();
    if (i < 0 || i >= m_contacts.size())
        return {};

    if (!index.isValid()) return QVariant();

    auto const& contact = m_contacts.at(i);

    switch (role) {
        case UserId:
            return contact.userId;

        case NameRole:
            return contact.name;

        case TelephoneNumberRole:
            return contact.telephoneNumber;

        case EmailAddressRole:
            return contact.emailAddress;
    }
    return QVariant();
}

const QList<DatabaseStruct> &ContactViewModel::contacts() const
{
    return m_contacts;
}

void ContactViewModel::setContacts(const QList<DatabaseStruct> &newContacts)
{
        m_contacts = newContacts;
        emit contactsChanged();
}

void ContactViewModel::remove(qint64 userId)
{
    m_model->remove(userId);
}

QHash<int, QByteArray> ContactViewModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[UserId] = "userId";
    roles[NameRole] = "name";
    roles[TelephoneNumberRole] = "telephoneNumber";
    roles[EmailAddressRole] = "emailAddress";

    return roles;
}
