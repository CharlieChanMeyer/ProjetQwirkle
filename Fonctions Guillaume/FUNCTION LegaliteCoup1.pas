(*
--------------------------------------------------------
- Fonction         : LegaliteCoup1
- Auteur           : Guillaume Proton
- Date de creation : 28 Mai 2018
-
- But              : Vérifie la légalité du premier coup du tour à la position (i,j) (0 : coup impossible, 1 : coup accepté)
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Vérifie la légalité du premier coup du tour à la position (i,j)(0 : coup impossible, 1 : coup accepté)
--------------------------------------------------------*)

Function LegaliteCoup1(jeux:jeu; couleur_p,forme_p,i,j :integer):integer;
Var
    CoupLegal : integer;
Begin
    //regarder nord est ouest et sud : si couleur de la piece voulant etre jouée ou forme pièce voulant etre jouée est la même que la forme ou la couleur
    //d une des pieces autour alors c est bon
    
    if (CaseVide(jeux,i,j)=0) then
    Begin
        if ((jeux.grille[i-1,j].couleur=couleur_p) or (jeux.grille[i+1,j].couleur=couleur_p) or (jeux.grille[i,j-1].couleur=couleur_p) or (jeux.grille[i,j+1].couleur=couleur_p) 
        or (jeux.grille[i-1,j].forme=forme_p) or (jeux.grille[i+1,j].forme=forme_p) or (jeux.grille[i,j-1].forme=forme_p) or (jeux.grille[i,j+1].forme=forme_p) then
        Begin
            CoupLegal:=1;
        end
        else
        begin
            CoupLegal:=0
        end;
    End
    Else
    Begin
        CoupLegal:=0;
    End;
    LegaliteCoup1:=CoupLegal;
End;


Legalité juste du premier coup ? 
Faire une fonction légalité des coups qui suivent le premier