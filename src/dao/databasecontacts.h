#ifndef DATABASECONTACTS_H
#define DATABASECONTACTS_H

#include <QObject>
#include <QSqlDatabase>
#include <QDir>
#include <optional>

#include "dto/databasestruct.h"

class DatabaseContacts : public QObject
{
    Q_OBJECT

public:

    explicit DatabaseContacts(QObject *parent = nullptr);

    void create();
    std::optional<DatabaseStruct> find(qint64 userId);
    QList<DatabaseStruct> list() const;
    qint64 insert(QString name, QString telephoneNumber, QString emailAddress);
    void update(qint64 userId, QString name, QString telephoneNumber, QString emailAddress);
    void remove(qint64 userId);

private:
    QSqlDatabase m_database;

signals:
    void inserted(qint64 userId);
    void updated(qint64 userId);
    void removed(qint64 userId);
};

#endif // DATABASECONTACTS_H
