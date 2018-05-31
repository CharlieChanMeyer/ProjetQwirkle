(*
--------------------------------------------------------
- Fonction         : CoupSuivant
- Auteur           : Guillaume Proton
- Date de creation : 31 Mai 2018
-
- But              : Vérifie la légalité du coup suivant le premier coup de ce tour à la position (i,j) (0 : coup impossible, 1 : coup accepté)
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Vérifie la légalité du coup suivant le premier coup de ce tour à la position (i,j)(0 : coup impossible, 1 : coup accepté)
--------------------------------------------------------*)

Function CoupSuivant(jeux : jeu;i,j : integer):integer;
Var
    CoupLegal : integer;
    est : piece;
Begin
// s'il n'y a aucune pièce autour on ne peut pas placer la pièce à cette position

    if (CaseVide(jeux,i-1,j)=0) and (CaseVide(jeux,i+1,j)=0) and (CaseVide(jeux,i,j-1)=0) and (CaseVide(jeux,i,j+1)=0) then
        CoupLegal:=0;
    end
    else           // sinon s'il y a au moins une pièce autour ...
    Begin
        if (CaseVide(jeux,i,j+1)=1) and 
        BEGIN
        
        END;
    End;
End;
