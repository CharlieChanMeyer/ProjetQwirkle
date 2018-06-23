(*
------------------------------------------------------------------------------------
-- Fichier           : UnitIA.pas
-- Auteur            : Charlie Meyer
-- Date de creation  : 21/06/18 12:50
--
-- But               : Gerer l'IA
-- Remarques         : Aucune
-- Compilation       : fpc
-- Edition des liens : fpc
-- Execution         : shell
------------------------------------------------------------------------------------
*)
Unit UnitIA;

interface

uses SysUtils,UnitType,UnitParam,UnitAff,UnitLegalite,Crt;

Function ia_base(jeux : jeu ; num_player,num_tour : integer): jeu;
Function ia_grille(ia_jeux : ia_jeu; num_player : integer):ia_jeu;
Function VerifPiocheIA(ia_jeux : ia_jeu;num_player : integer):ia_jeu;
Function piocherIA(ia_jeux : ia_jeu; num_player : integer): ia_jeu;

implementation

(*--------------------------------------------------------
- Fonction : ia_base
- Auteur : Charlie Meyer
- Date de creation : 21/06/18 12:53
-
- But : Gérer le tour de l'ia
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Gérer le tour de l'ia
--------------------------------------------------------*)
Function ia_base(jeux : jeu ; num_player,num_tour : integer): jeu;
Var
    ia_jeux : ia_jeu;
    n,milieu : integer;
Begin
    n := length(jeux.grille);       //Prend la taille de la grille
    milieu := (n DIV 2);        //Prends ~ le milieu de la grille
    ia_jeux.jeux := jeux;
    ClrScr;         //Reset l'affichage du terminal
    writeln('-------------------------------------------------------');                 //Affiche le numéro du tour et du joueur
    writeln('--                Tour ',num_tour,' Joueur ',num_player+1,'                    --');
    writeln('-------------------------------------------------------');
    AffichageIA(jeux,num_player);
    if (VerifMvide(jeux)) then      //Si la grille est vide, alors ...
    begin
        jeux.grille[milieu,milieu] := jeux.player[num_player].main[0];             //Pose sa première pièce au milieu
        ia_jeux.pieces := 0;                                //Dis que la pièce jouée est la pièce à l'emplacement 0 de la main de l'IA
        ia_jeux := VerifPiocheIA(ia_jeux,num_player)              //Verifie si la pioche est vide et fait piocher l'ia
    end
    else
    begin
        writeln('base OK');
        ia_jeux := ia_grille(ia_jeux,num_player);  //Lance la fonction ia_grille
        If (ia_jeux.action) then
            ia_jeux := VerifPiocheIA(ia_jeux,num_player);             //Verifie si la pioche est vide et fait piocher l'ia
    end;
    ia_base := ia_jeux.jeux;
End;

(*--------------------------------------------------------
- Fonction : ia_grille
- Auteur : Charlie Meyer
- Date de creation : 21/06/18 13:10
-
- But : Faire poser une pièce à l'IA
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Faire poser une pièce à l'IA
--------------------------------------------------------*)
Function ia_grille(ia_jeux : ia_jeu; num_player : Integer): ia_jeu;
Var
    ligne,colonne,n,pieces,p_couleur,p_forme : integer;
Begin
    n := length(ia_jeux.jeux.grille);                   //Prend la taille de la grille
    pieces := 0;                                        //Prend la position de la première piece
    ia_jeux.action := FALSE;                            //Dis que l'ia n'a pas encore jouer
    while (not ia_jeux.action) do                       //Tant que l'ia n'a pas jouée
    Begin
        p_couleur := ia_jeux.jeux.player[num_player].main[pieces].couleur;          //Prend la couleur de la pièce
        p_forme := ia_jeux.jeux.player[num_player].main[pieces].forme;              //Prend la forme de la pièce
        ligne := 3;                                                                //Prend la ligne 3
        while ((ligne<n) and (not ia_jeux.action)) do                               //Tant que le numéro de ligne ne dépasse pas la taille de la grille ou que l'ia n'a pas jouée
        Begin
            colonne := 3;                                                            //Prend la colonne 3
            while ((colonne<n) and (not ia_jeux.action)) do                          //Tant que le numéro de colonne ne dépasse pas la taille de la grille ou que l'ia n'a pas jouée
            begin
                If (LegaliteCoup(ia_jeux.jeux,p_couleur,p_forme,ligne,colonne)=1) THEN              //Vérifie si le coup demandé est valide
                Begin
                    ia_jeux.jeux.grille[ligne,colonne] := ia_jeux.jeux.player[num_player].main[pieces];       //Si valide, alors place la pièce
                    ia_jeux.pieces := pieces;                                                   //Stocke la place de la pièce jouée dans la main de l'ia
                    ia_jeux.action := True;                                                    //et dit que l'action est finie
                End;
                Inc(colonne,1);                                     //Incrémente le numéro de la colonne de 1
            end;
            Inc(ligne,1);                           //Incrémente le numéro de la ligne de 1
        End;
    End;
    ia_grille := ia_jeux;                               //Retourne l'ia_jeux
End;

(*--------------------------------------------------------
- Fonction : VerifPiocheIA
- Auteur : Charlie Meyer
- Date de creation : 21/06/18 13:30
-
- But : Vérifie si la pioche est vide
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Vérifie si la pioche est vide
--------------------------------------------------------*)
Function VerifPiocheIA(ia_jeux : ia_jeu;num_player : integer):ia_jeu;
Var
    i,n1,n2 : Integer;
Begin
    n1 := length(ia_jeux.jeux.pioches);         //n1 prend la taille de la pioche
    n2 := 1;                  //n2 prend la taille du tableau contenant la position des pieces jouées
    if (n1<>0) THEN                     //Si la pioche n'est pas vide alors ...
    Begin
        ia_jeux := piocherIA(ia_jeux,num_player);         //Fait piocher le joueur du nombre de pieces qu'il a joué
    End
    else                                //Sinon ...
    begin
        For i:=0 to n2-1 do             //Pour chaque piece jouée
        Begin
            ia_jeux.jeux.player[num_player].main[ia_jeux.pieces].couleur := 0;              //Reset sa couleur
            ia_jeux.jeux.player[num_player].main[ia_jeux.pieces].forme := 0;                //Reset sa forme
        End;
    end;
    VerifPiocheIA := ia_jeux;            //Retourne le jeux
End;

(*--------------------------------------------------------
- Fonction : piocherIA
- Auteur : Charlie Meyer
- Date de creation :21/06/18 13:37
-
- But : Faire piocher à l'ia une nouvelle pièce
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Faire piocher à l'ia une nouvelle pièce
--------------------------------------------------------*)
Function piocherIA(ia_jeux : ia_jeu; num_player : integer): ia_jeu;
Var
    n1,place_pp : Integer;
    p_tmp : piece;
Begin
    n1 := length(ia_jeux.jeux.pioches);     //Prends la taille de la pioche
    place_pp := Random(n1+1);           //Prend la place de piece pioché
    p_tmp := ia_jeux.jeux.pioches[place_pp];        //prends la piece pioché
    ia_jeux.jeux.player[num_player].main[ia_jeux.pieces] := p_tmp;      //donne la piece pioché à l'ia (à l'emplacement de la pièce jouée)
    ia_jeux.jeux.pioches[place_pp] := ia_jeux.jeux.pioches[n1-1];       //Prends la dernière pièce de la pioche et la met à la place de la pièce piochée
    setlength(ia_jeux.jeux.pioches,n1-1);                   //Enlève 1 à la taille de la pioche

    piocherIA := ia_jeux;                //Retourne le jeux
End;

End.
