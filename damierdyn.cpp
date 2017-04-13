#include "damierdyn.h"
#include <vector>
#include <iostream>
#include <stdlib.h>
using namespace std;

DamierDyn::DamierDyn(int l, int c, int vd, QObject *parent) : QObject(parent)
{
    Alloc(l, c);
    Init(vd);
}

DamierDyn::DamierDyn(const DamierDyn &D, QObject *parent) : QObject(parent)
{
    Alloc(D.L, D.C);

    for(int i=0; i<L; i++)
        for(int j=0; j<C; j++)
            T[i][j] = D.T[i][j];
}


void DamierDyn::Alloc(int l, int c){
    L = l;
    C = c;
    T = new int*[L];
    for(int i=0; i<L; i++)
        T[i] = new int[C];
}



int DamierDyn::PrintVal(int l, int c){
    return T[l][c];
}

QList<QString> DamierDyn::readDamier(){
    QList<QString> V;
    for (int i=0;i<L;i++){
        for(int j=0;j<C;j++){
            if (T[i][j]==0){
                V.append(QString::fromStdString(""));
            }
            else {
                V.append(QString::number(T[i][j]));
            }
        }
    }
    return V;
}

string DamierDyn::get_color(int valeur)//Renvoie une couleur (string au format hexadécimal) en fontion de la valeur d'entrée
{
    std::map<int, string> grille;
    grille[0]="#C1B4A4";
    grille[2]="#E9DED1";
    grille[4]="#E9DABD";
    grille[8]="#EDA267";
    grille[16]="#F58250";
    grille[32]="#F56450";
    grille[64]="#F14B30";
    grille[128]="#F1C62D";
    grille[256]="#E6C850";
    grille[512]="#E9BE3C";
    grille[1024]="#E6BE32";
    grille[2048]="#EBB42D";
    grille[8096]="";

    //définition de la liste des clefs
    std::vector<int> clefs;
    for (int n = 0; n < 13; n++) {
      clefs.push_back(pow(2,n));
    }

    //on parcours la liste des clefs
    for (int i = 0; i < clefs.size(); i++) {
      //si le score est égal à la clef
      if (valeur == clefs[i]) {
        //on renvoit la valeur associée à la clef
        return grille[clefs[i]] ;
      }
    }

    //si on a rien encore renvoyé
    //ie le score est supérieur à la clef max ou non prévu
    //on renvoit la valeur associée à la clef max
    /*std::cout << "c'est la fin" << std::endl;
    return grille[2048] ;*/
    return grille[0];
}



//Pour récupérer une matrice de couleur associée
QList<QString> DamierDyn::readColor(){
    QList<QString> D;
    QString Col;
    for (int i=0;i<L;i++){
        for(int j=0;j<C;j++){
            Col=QString::fromStdString(get_color(T[i][j]));
            D.append(Col);
        }
    }
    return D;
}

void DamierDyn::Init(int value){
    for(int i=0; i<L; i++)
        for(int j=0; j<C; j++)
            T[i][j]=value;
    damChanged();

}

void DamierDyn::Initialisation(){
    int a=rand() % 2 +1;
    int b=rand() % 2 +1;
    int a1=rand() % 3;
    int a2=rand() % 3;
    int b1=rand() % 3;
    int b2=rand() % 3;
    for(int i=0; i<L; i++)
       for(int j=0; j<C; j++)
          T[i][j]=0;
    T[a1][a2]=2*a;
    T[b1][b2]=2*b;
}

void DamierDyn::geneAleatoire(int touche){
    vector<int> P;
    vector<int> I;
    vector<int> J;
    int l;
    for (int i=0;i<L;i++){
        for(int j=0;j<C;j++){
            if (T[i][j]==0) {
                I.push_back(i);
                J.push_back(j);
            }
        }
    }
    l=I.size();
    int a=rand() %  l;
    if (touche==1 and I[a]<2){a=rand() % l;}
    if (touche==2 and I[a]>1){a=rand() % l;}
    if (touche==3 and J[a]<2){a=rand() % l;}
    if (touche==4 and J[a]>1){a=rand() % l;}
    int b=rand() % 2 +1;
    if (b==2){
        b=rand() % 2 +1;
        if (b==2){
            b=rand() % 2 +1;
        }
    }
    T[I[a]][J[a]]=2*b;



}

void DamierDyn::Print(){
    cout << endl;
    for(int i=0; i<L; i++) {
        cout << endl;
        for(int j=0; j<C; j++)
            cout << T[i][j] << ", ";
    }
    cout<<"___"<<endl;
}

void DamierDyn::Set(int x, int y, int value) {
    T[x][y]=value;
}


void DamierDyn::flecheGauche() {
    bool chgmt=false;
    for(int l=0;l<4;l++){

        for(int i=0;i<4;i++){
            int compteur=0;
            while (T[l][i]==0 && compteur<3) {
                compteur++;
                for (int j=i;j<3;j++){
                    if (T[l][j]!=0){
                        chgmt=true;
                    }
                    T[l][j]=T[l][j+1];
                };
                T[l][3]=0;

             }
        };

        for(int j=0 ; j<3 ; j++){
            if (T[l][j]==T[l][j+1]) {
                if (T[l][j]!=0){
                    chgmt=true;
                }
                T[l][j]=2*T[l][j];
                T[l][j+1]=0;
            }
        };

        for(int i=0;i<4;i++){
            int compteur=0;
            while (T[l][i]==0 && compteur<3) {
                compteur++;
                for (int j=i;j<3;j++){
                    if (T[l][j]!=0){
                        chgmt=true;
                    }
                    T[l][j]=T[l][j+1];
                };
                T[l][3]=0;

             }
        };

    };
    if (chgmt==true){
        geneAleatoire(3);
        I[3]=true;
    }
    else{
        I[2]=false;
    }
    damChanged();
}

