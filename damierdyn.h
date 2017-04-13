#ifndef DAMIERDYN_H
#define DAMIERDYN_H

#include <iostream>
#include <QObject>
using namespace std;

class DamierDyn : public QObject
{
    Q_OBJECT
public:
    explicit DamierDyn(int l, int c, int value, QObject *parent = 0);
    explicit DamierDyn(const DamierDyn &D, QObject *parent = 0);




    Q_PROPERTY(QList<QString> damQML READ readDamier NOTIFY damChanged);
    Q_PROPERTY(QList<QString> colQML READ readColor NOTIFY damChanged);
    Q_PROPERTY(QString issueQML READ readIssue NOTIFY damChanged);


    Q_INVOKABLE int PrintVal(int l, int c);
    Q_INVOKABLE void Init(int value);
    void Set(int x, int y, int value);
    void ReDim(int l, int c, int vd = -7);
    Q_INVOKABLE QList<QString> readDamier();
    Q_INVOKABLE QList<QString> readColor();
    Q_INVOKABLE void flecheGauche();
    Q_INVOKABLE void flecheDroite();
    Q_INVOKABLE void flecheHaut();
    Q_INVOKABLE void flecheBas();
    Q_INVOKABLE void Print();
    Q_INVOKABLE void Initialisation();
    Q_INVOKABLE void geneAleatoire(int touche);
    string get_color(int valeur);
    Q_INVOKABLE QString readIssue();

signals:
    void damChanged();

private:
    int L;
    int C;
    int** T;
    vector<bool> I={true,true,true,true};

    // Méthode privée (factorisation  de code)
    void Alloc(int l, int c);

    bool sameDimensions (const DamierDyn &D);
};

#endif // DAMIERDYN_H
