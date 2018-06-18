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

<<<<<<< HEAD
//Function CptFormeCommun(jeux:jeu;num_joueur:integer):main;
//Function CptCouleurCommun(jeux:jeu;num_joueur:integer):main;
//Function CombiJoueur(jeux:jeu):tabpiocher;
//Function indiceMaxTab(tab : tabpiocher): Integer;
//Function prioriteAge(jeux:jeu):tabpiocher;
//Function prioriteJoueur(jeux:jeu):jeu;
=======
Function Max(x1,x2:integer):integer;
Function CptFormeCommun(jeux:jeu;num_joueur:integer):tabpiocher;
Function CptCouleurCommun(jeux:jeu;num_joueur:integer):tabpiocher;
Function CombiJoueur(jeux:jeu):tabpiocher;
Function indiceMaxTab(tab : tabpiocher): Integer;
Function prioriteAge(jeux:jeu;tabCombi:tabpiocher;tabOrdreJoueur:tabjoueur;mmval:resMemeValeurPos):tabjoueur;
Function prioriteJoueur(jeux:jeu):jeu;
>>>>>>> 85db792b63f00c186c53fc19038a3fa191814282
Function deuxMemesAttributs(jeux:jeu;couleur_p,forme_p,i,j:integer):integer;
Function CaseVide(jeux:jeu ; i,j:integer):integer;
Function LegaliteCoup(jeux:jeu; couleur_p,forme_p,i,j :integer):integer;
Function VerifPieceEst(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Function VerifPieceNord(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Function VerifPieceOuest(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Function VerifPieceSud(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Function nbPiecesNord(jeux:jeu;i,j:integer):integer;
Function nbPiecesSud(jeux:jeu;i,j:integer):integer;
Function nbPiecesOuest(jeux:jeu;i,j:integer):integer;
Function nbPiecesEst(jeux:jeu;i,j:integer):integer;

implementation

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : maxTab
 -- Auteur            : Guillaume Proton
 -- Date de creation  : 01/12/2017
 --
 -- But               : Retourne le maximum d'un tableau d'entiers
 -- Remarques         : Aucune
 -- Pré conditions    : le tableau doit être initialisé
 -- Post conditions   : Retourne le maximum d'un tableau d'entiers
 ------------------------------------------------------------------------------------
 *)

Function maxTab(tab : tabpiocher):integer;
Var
   maximum, i : Integer;
Begin
   maximum := tab[0];
   FOR i:=1 to length(tab)-1 do
   BEGIN
      if ((tab[i])>maximum)then
      Begin
        maximum := tab[i];
      End;
   end;
    maxTab:=maximum;
End;


(*
 ------------------------------------------------------------------------------------
 -- Fonction          : CptFormeCommun
 -- Auteur            : Guillaume Proton
 -- Date de creation  : 16 Juin 2018
 --
 -- But               : renvoie un tableau d'entiers de taille 6 qui contient dans chaque case le nombre de pièces ayant la même forme selon le numéro de la pièce ( de la pièce 0 jusqu'à la pièce 5)
 -- Remarques         : Aucune
 -- Pré conditions    : Aucune
 -- Post conditions   : renvoie un tableau d'entiers de taille 6 qui contient dans chaque case le nombre de pièces ayant la même forme selon le numéro de la pièce ( de la pièce 0 jusqu'à la pièce 5)
 ------------------------------------------------------------------------------------
 *)

Function CptFormeCommun(jeux:jeu;num_joueur:integer):tabpiocher;
var
    i:integer;
    tabForme:tabpiocher;
Begin
    setlength(tabForme,6);
    for j:=0 to 5 do                    // j correspond au numéro de la pièce
    Begin
        for i:=0 to 5 do
        Begin
            cptForme:=0;
            if (j<>i) then
            Begin
                if (jeux.player[num_joueur].main[j].forme=jeux.player[num_joueur].main[i].forme) then
                Begin
                    Inc(cptForme)
                end;
            end;
            tabForme[j]:=cptForme                                // Chaque case du tableau est remplie avec le nombre de pièce ayant une forme commune avec la pièce de numéro j
        end;
    end;
    CptFormeCommun:=tabForme;
End;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : CptCouleurCommun
 -- Auteur            : Guillaume Proton
 -- Date de creation  : 16 Juin 2018
 --
 -- But               : renvoie un tableau d'entiers de taille 6 qui contient dans chaque case le nombre de pièces ayant la même couleur selon le numéro de la pièce ( de la pièce 0 jusqu'à la pièce 5)
 -- Remarques         : Aucune
 -- Pré conditions    : Aucune
 -- Post conditions   : renvoie un tableau d'entiers de taille 6 qui contient dans chaque case le nombre de pièces ayant la même couleur selon le numéro de la pièce ( de la pièce 0 jusqu'à la pièce 5)
 ------------------------------------------------------------------------------------
 *)

