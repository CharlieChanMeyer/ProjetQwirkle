(*
------------------------------------------------------------------------------------
-- Fichier           : UnitAff.pas
-- Auteur            : Charlie Meyer
-- Date de creation  : Date
--
-- But               : But
-- Remarques         : Aucune
-- Compilation       : fpc
-- Edition des liens : fpc
-- Execution         : shell
------------------------------------------------------------------------------------
*)
(*
------------------------------------------------------------------------------------
--Formes :                        -- Couleur :
--1 : ¤                           --1 : TextColor(Red);
--2 : §                           --2 : TextColor(LightRed);
--3 : ♫                           --3 : TextColor(Yellow);
--4 : ¶                           --4 : TextColor(Blue);
--5 : ♠                            --5 : TextColor(LightBlue);
--6 : ¿                           --6 : TextColor($808080);
--7 : Ð                           --7 : TextColor(LightGreen);
--8 : X                           --8 :TextColor(Green);
--9 : Ø                           --9 :
--10 :♣                           --10 :
------------------------------------------------------------------------------------
*)
Unit UnitAff;

interface

uses SysUtils,UnitType,UnitParam,Crt;

Procedure AffichageMain(jeux : jeu; i : integer);
Procedure AffichageBase(jeux : jeu ; i : integer);
Procedure AffichageGrille(grille : plateau);
Procedure AffichagePiece(p : piece);
Procedure AffichageRed(p : piece);
Procedure AffichageLightRed(p : piece);
Procedure AffichageYellow(p : piece);
Procedure AffichageBlue(p : piece);
Procedure AffichageLightBlue(p : piece);
Procedure AffichageGrey(p : piece);
Procedure AffichageLightGreen(p : piece);
Procedure AffichageGreen(p : piece);
//Procedure Affichage???(p : piece);
//Procedure Affichage???(p : piece);

implementation

(*
--------------------------------------------------------
- Procedure : AffichageRed
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Afficher une piece rouge
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Afficher une piece rouge
--------------------------------------------------------*)

