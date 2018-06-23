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

uses SysUtils,UnitType,UnitParam,UnitAff,UnitLegalite,UnitIA,Crt;

Function posePieces(jeux : jeu ; numJoueur : integer ; piecePosee : pioche): jeu;
Procedure initPosePieces(jeux : jeu; numJoueur : integer);
Function echangePioche(jeux : jeu; numJoueur : integer): jeu;
Procedure Tourdejeu(jeux : jeu);
Function Tourdejoueur(jeux : jeu; num_player,num_tour : Integer):jeu;
Function JeuDejoueur(jeux : jeu; num_player : Integer):jeu;
Function poser1p(jeux : jeu; num_player : Integer):jeu;
Function piocher(jeux : jeu;nb_pp,num_player : Integer; tbp : tabpiocher):jeu;
Function VerifPioche(jeux : jeu;nb_pp,num_player : Integer; tbp : tabpiocher):jeu;
Function VerifMainVide(jeux : jeu; num_player : Integer):Boolean;
Function JeuDejoueurssp(jeux : jeu; num_player : integer): jeu;
Function initMain(jeux : jeu): jeu;
Function poser1pchoix(jeux : jeu; num_player,p_choisi : Integer): jeu;

implementation

(*--------------------------------------------------------
- Fonction : posePieces
- Auteur : Marco Espiot
- Date de creation : 20/06/2018
-
- But : But
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : But
--------------------------------------------------------*)
Function posePieces(jeux : jeu ; numJoueur : integer ; piecePosee : pioche): jeu;
Var
i, choix : Integer;
Begin
    i := 0;
    Repeat
        writeln('Souhaitez vous posez une ligne ou une colonne');
        writeln('1 - En Ligne');
        writeln('2 - En colonne');
        read(choix);
    until ((choix = 1) or (choix = 2));
    if (choix = 1) then
    begin
        Repeat
            jeux.grille[12+i,12].forme := piecePosee[i].forme;
            jeux.grille[12+i,12].couleur := piecePosee[i].couleur;
            Inc(i,1);
        until (i = length(piecePosee)-1);
    end
    else
    begin
        Repeat
            jeux.grille[12,12+i].forme := piecePosee[i].forme;
            jeux.grille[12,12+i].couleur := piecePosee[i].couleur;
            Inc(i,1);
        until (i = length(piecePosee)-1);
    end;
    posePieces := jeux;
End;

(*--------------------------------------------------------
- Procedure : initPosePieces
- Auteur : ESPIOT Marco
- Date de creation : 12/06/2018
-
- But : initialise la pose de plusieurs pieces en meme temps
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : But
--------------------------------------------------------*)
Procedure initPosePieces(jeux : jeu; numJoueur : integer);
var
  i,nbPieceJoue,pieceMain : integer;
  piecePosee : pioche;
Begin
  Repeat
    writeln ('Entrez le nombre de pièces à jouer');
    readln (nbPieceJoue);
  until ((nbPieceJoue > 0) and (nbPieceJoue < 7) ); //sors de la boucle une fois que le nombre de pièce est entre 1 et 6
  setlength(piecePosee,nbPieceJoue); // le nombre de cases dans piecePosee est le nombre de pieces que le joueur veut poser
  For i := 0 to (nbPieceJoue-1) do //repete la boucle autant de fois qu'il y a de pièces a poser
  Begin
    Repeat
      writeln('Veuillez sélectionner une pièce a jouer');
      readln(pieceMain);
    until ((pieceMain < 7) and (pieceMain > 0)); //vérifie que le numéro de la piece dans la main est valide (donc entre 1 et 6)
      writeln('Piece enregistrée');
    piecePosee[i] := jeux.player[numJoueur].main[pieceMain-1]; //la piéce que le joueur veut poser est stocké dans un tableau
                                                              //afin de verifier la légalité de la combinaison en suivant
  End;
  if not VerifPose(piecePosee) then
  begin
   writeln('les pièces ne sont pas compatibles entre elles, veuillez recommencer');
   initPosePieces(jeux,numJoueur);
  end
  else
  begin
    jeux := posePieces(jeux,numJoueur,piecePosee);
  end;
End;


