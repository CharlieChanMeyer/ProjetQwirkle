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
--1 : ¤                           --1 : TextColor(1);
--2 : §                           --2 : TextColor(2);
--3 : ♫                           --3 : TextColor(3);
--4 : ¶                           --4 : TextColor(4);
--5 : ♠                           --5 : TextColor(5);
--6 : ¿                           --6 : TextColor(6);
--7 : Ð                           --7 : TextColor(7);
--8 : X                           --8 : TextColor(8);
--9 : Ø                           --9 : TextColor(9);
--10 :♣                           --10 : TextColor(10);
------------------------------------------------------------------------------------
*)
Unit UnitAff;

interface

uses SysUtils,UnitType,UnitParam,Crt;

Procedure AffichageMain(jeux : jeu; i : integer);
Procedure AffichageBase(jeux : jeu ; i : integer);
Procedure AffichageGrille(grille : plateau);
Procedure AffichagePiece(p : piece);
Procedure Affichagec1(p : piece);
Procedure Affichagec2(p : piece);
Procedure Affichagec3(p : piece);
Procedure Affichagec4(p : piece);
Procedure Affichagec5(p : piece);
Procedure Affichagec6(p : piece);
Procedure Affichagec7(p : piece);
Procedure Affichagec8(p : piece);
Procedure Affichagec9(p : piece);
Procedure Affichagec10(p : piece);
Procedure MenuAction();
Procedure MenuActionssp();
Procedure Ecrirenb(nb : integer);

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

Procedure Affichagec1(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(1);         //Selection de la couleur 1 pour la piece
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

Procedure Affichagec2(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(2);    //Selection de la couleur 2 pour la piece
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

Procedure Affichagec3(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(3);      //Selection de la couleur 3 pour la piece
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

Procedure Affichagec4(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(4);        //Selection de la couleur 4 pour la piece
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

Procedure Affichagec5(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(5);   //Selection de la couleur 5 pour la piece
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

Procedure Affichagec6(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(6);       //Selection de la couleur 6 pour la piece
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

Procedure Affichagec7(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(7);  //Selection de la couleur 7 pour la piece
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

Procedure Affichagec8(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(8);       //Selection de la couleur 8 pour la piece
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

Procedure Affichagec9(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(9);       //Selection de la couleur 9 pour la piece
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

Procedure Affichagec10(p : piece);
Var
    p_forme : Integer;
Begin
    p_forme := p.forme;     //Récupère la valeur de la forme de la piece
    TextColor(10);       //Selection de la couleur 10 pour la piece
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
        1 : Affichagec1(p);
        2 : Affichagec2(p);
        3 : Affichagec4(p);
        4 : Affichagec3(p);
        5 : Affichagec5(p);
        6 : Affichagec6(p);
        7 : Affichagec7(p);
        8 : Affichagec8(p);
        9 : Affichagec9(p);
        10 : Affichagec10(p);
        else write('  ');
    end;
End;

(*
--------------------------------------------------------
- Procedure : Ecrirenb
- Auteur : Charlie Meyer
- Date de creation : Mardi 12 Juin 2018
-
- But : Afficher le numéro de la ligne ou de la colonne
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Afficher le numéro de la ligne ou de la colonne
--------------------------------------------------------*)

Procedure Ecrirenb(nb : integer);
Begin
    If ((nb>=0) and (nb<10)) THEN
    Begin
        write(nb,' ');
    End
    else
    begin
        write(nb)
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
    For i := 0 to n do        //Pour chaque ligne, faire ...
    Begin
        Writeln();
        For j := 0 to n do    //Pour chaque colonne, faire ...
        Begin
            if (i = 0) then
            begin
                Ecrirenb(j);
            end
            else
            if (j = 0) then
            begin
                Ecrirenb(i);
            end
            else
            begin
                AffichagePiece(grille[i-1,j-1]);    //Affiche la piece à la position i,j
            end;
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
    writeln('--0. Passer son tour                                             --');
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
    writeln('--0. Passer son tour                                             --');
    writeln('-------------------------------------------------------------------');
End;

End.
