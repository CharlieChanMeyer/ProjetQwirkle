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
    param_joueur := Paramstr(i+1);          //Prend les paramètres rentrés en paramètres joueur
    n := length(param_joueur);      //Prend la taille des paramètres rentrés
    setlength(jeux.player,n);           //Définis le nombre de joueur
    For j:= 1 to n do                   //Pour chaque caractère rentrer en paramètre
    Begin
        If (param_joueur[j] = 'h') THEN             //Si le caractère est un h, alors
        Begin
            jeux.player[j-1].humain := TRUE;        //dis que le joueur est un humain
            jeux.player[j-1].points := 0;           //dis que les points du joueur sont à 0
        End
        else                                            //Sinon
        begin
            if (param_joueur[j] = 'o') then                 //Si le caractère est un o
            begin
                jeux.player[j-1].humain := FALSE;           //Dis que c'est une IA
                jeux.player[j-1].points := 0;               //dis que les points du joueur sont à 0
            end
            else                                                    //Sinon
            begin
                writeln('Le paramètre joueur ',param_joueur[j],' n existe pas. Merci de rentrer des paramètres valides !'); //Dis que le caractère rentré n'est pas valide et stop le programme
                Halt();
            end;
        end;
    End;
    Modif_Pj := jeux;               //Retourne le jeux
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
    nbp_t := StrToInt(Paramstr(i+1));        //Prend les paramètres rentrés en paramètres répétition
    If ((nbp_t>0) and (nbp_t<11)) THEN      //Si le nombre est compris entre ]0;11[ alors
    Begin
        jeux.parametre.repetition:= nbp_t;      //Définis le nombre de répétition
    End
    else
    begin
        writeln('Vous avez demandé un trop grand nombre de répétition. Le nombre de répétition maximal est de 10.');
        Halt();             //Dis que le nombre de répétition est trop grand et stop le programme
    end;
    Modif_Pt := jeux            //Retourne le Jeux
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
    nbp_f := StrToInt(Paramstr(i+1));           //Prend les paramètres rentrés en paramètres formes
    If ((nbp_f>0) and (nbp_f<11)) THEN      //Si le paramètre est compris entre 0 et 11 exclus, alors
    Begin
        jeux.parametre.nbforme:= nbp_f;         // Définis le nombre de formes
    End
    else            //Sinon
    begin
        writeln('Vous avez demandé un trop grand nombre de formes. Le nombre de forme maximal est de 10.');
        Halt();     //Dis que le nombre de forme demandé est trop grand et quitte le programme
    end;
    Modif_Pf := jeux        //Retourne le jeux
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
    nbp_c := StrToInt(Paramstr(i+1));       //Prend les paramètres rentrés en paramètre couleur
    If ((nbp_c>0) and (nbp_c<11)) THEN          //Si la couleur est comprise entre 0 et 11 exclus, alors
    Begin
        jeux.parametre.nbcouleur:= nbp_c;           //Définis le nombre de couleurs
    End
    else            //sinon
    begin
        writeln('Vous avez demandé un trop grand nombre de couleurs. Le nombre de couleurs maximal est de 10.');
        Halt();         //Dis que le nombre de couleur demandé est trop grand et quitte le programme
    end;
    Modif_Pc := jeux        //Retourne le jeux
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
Begin
    if (Paramstr(i) = pt) then              //Si le paramètre i est l'appel paramètre répétition alors
    begin
        jeux_param.jeux := Modif_Pt(jeux_param.jeux,i,pt);      //lance la fonction de modification de ce paramètres
        jeux_param.modif := True;                   //Dis qu'il y a bien eu une modification des paramètres
    end
    else
    begin
        if (Paramstr(i) = pj) then              //Si le paramètre i est l'appel paramètre joueur alors
        begin
            jeux_param.jeux := Modif_Pj(jeux_param.jeux,i,pj);      //lance la fonction de modification de ce paramètres
            jeux_param.modif := True;                               //Dis qu'il y a bien eu une modification des paramètres
        end;
    end;
    If ((i = nb_param) and (not jeux_param.modif))THEN          //Si tous les paramètres entrés ont été parcourues et que le jeux n'a pas été modifié
    Begin
        writeln('Les paramètres entrés ne sont pas valides. Merci de rentrer des paramètres valides !');
        Halt();     //Dis que les paramètres ne sont pas valides et stop le programme
    End;
    verify2 := jeux_param;      //Retourne le jeux
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
    jeux_param.jeux := jeux;            //Prend le jeux
    jeux_param.modif := False;          //Dis que le jeux n'a pas subit de modification
    For i := 1 to nb_param do           //Pour chaque paramètre rentré
    Begin
        If (Paramstr(i) = pc) THEN          //Si le paramètre i est l'appel paramètre couleur, alors
        Begin
            jeux_param.jeux := Modif_Pc(jeux_param.jeux,i,pc);          //Lance la fonction de modification de ce paramètre
            jeux_param.modif := True;                                  //Dis qu'il y a bien eu une modification des paramètres
        End
        else                    //Sinon
        begin
            if (Paramstr(i) = pf) then                      //Si le paramètre i est l'appel paramètre forme
            begin
                jeux_param.jeux := Modif_Pf(jeux_param.jeux,i,pf);          //Lance la fonction de modification de ce paramètre
                jeux_param.modif := True;                       //Dis qu'il y a bien eu une modification des paramètres.
            end
            else            //Sinon
            begin
                jeux_param := verify2(jeux_param,nb_param,i,pc,pf,pt,pj) //Lance la deuxième partie de la vérification des paramètres
            end;
        end;
    End;
    Jeux := jeux_param.jeux; //Prend le Jeux
    verify := Jeux;         //Retourne le Jeux
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
    valCouleur:=0;          //Prend 0 Pour valeur couleur temporaire
    setlength(jeux.pioches,18);             //Définis la taille de la pioche à 18
    for i:=0 to 17 do               //Pour chaque case de la pioche
    Begin
        jeux.pioches[i].couleur:= (valCouleur MOD 3) +1;       //Définis la couleur
        valCouleur:= valCouleur + 1;                            //Rajoute 1 à la couleur temporaire
    End;
   for i:=0 to 5 do                     //Pour chaque groupe de 6 pièce
   Begin
      jeux.pioches[i].forme:=1;         //Donne la forme 1 aux 6 premières pièces
      jeux.pioches[i+6].forme:=2;         //Donne la forme 1 aux 6 pièces suivantes
      jeux.pioches[i+12].forme:=3         //Donne la forme 1 aux 6 dernières pièces
   End;
    piochedefault:=jeux;        //Retourne le jeux avec la pioche définie
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
    valCouleur:=0;              //Dis que la couleur temporaire est à 0
    nb_couleur := jeux.parametre.nbcouleur;         //Prend le nombre de couleur
    nb_forme := jeux.parametre.nbforme;             //Prend le nombre de forme
    nb_repet := jeux.parametre.repetition;          //Prend le nombre de répétition
    n :=  nb_forme*nb_couleur * nb_repet;           //Calcul le nombre de pièces de la pioche
    setlength(jeux.pioches,n);                  //Donne sa taille à la pioche
    for i:=0 to n-1 do                      //Pour chaque case de la pioche
    Begin
        jeux.pioches[i].couleur:= (valCouleur MOD nb_couleur) +1;       //Définis la couleur
        valCouleur:= valCouleur + 1;                        //Incrémente la couleur temporaire de 1
    End;
    i := 0;             //Replace i à 0
    valeurforme := 1;           //Donne la valeur 1 à la forme temporaire
    nb_fp := nb_couleur*nb_repet;       //Calcul le nombre de pièce ayant la même forme
    while (i<n) do          //Tant que i ne sort pas de la pioche
    begin
        For j := 0 to nb_fp-1 do            //Pour chaque gorupe de pièce
        Begin
            jeux.pioches[i+j].forme:= valeurforme;      //donne la forme temporaire
        End;
        Inc(i,nb_fp);   //Incrémente i du nombre de pièce d'un groupe de pièces
        Inc(valeurforme,1);     //Incrémente la forme temporaire de 1
    End;
    param_pioche:=jeux;     //Retourne le jeux avec la pioche initialisé
