(*
--------------------------------------------------------
- Fonction         : VerifPieceEst
- Auteur           : Guillaume Proton
- Date de creation : 31 Mai 2018
-
- But              : Renvoie 0 si la pièce voulant être jouée n'est pas de la même couleur ou de la même forme que la couleur ou la forme de la pièce située à l'est sinon 1
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Renvoie 0 si la pièce voulant être jouée n'est pas de la même couleur ou de la même forme que la couleur ou la forme de la pièce située à l'est sinon 1
--------------------------------------------------------*)


Function PieceEst(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
    memeParam : integer;
Begin
    if ((couleur_p = jeux.grille[i,j+1].couleur) xor (forme_p = jeux.grille[i,j+1].forme)) then    // "xor" car on ne peut pas jouer une pièce de la même forme et de la même couleur côte à côte
    Begin
        memeParam:=1
    End
    else
    begin
        memeParam:=0;
    end;
    PieceEst:=memeParam;
End;