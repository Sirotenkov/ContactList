#include <QDebug>

#include "abonentcardviewmodel.h"
#include "dto/databasestruct.h"

AbonentCardViewModel::AbonentCardViewModel(DatabaseContacts* database, QObject* parent)
    : QObject(parent)
    , m_database(database) {}

const QString &AbonentCardViewModel::name() const
{
    return m_name;
}

void AbonentCardViewModel::setName(const QString &newName)
{
    qDebug() << newName;

    if (m_name == newName)
        return;
    m_name = newName;
    emit nameChanged();
}

const QString &AbonentCardViewModel::telephoneNumber() const
{
    return m_telephoneNumber;
}

void AbonentCardViewModel::setTelephoneNumber(const QString &newTelephoneNumber)
{
    qDebug() << newTelephoneNumber;

    if (m_telephoneNumber == newTelephoneNumber)
        return;
    m_telephoneNumber = newTelephoneNumber;
    emit telephoneNumberChanged();
}

const QString &AbonentCardViewModel::emailAddress() const
{
    return m_emailAddress;
}

void AbonentCardViewModel::setEmailAddress(const QString &newEmailAddress)
{
    qDebug() << newEmailAddress;

    if (m_emailAddress == newEmailAddress)
        return;
    m_emailAddress = newEmailAddress;
    emit emailAddressChanged();
}

int AbonentCardViewModel::userId() const
{
    return m_userId;
}

void AbonentCardViewModel::setUserId(int newUserId)
{
//    if (m_userId == newUserId)
//        return;
    m_userId = newUserId;
    emit userIdChanged();

    auto const& contact = m_database->find(m_userId);
    if (!contact) {
        qDebug() << "no such value found with id" << m_userId;
        return;
    }

    setName(contact->name);
    setTelephoneNumber(contact->telephoneNumber);
    setEmailAddress(contact->emailAddress);
}

void AbonentCardViewModel::insert()
{
    m_database->insert(m_name, m_telephoneNumber, m_emailAddress);
    emit inserted();
}

void AbonentCardViewModel::update()
{
    m_database->update(m_userId, m_name, m_telephoneNumber, m_emailAddress);
    emit updated();
}

void AbonentCardViewModel::remove(qint64 userId)
{
    m_database->remove(m_userId);
    emit removed();
}
