#ifndef STYLE_H
#define STYLE_H

#include <QColor>
#include <QObject>
#include <QtQml>

#include "global.h"

class Style : public QObject
{
    Q_OBJECT

    Q_PROPERTY(ThemeType::Type theme READ theme WRITE setTheme NOTIFY themeChanged)

    Q_PROPERTY(ComponentType::Type type READ type WRITE setType NOTIFY typeChanged)

    Q_PROPERTY(QColor primaryColor READ primaryColor NOTIFY colorChanged)
    Q_PROPERTY(QColor accentColor READ accentColor NOTIFY colorChanged)
    Q_PROPERTY(QColor disabledColor READ disabledColor NOTIFY colorChanged)
    Q_PROPERTY(QColor primaryTextColor READ primaryTextColor NOTIFY colorChanged)
    Q_PROPERTY(QColor accentTextColor READ accentTextColor NOTIFY colorChanged)
    Q_PROPERTY(QColor disabledTextColor READ disabledTextColor NOTIFY colorChanged)

public:

    explicit Style(QObject * parent = nullptr);
    explicit Style(QObject * parent, ComponentType::Type type);

    static Style *qmlAttachedProperties(QObject *object);

    ThemeType::Type theme() const;
    void setTheme(ThemeType::Type theme);

    ComponentType::Type type() const;
    void setType(ComponentType::Type type);

    QColor primaryColor() const;
    QColor accentColor() const;
    QColor disabledColor() const;
    QColor primaryTextColor() const;
    QColor accentTextColor() const;
    QColor disabledTextColor() const;

signals:

    void themeChanged();
    void colorChanged();
    void typeChanged();

private:

    ThemeType::Type m_theme;
    int m_elevation;
    ComponentType::Type m_type;
};

QML_DECLARE_TYPEINFO(Style, QML_HAS_ATTACHED_PROPERTIES)

#endif // STYLE_H
