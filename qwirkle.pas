(*
--------------------------------------------------------
- Fichier : Qwirkle.pas
- Auteur : Charlie MEYER / Guillaume PROTON / Marco ESPIOT
- Date de creation : Mardi 19 Juin 2018
-
- But : Jouer au jeu de societe Qwirkle
- Remarques : Aucune
- Compilation : fpc
- Edition des liens : fpc
- Execution : shell
--------------------------------------------------------
*)

PROGRAM qwirkle;
uses SysUtils,UnitType,UnitParam,UnitAff,UnitTour,UnitLegalite,Crt;
Var
    jeux : jeu;
Begin
    Randomize();
    jeux := CountParam();
    jeux := initJoueur(jeux);
    jeux := initMain(jeux);
    jeux.player:= prioriteJoueur(jeux);
    Tourdejeu(jeux)
End.
