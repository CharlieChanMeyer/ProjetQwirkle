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
 {$mode objfpc}
uses SysUtils, UnitType;

Function initJoueur(jeux : jeu): jeu;
Function Max(x1,x2:integer):integer;
Function piochedefault(jeux : jeu):jeu;
Function paramdefault(jeux : jeu):jeu;
Function CountParam():jeu;
Function verify(jeux:jeu ; nb_param : Integer; pc,pf,pt,pj : string):jeu;
Function verify2(jeux_param : modifparam; nb_param,i : Integer; pc,pf,pt,pj : string): modifparam;
Function Modif_Pc(jeux : jeu; i : Integer; pc : string):jeu;
Function Modif_Pf(jeux : jeu; i : Integer; pf : string):jeu;
Function Modif_Pt(jeux : jeu; i : Integer; pt : string):jeu;
Function Modif_Pj(jeux : jeu; i : Integer; pj : string):jeu;
Function param_pioche(jeux : jeu): jeu;
Function verifTaille(jeux : jeu): jeu;

implementation

(*--------------------------------------------------------
- Fonction : initJoueur
- Auteur : ESPIOT Marco
- Date de creation : 22/05/2018
-
- But : Initialisé l'age et le nom du joueur
- Remarques : remarques éventuelles
- Pré conditions : le nombre de joueur doit être initialisé et s'ils sont humain ou non.
- Post conditions : Initialisé l'age et le nom du joueur
--------------------------------------------------------*)
Function initJoueur(jeux : jeu): jeu;

var
   i: integer;
   nbJoueur : integer;
Begin
    nbJoueur := length(jeux.player);
    For i := 0 to nbJoueur-1 do
    Begin
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

(*
--------------------------------------------------------
- Fonction         : Max
- Auteur           : Guillaume Proton
- Date de creation : 11 Juin 2018
-
- But              : Renvoie le maximum entre deux entiers
- Remarques        : Aucune
- Pré conditions   : Aucune
- Post conditions  : Renvoie le maximum entre deux entiers
--------------------------------------------------------*)

Function Max(x1,x2 : integer):integer;
Var
   maximum : integer;
Begin
   if (x1>x2) then
   Begin
      maximum:=x1;
   end
   else
   Begin
      maximum:=x2
   End;
   Max:=maximum;
End;

(*--------------------------------------------------------
- Fonction : Modif_Pj
- Auteur : Charlie Meyer
- Date de creation : 16/06/18 14:14
-
- But : Modifier le nombre de joueur et dit s'ils sont humais ou non
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Modifier le nombre de joueur et dit s'ils sont humais ou non
--------------------------------------------------------*)
Function Modif_Pj(jeux : jeu; i : Integer; pj : string):jeu;
VAR
    param_joueur : string;
    j,n : Integer;
Begin
    param_joueur := Paramstr(i+1);
    n := length(param_joueur);
    setlength(jeux.player,n);
    For j:= 1 to n do
    Begin
        If (param_joueur[j] = 'h') THEN
        Begin
            jeux.player[j-1].humain := TRUE;
        End
        else
        begin
            if (param_joueur[j] = 'o') then
            begin
                jeux.player[j-1].humain := FALSE;
            end
            else
            begin
                writeln('Le paramètre joueur ',param_joueur[j],' n existe pas. Merci de rentrer des paramètres valides !');
                Halt();
            end;
        end;
    End;
    Modif_Pj := jeux;
End;

(*--------------------------------------------------------
- Fonction : Modif_Pt
- Auteur : Charlie Meyer
- Date de creation : 16/06/18 14:05
-
- But : Modifier le nombre de répétition par défault
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Modifier le nombre de répétition par défault
--------------------------------------------------------*)
Function Modif_Pt(jeux : jeu; i : Integer; pt : string): jeu;
Var
    nbp_t : Integer;
Begin
    nbp_t := StrToInt(Paramstr(i+1));
    If ((nbp_t>0) and (nbp_t<11)) THEN
    Begin
        jeux.parametre.repetition:= nbp_t;
    End;
    Modif_Pt := jeux
End;

(*--------------------------------------------------------
- Fonction : Modif_Pf
- Auteur : Charlie Meyer
- Date de creation : 16/06/18 14:05
-
- But : Modifier le nombre de formes par défault
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Modifier le nombre de formes par défault
--------------------------------------------------------*)
Function Modif_Pf(jeux : jeu; i : Integer; pf : string): jeu;
Var
    nbp_f : Integer;
Begin
    nbp_f := StrToInt(Paramstr(i+1));
    If ((nbp_f>0) and (nbp_f<11)) THEN
    Begin
        jeux.parametre.nbforme:= nbp_f;
    End;
    Modif_Pf := jeux
End;