Function CptCouleurCommun(jeux:jeu;num_joueur:integer):tabpiocher;
var
    i:integer;
    tabCouleur:tabpiocher;
Begin
    setlength(tabCouleur,6);
    for j:=0 to 5 do                    // j correspond au numéro de la pièce
    Begin
        for i:=0 to 5 do
        Begin
            cptCouleur:=0;
            if (j<>i) then
            Begin
                if (jeux.player[num_joueur].main[j].couleur=jeux.player[num_joueur].main[i].couleur) then
                Begin
                    Inc(cptCouleur)
                end;
            end;
            tabCouleur[j]:=cptCouleur                                // Chaque case du tableau est remplie avec le nombre de pièce ayant une couleur commune avec la pièce de numéro j
        end;
    end;
    CptCouleurCommun:=tabCouleur;
End;


(*
 ------------------------------------------------------------------------------------
 -- Fonction          : CombiJoueur
 -- Auteur            : Guillaume Proton
 -- Date de creation  : 16 Juin 2018
 --
 -- But               : renvoie un tableau d'entiers contenant le maximum de pièces ayant un attribut en commun pour chaque joueur 
 -- Remarques         : Aucune
 -- Pré conditions    : Aucune
 -- Post conditions   : renvoie un tableau d'entiers contenant le maximum de pièces ayant un attribut en commun pour chaque joueur 
 ------------------------------------------------------------------------------------
 *)

Function CombiJoueur(jeux:jeu):tabpiocher;
Var
    maxTabC, maxTabF:integer;
    tabCouleur,tabForme:tabpiocher;
    tabCombinaison:tabpiocher;                          // tableau dynamique car on ne connait pas le nombre de joueurs à l'avance
Begin
    setlength(tabCombinaison,length(jeux.player));        // On initialise le tableau dynamique qui contiendra à chaque case le plus grand nombre de pièces ayant un attribut commun selon chaque joueur
    for i:=0 to length(jeux.player)-1 do
    Begin
        tabCouleur:=CptCouleurCommun(jeux,i);
        tabForme:=CptFormeCommun(jeux,i);
        maxTabC:=tabCouleur[indiceMaxTab];               // On stocke le nombre maximum de pièces ayant une couleur en commun
        maxTabF:=tabForme[indiceMaxTab];                 // On stocke le nombre maximum de pièces ayant une forme en commun
        combinaisonMax:=Max(maxTabC,maxTabF);      // On prend le maximum entre ces deux nombres afin d'avoir le plus grand nombre de pièces ayant un attribut en commun pour le joueur 0
        tabCombinaison[i]:=combinaisonMax;         // On remplit le tableau de la taille du nombre de joueurs avec le maximum de pièces ayant un attribut en commun pour chaque joueur
    end;
    CombiJoueur:=tabCombinaison;
End;



(*
 ------------------------------------------------------------------------------------
 -- Fonction          : deuxMemeValTab
 -- Auteur            : Guillaume Proton
 -- Date de creation  : 06/12/2017
 --
 -- But               : renvoie
 -- Remarques         : Aucune
 -- Pré conditions    : Aucune
 -- Post conditions   : renvoie
 ------------------------------------------------------------------------------------
 *)

Function deuxMemeValTab(tab:tabpiocher):resMemeValeurPos;               
var                                                               
    mmVal:resMemeValeurPos;                                             
    i,j:integer;                                                  
Begin                                                              
    mmVal.memeValeur:=0;
    mmVal.indiceJ1:= 0;
    mmVal.indiceJ2:=0;
    for i:=0 to 5 do
    Begin
        for j:=0 to 5 do
        Begin
            if ((i<>j) and (tab[i]=tab[j])) then
            Begin
                mmVal.memeValeur:=1;
                mmVal.indiceJ1:=i;
                mmVal.indiceJ2:=j
            end;
        End;
    end;
    deuxMemeValTab:=mmVal;
