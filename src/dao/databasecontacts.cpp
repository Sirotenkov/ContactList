#include <QDebug>
#include <QSqlError>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QStandardPaths>

#include "databasecontacts.h"

QString const driverName = "QSQLITE";

DatabaseContacts::DatabaseContacts(QObject *parent) : QObject(parent)
{
    if (!QSqlDatabase::isDriverAvailable(driverName)) {
        qDebug() << "No driver found: " << driverName;
        qDebug() << "Available drivers: " << QSqlDatabase::drivers();
    }

    QDir const workDir = QStandardPaths::writableLocation(QStandardPaths::DocumentsLocation);
//    QDir().mkdir(workDir.path());

    m_database = QSqlDatabase::addDatabase(driverName);
    m_database.setDatabaseName(workDir.path() + QDir::separator() + "contacts.sqlite");

    if (!m_database.open()) {
        QSqlError err = m_database.lastError();
        qDebug() << err.nativeErrorCode() << ": " << err.text();
    }

    create();
}

void DatabaseContacts::create()
{
    qDebug();

    QSqlQuery query(m_database);
    query.exec("CREATE TABLE IF NOT EXISTS contacts (userId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT, telephoneNumber TEXT, emailAddress TEXT, timeCreation DATETIME, timeChange DATETIME);");
}

std::optional<DatabaseStruct> DatabaseContacts::find(qint64 userId)
{
    qDebug() << userId;

    QSqlQuery query(m_database);
    query.prepare("SELECT * FROM contacts WHERE userId = ?");
    query.addBindValue(userId);
    query.exec();

    qDebug() << query.lastError();

    if (query.next()) {
        DatabaseStruct const entry (query.value(0).toInt(), query.value(1).toString(), query.value(2).toString(), query.value(3).toString(), query.value(4).toDateTime(), query.value(5).toDateTime());
        return entry;
    } else {
        qDebug() << "Error! Not entry with this id!" << userId;
        return {};
    }
}

QList<DatabaseStruct> DatabaseContacts::list() const
{
    qDebug();

    QSqlQuery query(m_database);
    query.prepare("SELECT * FROM contacts ORDER BY timeChange DESC");
    query.exec();

    qDebug() << query.lastError();

    QList<DatabaseStruct> list;
    while (query.next()) {
        DatabaseStruct const entry (query.value(0).toInt(), query.value(1).toString(), query.value(2).toString(), query.value(3).toString(), query.value(4).toDateTime(), query.value(5).toDateTime());
        list.append(entry);
    }
    return list;
}

qint64 DatabaseContacts::insert(QString name, QString telephoneNumber, QString emailAddress)
{
    qDebug() << name << telephoneNumber << emailAddress;

    QSqlQuery query(m_database);
    query.prepare("INSERT INTO contacts (name, telephoneNumber, emailAddress, timeCreation, timeChange) VALUES (?, ?, ?, ?, ?)");
    query.addBindValue(name);
    query.addBindValue(telephoneNumber);
    query.addBindValue(emailAddress);
    query.addBindValue(QDateTime::currentDateTime());
    query.addBindValue(QDateTime::currentDateTime());
    query.exec();

    qDebug() << query.lastError();

    auto const insertId = query.lastInsertId().toInt();

    emit inserted(insertId);
    return insertId;;
}

void DatabaseContacts::remove(qint64 userId)
{
    qDebug() << userId;

    QSqlQuery query(m_database);
    query.prepare("DELETE FROM contacts WHERE userId = ?");
    query.addBindValue(userId);
    query.exec();

    qDebug() << query.lastError();

    if (query.numRowsAffected() > 0) {
        emit removed(userId);
    }
}

void DatabaseContacts::update(qint64 userId, QString name, QString telephoneNumber, QString emailAddress)
{
    qDebug() << userId << name;

    QSqlQuery query(m_database);
    query.prepare("UPDATE contacts SET name = ?, telephoneNumber = ?, emailAddress = ?, timeChange = ? WHERE userId = ?");
    query.addBindValue(name);
    query.addBindValue(telephoneNumber);
    query.addBindValue(emailAddress);
    query.addBindValue(QDateTime::currentDateTime());
    query.addBindValue(userId);
    query.exec();

    qDebug() << query.lastError();

    emit updated(userId);
}
