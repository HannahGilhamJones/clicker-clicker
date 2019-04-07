#include "settingsmodel.h"

SettingsModel::SettingsModel(QObject * parent)
    : QObject(parent),
      m_volume(100),
      m_fullScreenState(true)
{

}

int SettingsModel::getVolume()
{
    return m_volume;
}

bool SettingsModel::getFullScreenState()
{
    return m_fullScreenState;
}

QSize SettingsModel::getResolution()
{
    return m_resolution;
}

void SettingsModel::setVolume(int volume)
{
    if(volume != m_volume)
    {
        m_volume = volume;
        emit this->volumeChanged(m_volume);
    }
}

void SettingsModel::setFullScreenState(bool fullScreenState)
{
    if(fullScreenState != m_fullScreenState)
    {
        m_fullScreenState = fullScreenState;

        emit this->fullScreenStateChanged(m_fullScreenState);
    }
}

void SettingsModel::setResolution(QSize resolution)
{
    if(m_resolution != resolution)
    {
        m_resolution = resolution;
        emit this->resolutionChanged(m_resolution);
    }
}
