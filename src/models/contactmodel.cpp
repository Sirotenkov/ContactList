#include "contactmodel.h"

ContactModel::ContactModel(QObject *parent) : QObject{parent}
{

}

ContactModel::ContactModel(const qint64 userId, const QString &name, const QString &telephoneNumber, const QString &emailAddress) : m_userId(userId), m_name(name),
    m_telephoneNumber(telephoneNumber),
    m_emailAddress(emailAddress)
{

}

const qint64 ContactModel::userId() const
{
    return m_userId;
}

const QString &ContactModel::name() const
{
    return m_name;
}

void ContactModel::setName(const QString &newName)
{
    if (m_name == newName)
        return;
    m_name = newName;
    emit nameChanged();
}

const QString &ContactModel::telephoneNumber() const
{
    return m_telephoneNumber;
}

void ContactModel::setTelephoneNumber(const QString &newTelephoneNumber)
{
    if (m_telephoneNumber == newTelephoneNumber)
        return;
    m_telephoneNumber = newTelephoneNumber;
    emit telephoneNumberChanged();
}

const QString &ContactModel::emailAddress() const
{
    return m_emailAddress;
}

void ContactModel::setEmailAddress(const QString &newEmailAddress)
{
    if (m_emailAddress == newEmailAddress)
        return;
    m_emailAddress = newEmailAddress;
    emit emailAddressChanged();
}
