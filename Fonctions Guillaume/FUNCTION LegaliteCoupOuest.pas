(*
--------------------------------------------------------
- Fonction         : LegaliteCoupOuest
- Auteur           : Guillaume Proton
- Date de creation : 5 Juin 2018
-
- But              : Renvoie 0 si la pièce voulant être jouée n'est pas de la même couleur ou de la même forme que la couleur ou la forme de la pièce située à l'ouest sinon 1
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Renvoie 0 si la pièce voulant être jouée n'est pas de la même couleur ou de la même forme que la couleur ou la forme de la pièce située à l'ouest sinon 1
--------------------------------------------------------*)

Function LegaliteCoupOuest(jeux:jeu ; i,j,forme_p,couleur_p:integer):integer;
Var
    CoupLegal : integer;
Begin
    if (VerifPosOuest(jeux,couleur_p,forme_p,i,j)=0) then // Vérifie que la pièce voulant être jouée n'est pas de la même couleur ET de la même forme que la pièce située sur la case à gauche
    Begin
        CoupLegal:=0;
    End
    else
    Begin
        CoupLegal:=1          // Coup accepté car (couleur_p = couleur pièce à gauche) XOR (forme_p = forme pièce à gauche)
    End;
    LegaliteCoupOuest:=CoupLegal;
End;
