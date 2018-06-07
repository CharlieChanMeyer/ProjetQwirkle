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
    nbCasesDessus,nbCasesDessous,l, memeAttribut:integer;

Begin
    memeAttribut :=0;
    for l:=0 to length(jeux.grille)-1 do                // de 0 à 24 faire 
    Begin
        if ((jeux.grille[i,j].forme=) or (jeux.grille[i,j].couleur)) then
        Begin
            memeAttribut := memeAttribut+1
        End;
    End;
    2memesAttributs:= ;
End;


Il faut créer une Fonction pour savoir le nombre de pièces collées qui se trouvent au dessus de la pièce à la position (i,j), au dessous, à gauche et à droite.