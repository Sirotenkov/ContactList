#include <QtQuick>
#include <QStandardPaths>
#include <QQmlEngine>

#include <auroraapp.h>

#include "viewmodels/contactviewmodel.h"
#include "viewmodels/abonentcardviewmodel.h"

#include "dto/databasestruct.h"
#include "dao/databasecontacts.h"

int main(int argc, char *argv[])
{

    QScopedPointer<QGuiApplication> application(Aurora::Application::application(argc, argv));

    application->setOrganizationName(QStringLiteral("ru.template"));
    application->setApplicationName(QStringLiteral("ContactList"));

    DatabaseContacts database(&*application);

    ContactViewModel viewModel(&database, &*application);
    AbonentCardViewModel abonentCardViewModel(&database, &*application);

    QScopedPointer<QQuickView> view(Aurora::Application::createView());

    view->rootContext()->setContextProperty("_viewModel", &viewModel);
    view->rootContext()->setContextProperty("_abonentCardViewModel", &abonentCardViewModel);
    view->setSource(Aurora::Application::pathTo(QStringLiteral("qml/ContactList.qml")));
    view->show();

    return application->exec();
}