End;

(*--------------------------------------------------------
- Fonction : paramdefault
- Auteur : Charlie Meyer
- Date de creation : 28 Mai 2018
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
    jeux.parametre.nbforme := 3;        //Définis le nombre de forme par défault sur 3
    jeux.parametre.nbcouleur := 3;      //Définis le nombre de couleur par défault sur 3
    jeux.parametre.repetition := 2;     //Définis le nombre de répétition par défault sur 2
    setlength(jeux.player,2);           //Définis le nombre de joueur sur 2
    jeux.player[0].humain := True;      //Dis que les deux joueurs sont humains
    jeux.player[1].humain := True;
    jeux.player[0].points := 0;         //dis que les points des joueur sont à 0
    jeux.player[1].points := 0;
    setlength(jeux.grille,25,25);       //Définis la grille par défault
    For i:=0 to 24 do
    Begin                               //Pour chaque case de la grille, place une pièce vide
        For j:=0 to 24 do
        Begin
            jeux.grille[i,j].forme := 0;
            jeux.grille[i,j].couleur := 0;
        End;
    End;
    jeux:=piochedefault(jeux);          //Initialise la pioche par défault
    paramdefault := jeux;       //Retourne le jeux initialisé
End;

(*
--------------------------------------------------------
- Procedure : CountParam
- Auteur : Charlie Meyer
- Date de creation : 28 Mai 2018
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
    pc := '-c';     //Définis l'appel de paramètre couleur sur -c
    pf := '-f';     //Définis l'appel de paramètre forme sur -f
    pt := '-t';     //Définis l'appel de paramètre répétition sur -t
    pj := '-j';     //Définis l'appel de paramètre joueur sur -j
    nb_param := ParamCount();       //Compte le nombre de paramètre entré
    jeux := paramdefault(jeux);     //Définis le jeux par défault
    IF (nb_param > 1) THEN          //Si le nombre de paramètre est supérieur à 1 (1 étant seulement un appel sans valeur rentrée)
    BEGIN
       jeux := verify(jeux,nb_param,pc,pf,pt,pj);               //Lance la vérification des paramètres entrés
       if ((jeux.parametre.nbforme <>3) or (jeux.parametre.nbcouleur <> 3) or (jeux.parametre.repetition <> 2)) then //Si un paramètre autre que celui des joueur est modifié
       begin
           jeux := param_pioche(jeux); //Ré-initialise la pioche
       end;
    END;
    CountParam := jeux; //Retourne le jeux initialisé
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
 n :=length(jeux.grille);       //Prend la taille de la grille
 setlength(jeux.grille,n+6,n+6); //ajoute 6 cases sur les 2 dimensions du tableau
 verifTaille := jeux        //Retourne le jeux
End;

End.
