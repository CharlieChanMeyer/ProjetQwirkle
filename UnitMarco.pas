(*
------------------------------------------------------------------------------------
-- Fichier           : UnitMarco.pas
-- Auteur            : ESPIOT Marco
-- Date de creation  : Date
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
uses
  SysUtils, Classes, UnitType;
(*--------------------------------------------------------
- Fonction : initJoueur
- Auteur : ESPIOT Marco
- Date de creation : date
-
- But : initialise les paramètres des différents joueurs
- Remarques : remarques éventuelles
- Pré conditions : avoir mis un nombre de joueurs en argument
- Post conditions : renvoi l'etat du jeux avec les joueurs initialisés
--------------------------------------------------------*)
Function initJoueur(nbJoueur : integer; jeux : jeu): jeu;
Function verifTaille(jeux : jeu): jeu;


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
- Date de creation : date
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

End.