(*--------------------------------------------------------
- Fonction : echangePioche
- Auteur : ESPIOT Marco
- Date de creation : 31/05/2018
-
- But : Permettre l'echange de pions entre la main et la pioche
- Remarques : remarques éventuelles
- Pré conditions : l'utilisateur a demandé à échanger des pièces avec la pioche
- Post conditions : l'utilisateur a ses nouveaux pions et ses anciens se retrouvent dans la pioche
--------------------------------------------------------*)
Function echangePioche(jeux : jeu; numJoueur : integer): jeu;
var
  i, nbPiece, numpiece, numPieceMain : integer;
  attente, dejaPioche : pioche;
Begin
  Randomize();
  writeln('combien de pièces souhaitez vous échanger ?');
   readln(nbPiece);
   setlength(attente,nbPiece+1);
   setlength(dejaPioche,nbPiece+1);
   i := 1;
   attente[0].forme := 0;//case de référence pour la comparaison suivante

   Repeat
    numpiece := random(length(jeux.pioches)); //prend une pièce au hasard dans la pioche
        attente[i] := jeux.pioches[numpiece]; //stock cette pièce dans une "pioche temporaire"
        AffichageMain(jeux,numJoueur);
        writeln('Entrez le numero de la piece a échanger ');
        readln(numPieceMain);
        jeux.pioches[numpiece] := jeux.player[numjoueur].main[numPieceMain-1]; //on place la pièce depuis la main du joueur dans la pioche
        jeux.player[numjoueur].main[numPieceMain-1] := attente[i]; //le joueur récupère la pièce mise de coté
      i := i+1;
   until (i = nbPiece+1);
   AffichageMain(jeux,numJoueur);
   echangePioche := jeux;
End;

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
    n2 := length(tbp);                  //n2 prend la taille du tableau contenant la position des pieces jouées
    if (n1<>0) THEN                     //Si la pioche n'est pas vide alors ...
    Begin
        jeux := piocher(jeux,nb_pp,num_player,tbp);         //Fait piocher le joueur du nombre de pieces qu'il a joué
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
        place_pp := Random(n1+1);           //Prend la place de piece pioché
        p_tmp := jeux.pioches[place_pp];        //prends la piece pioché
        jeux.player[num_player].main[tbp[i]] := p_tmp;      //donne la piece pioché au joueur (à l'emplacement de la pièce jouée)
        jeux.pioches[place_pp] := jeux.pioches[n1-1];       //Prends la dernière pièce de la pioche et la met à la place de la pièce piochée
        setlength(jeux.pioches,n1-1);                   //Enlève 1 à la taille de la pioche
    End;
    piocher := jeux;                //Retourne le jeux
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
    i :=-1;
    while (i=-1) do //Tant que i = -1
    begin
        writeln('Merci de rentrer le numéro de l action souhaitée'); //Donne un instruction au Joueur
        readln(i);              //Lis l'information donnée par le Joueur
        case i of
            0: exit(jeux);
            1: jeux:=poser1p(jeux,num_player);          //Si le joueur demande l'action 1, lance la fonction poser1p
            //2: poserpp;
            3: jeux:=echangePioche(jeux,num_player);        //Si le joueur demande l'action 3, lance l'action echangePioche
            else i:=-1;              //Sinon remet i=-1
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
    affpioche(jeux);            //A ENLEVER APRES LES TESTS
    EmptyHand := False;              //Dis que la main des joueur n'est pas vide
    n := length(jeux.player);           //Prends le nombre de Joueur
    num_tour := 1;                  //Met le Premier tour en place
    while not EmptyHand do              //Tant que ..., fait ...
    begin
        num_player:= 0;                 //Met le joueur initial du tour sur 0
        while ((num_player<=n-1) and (not EmptyHand)) do        //Pour chaque joueur, fait ...
        Begin
            if (jeux.player[num_player].humain) then
            BEGIN
                jeux := Tourdejoueur(jeux,num_player,num_tour);         //Lance le tour de jeux du joueur
            End
            else
                jeux := ia_base(jeux,num_player,num_tour);         //Lance le tour de jeux de l'ia
            if (VerifMainVide(jeux,num_player)) then       //Si la main du joueur est vide alors
            begin
                EmptyHand := True;                          //Dit que la main d'un joueur est vide et sort des boucles
            end
            else
                Inc(num_player,1);                   //sinon, fait passer le tour au joueur suivant
        End;
        Inc(num_tour,1)         //Augmente le nombre de tour de 1
    end;
    grillefinale(jeux);
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
  if ((length(jeux.player)*6) > (length(jeux.pioches))) then //condition d'arret
  begin
    error(2);
  end
  else
  begin
    setlength (tbp,6);
    For i := 0 to 5 do
    Begin
        tbp[i]:=i;
    End;
    n := length(jeux.player)-1;
    For i := 0 to n do //parcour le tableau joueur et les fait piocher 1 par 1
    Begin
     jeux := VerifPioche(jeux,6,i,tbp);
    End;
  end;
  initMain := jeux; //renvoi le jeux avec les donnes de chaque joueurs