void DamierDyn::flecheDroite(){
    bool chgmt=false; // cette variable permet de savoir s'il y a eu un déplacement de nombre lors de l'appui sur une touche.
                      // S'il y a eu un chagement, on va générer un 2 ou un 4 de manière aléatoire, sinon, aucun nouveau chiffre n'apparait.
    for(int l=0;l<4;l++){

        for(int i=3;i>-1;i--){
            int compteur=0;
            while (T[l][i]==0 && compteur<4) {
                compteur++;
                for (int j=i;j>-1;j--){ // Cette boucle permet de prévoir s'il va y avoir un déplacement de nombre
                    if (T[l][j]!=0) {   // pour cela, on regarde sur une ligne commençant par 0, s'il n'y a que des zeros ou non.
                        chgmt=true;     // Si non, chgmt prend la valeur true.
                    }
                }
                for (int j=i;j>0;j--){
                    T[l][j]=T[l][j-1];
                };
                T[l][0]=0;

             }
        };



        for(int j=3 ; j>0 ; j--){
            if (T[l][j]==T[l][j-1]) {
                if (T[l][j]!=0){  // S'il y a deux nombres identiques côte à côte, or 0, il y a un changement
                    chgmt=true;
                }
                T[l][j]=2*T[l][j];
                T[l][j-1]=0;
            }
        }

        for(int i=3;i>-1;i--){
            int compteur=0;
            while (T[l][i]==0 && compteur<4) {
                compteur++;
                for (int j=i;j>-1;j--){
                    if (T[l][j]!=0) {
                        chgmt=true;
                    }
                }
                for (int j=i;j>0;j--){
                    T[l][j]=T[l][j-1];
                };
                T[l][0]=0;

             }
        };
    }
    if (chgmt==true){    // On génère un 2 ou un 4 à une position aléatoire uniquement s'il y a eu un changement
        geneAleatoire(4);
        I[3]=true;
    }
    else{
        I[3]=false;
    }

    damChanged();
}

void DamierDyn::flecheHaut(){
    bool chgmt=false;

    for(int c=0;c<4;c++){
        for(int i=0;i<4;i++){
            int compteur=0;
            while (T[i][c]==0 && compteur<4) {
                compteur++;
                for (int j=i;j<3;j++){
                    if (T[j][c]!=0){
                        chgmt=true;
                    }
                }
                for (int j=i;j<3;j++){
                    T[j][c]=T[j+1][c];
                };
                T[3][c]=0;

             }
        };

        for(int i=0 ; i<3 ; i++){
            if (T[i][c]==T[i+1][c]){
                if (T[i][c]!=0){
                    chgmt=true;
                }
                T[i][c]=2*T[i][c];
                T[i+1][c]=0;
            }
        }

        for(int i=0;i<4;i++){
            int compteur=0;
            while (T[i][c]==0 && compteur<4) {
                compteur++;
                for (int j=i;j<3;j++){
                    if (T[j][c]!=0){
                        chgmt=true;
                    }
                }
                for (int j=i;j<3;j++){
                    T[j][c]=T[j+1][c];
                };
                T[3][c]=0;

             }
        };

    };
    if (chgmt==true){
        geneAleatoire(1);
        I[0]=true;
    }
    else{
        I[0]=false;
    }

    damChanged();
}



void DamierDyn::flecheBas(){
    bool chgmt=false;
    for(int c=0;c<4;c++){
        for(int i=3;i>-1;i--){
            int compteur=0;
            while (T[i][c]==0 && compteur<4) {
                compteur++;
                for (int j=i;j>0;j--){
                    if (T[j][c]!=0){
                        chgmt=true;
                    }
                }
                for (int j=i;j>0;j--){
                    T[j][c]=T[j-1][c];
                };
                T[0][c]=0;
             }
        };

        for(int i=3 ; i>0 ; i--){
            if (T[i][c]==T[i-1][c]){
                T[i][c]=2*T[i][c];
                T[i-1][c]=0;
            }
        }

        for(int i=3;i>-1;i--){
            int compteur=0;
            while (T[i][c]==0 && compteur<4) {
                compteur++;
                for (int j=i;j>0;j--){
                    if (T[j][c]!=0){
                        chgmt=true;
                    }
                }
                for (int j=i;j>0;j--){
                    T[j][c]=T[j-1][c];
                };
                T[0][c]=0;

             }
        };
    }
    if (chgmt==true){
        geneAleatoire(2);
        I[1]=true;
    }
    else{
        I[1]=false;
    }
    damChanged();

};

QString DamierDyn::readIssue(){
    int n=0;
    for (int i=0; i++; i<4){
        if (I[i]==false){
            n++;
        }
    }
    if (n==4){
        return QString::fromStdString("Perdu");
    }
    else {
        return QString::fromStdString("");
    }
    for (int i=0; i<L;i++){
        for (int j=0;i<C;i++){
            if (T[i][j]==2048){
                return QString::fromStdString("Gagné");
            }
        }
    }
}








