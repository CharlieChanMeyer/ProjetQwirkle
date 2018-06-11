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
--2 : §                           --2 : TextColor(Yellow);
--3 : ♫                           --3 : TextColor(Blue);
--4 : ¶                           --4 : TextColor($808080);
--5 : ♠                           --5 : TextColor(Green);
--6 : ¿                           --6 : TextColor(LightRed);
--7 : Ð                           --7 : TextColor(LightGreen);
--8 : X                           --8 :TextColor(LightBlue);
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
Procedure MenuAction();
Procedure MenuActionssp();

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
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(Red);         //Selection de la couleur rouge pour la piece
    case p_forme of         //Affiche la piece en fonction de la valeur de sa forme
        1: write('¤ ');
        2: write('§ ');
        3: write('♫ ');
        4: write('¶ ');
        5: write('♠ ');
        6: write('¿ ');
        7: write('Ð ');
        8: write('X ');
        9: write('Ø ');
        10: write('♣ ');
        else write(' ');
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
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(LightRed);    //Selection de la couleur rouge clair pour la piece
    case p_forme of         //Affiche la piece en fonction de la valeur de sa forme
        1: write('¤ ');
        2: write('§ ');
        3: write('♫ ');
        4: write('¶ ');
        5: write('♠ ');
        6: write('¿ ');
        7: write('Ð ');
        8: write('X ');
        9: write('Ø ');
        10: write('♣ ');
        else write(' ');
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
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(Yellow);      //Selection de la couleur jaune pour la piece
    case p_forme of         //Affiche la piece en fonction de la valeur de sa forme
        1: write('¤ ');
        2: write('§ ');
        3: write('♫ ');
        4: write('¶ ');
        5: write('♠ ');
        6: write('¿ ');
        7: write('Ð ');
        8: write('X ');
        9: write('Ø ');
        10: write('♣ ');
        else write(' ');
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
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(Blue);        //Selection de la couleur bleue pour la piece
    case p_forme of         //Affiche la piece en fonction de la valeur de sa forme
        1: write('¤ ');
        2: write('§ ');
        3: write('♫ ');
        4: write('¶ ');
        5: write('♠ ');
        6: write('¿ ');
        7: write('Ð ');
        8: write('X ');
        9: write('Ø ');
        10: write('♣ ');
        else write(' ');
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
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(LightBlue);   //Selection de la couleur bleu clair pour la piece
    case p_forme of         //Affiche la piece en fonction de la valeur de sa forme
        1: write('¤ ');
        2: write('§ ');
        3: write('♫ ');
        4: write('¶ ');
        5: write('♠ ');
        6: write('¿ ');
        7: write('Ð ');
        8: write('X ');
        9: write('Ø ');
        10: write('♣ ');
        else write(' ');
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
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(White);       //Selection de la couleur blanche pour la piece
    case p_forme of         //Affiche la piece en fonction de la valeur de sa forme
        1: write('¤ ');
        2: write('§ ');
        3: write('♫ ');
        4: write('¶ ');
        5: write('♠ ');
        6: write('¿ ');
        7: write('Ð ');
        8: write('X ');
        9: write('Ø ');
        10: write('♣ ');
        else write(' ');
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
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(LightGreen);  //Selection de la couleur vert clair pour la piece
    case p_forme of         //Affiche la piece en fonction de la valeur de sa forme
        1: write('¤ ');
        2: write('§ ');
        3: write('♫ ');
        4: write('¶ ');
        5: write('♠ ');
        6: write('¿ ');
        7: write('Ð ');
        8: write('X ');
        9: write('Ø ');
        10: write('♣ ');
        else write(' ');
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
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(Green);       //Selection de la couleur verte pour la piece
    case p_forme of         //Affiche la piece en fonction de la valeur de sa forme
        1: write('¤ ');
        2: write('§ ');
        3: write('♫ ');
        4: write('¶ ');
        5: write('♠ ');
        6: write('¿ ');
        7: write('Ð ');
        8: write('X ');
        9: write('Ø ');
        10: write('♣ ');
        else write(' ');
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
    p_couleur := p.couleur;         //Récupère la valeur de la couleur de la piece
    case p_couleur of               //Selection de la couleur de la piece en fonction de sa valeur
        1 : AffichageRed(p);
        2 : AffichageYellow(p);
        3 : AffichageBlue(p);
        4 : AffichageGrey(p);
        5 : AffichageGreen(p);
        6 : AffichageLightRed(p);
        7 : AffichageLightGreen(p);
        8 : AffichageLightBlue(p);
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
    n := length(grille);        //Récupère la taille de la grille
    For i := -1 to n-1 do        //Pour chaque ligne, faire ...
    Begin
        Writeln();
        For j := -1 to n-1 do    //Pour chaque colonne, faire ...
        Begin
            if (i = -1) then
            begin
                write(j);
            end;
            if (j = -1) then
            begin
                write(i);
            end;
            AffichagePiece(grille[i,j]);    //Affiche la piece à la position i,j
            TextColor(Green);               //Reset la Couleur
            write('|');
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
    AffichagePiece(jeux.player[i].main[0]);     //Affiche la piece 1 de la main du joueur i
    TextColor(Green);
    write(' | 2 : ');
    AffichagePiece(jeux.player[i].main[1]);     //Affiche la piece 2 de la main du joueur i
    TextColor(Green);
    write(' | 3 : ');
    AffichagePiece(jeux.player[i].main[2]);     //Affiche la piece 3 de la main du joueur i
    TextColor(Green);
    write(' | 4 : ');
    AffichagePiece(jeux.player[i].main[3]);     //Affiche la piece 4 de la main du joueur i
    TextColor(Green);
    write(' | 5 : ');
    AffichagePiece(jeux.player[i].main[4]);     //Affiche la piece 5 de la main du joueur i
    TextColor(Green);
    write(' | 6 : ');
    AffichagePiece(jeux.player[i].main[5]);     //Affiche la piece 6 de la main du joueur i
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
    TextColor(Green);                       //Reset la couleur générale
    writeln('---------',jeux.player[i].nom,'---------');
    writeln('-------------------------------------');
    AffichageGrille(jeux.grille);           //Affiche la grille de jeu
    TextColor(Green);                       //Reset la couleur générale
    writeln('-------------------------------------');
    writeln('-------------Votre Main--------------');
    AffichageMain(jeux,i);                  //Affiche la main du joueur
    TextColor(Green);                       //Reset la couleur générale
    writeln('-------------------------------------');
