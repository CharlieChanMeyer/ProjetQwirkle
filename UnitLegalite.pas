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
Function CaseVide(jeux:jeu ; i,j:integer):boolean;
Function LegaliteCoup1(jeux:jeu; couleur_p,forme_p,i,j :integer):integer;
Function VerifPieceEst(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Function VerifPieceNord(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Function VerifPieceOuest(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;
Function VerifPieceSud(jeux:jeu ; couleur_p,forme_p,i,j : integer):integer;


implementation

jeux.player.main[].forme




(*
--------------------------------------------------------
- Fonction : CaseVide
- Auteur : Guillaume Proton
- Date de creation : 28 Mai 2018
-
- But : Renvoie TRUE si il n'y a pas de pièce dans cette case sinon renvoie FALSE
- Remarques : Aucune
- Pré conditions : Aucune
- Post conditions : Renvoie TRUE si il n'y a pas de pièce dans cette case sinon renvoie FALSE
--------------------------------------------------------*)

Function CaseVide(jeux:jeu ; i,j:integer):boolean;
Begin
    CaseVide:=((jeux.grille[i,j].couleur=0) and (jeux.grille[i,j].forme=0));
End;


(*
--------------------------------------------------------
- Fonction         : LegaliteCoup1
- Auteur           : Guillaume Proton
- Date de creation : 28 Mai 2018
-
- But              : Vérifie la légalité du coup à la position (i,j) (0 : coup impossible, 1 : coup accepté)
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Vérifie la légalité du coup à la position (i,j)(0 : coup impossible, 1 : coup accepté)
--------------------------------------------------------*)

Function LegaliteCoup1(jeux:jeu; couleur_p,forme_p,i,j :integer):integer;
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
    LegaliteCoup1:=CoupLegal;
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


END.

