#ifndef SETTINGSMODEL_H
#define SETTINGSMODEL_H

#include <QObject>
#include <QPair>
#include <QSize>

class SettingsModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int volume READ getVolume WRITE setVolume NOTIFY volumeChanged)
    Q_PROPERTY(bool fullscreenState READ getFullScreenState WRITE setFullScreenState NOTIFY fullScreenStateChanged)
    Q_PROPERTY(QSize resolution READ getResolution WRITE setResolution NOTIFY resolutionChanged)

public:

    explicit SettingsModel(QObject *parent = nullptr);

    int             getVolume();
    bool            getFullScreenState();
    QSize           getResolution();

signals:

    void            volumeChanged(int volume);
    void            fullScreenStateChanged(bool fullScreenState);
    void            resolutionChanged(QSize resolution);

public slots:

    void            setVolume(int volume);
    void            setFullScreenState(bool fullScreenState);
    void            setResolution(QSize resolution);

private:

    int             m_volume;
    QSize           m_resolution;
    bool            m_fullScreenState;
};

#endif // SETTINGSMODEL_H
