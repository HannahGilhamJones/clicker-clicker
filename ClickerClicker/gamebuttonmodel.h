#ifndef GAMEBUTTON_H
#define GAMEBUTTON_H

#include <QObject>

class GameButtonModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int currentScore READ getCurrentScore WRITE setCurrentScore NOTIFY currentScoreChanged)
    Q_PROPERTY(int initialScore READ getInitialScore WRITE setInitialScore NOTIFY initialScoreChanged)
    Q_PROPERTY(int amount READ getAmount WRITE setAmount NOTIFY amountChanged)
    Q_PROPERTY(int cost READ getCost WRITE setCost NOTIFY costChanged)

public:
    explicit GameButtonModel(QObject *parent = nullptr);

    int         getCurrentScore();
    int         getInitialScore();
    int         getAmount();
    int         getCost();

signals:

    void        currentScoreChanged(int currentScore);
    void        initialScoreChanged(int initialScore);
    void        amountChanged(int amount);
    void        costChanged(int cost);

public slots:

    void        setCurrentScore(int currentScore);
    void        setInitialScore(int initialScore);
    void        setAmount(int amount);
    void        setCost(int cost);

private:

    int m_currentScore;
    int m_initialScore;
    int m_amount;
    int m_cost;
};

#endif // GAMEBUTTON_H