End;*)



(*
 ------------------------------------------------------------------------------------
 -- Fonction          : indiceMaxTab
 -- Auteur            : Guillaume Proton
 -- Date de creation  : 06/12/2017
 --
 -- But               : renvoie l'indice du maximum d'un tableau
 -- Remarques         : Aucune
 -- Pré conditions    : Aucune
 -- Post conditions   : renvoie l'indice du maximum d'un tableau
 ------------------------------------------------------------------------------------
 *)

Function indiceMaxTab(tab : tabpiocher): Integer;
VAR
   i,maximum,i_maximum : Integer;
BEGIN
   maximum:=tab[0];
   i_maximum := 0;                           // par défaut l'indice du maximum correspond à l'indice de la première case
   FOR i:=0 to length(tab)-1 do
   BEGIN
      if ((tab[i])>maximum)then             // On teste toutes les valeurs de tab afin de trouver le maximum
      BEGIN
        i_maximum:=i;                    // dès que l'on a trouvé le maximum on stocke son indice dans la variable i_maximum
      END;
      indiceMaxTab := i_maximum;
   END;
END;


(*
--------------------------------------------------------
- Fonction         : prioriteAge
- Auteur           : Guillaume Proton
- Date de creation : 12 Juin 2018
-
- But              : Renvoie un tableau contenant les joueurs dans leur ordre de jeu dans le cas où deux joueurs ont le même nombre de pièce ayant un attribut en commun
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Renvoie un tableau contenant les joueurs dans leur ordre de jeu dans le cas où deux joueurs ont le même nombre de pièce ayant un attribut en commun
--------------------------------------------------------*)

<<<<<<< HEAD
(*Function prioriteAge(jeux:jeu):tabjoueur;
=======
Function prioriteAge(jeux:jeu;tabCombi:tabpiocher;tabOrdreJoueur:tabjoueur;mmVal:resMemeValeurPos):tabjoueur;
>>>>>>> 85db792b63f00c186c53fc19038a3fa191814282
Var
    i : integer;
    premiereCaseTabJoueur:joueur;
Begin
<<<<<<< HEAD
    setlength(tabCombi,length(jeux.player));
    setlength(tabOrdreJoueur,length(jeux.player));
    tabCombi:=CombiJoueur(jeux);                       //tabTrie va prendre les valeurs du maximum de pièces ayant un attribut en commun pour chaque joueur
    mmVal:=deuxMemeValTab(tabCombi);
    for i:=0 to length(jeux.player)-1 do
    Begin
        tabOrdreJoueur[i]:=jeux.player[i]         // On ajoute dans le tableau final tous les joueurs qui se sont enregistrés
    End;
=======
>>>>>>> 85db792b63f00c186c53fc19038a3fa191814282
    premiereCaseTabJoueur:=tabOrdreJoueur[0];
    if ((jeux.player[mmVal.indiceJ1].age)>=(jeux.player[mmVal.indiceJ2].age)) then        //">=" pour que si deux joueurs ont le même âge et le plus grand nombre de pièce ayant un attribut commun égal alors le joueur ayant rentrer ses informations en premier au lancement du jeu commence
    Begin
        tabOrdreJoueur[0]:= jeux.player[mmVal.indiceJ1];                               // On échange la position du joueur le plus âgé avec la position du premier joueur dans le tableau poue que le plus âgé commence en premier
        tabOrdreJoueur[mmVal.indiceJ1]:=premiereCaseTabJoueur
    End
    else
    Begin
        tabOrdreJoueur[0]:= jeux.player[mmVal.indiceJ2];
        tabOrdreJoueur[mmVal.indiceJ2]:=premiereCaseTabJoueur
    End;
    prioriteAge:=tabOrdreJoueur;
<<<<<<< HEAD
end;*)
=======
end;

>>>>>>> 85db792b63f00c186c53fc19038a3fa191814282
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
    i, i_maxCombi:integer;
    tabCombi : tabpiocher;
    tabOrdreJoueur : tabjoueur;
    mmVal:resMemeValeurPos; 
    premiereCaseTabJoueur:joueur; 
