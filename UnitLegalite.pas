(*
------------------------------------------------------------------------------------
-- Fichier           : UnitLegalite.pas
-- Auteur            : Guillaume Proton 
-- Date de creation  : 6 Juin 2018
--
-- But               : But
-- Remarques         : Aucune
-- Compilation       : fpc
-- Edition des liens : fpc
-- Execution         : shell
------------------------------------------------------------------------------------
*)
Unit UnitLegalite;

interface

USES SysUtils,UnitType,UnitParam,UnitAff,Crt;

Function PrioriteJoueur(jeux:jeu):jeu;
Function deuxMemesAttributs(jeux:jeu;i,j:integer):integer;
Function CaseVide(jeux:jeu ; i,j:integer):integer;
Function LegaliteCoup(jeux:jeu; couleur_p,forme_p,i,j :integer):integer;
Function VerifPieceEst(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Function VerifPieceNord(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Function VerifPieceOuest(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Function VerifPieceSud(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Function Max(x1,x2:integer):integer;
Function nbPiecesNord(jeux:jeu;i,j:integer):integer;
Function nbPiecesSud(jeux:jeu;i,j:integer):integer;
Function nbPiecesOuest(jeux:jeu;i,j:integer):integer;
Function nbPiecesEst(jeux:jeu;i,j:integer):integer;

implementation


(*
 ------------------------------------------------------------------------------------
 -- Fonction          : TriBulle
 -- Auteur            : Guillaume Proton
 -- Date de creation  : Mercredi 4 Avril 2018
 --
 -- But               : Trie un tableau d'entiers dans l'ordre croissant
 -- Remarques         : Aucune
 -- Préconditions     : t est un tableau quelconque
 -- Postconditions    : Trie un tableau d'entiers dans l'ordre croissant
 ------------------------------------------------------------------------------------
 *)

FUNCTION TriBulle(t : tabentier):tabentier;
VAR
   n,tmp,fin,j : integer;
   boolechange : boolean;
BEGIN
   n := length(t);
   fin:=n-2;
   boolechange:=true;
   While (fin>0) and (boolechange) do
   BEGIN
      boolechange:=false;
      for j:=0 to fin do
      BEGIN
	 if (t[j]>t[j+1]) then
	 BEGIN
	    tmp :=t[j];
	    t[j]:=t[j+1];
	    t[j+1]:=tmp;
	    boolechange:=true;
	 END;
      END;
      fin:=fin-1;
   END;
   TriBulle:=t;
END;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : InverseOrdre
 -- Auteur            : Guillaume Proton
 -- Date de creation  : Lundi 29 Janvier 2018
 --
 -- But               : Inverse l'ordre des valeurs dans un tableau
 -- Remarques         : Aucune
 -- Préconditions     : Aucune
 -- Postconditions    : Inverse l'ordre des valeurs dans un tableau
 ------------------------------------------------------------------------------------
 *)

FUNCTION InverseOrdre(t	: tabdyn):tabdyn;
VAR
   Tinv : tabdyn;
   i, compteur : Integer;
BEGIN
   compteur := 0;
   setlength(Tinv,length(t));
   for i:=0 to high(t) do
   BEGIN
      Tinv[i]:=t[high(t)-compteur];
      compteur := compteur + 1
   END;
   InverseOrdre := Tinv;
END;


(*
--------------------------------------------------------
- Fonction         : prioriteAge
- Auteur           : Guillaume Proton
- Date de creation : 12 Juin 2018
-
- But              : Renvoie un tableau de joueurs trié par âge décroissant
- Remarques        : Aucune  
- Pré conditions   : Aucune
- Post conditions  : Renvoie un tableau de joueurs trié par âge décroissant
--------------------------------------------------------*)

Function prioriteAge(jeux:jeu):tabpiocher;
Var
    tableauAge:tabpiocher;
Begin
    setlength(tableauAge,length(jeux.player));           // créer un tableau de la taille du nombre de joueurs
    for i:=0 to length(tableauAge)-1 do                  // recopier l'âge de chaque joueur dans le tableau 'tableauAge'
    Begin
        tableauAge[i]:=jeux.player[i].age
    End;
    tableauAge:=TriBulle(tableauAge);                       //Trier le tableau pour avoir les âges dans l'ordre croissant
    tableauAge:=InverseOrdre(tableauAge);                   // Inverse l'ordre des valeurs du tableau pour avoir les âges des joueurs dans l'ordre décroissant
    prioriteAge:=tableauAge;
end;
(*
--------------------------------------------------------
- Fonction         : prioriteJoueur
- Auteur           : Guillaume Proton
- Date de creation : 11 Juin 2018
-
- But              : Renvoie un tableau de joueurs trié dans l'ordre dans lequel ils vont jouer (le joueur 0 va jouer en premier puis le joueur 1, etc ...)
- Remarques        : Aucune  
- Pré conditions   : Aucune
- Post conditions  : Renvoie un tableau de joueurs trié dans l'ordre dans lequel ils vont jouer (le joueur 0 va jouer en premier puis le joueur 1, etc ...)
--------------------------------------------------------*)
Function prioriteJoueur(jeux:jeu):tabjoueur;
Var
    tabTrie : tabjoueur;
Begin
    if (plusGrandeCombinaison d'un joueur = plusGrandeCombinaison d'un autre) then
    Begin
        fonction priorite en fonction de l'age
    End;
    for i:=0 to length(jeux.player.main)-1 do 
    Begin
        
    end;
End;
jeux.player.main[].forme
Fonction qui compte le nombre de combinaisons de chaque joueur en fonction de sa main
Une autre fonction pour faire l''ordre en fonction de l''âge (max d''un tableau dyn qui s''efface comme la pioche au fur et à mesure, création d''un deuxieme tableau dyn qui contiendra les joueurs triés dans l''ordre)  

(*
--------------------------------------------------------
- Fonction         : deuxMemesAttributs
- Auteur           : Guillaume Proton
- Date de creation : 28 Mai 2018
-
- But              : Renvoie 1 s'il y a deux fois le même attribut sur la même ligne sinon 0
- Remarques        : Aucune  
- Pré conditions   : Aucune
- Post conditions  : Renvoie 1 s'il y a deux fois le même attribut sur la même ligne sinon 0
--------------------------------------------------------*)

Function deuxMemesAttributs(jeux:jeu;i,j : integer):integer;
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
    deuxMemesAttributs:=memeAttribut ;
End;


(*
--------------------------------------------------------
- Fonction : CaseVide
- Auteur : Guillaume Proton
- Date de creation : 28 Mai 2018
-
- But : Renvoie 0 s'il n'y a pas de pièce dans cette case sinon renvoie 1
- Remarques : Aucune
- Pré conditions : Aucune
- Post conditions : Renvoie 0 s'il n'y a pas de pièce dans cette case sinon renvoie 1
--------------------------------------------------------*)

Function CaseVide(jeux:jeu ; i,j:integer):integer;
Var
    Vide : integer;
Begin
    if ((jeux.grille[i,j].couleur=0) and (jeux.grille[i,j].forme=0)) then   // si la couleur et la forme de la pièce censée être à cette position ne sont pas définies (=0) alors il n'y a pas de pièce
    Begin
        Vide:=0;
    End
    Else
    Begin
        Vide:=1
    End;
    CaseVide:=Vide;
End;


(*
--------------------------------------------------------
- Fonction         : LegaliteCoup
- Auteur           : Guillaume Proton
- Date de creation : 28 Mai 2018
-
- But              : Vérifie la légalité du coup à la position (i,j) (0 : coup impossible, 1 : coup accepté)
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Vérifie la légalité du coup à la position (i,j)(0 : coup impossible, 1 : coup accepté)
--------------------------------------------------------*)

Function LegaliteCoup(jeux:jeu; couleur_p,forme_p,i,j :integer):integer;
Var
    CoupLegal : integer;
Begin
    //regarder nord est ouest et sud : si couleur de la piece voulant etre jouée ou forme pièce voulant etre jouée est la même que la forme ou la couleur
    //d une des pieces autour alors c est bon
    
    if (CaseVide(jeux,i,j)=0) then
    Begin
        if ((VerifPieceNord(jeux,couleur_p,forme_p,i,j)=1) or (VerifPieceSud(jeux,couleur_p,forme_p,i,j)=1) or (VerifPieceEst(jeux,couleur_p,forme_p,i,j)=1) or (VerifPieceOuest(jeux,couleur_p,forme_p,i,j)=1)) then
        Begin
            CoupLegal:=1;          // coup accepté
        end
        else
        begin
            CoupLegal:=0             // coup impossible
        end;
    End
    Else
    Begin
        CoupLegal:=0;               // coup impossible car il y a déjà une pièce à cette position
    End;
    if (deuxMemesAttributs(jeux,i,j)=1) then  // s'il y a deux fois le même attribut sur la même ligne alors le coup n'est pas valide
    Begin
        CoupLegal:=0
    end;
    LegaliteCoup:=CoupLegal;
End;


(*
--------------------------------------------------------
- Fonction         : VerifPieceEst
- Auteur           : Guillaume Proton
- Date de creation : 31 Mai 2018
-
- But              : Renvoie 0 si la pièce voulant être jouée n'a pas un attribut en commun avec la pièce située à l'est de la position (i,j) sinon 1
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Renvoie 0 si la pièce voulant être jouée n'a pas un attribut en commun avec la pièce située à l'est de la position (i,j) sinon 1
--------------------------------------------------------*)


Function VerifPieceEst(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Var
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
    VerifPieceEst:=memeParam;
End;


(*
--------------------------------------------------------
- Fonction         : VerifPieceNord
- Auteur           : Guillaume Proton
- Date de creation : 31 Mai 2018
-
- But              : Renvoie 0 si la pièce voulant être jouée n'a pas un attribut en commun avec la pièce située au nord de la position (i,j) sinon 1
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Renvoie 0 si la pièce voulant être jouée n'a pas un attribut en commun avec la pièce située au nord de la position (i,j) sinon 1
--------------------------------------------------------*)


Function VerifPieceNord(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Var
    memeParam : integer;
Begin
    if ((couleur_p = jeux.grille[i-1,j].couleur) xor (forme_p = jeux.grille[i-1,j].forme)) then    // "xor" car on ne peut pas jouer une pièce de la même forme et de la même couleur côte à côte
    Begin
        memeParam:=1
    End
    else
    begin
        memeParam:=0;
    end;
    VerifPieceNord:=memeParam;
End;


(*
--------------------------------------------------------
- Fonction         : VerifPieceOuest
- Auteur           : Guillaume Proton
- Date de creation : 31 Mai 2018
-
- But              : Renvoie 0 si la pièce voulant être jouée n'a pas un attribut en commun avec la pièce située à l'ouest de la position (i,j) sinon 1
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Renvoie 0 si la pièce voulant être jouée n'a pas un attribut en commun avec la pièce située à l'ouest de la position (i,j) sinon 1
--------------------------------------------------------*)


Function VerifPieceOuest(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Var
    memeParam : integer;
Begin
    if ((couleur_p = jeux.grille[i,j-1].couleur) xor (forme_p = jeux.grille[i,j-1].forme)) then    // "xor" car on ne peut pas jouer une pièce de la même forme et de la même couleur côte à côte
    Begin
        memeParam:=1;
    End
    else
    begin
        memeParam:=0
    end;
    VerifPieceOuest:=memeParam;
End;


(*
--------------------------------------------------------
- Fonction         : VerifPieceSud
- Auteur           : Guillaume Proton
- Date de creation : 31 Mai 2018
-
- But              : Renvoie 0 si la pièce voulant être jouée n'a pas un attribut en commun avec la pièce située au sud de la position (i,j) sinon 1
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Renvoie 0 si la pièce voulant être jouée n'a pas un attribut en commun avec la pièce située au sud de la position (i,j) sinon 1
--------------------------------------------------------*)


Function VerifPieceSud(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Var
    memeParam : integer;
Begin
    if ((couleur_p = jeux.grille[i+1,j].couleur) xor (forme_p = jeux.grille[i+1,j].forme)) then    // "xor" car on ne peut pas jouer une pièce de la même forme et de la même couleur côte à côte
    Begin
        memeParam:=1
    End
    else
    begin
        memeParam:=0;
    end;
    VerifPieceSud:=memeParam;
End;


(*
--------------------------------------------------------
- Fonction         : Max
- Auteur           : Guillaume Proton
- Date de creation : 11 Juin 2018
-
- But              : Renvoie le maximum entre deux entiers 
- Remarques        : Aucune  
- Pré conditions   : Aucune
- Post conditions  : Renvoie le maximum entre deux entiers
--------------------------------------------------------*)

Function Max(x1,x2 : integer):integer;
Var
   maximum : integer;
Begin
   if (x1>x2) then
   Begin
      maximum:=x1;
   end
   else
   Begin
      maximum:=x2
   End;
   Max:=maximum;
End;

(*
--------------------------------------------------------
- Fonction         : nbPiecesNord
- Auteur           : Guillaume Proton
- Date de creation : 7 Juin 2018
-
- But              : Renvoie le nombre de pièces "collées" entre elles au nord de la pièce située à la position (i,j)
- Remarques        : Aucune  
- Pré conditions   : Aucune
- Post conditions  : Renvoie le nombre de pièces "collées" entre elles au nord de la pièce située à la position (i,j)
--------------------------------------------------------*)

Function nbPiecesNord(jeux:jeu;i,j:integer):integer;
Var
    l,ComptePiece : integer;
Begin
    ComptePiece:=0;
    for l:=1 to Max(jeux.parametre.nbforme,jeux.parametre.nbcouleur)-1  do         //Cet itérateur va jusqu'au maximum entre le nombre de couleurs différentes et le nombre de formes différentes présentes dans le jeu et définies dans les paramètres moins 1 car une ligne ne peut dépasser ce nombre maximum
    Begin
        if (CaseVide(jeux,i-l,j)=1) then      // s'il y a une pièce dans la case située au-dessus alors ...
        Begin
            ComptePiece := ComptePiece +1         // ... on incrémente à chaque fois que la case contient une pièce
        End
    End;
    nbPiecesNord:=ComptePiece;
End;

(*
--------------------------------------------------------
- Fonction         : nbPiecesSud
- Auteur           : Guillaume Proton
- Date de creation : 7 Juin 2018
-
- But              : Renvoie le nombre de pièces "collées" entre elles au sud de la pièce située à la position (i,j)
- Remarques        : Aucune  
- Pré conditions   : Aucune
- Post conditions  : Renvoie le nombre de pièces "collées" entre elles au sud de la pièce située à la position (i,j)
--------------------------------------------------------*)

Function nbPiecesSud(jeux:jeu;i,j:integer):integer;
Var
    l,ComptePiece : integer;
Begin
    ComptePiece:=0;
    for l:=1 to Max(jeux.parametre.nbforme,jeux.parametre.nbcouleur)-1  do         //Cet itérateur va jusqu'au maximum entre le nombre de couleurs différentes et le nombre de formes différentes présentes dans le jeu et définies dans les paramètres moins 1 car une ligne ne peut dépasser ce nombre maximum
    Begin
        if (CaseVide(jeux,i+l,j)=1) then      // s'il y a une pièce dans la case située au-dessus alors ...
        Begin
            ComptePiece := ComptePiece +1         // ... on incrémente à chaque fois que la case contient une pièce
        End
    End;
    nbPiecesSud:=ComptePiece;
End;

(*
--------------------------------------------------------
- Fonction         : nbPiecesOuest
- Auteur           : Guillaume Proton
- Date de creation : 7 Juin 2018
-
- But              : Renvoie le nombre de pièces "collées" entre elles à l'ouest de la pièce située à la position (i,j)
- Remarques        : Aucune  
- Pré conditions   : Aucune
- Post conditions  : Renvoie le nombre de pièces "collées" entre elles à l'ouest de la pièce située à la position (i,j)
--------------------------------------------------------*)

Function nbPiecesOuest(jeux:jeu;i,j:integer):integer;
Var
    l,ComptePiece : integer;
Begin
    ComptePiece:=0;
    for l:=1 to Max(jeux.parametre.nbforme,jeux.parametre.nbcouleur)-1  do         //Cet itérateur va jusqu'au maximum entre le nombre de couleurs différentes et le nombre de formes différentes présentes dans le jeu et définies dans les paramètres moins 1 car une ligne ne peut dépasser ce nombre maximum
    Begin
        if (CaseVide(jeux,i,j-l)=1) then      // s'il y a une pièce dans la case située au-dessus alors ...
        Begin
            ComptePiece := ComptePiece +1         // ... on incrémente à chaque fois que la case contient une pièce
        End
    End;
    nbPiecesOuest:=ComptePiece;
End;

(*
--------------------------------------------------------
- Fonction         : nbPiecesEst
- Auteur           : Guillaume Proton
- Date de creation : 7 Juin 2018
-
- But              : Renvoie le nombre de pièces "collées" entre elles à l'est de la pièce située à la position (i,j)
- Remarques        : Aucune  
- Pré conditions   : Aucune
- Post conditions  : Renvoie le nombre de pièces "collées" entre elles à l'est de la pièce située à la position (i,j)
--------------------------------------------------------*)

Function nbPiecesEst(jeux:jeu;i,j:integer):integer;
Var
    l,ComptePiece : integer;
Begin
    ComptePiece:=0;
    for l:=1 to Max(jeux.parametre.nbforme,jeux.parametre.nbcouleur)-1  do         //Cet itérateur va jusqu'au maximum entre le nombre de couleurs différentes et le nombre de formes différentes présentes dans le jeu et définies dans les paramètres moins 1 car une ligne ne peut dépasser ce nombre maximum
    Begin
        if (CaseVide(jeux,i,j+l)=1) then      // s'il y a une pièce dans la case située au-dessus alors ...
        Begin
            ComptePiece := ComptePiece +1         // ... on incrémente à chaque fois que la case contient une pièce
        End
    End;
    nbPiecesEst:=ComptePiece;
End;

END.

