Program test;

uses SysUtils,UnitType,UnitParam,UnitAff,UnitTour,Crt;
Var
    jeux : jeu;
    i,j : integer;
Begin
    Randomize();
    jeux := CountParam();
    jeux.player[0].nom := 'Charlie';
    jeux.player[0].main[0].couleur := 1;
    jeux.player[0].main[0].forme := 1;
    jeux.player[0].main[1].couleur := 3;
    jeux.player[0].main[1].forme := 3;
    jeux.player[0].main[2].couleur := 5;
    jeux.player[0].main[2].forme := 5;
    jeux.player[0].main[3].couleur := 7;
    jeux.player[0].main[3].forme := 7;
    jeux.player[0].main[4].couleur := 2;
    jeux.player[0].main[4].forme := 2;
    jeux.player[0].main[5].couleur := 8;
    jeux.player[0].main[5].forme := 8;
    Tourdejeu(jeux)

End.
