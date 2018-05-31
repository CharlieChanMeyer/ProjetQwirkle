Program test;

uses SysUtils,UnitType,UnitParam,UnitAff,Crt;
Var
    jeux : jeu;
    i,j : integer;
Begin
    Randomize();
    jeux := CountParam();
    jeux.player[1].nom := 'Charlie';
    jeux.player[1].main[0].couleur := 1;
    jeux.player[1].main[0].forme := 1;
    jeux.player[1].main[1].couleur := 3;
    jeux.player[1].main[1].forme := 3;
    jeux.player[1].main[2].couleur := 5;
    jeux.player[1].main[2].forme := 5;
    jeux.player[1].main[3].couleur := 7;
    jeux.player[1].main[3].forme := 7;
    jeux.player[1].main[4].couleur := 2;
    jeux.player[1].main[4].forme := 2;
    jeux.player[1].main[5].couleur := 8;
    jeux.player[1].main[5].forme := 8;
    For i:=5 to 24 do
    Begin
        For j := 10 to 24 do
        Begin
            jeux.grille[i,j].couleur := random(7)+1;
            jeux.grille[i,j].forme := random(9)+1;
        End;
    End;
    AffichageBase(jeux,1);

End.