Procedure AffichageRed(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;
    TextColor(Red);
    case p_forme of
        1: write('¤');
        2: write('§');
        3: write('♫');
        4: write('¶');
        5: write('♠');
        6: write('¿');
        7: write('Ð');
        8: write('X');
        9: write('Ø');
        10: write('♣');
        else write('');
    end;
End;

(*
--------------------------------------------------------
- Procedure : AffichageLightRed
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Afficher une piece orange
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Afficher une piece orange
--------------------------------------------------------*)

Procedure AffichageLightRed(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;
    TextColor(LightRed);
    case p_forme of
        1: write('¤');
        2: write('§');
        3: write('♫');
        4: write('¶');
        5: write('♠');
        6: write('¿');
        7: write('Ð');
        8: write('X');
        9: write('Ø');
        10: write('♣');
        else write('');
    end;
End;

(*
--------------------------------------------------------
- Procedure : AffichageYellow
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Afficher une piece jaune
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Afficher une piece jaune
--------------------------------------------------------*)

Procedure AffichageYellow(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;
    TextColor(Yellow);
    case p_forme of
        1: write('¤');
        2: write('§');
        3: write('♫');
        4: write('¶');
        5: write('♠');
        6: write('¿');
        7: write('Ð');
        8: write('X');
        9: write('Ø');
        10: write('♣');
        else write('');
    end;
End;

(*
--------------------------------------------------------
- Procedure : AffichageBlue
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Afficher une piece Bleu
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Afficher une piece Bleu
--------------------------------------------------------*)

Procedure AffichageBlue(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;
    TextColor(Blue);
    case p_forme of
        1: write('¤');
        2: write('§');
        3: write('♫');
        4: write('¶');
        5: write('♠');
        6: write('¿');
        7: write('Ð');
        8: write('X');
        9: write('Ø');
        10: write('♣');
        else write('');
    end;
End;

(*
--------------------------------------------------------
- Procedure : AffichageLightBlue
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Afficher une piece bleu clair
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Afficher une piece bleu clair
--------------------------------------------------------*)

Procedure AffichageLightBlue(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;
    TextColor(LightBlue);
    case p_forme of
        1: write('¤');
        2: write('§');
        3: write('♫');
        4: write('¶');
        5: write('♠');
        6: write('¿');
        7: write('Ð');
        8: write('X');
        9: write('Ø');
        10: write('♣');
        else write('');
    end;
End;

(*
--------------------------------------------------------
- Procedure : AffichageGrey
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Afficher une piece Grise
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Afficher une piece grise
--------------------------------------------------------*)

Procedure AffichageGrey(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;
    TextColor(White);
    case p_forme of
        1: write('¤');
        2: write('§');
        3: write('♫');
        4: write('¶');
        5: write('♠');
        6: write('¿');
        7: write('Ð');
        8: write('X');
        9: write('Ø');
        10: write('♣');
        else write('');
    end;
End;

(*
--------------------------------------------------------
- Procedure : AffichageLightGreen
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Afficher une piece vert clair
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Afficher une piece vert clair
--------------------------------------------------------*)

Procedure AffichageLightGreen(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;
    TextColor(LightGreen);
    case p_forme of
        1: write('¤');
        2: write('§');
        3: write('♫');
        4: write('¶');
        5: write('♠');
        6: write('¿');
        7: write('Ð');
        8: write('X');
        9: write('Ø');
        10: write('♣');
        else write('');
    end;
End;

(*
--------------------------------------------------------
- Procedure : AffichageGreen
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Afficher une piece verte
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Afficher une piece verte
--------------------------------------------------------*)

Procedure AffichageGreen(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;
    TextColor(Green);
    case p_forme of
        1: write('¤');
        2: write('§');
        3: write('♫');
        4: write('¶');
        5: write('♠');
        6: write('¿');
        7: write('Ð');
        8: write('X');
        9: write('Ø');
        10: write('♣');
        else write('');
    end;
End;

(*
--------------------------------------------------------
- Procedure : AffichagePiece
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Afficher une piece de la partie
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Afficher une piece de la partie
--------------------------------------------------------*)

Procedure AffichagePiece(p : piece);
Var
    p_couleur : integer;
Begin
    p_couleur := p.couleur;
    case p_couleur of
        1 : AffichageRed(p);
        2 : AffichageLightRed(p);
        3 : AffichageYellow(p);
        4 : AffichageBlue(p);
        5 : AffichageLightBlue(p);
        6 : AffichageGrey(p);
        7 : AffichageLightGreen(p);
        8 : AffichageGreen(p);
        //9 : Affichage???(p);
        //10 : Affichage???(p);
        else write('  ');
    end;
End;

(*
--------------------------------------------------------
- Procedure : AffichageGrille
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Afficher la grille de jeu
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Afficher la grille de jeu
--------------------------------------------------------*)

Procedure AffichageGrille(grille : plateau);
Var
    n,i,j : Integer;
Begin
    n := length(grille);
    For i := 0 to n-1 do
    Begin
        Writeln();
        For j := 0 to n-1 do
        Begin
            AffichagePiece(grille[i,j]);
            write('|')
        End;
    End;
    writeln();
End;

(*
--------------------------------------------------------
- Procedure : AffichageMain
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Afficher la main du joueur
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Afficher la main du joueur
--------------------------------------------------------*)

Procedure AffichageMain(jeux : jeu; i : integer);
Begin
    write('1 : ');
    AffichagePiece(jeux.player[i].main[0]);
    TextColor(Green);
    write(' | 2 : ');
    AffichagePiece(jeux.player[i].main[1]);
    TextColor(Green);
    write(' | 3 : ');
    AffichagePiece(jeux.player[i].main[2]);
    TextColor(Green);
    write(' | 4 : ');
    AffichagePiece(jeux.player[i].main[3]);
    TextColor(Green);
    write(' | 5 : ');
    AffichagePiece(jeux.player[i].main[4]);
    TextColor(Green);
    write(' | 6 : ');
    AffichagePiece(jeux.player[i].main[5]);
    TextColor(Green);
    writeln('');
End;

(*--------------------------------------------------------
- Procedure : AffichageBase
- Auteur : Charlie Meyer
- Date de creation : date
-
- But : Affiche la partie d'une joueur
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Affiche la partie d'une joueur
--------------------------------------------------------*)
Procedure AffichageBase(jeux : jeu ; i : Integer);
Begin
    writeln('---------',jeux.player[i].nom,'---------');
    writeln('-------------------------------------');
    AffichageGrille(jeux.grille);
    TextColor(Green);
    writeln('-------------------------------------');
    writeln('-------------Votre Main--------------');
    AffichageMain(jeux,i);
    writeln('-------------------------------------');
End;

End.
