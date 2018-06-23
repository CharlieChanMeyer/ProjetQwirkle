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
    Randomize();                //Démarage de la fonction Random
    jeux := CountParam();               //Vérifie et définis les paramètres.
    jeux := initJoueur(jeux);           //Initialise les joueurs
    jeux := initMain(jeux);             //Initialise les mains des joueurs
    jeux.player:= prioriteJoueur(jeux);         //Vérifie quel joueur doit commencer
    Tourdejeu(jeux)                             //Lance le jeux
End.
