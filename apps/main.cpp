#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include <QCoreApplication>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    app.setOrganizationName("SunoClientProjectM");
    app.setApplicationName("SunoClientProjectMVideoCreator");
    app.setApplicationVersion("0.1.0");

    QQmlApplicationEngine engine;

    const QString appDir = QCoreApplication::applicationDirPath();
    const QString qmlPath = QDir(appDir).filePath("qml/main.qml");
    engine.load(QUrl::fromLocalFile(qmlPath));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return QCoreApplication::exec();
}