Begin 
    setlength(tabCombi,length(jeux.player)); 
    setlength(tabOrdreJoueur,length(jeux.player)); 
    tabCombi:=CombiJoueur(jeux);                        //tabTrie va prendre les valeurs du maximum de pièces ayant un attribut en commun pour chaque joueur
    mmVal:=deuxMemeValTab(tabCombi); 
    for i:=0 to length(jeux.player)-1 do 
    Begin 
        tabOrdreJoueur[i]:=jeux.player[i]         // On ajoute dans le tableau final tous les joueurs qui se sont enregistrés au début de la partie
    End; 
    premiereCaseTabJoueur:=tabOrdreJoueur[0]; 
    if (mmVal.memeValeur=1) then                      // si deux joueurs ont le même nombre de pièces ayant un attribut en commun alors le plus âgé commence donc on le place au début du tableau
    Begin 
        tabOrdreJoueur:=prioriteAge(jeux,tabCombi,tabOrdreJoueur,mmVal);
    End
<<<<<<< HEAD






































    FONCTION TROP LONGUE, A SEPARER EN DEUX FONCTIONS QUI RENVOIENT UN tabJoueur

























































































=======
>>>>>>> 85db792b63f00c186c53fc19038a3fa191814282
    Else                                        // s'il n'y a pas plusieurs mêmes valeurs maximum alors
    begin
        i_maxCombi:=indiceMaxTab(tabCombi);
        tabOrdreJoueur[0]:=jeux.player[i_maxCombi];   // On place le joueur ayant le maximum de pièces avec un attribut commun dans la première case du tableau final
        tabOrdreJoueur[i_maxCombi]:=premiereCaseTabJoueur;                             // On échange la première case du tableau avec la case où se situe le joueur ayant le maximum de pièces d'attribut commun pour que ce dernier soit au début du tableau et donc premier à jouer
    End;
    prioriteJoueur:=tabOrdreJoueur;
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

Function deuxMemesAttributs(jeux:jeu;couleur_p,forme_p,i,j : integer):integer;
Var
    l, memeAttribut:integer;

Begin
    memeAttribut :=0;
    for l:=i+nbPiecesSud(jeux,i,j) downto i-nbPiecesNord(jeux,i,j) do             // parcoure la ligne contenant la pièce à la position (i,j) de haut en bas
    Begin
        //FAUT RECUPERER LA COULEUR ET LA FORME DE LA PIECE JOUER ET NON DE LA GRILLE
        writeln('Piece en ',l,'|',j,'Forme identique : ',jeux.grille[i,j].forme=jeux.grille[l,j].forme,' | Couleur Identique : ',jeux.grille[i,j].couleur=jeux.grille[l,j].couleur);
        writeln(forme_p,' | ',jeux.grille[l,j].forme);
        writeln(couleur_p,' | ',jeux.grille[l,j].couleur);
        if (((forme_p=jeux.grille[l,j].forme) and (couleur_p=jeux.grille[l,j].couleur)) and (l<>i)) then  // s'il y a une pièce ayant le même attribut sur cette ligne autre que la pièce de la position (i,j)
        Begin
            writeln('Piece en ',l,' : OK');
           memeAttribut := 1
        End;
    End;
    for l:=j+nbPiecesEst(jeux,i,j) downto j-nbPiecesOuest(jeux,i,j) do            // parcoure la ligne contenant la pièce à la position (i,j) de gauche à droite
    Begin
        if (((forme_p=jeux.grille[i,l].forme) and (couleur_p=jeux.grille[i,l].couleur)) and (l<>j)) then // s'il y a une pièce ayant le même attribut sur cette ligne autre que la pièce de la position (i,j)
        Begin
            writeln('Piece en ',l,' : OK');
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
    //regarder nord, est, ouest et sud : si couleur de la piece voulant etre jouée ou forme pièce voulant etre jouée est la même que la forme ou la couleur
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
    if (deuxMemesAttributs(jeux,couleur_p,forme_p,i,j)=1) then  // s'il y a deux fois le même attribut sur la même ligne alors le coup n'est pas valide
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
    writeln (couleur_p);
    writeln(jeux.grille[i,j+1].couleur);
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

END.
