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

Function piochedefault(jeux : jeu):jeu;
Function CountParam():jeu;
Function paramdefault(jeux : jeu):jeu;



implementation


(*--------------------------------------------------------
- Fonction : piochedefault
- Auteur : Guillaume Proton
- Date de creation : 28 mai 2018
-
- But : Paramètre la pioche avec les paramètres par défault
- Remarques : Aucune
- Pré conditions : Aucune
- Post conditions : Paramètre la pioche avec les paramètres par défault
--------------------------------------------------------*)
Function piochedefault(jeux : jeu): jeu;
Var
    i, valCouleur: integer;
Begin
    valCouleur:=0;
    setlength(jeux.pioches,18);
    for i:=0 to 17 do
    Begin
        jeux.pioches[i].couleur:= (valCouleur MOD 3) +1;
        valCouleur:= valCouleur + 1;
    End;
   for i:=0 to 5 do
   Begin
      jeux.pioches[i].forme:=1;
      jeux.pioches[i+6].forme:=2;
      jeux.pioches[i+12].forme:=3
   End;
    piochedefault:=jeux;
End;


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
    jeux:=piochedefault(jeux);
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