End;


(*--------------------------------------------------------
- Fonction         : scoreNordSud
- Auteur           : Guillaume PROTON
- Date de creation : 19/06/2018
-
- But              : renvoie un entier qui représente le score marqué par un joueur en fonction des pièces situées au nord et au sud de la pièce à la position (i,j)
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : renvoie un entier qui représente le score marqué par un joueur en fonction des pièces situées au nord et au sud de la pièce à la position (i,j)
--------------------------------------------------------*)

Function scoreNordSud(jeux:jeu;i,j:integer):integer;
Var
    score:integer;
begin
    score:=0;
    if ((jeux.grille[i,j].forme=jeux.grille[i+1,j].forme) or (jeux.grille[i,j].forme=jeux.grille[i-1,j].forme)) then   // Si les formes sont égales alors c'est une ligne de couleur
    Begin
        if (nbPiecesSud(jeux,i,j)+nbPiecesNord(jeux,i,j)+1=jeux.parametre.nbcouleur) then                     // Si la ligne de couleur est complète alors
        Begin
            score:=score+jeux.parametre.nbcouleur
        End;
    end
    else           // Si ce n'est pas une ligne de couleur alors c'est une ligne de forme
    Begin
        if (nbPiecesSud(jeux,i,j)+nbPiecesNord(jeux,i,j)+1=jeux.parametre.nbforme) then      // Si la ligne de forme est complète
        Begin
            score:=score+jeux.parametre.nbforme
        end;
    end;
    scoreNordSud:=score;
end;

(*--------------------------------------------------------
- Fonction         : scoreEstOuest
- Auteur           : Guillaume PROTON
- Date de creation : 19/06/2018
-
- But              : renvoie un entier qui représente le score marqué par un joueur en fonction des pièces situées à l'est et à l'ouest de la pièce à la position (i,j)
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : renvoie un entier qui représente le score marqué par un joueur en fonction des pièces situées à l'est et à l'ouest de la pièce à la position (i,j)
--------------------------------------------------------*)

Function scoreEstOuest(jeux:jeu;i,j:integer):integer;
Var
    score:integer;
begin
    score:=0;
    if ((jeux.grille[i,j].forme=jeux.grille[i,j+1].forme) or (jeux.grille[i,j].forme=jeux.grille[i,j-1].forme)) then   // Si les formes sont égales alors c'est une ligne de couleur
    Begin
        if (nbPiecesOuest(jeux,i,j)+nbPiecesEst(jeux,i,j)+1=jeux.parametre.nbcouleur) then                     // Si la ligne de couleur est complète alors
        Begin
            score:=score+jeux.parametre.nbcouleur
        End;
    end
    else           // Si ce n'est pas une ligne de couleur alors c'est une ligne de forme
    Begin
        if (nbPiecesEst(jeux,i,j)+nbPiecesOuest(jeux,i,j)+1=jeux.parametre.nbforme) then      // Si la ligne de forme est complète
        Begin
            score:=score+jeux.parametre.nbforme
        end;
    end;
    scoreEstOuest:=score;
end;


(*--------------------------------------------------------
- Fonction         : comptePoint
- Auteur           : Guillaume PROTON
- Date de creation : 19/06/2018
-
- But              : renvoie un entier qui représente le score marqué par un joueur à la fin de son tour
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : renvoie un entier qui représente le score marqué par un joueur à la fin de son tour
--------------------------------------------------------*)

Function comptePoint(jeux:jeu;i,j:integer):integer;
Var
    score, l:integer;
Begin
    score:=scoreNordSud(jeux,i,j)+scoreEstOuest(jeux,i,j);
    for l:=i+nbPiecesSud(jeux,i,j) downto i-nbPiecesNord(jeux,i,j) do
    begin
       Inc(score)
    end;
    for l:=i+nbPiecesEst(jeux,i,j) downto i-nbPiecesOuest(jeux,i,j) do
    begin
        Inc(score)
    end;
    comptePoint:=score;
End;


End.
