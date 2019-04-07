#ifndef THEME_H
#define THEME_H

#include <QColor>

#include "global.h"

class Theme
{
public:

    struct ColorSet {
        QColor PrimaryColor;
        QColor AccentColor;
        QColor DisabledColor;
        QColor PrimaryTextColor;
        QColor AccentTextColor;
        QColor DisabledTextColor;
    };

    static Theme * instance();

    ColorSet * colorSet(ThemeType::Type theme, ComponentType::Type type);

protected:

    Theme();

};

#endif // THEME_H
