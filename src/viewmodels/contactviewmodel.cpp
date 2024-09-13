#include "contactviewmodel.h"

ContactViewModel::ContactViewModel(ContactsDatabaseModel* model, QObject *parent) : QAbstractListModel{parent}
{
    //m_contacts.append(new ContactModel(QString("Nick"), QString("+7(999)111-11-11"), QString("aaa@qqq.yy")));
    //m_contacts.append(new ContactModel(QString("Dick"), QString("+7(999)222-22-22"), QString("bbb@bbb.yy")));
    //m_contacts.append(new ContactModel(QString("Rick"), QString("+7(999)333-33-33"), QString("ccc@fff.yy")));
    //m_contacts.append(new ContactModel(QString("Mick"), QString("+7(999)444-44-44"), QString("vvv@bbb.yy")));
    //m_contacts.append(new ContactModel(QString("Wick"), QString("+7(999)555-55-55"), QString("nnn@mmm.yy")));
    m_contacts = model->list();
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

//    if (!index.isValid()) return QVariant();

    auto const& contact = m_contacts.at(i);

    switch (role) {
        case UserId:
//            return m_contacts.at(index.row()).userId;
        return contact.userId;;
        case NameRole:
//            return m_contacts.at(index.row()).name;
        return contact.name;
        case TelephoneNumberRole:
//            return m_contacts.at(index.row()).telephoneNumber;
        return contact.telephoneNumber;
        case EmailAddressRole:
//            return m_contacts.at(index.row()).emailAddress;
        return contact.emailAddress;
    }
    return QVariant();
}

const QList<Contact> &ContactViewModel::contacts() const
{
    return m_contacts;
}

void ContactViewModel::setContacts(const QList<Contact> &newContacts)
{
//    if (m_contacts == newContacts)
//        return;
    m_contacts = newContacts;
    emit contactsChanged();
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
