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
    writeln('Couleur : ',jeux.parametre.nbcouleur,'Forme : ',jeux.parametre.nbforme,'Tuile : ',jeux.parametre.repetition);
    affpioche(jeux);
    jeux := initJoueur(jeux);
    jeux := initMain(jeux);
    affpioche(jeux);
    AffichageMain(jeux,0);
    AffichageMain(jeux,1);
    jeux.player:= prioriteJoueur(jeux);
    AffichageMain(jeux,0);
    AffichageMain(jeux,1);
    AffichageMain(jeux,2);
    Tourdejeu(jeux)
End.