End;

(*
--------------------------------------------------------
- Procedure : MenuAction
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Affiche le menu des actions disponible au Joueur
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Affiche le menu des actions disponible au Joueur
--------------------------------------------------------*)

Procedure MenuAction();
Begin
    writeln('-----------------------Vos Actions Possibles-----------------------');
    writeln('-------------------------------------------------------------------');
    writeln('--                                                               --');
    writeln('--1. Poser UNE pièce                                             --');
    writeln('--2. Poser PLUSIEURS pièces possédant un même attribut           --');
    writeln('--3. Echanger une ou plusieurs pièces                            --');
    writeln('-------------------------------------------------------------------');
End;

(*
--------------------------------------------------------
- Procedure : MenuActionssp
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Affiche le menu des actions disponible au Joueur sans piocher
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Affiche le menu des actions disponible au Joueur sans piocher
--------------------------------------------------------*)

Procedure MenuActionssp();
Begin
    writeln('-----------------------Vos Actions Possibles-----------------------');
    writeln('-------------------------------------------------------------------');
    writeln('--                                                               --');
    writeln('--1. Poser UNE pièce                                             --');
    writeln('--2. Poser PLUSIEURS pièces possédant un même attribut           --');
    writeln('-------------------------------------------------------------------');
End;

End.
