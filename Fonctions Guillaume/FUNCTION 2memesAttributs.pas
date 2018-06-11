(*
--------------------------------------------------------
- Fonction         : 2memesAttributs
- Auteur           : Guillaume Proton
- Date de creation : 28 Mai 2018
-
- But              : Renvoie 1 s'il y a deux fois le même attribut sur la même ligne sinon 0
- Remarques        : Aucune  
- Pré conditions   : Aucune
- Post conditions  : Renvoie 1 s'il y a deux fois le même attribut sur la même ligne sinon 0
--------------------------------------------------------*)

Function 2memesAttributs(jeux:jeu;i,j : integer):integer;
Var
    l, memeAttribut:integer;

Begin
    memeAttribut :=0;
    for l:=i+nbCasesSud(jeux,i,j) downto i-nbCasesNord(jeux,i,j) do             // parcoure la ligne contenant la pièce à la position (i,j) de haut en bas
    Begin
        if (((jeux.grille[i,j].forme=jeux.grille[l,j].forme) or (jeux.grille[i,j].couleur=jeux.grille[l,j].couleur)) and (l<>i)) then  // s'il y a une pièce ayant le même attribut sur cette ligne autre que la pièce de la position (i,j)
        Begin
           memeAttribut := 1
        End;
    End;
    for l:=j+nbCasesEst(jeux,i,j) downto j-nbcasesOuest(jeux,i,j) do            // parcoure la ligne contenant la pièce à la position (i,j) de gauche à droite
    Begin
        if (((jeux.grille[i,j].forme=jeux.grille[i,l].forme) or (jeux.grille[i,j].couleur=jeux.grille[i,l].couleur)) and (l<>j)) then // s'il y a une pièce ayant le même attribut sur cette ligne autre que la pièce de la position (i,j)
        Begin
            memeAttribut:=1
        end;
    end;
    2memesAttributs:=memeAttribut ;
End;