(*--------------------------------------------------------
- Fonction : Modif_Pc
- Auteur : Charlie Meyer
- Date de creation : 16/06/18 14:05
-
- But : Modifier le nombre de couleur par défault
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Modifier le nombre de couleur par défault
--------------------------------------------------------*)
Function Modif_Pc(jeux : jeu; i : Integer; pc : string): jeu;
Var
    nbp_c : Integer;
Begin
    nbp_c := StrToInt(Paramstr(i+1));
    If ((nbp_c>0) and (nbp_c<11)) THEN
    Begin
        jeux.parametre.nbcouleur:= nbp_c;
    End;
    Modif_Pc := jeux
End;

(*--------------------------------------------------------
- Fonction : verify2
- Auteur : Charlie Meyer
- Date de creation : 16/06/18 13:36
-
- But : Vérifier le reste des paramètres rentrés
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Vérifier le reste des paramètres rentrés
--------------------------------------------------------*)
Function verify2(jeux_param : modifparam; nb_param,i : Integer; pc,pf,pt,pj : string): modifparam;
VAR
    modification : Boolean;
Begin
    if (Paramstr(i) = pt) then
    begin
        jeux_param.jeux := Modif_Pt(jeux_param.jeux,i,pt);
        jeux_param.modif := True;
    end
    else
    begin
        if (Paramstr(i) = pj) then
        begin
            jeux_param.jeux := Modif_Pj(jeux_param.jeux,i,pj);
            jeux_param.modif := True;
        end;
    end;
    modification := jeux_param.modif;
    If ((i = nb_param) and (not modification))THEN
    Begin
        writeln('Les paramètres entrés ne sont pas valides. Merci de rentrer des paramètres valides !');
        Halt();
    End;
    verify2 := jeux_param;
End;

(*--------------------------------------------------------
- Fonction : verify
- Auteur : Charlie Meyer
- Date de creation : 16/06/18 11:41
-
- But : Verifier les paramètres rentrer
- Remarques : remarques éventuelles
- Pré conditions : Préconditions
- Post conditions : Verifier les paramètres rentrer
--------------------------------------------------------*)
Function verify(Jeux : jeu ; nb_param : Integer; pc,pf,pt,pj : string): jeu;
Var
    i : Integer;
    jeux_param : modifparam;
Begin
    jeux_param.jeux := jeux;
    jeux_param.modif := False;
    For i := 1 to nb_param do
    Begin
        If (Paramstr(i) = pc) THEN
        Begin
            jeux_param.jeux := Modif_Pc(jeux_param.jeux,i,pc);
            jeux_param.modif := True;
        End
        else
        begin
            if (Paramstr(i) = pf) then
            begin
                jeux_param.jeux := Modif_Pf(jeux_param.jeux,i,pf);
                jeux_param.modif := True;
            end
            else
            begin
                jeux_param := verify2(jeux_param,nb_param,i,pc,pf,pt,pj)
            end;
        end;
    End;
    Jeux := jeux_param.jeux;
    verify := Jeux;
End;

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
- Fonction : param_pioche_forme
- Auteur : Charlie Meyer
- Date de creation : 16/06/18 14:34
-
- But : Paramètre la pioche avec les paramètres entrés
- Remarques : Aucune
- Pré conditions : Aucune
- Post conditions : Paramètre la pioche avec les paramètres entrés
--------------------------------------------------------*)
Function param_pioche(jeux : jeu): jeu;
Var
    i,j,n,valCouleur,nb_couleur,nb_forme,nb_repet,valeurforme,nb_fp: integer;
Begin
    valCouleur:=0;
    nb_couleur := jeux.parametre.nbcouleur;
    nb_forme := jeux.parametre.nbforme;
    nb_repet := jeux.parametre.repetition;
    n :=  nb_forme*nb_couleur * nb_repet;
    setlength(jeux.pioches,n);
    for i:=0 to n-1 do
    Begin
        jeux.pioches[i].couleur:= (valCouleur MOD nb_couleur) +1;
        valCouleur:= valCouleur + 1;
    End;
    i := 0;
    valeurforme := 1;
    nb_fp := nb_couleur*nb_repet;
    while (i<n) do
    begin
        For j := 0 to nb_fp-1 do
        Begin
            jeux.pioches[i+j].forme:= valeurforme;
        End;
        Inc(i,nb_fp);
        Inc(valeurforme,1);
    End;
    param_pioche:=jeux;
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
    pc,pf,pt,pj : string;
    nb_param : Integer;
Begin
    pc := '-c';
    pf := '-f';
    pt := '-t';
    pj := '-j';
    nb_param := ParamCount();
    jeux := paramdefault(jeux);
    IF (nb_param <> 0) THEN
    BEGIN
       jeux := verify(jeux,nb_param,pc,pf,pt,pj);
       if ((jeux.parametre.nbforme <>3) or (jeux.parametre.nbcouleur <> 3) or (jeux.parametre.repetition <> 2)) then
       begin
           jeux := param_pioche(jeux);
       end;
    END;
    CountParam := jeux;
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

End.
