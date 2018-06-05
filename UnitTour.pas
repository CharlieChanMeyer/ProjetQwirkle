(*
------------------------------------------------------------------------------------
-- Fichier           : UnitTour.pas
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
Unit UnitTour;

interface

uses SysUtils,UnitType,UnitParam,UnitAff,Crt;

Procedure Tourdejeu(jeux : jeu);
Function Tourdejoueur(jeux : jeu; num_player,num_tour : Integer):jeu;
Function JeuDejoueur(jeux : jeu; num_player : Integer):jeu;
Function poser1p(jeux : jeu; num_player : Integer):jeu;

implementation

(*--------------------------------------------------------
- Fonction : poser1p
- Auteur : Charlie Meyer
- Date de creation : date
-
- But : Faire poser une pièce à un joueur
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Faire poser une pièce à un joueur
--------------------------------------------------------*)
Function poser1p(jeux : jeu; num_player : Integer): jeu;
Var
    p_choisi : Integer;
Begin
    p_choisi := -1;

    while (p_choisi=-1) do
    begin
        writeln('Ecrire le numéro de la pièce que vous souhaitez jouer');
        readln(p_choisi)
    end;

End;

(*--------------------------------------------------------
- Fonction : JeuDejoueur
- Auteur : Charlie Meyer
- Date de creation : date
-
- But : Permet au joueur num_player de jouer son Tour
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Permet au joueur num_player de jouer son Tour
--------------------------------------------------------*)
Function JeuDejoueur(jeux : jeu; num_player : integer): jeu;
Var
    i : Integer;
Begin
    MenuAction();
    i :=0;
    while (i=0) do
    begin
        writeln('Merci de rentrer le numéro de l action souhaitée');
        readln(i);
        case i of
            1: poser1p(jeux,num_player);
            //2: poserpp;
            //3: echangerp;
            else i:=0;
        end;
    end;
    JeuDejoueur := jeux
End;

(*--------------------------------------------------------
- Fonction : Tourdejoueur
- Auteur : Charlie Meyer
- Date de creation : Jeudi 31 Mai
-
- But : Afficher le tour d'un joueur
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Afficher le tour d'un joueur
--------------------------------------------------------*)
Function Tourdejoueur(jeux : jeu; num_player,num_tour : Integer): jeu;
Begin
    ClrScr;
    writeln('-------------------------------------------------------');
    writeln('--                Tour ',num_tour,' Joueur ',num_player,'                    --');
    writeln('-------------------------------------------------------');
    delay(900);
    AffichageBase(jeux,num_player);
    jeux := JeuDejoueur(jeux,num_player);
    Tourdejoueur := jeux;
    delay(1200);
End;

(*
--------------------------------------------------------
- Procedure : Tourdejeu
- Auteur : Charlie Meyer
- Date de creation : Jeudi 31 Mai
-
- But : Calcul du tour de jeu
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Calcul du tour de jeu
--------------------------------------------------------*)

Procedure Tourdejeu(jeux : jeu);
Var
    num_player,num_tour,n: Integer;
Begin
    n := length(jeux.player);
    num_tour := 1;
    while (num_tour<>2) do
    begin
        For num_player := 0 to n-1 do
        Begin
            jeux := Tourdejoueur(jeux,num_player,num_tour);
        End;
        Inc(num_tour,1)
    end;
End;



End.
