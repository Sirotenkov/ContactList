#include "contactsdatabasemodel.h"

ContactsDatabaseModel::ContactsDatabaseModel(QObject *parent) : QObject(parent)
{
    m_contacts.append({1000, QString("Nick"), QString("+7(999)111-11-11"), QString("aaa@qqq.yy")});
    m_contacts.append({1001, QString("Dick"), QString("+7(999)222-22-22"), QString("bbb@bbb.yy")});
    m_contacts.append({1002, QString("Rick"), QString("+7(999)333-33-33"), QString("ccc@fff.yy")});
    m_contacts.append({1003, QString("Mick"), QString("+7(999)444-44-44"), QString("vvv@bbb.yy")});
    m_contacts.append({1004, QString("Wick"), QString("+7(999)555-55-55"), QString("nnn@mmm.yy")});
    m_contacts.append({1005, QString("Nick"), QString("+7(999)111-11-11"), QString("aaa@qqq.yy")});
    m_contacts.append({1006, QString("Dick"), QString("+7(999)222-22-22"), QString("bbb@bbb.yy")});
    m_contacts.append({1007, QString("Rick"), QString("+7(999)333-33-33"), QString("ccc@fff.yy")});
    m_contacts.append({1008, QString("Mick"), QString("+7(999)444-44-44"), QString("vvv@bbb.yy")});
    m_contacts.append({1009, QString("Wick"), QString("+7(999)555-55-55"), QString("nnn@mmm.yy")});
    m_contacts.append({1010, QString("Nick"), QString("+7(999)111-11-11"), QString("aaa@qqq.yy")});
    m_contacts.append({1011, QString("Dick"), QString("+7(999)222-22-22"), QString("bbb@bbb.yy")});
    m_contacts.append({1012, QString("Rick"), QString("+7(999)333-33-33"), QString("ccc@fff.yy")});
    m_contacts.append({1013, QString("Mick"), QString("+7(999)444-44-44"), QString("vvv@bbb.yy")});
    m_contacts.append({1015, QString("Wick"), QString("+7(999)555-55-55"), QString("nnn@mmm.yy")});
    m_contacts.append({1016, QString("Nick"), QString("+7(999)111-11-11"), QString("aaa@qqq.yy")});
    m_contacts.append({1017, QString("Dick"), QString("+7(999)222-22-22"), QString("bbb@bbb.yy")});
    m_contacts.append({1018, QString("Rick"), QString("+7(999)333-33-33"), QString("ccc@fff.yy")});
    m_contacts.append({1019, QString("Mick"), QString("+7(999)444-44-44"), QString("vvv@bbb.yy")});
    m_contacts.append({1020, QString("Wick"), QString("+7(999)555-55-55"), QString("nnn@mmm.yy")});
    m_contacts.append({1021, QString("Nick"), QString("+7(999)111-11-11"), QString("aaa@qqq.yy")});
    m_contacts.append({1022, QString("Dick"), QString("+7(999)222-22-22"), QString("bbb@bbb.yy")});
    m_contacts.append({1023, QString("Rick"), QString("+7(999)333-33-33"), QString("ccc@fff.yy")});
    m_contacts.append({1024, QString("Mick"), QString("+7(999)444-44-44"), QString("vvv@bbb.yy")});
    m_contacts.append({1025, QString("Wick"), QString("+7(999)555-55-55"), QString("nnn@mmm.yy")});
    m_contacts.append({1026, QString("Nick"), QString("+7(999)111-11-11"), QString("aaa@qqq.yy")});
    m_contacts.append({1027, QString("Dick"), QString("+7(999)222-22-22"), QString("bbb@bbb.yy")});
    m_contacts.append({1028, QString("Rick"), QString("+7(999)333-33-33"), QString("ccc@fff.yy")});
    m_contacts.append({1029, QString("Mick"), QString("+7(999)444-44-44"), QString("vvv@bbb.yy")});
    m_contacts.append({1030, QString("Wick"), QString("+7(999)555-55-55"), QString("nnn@mmm.yy")});
}

std::optional<Contact> ContactsDatabaseModel::find(qint64 userId) const
{
    for (auto const& contact : m_contacts) {
        if (contact.userId == userId) {
            return contact;
        }
    }
    return {};
}

QList<Contact> ContactsDatabaseModel::list() const
{
    return m_contacts;
}
