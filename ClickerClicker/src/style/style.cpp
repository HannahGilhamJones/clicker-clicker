#include "style.h"

#include <QColor>

#include "theme.h"

Style::Style(QObject *parent) :
    QObject (parent),
    m_theme(ThemeType::Type::Base),
    m_type(ComponentType::Type::Button)
{
}

Style::Style(QObject *parent, ComponentType::Type type) :
    QObject (parent),
    m_theme(ThemeType::Type::Base),
    m_type(type)
{
}

Style *Style::qmlAttachedProperties(QObject *object)
{
    const QString objectClass = object->metaObject()->className();

    if (objectClass.startsWith("QQuickButton")) {
        return new Style(object, ComponentType::Type::Button);
    }

    return new Style(object);
}

ThemeType::Type Style::theme() const
{
    return m_theme;
}

void Style::setTheme(ThemeType::Type theme)
{
    if (theme == m_theme) {
        return;
    }

    m_theme = theme;

    emit this->themeChanged();
}

ComponentType::Type Style::type() const
{
    return m_type;
}

void Style::setType(ComponentType::Type type)
{
    if (type == m_type) {
        return;
    }

    m_type = type;

    emit this->typeChanged();
}

QColor Style::primaryColor() const
{
    return Theme::instance()->colorSet(m_theme, m_type)->PrimaryColor;
}

QColor Style::accentColor() const
{
    return Theme::instance()->colorSet(m_theme, m_type)->AccentColor;
}

QColor Style::disabledColor() const
{
    return Theme::instance()->colorSet(m_theme, m_type)->DisabledColor;
}

QColor Style::primaryTextColor() const
{
    return Theme::instance()->colorSet(m_theme, m_type)->PrimaryTextColor;
}

QColor Style::accentTextColor() const
{
    return Theme::instance()->colorSet(m_theme, m_type)->AccentTextColor;
}

QColor Style::disabledTextColor() const
{
    return Theme::instance()->colorSet(m_theme, m_type)->DisabledTextColor;
}
