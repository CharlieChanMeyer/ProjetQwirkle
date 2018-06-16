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

uses SysUtils,UnitType,UnitParam,UnitAff,UnitMarco,UnitLegalite,Crt;

Procedure Tourdejeu(jeux : jeu);
Function Tourdejoueur(jeux : jeu; num_player,num_tour : Integer):jeu;
Function JeuDejoueur(jeux : jeu; num_player : Integer):jeu;
Function poser1p(jeux : jeu; num_player : Integer):jeu;
Function VerifMvide(jeux : jeu):Boolean;
Function piocher(jeux : jeu;nb_pp,num_player : Integer; tbp : tabpiocher):jeu;
Function VerifPioche(jeux : jeu;nb_pp,num_player : Integer; tbp : tabpiocher):jeu;
Function VerifMainVide(jeux : jeu; num_player : Integer):Boolean;
Function JeuDejoueurssp(jeux : jeu; num_player : integer): jeu;
Function initMain(jeux : jeu): jeu;
Function poser1pchoix(jeux : jeu; num_player,p_choisi : Integer): jeu;

implementation

(*--------------------------------------------------------
- Fonction : VerifMainVide
- Auteur : Charlie Meyer
- Date de creation : Lundi 11 Juin 2018
-
- But : Retourne True si la main du joueur est vide
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Retourne True si la main du joueur est vide
--------------------------------------------------------*)
Function VerifMainVide(jeux : jeu; num_player : Integer): Boolean;
Var
    i : Integer;
    EmptyHand : Boolean;
Begin
    EmptyHand := True;
    i := 0;
    while ((i<6) and EmptyHand) do
    begin
        if ((jeux.player[num_player].main[i].couleur <> 0) and (jeux.player[num_player].main[i].forme <> 0)) then
        begin
            EmptyHand := False
        end
        else
        begin
            Inc(i,1)
        end;
    end;
    VerifMainVide := EmptyHand;
End;

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
    n1 := length(jeux.pioches);         //n1 prend la taille de la pioche
    writeln('Pioche Restante : ',n1);
    n2 := length(tbp);                  //n2 prend la taille du tableau contenant la position des pieces jouées
    writeln('Pieces à piocher restante : ',n2);
    if (n1<>0) THEN                     //Si la pioche n'est pas vide alors ...
    Begin
        writeln('Presque OK');
        jeux := piocher(jeux,nb_pp,num_player,tbp);         //Fait piocher le joueur du nombre de pieces qu'il a joué
        writeln('OK');
    End
    else                                //Sinon ...
    begin
        For i:=0 to n2-1 do             //Pour chaque piece jouée
        Begin
            jeux.player[num_player].main[tbp[i]].couleur := 0;              //Reset sa couleur
            jeux.player[num_player].main[tbp[i]].forme := 0;                //Reset sa forme
        End;
    end;
    VerifPioche := jeux;            //Retourne le jeux
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
    i,n1,place_pp : Integer;
    p_tmp : piece;
Begin
    For i:=1 to nb_pp do        //Pour chaque pièce jouée, faire
    Begin
        n1 := length(jeux.pioches);     //Prends la taille de la pioche
        writeln('Pioche : ',n1);
        place_pp := Random(n1+1);           //Prend la place de piece pioché
        p_tmp := jeux.pioches[place_pp];        //prends la piece pioché
        writeln('OK Pioche 1');
        jeux.player[num_player].main[tbp[i]] := p_tmp;      //donne la piece pioché au joueur (à l'emplacement de la pièce jouée)
        writeln('OK Pioche 2');
        jeux.pioches[place_pp] := jeux.pioches[n1-1];       //Prends la dernière pièce de la pioche et la met à la place de la pièce piochée
        writeln('OK Pioche 3');
        setlength(jeux.pioches,n1-1);                   //Enlève 1 à la taille de la pioche
        writeln('OK Pioche 4');
    End;
    piocher := jeux;                //Retourne le jeux
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
                Writeln(i,',',j);       //A ENLEVER PLUS TARD
                Mvide := False;                     //Dit que la grille n'est pas vide.
            End;
            Inc(j,1);                           //Augmente le nombre de colonne de 1
        end;
        Inc(i,1);                           //Augmente le nombre de ligne de 1
    end;
    If Mvide then
    Begin
        writeln('La grille est vide')       //A ENLEVER PLUS TARD
    End;
    VerifMvide := Mvide; //Retourne le fait que la grille soit vide ou non
