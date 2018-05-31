(*
--------------------------------------------------------
- Fonction : CaseVide
- Auteur : Guillaume Proton
- Date de creation : 28 Mai 2018
-
- But : Renvoie 0 si il n'y a pas de pièce dans cette case sinon renvoie 1
- Remarques : Aucune
- Pré conditions : Aucune
- Post conditions : Renvoie 0 si il n'y a pas de pièce dans cette case sinon renvoie 1
--------------------------------------------------------*)

Function CaseVide(jeux:jeu ; i,j:integer):integer;
Var
    Vide : integer;
Begin
    if ((jeux.grille[i,j].couleur=0) or (jeux.grille[i,j].forme=0)) then
    Begin
        Vide:=0;
    End
    Else
    Begin
        Vide:=1
    End;
    CaseVide:=Vide;
End;