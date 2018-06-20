(*
------------------------------------------------------------------------------------
-- Fichier           : UnitMarco.pas
-- Auteur            : ESPIOT Marco
-- Date de creation  : 22/05/2018
--
-- But               : Regroupe les fonctions ecrites pas Marco
-- Remarques         : Aucune
-- Compilation       : fpc
-- Edition des liens : fpc
-- Execution         : shell
------------------------------------------------------------------------------------
*)
Unit UnitMarco;
{$mode objfpc}
interface
uses SysUtils,UnitType,UnitParam,UnitAff,Crt;
(*--------------------------------------------------------
- Fonction : initJoueur
- Auteur : ESPIOT Marco
- Date de creation : 22/05/2018
-
- But : initialise les paramètres des différents joueurs
- Remarques : remarques éventuelles
- Pré conditions : avoir mis un nombre de joueurs en argument
- Post conditions : renvoi l'etat du jeux avec les joueurs initialisés
--------------------------------------------------------*)
Function initJoueur(jeux : jeu): jeu;
Function verifTaille(jeux : jeu): jeu;
(*Function verif(dejaPioche : pioche; jeux : jeu; i : integer): Boolean; obsolete*)
Function echangePioche(jeux : jeu; numJoueur : integer): jeu;
Procedure initPosePieces(jeux : jeu; numJoueur : integer);
Function verifPose(piecePosee : pioche): Boolean;
Function formeOuCouleur(piecePosee : pioche; verif : Boolean): Boolean;


implementation

Function initJoueur(jeux : jeu): jeu;

var
   i: integer;
   nbJoueur : integer;
Begin
    nbJoueur := length(jeux.player);
    For i := 0 to nbJoueur-1 do
    Begin
        writeln('Humain : ', jeux.player[i].humain);
        if (jeux.player[i].humain) THEN
        BEGIN
            writeln('Entrez le nom du joueur ',i+1);
            readln(jeux.player[i].nom);
            writeln('Entrez l''age du joueur ',i+1);
            Try
                readln(jeux.player[i].age);
            except
                on e: Exception do error(1);
            end;

        End
        else
        begin
            jeux.player[i].nom := 'Ordinateur';
            jeux.player[i].age := 0;
        end;
    End;
    initJoueur := jeux;
End;

(*--------------------------------------------------------
- Fonction : verifTaille
- Auteur : ESPIOT Marco
- Date de creation : 22/05/2018
-
- But : Augmente la taille de la grille jouable si un joueur arrive au bout de la grille
- Remarques : remarques éventuelles
- Pré conditions : Une tuile est posé sur une des extrémités du tableau
- Post conditions : renvoi l'etat du jeux avec la grille agrandit
--------------------------------------------------------*)
Function verifTaille(jeux : jeu):jeu ;
var
  n: Integer;
Begin
 n :=length(jeux.grille);
 setlength(jeux.grille,n+6,n+6); //ajoute 6 cases sur les 2 dimensions du tableau
 verifTaille := jeux
End;



(*--------------------------------------------------------
- Fonction : verif (obsolète)
- Auteur : ESPIOT Marco
- Date de creation : date
-
- But : vérifie si la case est deja piochée
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : vérifie si la case est deja piochée
--------------------------------------------------------
Function verif(dejaPioche : pioche; jeux : jeu; i : integer): Boolean;
Var
  res : Boolean;
  j : integer;
  Begin
    res := true;
    For j := 0 to i-1 do
      Begin
        If (((dejaPioche[j].forme) = (dejaPioche[i].forme)) and ((dejaPioche[j].forme) = (dejaPioche[i].forme))) then
          res := false;
        End;
       verif := res;
      End;
                    *)

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
  n,nbPieceJoue,milieu,pieceMain : integer;
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
- Fonction : verifPose
- Auteur : ESPIOT Marco
- Date de creation : 12/06/2018
-
- But : vérifier que les pieces choisie peuvent etre posées ensembles
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : renvoi vrai si les pieces peuvent etre combinées et faux sinon
--------------------------------------------------------*)
Function verifPose(piecePosee : pioche): Boolean;
Var
  verif : Boolean;
  i,j : integer;
Begin
  verif := true;
  verif := formeOuCouleur(piecePosee, verif);

  For i := 1 to (length(piecePosee)-1) do //boucle parcourant le tableau contenant les pieces à poser
  Begin
    for j := i to (length(piecePosee)-1) do //boucle qui part de la piece en cours de verification et qui la compare a toute celles d'après
      Begin
       if ((piecePosee[i].forme = piecePosee[j].forme) and (piecePosee[i].couleur = piecePosee[j].couleur)) then //vérifie que les pièces ne soient pas identiques
       verif := false;
      End;
  End;
  verifPose := verif;
End;
 (*--------------------------------------------------------
 - Fonction : formeOuCouleur
 - Auteur : ESPIOT Marco
 - Date de creation : 16/06/2018
 -
 - But : verifier que l'on a ques des pieces de meme couleur ou de meme forme
 - Remarques : remarques éventuelles
 - Pré conditions : Préconditions
 - Post conditions : renvoi true si le but est vérifié, false sinon
 --------------------------------------------------------*)
Function formeOuCouleur(piecePosee : pioche; verif : Boolean): Boolean;
Var
   i : Integer;
Begin
   if (piecePosee[0].forme) <> (piecePosee[1].forme) then //si les 2 premieres pieces ont une forme différente alors
   begin
     For i := 0 to (length(piecePosee)-1) do
     Begin
       if (piecePosee[0].couleur) <> (piecePosee[i].couleur) then //on vérifie que toutes les pièces soit de la meme couleur
       begin
         verif := false; //verif est false si ce n'est pas le cas
       end;
     End;
   end
   else if (piecePosee[0].couleur) <> (piecePosee[1].couleur) then //si les 2 premieres pieces ont une couleur différente alors
   begin
     For i := 0 to (length(piecePosee)-1) do
     Begin
       if (piecePosee[0].forme) <> (piecePosee[i].forme) then //on vérifie que toutes les pièces aient la meme forme
       begin
         verif := false; //verif est false si ce n'est pas le cas
       end;
     End;
   end;
   formeOuCouleur := verif;
End;

End.



(*--------------------------------------------------------
- Fonction : comptePoint
- Auteur : ESPIOT Marco
- Date de creation : date
-
- But : compte les points a la fin du tour
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : compte les points a la fin du tour
--------------------------------------------------------
Function comptePoint(jeux : jeu): jeu;
Begin

End;
End.*)
