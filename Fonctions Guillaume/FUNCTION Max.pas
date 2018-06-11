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
