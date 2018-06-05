(*
------------------------------------------------------------------------------------
-- Fichier           : UnitMarco.pas
-- Auteur            : ESPIOT Marco
-- Date de creation  : 22/05/2018
--
-- But               : Regroupe les fonctions ecrites pas Marco
-- Remarques         : Aucune
-- Compilation       : fpc
-- Edition des liens : fpc
-- Execution         : shell
------------------------------------------------------------------------------------
*)
Unit UnitMarco;

interface
uses SysUtils,UnitType,UnitParam,UnitAff,UnitTour,Crt;
(*--------------------------------------------------------
- Fonction : initJoueur
- Auteur : ESPIOT Marco
- Date de creation : 22/05/2018
-
- But : initialise les paramètres des différents joueurs
- Remarques : remarques éventuelles
- Pré conditions : avoir mis un nombre de joueurs en argument
- Post conditions : renvoi l'etat du jeux avec les joueurs initialisés
--------------------------------------------------------*)
Function initJoueur(nbJoueur : integer; jeux : jeu): jeu;
Function verifTaille(jeux : jeu): jeu;
Function verif(dejaPioche : pioche; jeux : jeu; i : integer): Boolean;


implementation

Function initJoueur(nbJoueur : integer; jeux : jeu): jeu;

var
   i: integer;

  Begin
   setlength(jeux.player,nbJoueur);
   For i := 0 to nbJoueur-1 do
   Begin
    writeln('Entrez le nom du joueur ',i);
     readln(jeux.player[i].nom);
    writeln('Entrez l''age du joueur ',i);
     readln(jeux.player[i].age);
   End;

   initJoueur := jeux;

  End;

(*--------------------------------------------------------
- Fonction : verifTaille
- Auteur : ESPIOT Marco
- Date de creation : 22/05/2018
-
- But : Augmente la taille de la grille jouable si un joueur arrive au bout de la grille
- Remarques : remarques éventuelles
- Pré conditions : Une tuile est posé sur une des extrémités du tableau
- Post conditions : renvoi l'etat du jeux avec la grille agrandit
--------------------------------------------------------*)
Function verifTaille(jeux : jeu):jeu ;
var
  n: Integer;
Begin
 n :=length(jeux.grille);
 setlength(jeux.grille,n+6,n+6);
 verifTaille := jeux
End;

(*--------------------------------------------------------
- Fonction : verif
- Auteur : ESPIOT Marco
- Date de creation : date
-
- But : vérifie si la case est deja piochée
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : vérifie si la case est deja piochée
--------------------------------------------------------*)
Function verif(dejaPioche : pioche; jeux : jeu; i : integer): Boolean;
Var
  res : Boolean;
  j : integer;
  Begin
    res := true;
    For j := 0 to i-1 do
      Begin
        If (((dejaPioche[j].forme) = (dejaPioche[i].forme)) and ((dejaPioche[j].forme) = (dejaPioche[i].forme))) then
          res := false;
          End;
          verif := res;
          End;

          End.
(*--------------------------------------------------------
- Fonction : echangePioche
- Auteur : ESPIOT Marco
- Date de creation : 31/05/2018
-
- But : Permettre l'echange de pions entre la main et la pioche
- Remarques : remarques éventuelles
- Pré conditions : l'utilisateur a demandé à échanger des pièces avec la pioche
- Post conditions : l'utilisateur a ses nouveaux pions et ses anciens se retrouvent dans la pioche
--------------------------------------------------------*)
Function echangePioche(jeux : jeu; numJoueur : integer): jeu;
var
  i, j, nbPiece, numpiece, numPieceMain : integer;
  attente, dejaPioche : pioche;
Begin
  writeln('combien de pièces souhaitez vous échanger ?');
   readln(nbPiece);
   setlength(attente,nbPiece+1);
   i := 1;
   attente[0].forme := 0;//case de référence pour la comparaison suivante

   Repeat
    numpiece := random(length(jeux.pioches))+1; //prend une pièce au hasard dans la pioche
    dejaPioche[i] := jeux.pioches[numpiece];
    If (verif(dejaPioche,jeux,i)) then //faire en sorte que l'on ne puisse pas piocher une case deja pioché avec le tableau "dejaPioche"
      Begin
        attente[i] := jeux.pioches[numpiece]; //stock cette pièce dans une "pioche temporaire"
      End;

    for j := 0 to nbPiece-1 do
      Begin
        AffichageMain(jeux,numJoueur);
        writeln('Entrez le numero de la piece a échanger ');
        readln(numPieceMain);
        jeux.pioches[numpiece] := jeux.player[numjoueur].main[numPieceMain]; //on place la pièce depuis la main du joueur dans la pioche
        jeux.player[numjoueur].main[numPieceMain] := attente[i]; //le joueur récupère la pièce mise de coté
      End;
      i := i+1;
   until (i = nbPiece+1);
End;
