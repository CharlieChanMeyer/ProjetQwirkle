(*
------------------------------------------------------------------------------------
-- Fichier           : UnitTour.pas
-- Auteur            : Charlie Meyer
-- Date de creation  : 06 Juin 2018
--
-- But               : Gérer les tours de la partie
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
Function VerifMvide(jeux : jeu):Boolean;
Function piocher(jeux : jeu;nb_pp,num_player : Integer; tbp : tabpiocher):jeu;
Function VerifPioche(jeux : jeu;nb_pp,num_player : Integer; tbp : tabpiocher):jeu;

implementation

(*--------------------------------------------------------
- Fonction : VerifPioche
- Auteur : Charlie Meyer
- Date de creation : 06 Juin
-
- But : Vérifie si la pioche est vide
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Vérifie si la pioche est vide
--------------------------------------------------------*)
Function VerifPioche(jeux : jeu;nb_pp,num_player : Integer; tbp : tabpiocher):jeu;
Var
    i,n1,n2 : Integer;
Begin
    n1 := length(jeux.pioches);
    n2 := length(tbp);
    if (n1<>0) THEN
    Begin
        jeux := piocher(jeux,1,num_player,tbp);
    End
    else
    begin
        For i:=0 to n2-1 do
        Begin
            jeux.player[num_player].main[tbp[i]].couleur := 0;
            jeux.player[num_player].main[tbp[i]].forme := 0;
        End;
    end;
    VerifPioche := jeux;
End;

(*--------------------------------------------------------
- Fonction : piocher
- Auteur : Charlie Meyer
- Date de creation : 06 Juin 2018
-
- But : Faire piocher au joueur le nombre de piece "nb_pp"
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Faire piocher au joueur le nombre de piece "nb_pp"
--------------------------------------------------------*)
Function piocher(jeux : jeu;nb_pp,num_player : Integer; tbp : tabpiocher): jeu;
Var
    i,j,n1,n2,place_pp : Integer;
    p_tmp : piece;
Begin
    n2 := length(tbp);
    For i:=1 to nb_pp do        //Pour chaque pièce jouée, faire
    Begin
        For j:=0 to n2 do       //Pour chaque emplacement de piece jouée
        Begin
            n1 := length(jeux.pioches);
            place_pp := Random(n1+1);
            p_tmp := jeux.pioches[place_pp];
            jeux.player[num_player].main[tbp[j]] := p_tmp;
            jeux.pioches[place_pp] := jeux.pioches[n1-1];
            setlength(jeux.pioches,n1-1);
        End;
    End;
    piocher := jeux;
End;

(*--------------------------------------------------------
- Fonction : VerifMvide
- Auteur : Charlie Meyer
- Date de creation : date
-
- But : Vérifie si la grille est vide
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Vérifie si la grille est vide
--------------------------------------------------------*)
Function VerifMvide(jeux : jeu): Boolean;
Var
    Mvide : Boolean;
    n,i,j : Integer;
Begin
    Mvide := True;                      //Dis que la grille est vide
    i:=0;                               //Compteur de ligne à 0

    n := length(jeux.grille);           //n prend la taille de la grille
    while ((i<n) and (Mvide)) do        // Tant que le nombre de ligne parcouru < au nombre de ligne et que la grille est vide, fait ...
    begin
        j := 0;                     //Compteur de colonne à 0
        while ((j<n) and (Mvide)) do         // Tant que le nombre de colonne parcouru < au nombre de colonne et que la grille est vide, fait ...
        begin
            If (jeux.grille[i,j].couleur <> 0) then     //Si la couleur de la pièce sur la case [i,j] n'existe pas (0), alors ...
            Begin
                Writeln(i,',',j);
                Mvide := False;                     //Dit que la grille n'est pas vide.
            End;
            Inc(j,1);                           //Augmente le nombre de colonne de 1
        end;
        Inc(i,1);                           //Augmente le nombre de ligne de 1
    end;
    If Mvide then
    Begin
        writeln('La grille est vide')
    End;
    VerifMvide := Mvide;
End;

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
    p_choisi,n,milieu : Integer;
    tbp : tabpiocher;
Begin
    p_choisi := -1;
    n := length(jeux.grille);
    milieu := (n DIV 2);
    while ((p_choisi<1) or (p_choisi>6)) do
    begin
        writeln('Ecrire le numéro de la pièce que vous souhaitez jouer');
        readln(p_choisi)
    end;
    setlength(tbp,1);
    tbp[0] := p_choisi-1;
    if (VerifMvide(jeux)) then
    begin
        jeux.grille[milieu,milieu] := jeux.player[num_player].main[p_choisi-1];
        jeux := VerifPioche(jeux,1,num_player,tbp)
    end;
    poser1p := jeux;

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
            1: jeux:=poser1p(jeux,num_player);
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
    while (num_tour<>3) do
    begin
        For num_player := 0 to n-1 do
        Begin
            jeux := Tourdejoueur(jeux,num_player,num_tour);
        End;
        Inc(num_tour,1)
    end;
End;



End.
