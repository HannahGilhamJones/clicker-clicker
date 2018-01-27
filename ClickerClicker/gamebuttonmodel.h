#ifndef GAMEBUTTON_H
#define GAMEBUTTON_H

#include <QObject>

class GameButtonModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int currentScore READ getCurrentScore WRITE setCurrentScore NOTIFY currentScoreChanged)

public:
    explicit GameButtonModel(QObject *parent = nullptr);

    int         getCurrentScore();
    int         getInitialScore();
    int         getAmount();
    int         getCost();

signals:

    void        currentScoreChanged(int currentScore);
    void        initialScoreChanged(int initialScore);
    void        amountChanged(int currentAmount);
    void        costChanged(int costChanged);

public slots:

    void        setCurrentScore(int currentScore);
    void        setInitialScore(int initialScore);
    void        setAmount(int amount);
    void        setCost(int cost);

private:

    int m_amount;
    int m_initialScore;
    int m_score;
    int m_cost;
};

#endif // GAMEBUTTON_H
