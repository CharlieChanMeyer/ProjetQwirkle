(*
--------------------------------------------------------
- Fonction         : PieceEst
- Auteur           : Guillaume Proton
- Date de creation : 31 Mai 2018
-
- But              : Renvoie la forme et la couleur de la pièce située à l'est de la position (i,j)
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Renvoie la forme et la couleur de la pièce située à l'est de la position (i,j)
--------------------------------------------------------*)


Function PieceEst(jeux:jeu ; i,j : integer):piece;
Var
    maPiece : piece;
Begin
    maPiece.couleur:=jeux.grille[i,j+1].couleur;
    maPiece.forme:=jeux.grille[i,j+1].forme;
    PieceEst:=maPiece;
End;