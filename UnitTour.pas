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
Function Tourdejoueur(jeux : jeu; i,j : Integer):jeu;

implementation

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
Function Tourdejoueur(jeux : jeu; i,j : Integer): jeu;
Begin
    ClrScr;
    writeln('-------------------------------------------------------');
    writeln('--                Tour ',j,' Joueur ',i,'                    --');
    writeln('-------------------------------------------------------');
    delay(600);
    AffichageBase(jeux,i);
    Tourdejoueur := jeux;
    delay(600);
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
    i,j,n: Integer;
Begin
    n := length(jeux.player);
    j := 1;
    while (j<>2) do
    begin
        For i := 0 to n-1 do
        Begin
            jeux := Tourdejoueur(jeux,i,j);
        End;
        Inc(j,1)
    end;
End;



End.
