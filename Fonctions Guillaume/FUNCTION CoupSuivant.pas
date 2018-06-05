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

Function CoupSuivant(jeux : jeu;couleur_p,forme_p,i,j : integer):integer;
Var
    CoupLegal : integer;
Begin
// s'il n'y a aucune pièce autour OU s'il y a dejà une pièce à cette position (i,j) alors on ne peut pas placer la pièce à cette position
    if (((CaseVide(jeux,i-1,j)=0) and (CaseVide(jeux,i+1,j)=0) and (CaseVide(jeux,i,j-1)=0) and (CaseVide(jeux,i,j+1)=0)) or (CaseVide(jeux,i,j)=1)) then
    begin
        CoupLegal:=0;   //coup impossible
    end
    else           // sinon s'il y a au moins une pièce autour ...
    Begin
        if ((VerifPieceNord(jeux,couleur_p,forme_p,i,j)=1) or (VerifPieceSud(jeux,couleur_p,forme_p,i,j)=1) or (VerifPieceOuest(jeux,couleur_p,forme_p,i,j)=1) or (VerifPieceEst(jeux,couleur_p,forme_p,i,j)=1)) then
        BEGIN
            CoupLegal:= 1;
        END
        else
        Begin
            CoupLegal:= 0
        end;
    End;
    CoupSuivant:=CoupLegal;
End;
