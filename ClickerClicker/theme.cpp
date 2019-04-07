#include "theme.h"

static Theme::ColorSet * baseButtonColorSet = new Theme::ColorSet{
        QColor(0xf4, 0xd7, 0x42), // Primary
        QColor(0xcc, 0xcc, 0xcc), // Accent
        QColor(0x00, 0x00, 0x00), // Disabled
        QColor(0xff, 0xff, 0xff), // Primary text
        QColor(0xcc, 0xcc, 0xcc), // Accent text
        QColor(0x00, 0x00, 0x00) // Disabled text
};
static Theme::ColorSet * bloodMoonColorSet = new Theme::ColorSet{
        QColor(Qt::red), // Primary
        QColor(Qt::black), // Accent
        QColor(0x00, 0x00, 0x00), // Disabled
        QColor(0xff, 0xff, 0xff), // Primary text
        QColor(0xcc, 0xcc, 0xcc), // Accent text
        QColor(0x00, 0x00, 0x00) // Disabled text
};

Theme::Theme()
{
}

Theme *Theme::instance()
{
    static Theme * i = new Theme();
    return i;
}

Theme::ColorSet * Theme::colorSet(ThemeType::Type theme, ComponentType::Type type)
{
    if (theme == ThemeType::Type::Base) {
        switch (type) {
            case ComponentType::Type::Button :
                return baseButtonColorSet;
            case ComponentType::Type::Label :
                return baseButtonColorSet;
        }
    }

    if (theme == ThemeType::Type::BloodMoon) {
        switch (type) {
            case ComponentType::Type::Button :
                return bloodMoonColorSet;
            case ComponentType::Type::Label :
                return bloodMoonColorSet;
        }
    }

    return baseButtonColorSet;
}
