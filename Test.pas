Program test;

uses SysUtils,UnitType,UnitParam,UnitAff,UnitTour,Crt;
Var
    jeux : jeu;
Begin
    Randomize();
    
    //jeux.player[0].main[0].couleur := 1;
    //jeux.player[0].main[0].forme := 1;
    //jeux.player[0].main[1].couleur := 3;
    //jeux.player[0].main[1].forme := 3;
    //jeux.player[0].main[2].couleur := 1;
    //jeux.player[0].main[2].forme := 3;
    //jeux.player[0].main[3].couleur := 3;
    //jeux.player[0].main[3].forme := 1;
    //jeux.player[0].main[4].couleur := 1;
    //jeux.player[0].main[4].forme := 1;
    //jeux.player[0].main[5].couleur := 3;
    //jeux.player[0].main[5].forme := 3;

    //jeux.player[1].main[0].couleur := 1;
    //jeux.player[1].main[0].forme := 1;
    //jeux.player[1].main[1].couleur := 3;
    //jeux.player[1].main[1].forme := 1;
    //jeux.player[1].main[2].couleur := 1;
    //jeux.player[1].main[2].forme := 5;
    //jeux.player[1].main[3].couleur := 3;
    //jeux.player[1].main[3].forme := 7;
    //jeux.player[1].main[4].couleur := 1;
    //jeux.player[1].main[4].forme := 2;
    //jeux.player[1].main[5].couleur := 3;
    //jeux.player[1].main[5].forme := 8;
    //setlength(jeux.pioches,0);
    writeln(length(jeux.pioches));
    Tourdejeu(jeux)

End.
