#ifndef ABONENTCARDVIEWMODEL_H
#define ABONENTCARDVIEWMODEL_H

#include <QObject>

class ContactsDatabaseModel;

class AbonentCardViewModel : public QObject
{
    Q_OBJECT

public:
    Q_PROPERTY(int userId READ userId WRITE setUserId NOTIFY userIdChanged)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString telephoneNumber READ telephoneNumber WRITE setTelephoneNumber NOTIFY telephoneNumberChanged)
    Q_PROPERTY(QString emailAddress READ emailAddress WRITE setEmailAddress NOTIFY emailAddressChanged)

    explicit AbonentCardViewModel(ContactsDatabaseModel* model = nullptr, QObject *parent = nullptr);

    const QString &name() const;
    void setName(const QString &newName);

    const QString &telephoneNumber() const;
    void setTelephoneNumber(const QString &newTelephoneNumber);

    const QString &emailAddress() const;
    void setEmailAddress(const QString &newEmailAddress);

    int userId() const;
    void setUserId(int newId);

signals:
    void nameChanged();

    void telephoneNumberChanged();

    void emailAddressChanged();

    void userIdChanged();

private:
    ContactsDatabaseModel* m_model = nullptr;

    QString m_name;
    QString m_telephoneNumber;
    QString m_emailAddress;
    int m_userId;
};

#endif // ABONENTCARDVIEWMODEL_H
