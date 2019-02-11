# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-countme2

CONFIG += sailfishapp_qml

DISTFILES += qml/harbour-countme2.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-countme2.changes.run.in \
    rpm/harbour-countme2.spec \
    rpm/harbour-countme2.yaml \
    translations/*.ts \
    harbour-countme2.desktop \
    qml/pages/MainPage.qml \
    qml/pages/AboutPage.qml \
    qml/components/KeepAlive.qml \
    rpm/harbour-countme2.changes

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

TRANSLATIONS += translations/harbour-countme2-fi.ts
