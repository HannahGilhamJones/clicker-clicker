#ifndef SETTINGSMODEL_H
#define SETTINGSMODEL_H

#include <QObject>
#include <QPair>

class SettingsModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int volume READ getVolume WRITE setVolume NOTIFY volumeChanged)
    Q_PROPERTY(bool fullscreenState READ getFullScreenState WRITE setFullScreenState NOTIFY fullScreenStateChanged)

public:

    explicit SettingsModel(QObject *parent = nullptr);

    int             getVolume();
    bool            getFullScreenState();

signals:

    void            volumeChanged(int volume);
    void            fullScreenStateChanged(bool fullScreenState);

public slots:

    void            setVolume(int volume);
    void            setFullScreenState(bool fullScreenState);

private:

    int             m_volume;
    QPair<int, int> m_resolution;
    bool            m_fullScreenState;
};

#endif // SETTINGSMODEL_H
