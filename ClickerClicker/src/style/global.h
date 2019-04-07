#ifndef GLOBAL_H
#define GLOBAL_H

#include <QObject>

class ComponentType : public QObject {

    Q_OBJECT

public:
    enum class Type {
        Button,
        Label
    };
    Q_ENUM(Type)
};

class ThemeType : public QObject {

    Q_OBJECT

public:
    enum class Type {
        Base,
        BloodMoon
    };
    Q_ENUM(Type)
};

#endif // GLOBAL_H
