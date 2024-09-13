#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H

#include <QObject>
//#include <QTimer>
//#include <QDateTime>

class ContactModel: public QObject
{
    Q_OBJECT

    Q_PROPERTY(qint64 userId READ userId CONSTANT)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(QString telephoneNumber READ telephoneNumber WRITE setTelephoneNumber NOTIFY telephoneNumberChanged FINAL)
    Q_PROPERTY(QString emailAddress READ emailAddress WRITE setEmailAddress NOTIFY emailAddressChanged FINAL)

public:    
    explicit ContactModel(QObject *parent = nullptr);
    ContactModel(const qint64 userId, const QString &name, const QString &telephoneNumber, const QString &emailAddress);


    const QString &telephoneNumber() const;
    Q_INVOKABLE void setTelephoneNumber(const QString &newTelephoneNumber);

    const QString &emailAddress() const;
    Q_INVOKABLE void setEmailAddress(const QString &newEmailAddress);

    const QString &name() const;
    Q_INVOKABLE void setName(const QString &newName);

    const qint64 userId() const;

signals:
    void nameChanged();
    void telephoneNumberChanged();
    void emailAddressChanged();

private:
    qint64 m_userId;
    QString m_name;
    QString m_telephoneNumber;
    QString m_emailAddress;
};

#endif // CONTACTMODEL_H