End;

(*--------------------------------------------------------
- Fonction : poser1pchoix
- Auteur : Charlie Meyer
- Date de creation : Mardi 12 Juin 2018
-
- But : Faire choisir au joueur où il souhaite poser sa pièce
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Faire choisir au joueur où il souhaite poser sa pièce
--------------------------------------------------------*)
Function poser1pchoix(jeux : jeu; num_player,p_choisi : Integer): jeu;
Var
    ligne, colonne,p_forme, p_couleur : Integer;
    actionfinie : Boolean;
Begin
    actionfinie := False;               //dit que l'action n'est pas finie
    p_forme := jeux.player[num_player].main[p_choisi].forme;            //prends la valeur de la forme de la pièce choisie
    p_couleur := jeux.player[num_player].main[p_choisi].couleur;        //prends la valeur de la couleur de la forme choisie
    While not actionfinie do                    //Tant que l'action n'est pas finie
    Begin
        writeln('Merci de rentrer le numéro de la ligne sur laquelle vous souhaitez poser votre piece');        //Demande au joueur le numéro de la ligne sur laquelle il veut jouer la pièce
        readln(ligne);
        writeln('Merci de rentrer le numéro de la colonne sur laquelle vous souhaitez poser votre piece');      //Demande au joueur le numéro de la colonne sur laquelle il veut jouer la pièce
        readln(colonne);
        Inc(ligne,-1);      //Met la valeur ligne sur celle ordinateur
        Inc(colonne,-1);        //Met la valeur colonne sur celle ordinateur
        If (LegaliteCoup(jeux,p_couleur,p_forme,ligne,colonne)=1) THEN              //Vérifie si le coup demandé est valide
        Begin
            jeux.grille[ligne,colonne] := jeux.player[num_player].main[p_choisi];       //Si valide, alors place la pièce choisie
            actionfinie := True                                                         //et dit que l'action est finie
        End
        else
        begin
            writeln('Votre action n est pas valide. Merci de renseigner de nouvelles coordonnées.')     //Sinon, dit que l'action n'est pas valide et boucle
        end;
    End;
    poser1pchoix := Jeux;           //Retourne le plateau
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
    p_choisi := -1;         //Met l'emplacement de la piece choisie sur -1
    n := length(jeux.grille);       //Prend la taille de la grille
    milieu := (n DIV 2);        //Prends ~ le milieu de la grille
    while ((p_choisi<1) or (p_choisi>6)) do     //Tant que l'emplacement de la pièce choisie n'existe pas, fait ...
    begin
        writeln('Ecrire le numéro de la pièce que vous souhaitez jouer');       //Ecrit un message d'instruction au joueur
        readln(p_choisi)            //Lis l'emplacement de la pièce choisie
    end;
    Inc(p_choisi,-1);           //Change pour la valeur ordinateur de la pièce
    setlength(tbp,1);           //Augmente de 1 la taille du tableau contenant les emplacement des pieces jouées
    tbp[0] := p_choisi;       //Stocke l'emplacement de la pièce jouée
    if (VerifMvide(jeux)) then      //Si la grille est vide, alors ...
    begin
        jeux.grille[milieu,milieu] := jeux.player[num_player].main[p_choisi];             //Pose la pièce jouée au milieu
        jeux := VerifPioche(jeux,1,num_player,tbp)              //Verifie si la pioche est vide et fait piocher le joueur
    end
    else
    begin
        jeux := poser1pchoix(jeux,num_player,p_choisi);  //Lance la fonction qui fera choisir au joueur où il veut poser sa pièce
        jeux := VerifPioche(jeux,1,num_player,tbp);             //Verifie si la pioche est vide et fait piocher le joueur
    end;
    poser1p := jeux;        //Retourne le jeu

End;

(*--------------------------------------------------------
- Fonction : JeuDejoueurssp
- Auteur : Charlie Meyer
- Date de creation : date
-
- But : Permet au joueur num_player de jouer son Tour
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Permet au joueur num_player de jouer son Tour
--------------------------------------------------------*)
Function JeuDejoueurssp(jeux : jeu; num_player : integer): jeu;
Var
    i : Integer;
