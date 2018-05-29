(*
------------------------------------------------------------------------------------
-- Fichier           : UnitParam.pas
-- Auteur            : Charlie Meyer / Marco Espiot / Guillaume Proton
-- Date de creation  : 22 Mai 2018
--
-- But               : Parametrage de la partie de Qwirkle
-- Remarques         : Aucune
-- Compilation       : fpc
-- Edition des liens : fpc
-- Execution         : shell
------------------------------------------------------------------------------------
*)
Unit UnitParam;

interface

uses SysUtils, UnitType;

Function CountParam():jeu;
Function paramdefault(jeux : jeu):jeu;



implementation

(*--------------------------------------------------------
- Fonction : paramdefault
- Auteur : Charlie Meyer
- Date de creation : date
-
- But : Paramètre le jeu avec les paramètres par défault
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Paramètre le jeu avec les paramètres par défault
--------------------------------------------------------*)
Function paramdefault(jeux : jeu): jeu;
Var
    i,j : Integer;
Begin
    jeux.parametre.nbforme := 3;
    jeux.parametre.nbcouleur := 3;
    jeux.parametre.repetition := 2;
    setlength(jeux.player,2);
    jeux.player[0].humain := True;
    jeux.player[1].humain := True;
    setlength(jeux.grille,25,25);
    For i:=0 to 24 do
    Begin
        For j:=0 to 24 do
        Begin
            jeux.grille[i,j].forme := 0;
            jeux.grille[i,j].couleur := 0;
        End;
    End;
    setlength(jeux.pioches,18);
    paramdefault := jeux;
End;

(*
--------------------------------------------------------
- Procedure : CountParam
- Auteur : Charlie Meyer
- Date de creation : Date
-
- But : Compte le nombre de paramètre et lance la fonction adéquate
- Remarques : Remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Compte le nombre de paramètre et lance la fonction adéquate
--------------------------------------------------------*)

Function CountParam():jeu;
Var
    jeux : jeu;
Begin
    IF (ParamCount = 0) THEN
    BEGIN
        jeux := paramdefault(jeux);
    END
    ELSE
    BEGIN
        writeln('Error !')
       //verify();
    END;

    CountParam := jeux;
End;

End.
