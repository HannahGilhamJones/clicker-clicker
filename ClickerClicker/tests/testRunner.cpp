#include <QTest>

#include "testgamebuttonmodel.cpp"
#include "testboostbuttonmodel.cpp"

int main(int argc, char **argv) {
    int status = 0;

    {
        TestGameButtonModel testA;
        status |= QTest::qExec(&testA, argc, argv);
    }

    {
        TestBoostButtonModel testB;
        status |= QTest::qExec(&testB, argc, argv);
    }

    return status;
}