Begin
    MenuActionssp();           //Lance l'affichage du menu des actions
    i :=0;
    while (i=0) do //Tant que i = 0
    begin
        writeln('Merci de rentrer le numéro de l action souhaitée'); //Donne un instruction au Joueur
        readln(i);              //Lis l'information donnée par le Joueur
        case i of
            1: jeux:=poser1p(jeux,num_player);          //Si le joueur demande l'action 1, lance la fonction poser1p
            //2: poserpp;
            else i:=0;              //Sinon remet i=0
        end;
    end;
    JeuDejoueurssp := jeux         //Retourne le Jeux
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
    MenuAction();           //Lance l'affichage du menu des actions
    i :=0;
    while (i=0) do //Tant que i = 0
    begin
        writeln('Merci de rentrer le numéro de l action souhaitée'); //Donne un instruction au Joueur
        readln(i);              //Lis l'information donnée par le Joueur
        case i of
            1: jeux:=poser1p(jeux,num_player);          //Si le joueur demande l'action 1, lance la fonction poser1p
            //2: poserpp;
            3: jeux:=echangePioche(jeux,num_player);        //Si le joueur demande l'action 3, lance l'action echangePioche
            else i:=0;              //Sinon remet i=0
        end;
    end;
    JeuDejoueur := jeux         //Retourne le Jeux
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
    ClrScr;         //Reset l'affichage du terminal
    writeln('-------------------------------------------------------');                 //Affiche le numéro du tour et du joueur
    writeln('--                Tour ',num_tour,' Joueur ',num_player+1,'                    --');
    writeln('-------------------------------------------------------');
    delay(900);                                 //Met le programme en pause pendant quelques secondes afin de laisser le temps au joueur de se préparer
    AffichageBase(jeux,num_player);             //Lance l'affichage de base du joueur
    if (length(jeux.pioches)=0) then
    begin
        jeux := JeuDejoueurssp(jeux,num_player);       //Lance le tour du joueur sans pioche
    end
    else
    begin
        jeux := JeuDejoueur(jeux,num_player);       //Lance le tour du joueur
    end;
    Tourdejoueur := jeux;           //Retourne le jeux
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
    EmptyHand : Boolean;
Begin
    jeux := CountParam();
    jeux := initMain(jeux);
    jeux.player[1].nom := 'Marco';
    jeux.player[0].nom := 'Charlie';
    EmptyHand := False;              //Dis que la main des joueur n'est pas vide
    n := length(jeux.player);           //Prends le nombre de Joueur
    num_tour := 1;                  //Met le Premier tour en place
    while not EmptyHand do              //Tant que ..., fait ...
    begin
        num_player:= 0;                 //Met le joueur initial du tour sur 0
        while ((num_player<=n-1) and (not EmptyHand)) do        //Pour chaque joueur, fait ...
        Begin
            jeux := Tourdejoueur(jeux,num_player,num_tour);         //Lance le tour de jeux du joueur
            if (VerifMainVide(jeux,num_player)) then       //Si la main du joueur est vide alors
            begin
                EmptyHand := True;                          //Dit que la main d'un joueur est vide et sort des boucles
            end
            else
            begin
                Inc(num_player,1)                   //sinon, fait passer le tour au joueur suivant
            end;
        End;
        Inc(num_tour,1)         //Augmente le nombre de tour de 1
    end;
End;

(*--------------------------------------------------------
- Fonction : initMain
- Auteur : ESPIOT Marco
- Date de creation : date
-
- But : faire en sorte que le joueur pioche 6 pions
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : renvoi l'etat du jeux avec la donne des joueurs initialisé
--------------------------------------------------------*)
Function initMain(jeux : jeu): jeu;
var
tbp : tabpiocher;
i,n: integer;

Begin
    writeln('OK MARCO');
  if ((length(jeux.player)*6) > (length(jeux.pioches))) then //condition d'arret
  begin
    writeln ('Erreur, pas assez de pièces pour tout les joueurs');
    writeln ('Veuillez enlever des joueurs ou rajouter des pieces');
  end
  else
  begin
      writeln('OK MARCO 2');
    setlength (tbp,6);
    For i := 0 to 5 do
    Begin
        tbp[i]:=i;
    End;
    writeln('OK MARCO 3');
    n := length(jeux.player)-1;
    writeln(n);
    For i := 0 to n do //parcour le tableau joueur et les fait piocher 1 par 1
    Begin
     jeux := VerifPioche(jeux,6,i,tbp);
        writeln('OK MARCO 4');
    End;
  end;
  writeln('OK MARCO FIN');
  initMain := jeux; //renvoi le jeux avec les donnes de chaque joueurs
End;

End.
