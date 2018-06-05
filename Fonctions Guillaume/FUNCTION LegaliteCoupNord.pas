(*
--------------------------------------------------------
- Fonction         : LegaliteCoupNord
- Auteur           : Guillaume Proton
- Date de creation : 5 Juin 2018
-
- But              : Renvoie 0 si la pièce voulant être jouée n'est pas de la même couleur ou de la même forme que la couleur ou la forme de la pièce située au nord sinon 1
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Renvoie 0 si la pièce voulant être jouée n'est pas de la même couleur ou de la même forme que la couleur ou la forme de la pièce située au nord sinon 1
--------------------------------------------------------*)

Function LegaliteCoupNord(jeux:jeu ; i,j,forme_p,couleur_p:integer):integer;
Var
    CoupLegal : integer;
Begin
    if (VerifPosNord(jeux,couleur_p,forme_p,i,j)=0) then // Vérifie que la pièce voulant être jouée n'est pas de la même couleur ET de la même forme que la pièce située sur la case au-dessus
    Begin
        CoupLegal:=0;
    End
    else
    Begin
        CoupLegal:=1          // Coup accepté car (couleur_p = couleur pièce au dessus) XOR (forme_p = forme pièce au-dessus)
    End;
    LegaliteCoupNord:=CoupLegal;
End;