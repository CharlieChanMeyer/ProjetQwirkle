(*
------------------------------------------------------------------------------------
-- Fichier           : UnitType.pas
-- Auteur            : Charlie Meyer / Marco Espiot / Guillaume Proton
-- Date de creation  : 22 Mai 2018
--
-- But               : Créer les types utilisés dans notre programme
-- Remarques         : Aucune
-- Compilation       : fpc
-- Edition des liens : fpc
-- Execution         : shell
------------------------------------------------------------------------------------
*)
Unit UnitType;

interface
uses SysUtils;

TYPE
    piece = RECORD
        forme : Integer;
        couleur : integer;
    END;

    param = RECORD
        nbforme : Integer;
        nbcouleur : Integer;
        repetition : Integer;
    END;

    joueur = RECORD
        nom : string;
        humain : Boolean;
        age : integer;
        points : integer;
        main : array[0..5] of piece;
    END;

    tabjoueur = array of joueur;

    pioche = array of piece;

    plateau = array of array of piece;

    jeu = RECORD
        player : tabjoueur;
        pioches : pioche;
        grille : plateau;
        parametre : param;
    END;

<<<<<<< HEAD

=======
>>>>>>> 17cbc311d37e3444aeacf10ee198397b5b7b92e0
implementation

End.
