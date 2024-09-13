#include <QDebug>

#include "abonentcardviewmodel.h"
#include <models/contactsdatabasemodel.h>

AbonentCardViewModel::AbonentCardViewModel(ContactsDatabaseModel* model, QObject *parent)
    : QObject(parent)
    , m_model(model)
{

}

const QString &AbonentCardViewModel::name() const
{
    return m_name;
}

void AbonentCardViewModel::setName(const QString &newName)
{
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
    if (m_userId == newUserId)
        return;
    m_userId = newUserId;
    emit userIdChanged();

    auto const& contact = m_model->find(m_userId);
    if (!contact) {
        qDebug() << "no such value found with id" << m_userId;
        return;
    }

    setName(contact->name);
    setTelephoneNumber(contact->telephoneNumber);
    setEmailAddress(contact->emailAddress);
}
