unit VALIDACIONES;
//{$MODE OBJFPC} necesario para usar el Try

Interface
uses crt,iconos_carteles,sysutils;

Procedure Validacion_Integer(Dato_Str:String; var Dato_Int:Int64; X:Byte; Y:Byte);
Procedure Validacion_Integer2(Dato_Str:String; var Dato_Int:Int64; X:Byte; Y:Byte);
Procedure Validacion_Int_Edicion_Obras (Dato_Str:String; var Dato_Int:Int64);
Implementation

Procedure Validacion_Integer(Dato_Str:String; var Dato_Int:Int64; X:Byte; Y:Byte);
var 
	Code:word;
	Aux:Byte;
	
Begin
Aux:=Length(Dato_Str);
	Repeat
	 Val(Dato_Str,Dato_Int,Code);
		If Code<>0 then
		Begin
		 Dato_Ingresado_Erroneo();
		 Window(X,Y,X+Aux,Y);
		 Clrscr;
		 Window(1,1,120,80);
		 TextColor(Green);
		 Gotoxy(X,Y);
		 Readln(Dato_Str);
		 Aux:=Length(Dato_Str);
		End;
	Until Code=0;
End;

Procedure Validacion_Integer2(Dato_Str:String; var Dato_Int:Int64; X:Byte; Y:Byte);
var 
	Code:word;
	Aux:Byte;
	
Begin
Aux:=Length(Dato_Str);
	Repeat
	 Val(Dato_Str,Dato_Int,Code);
		If Code<>0 then
		Begin
		 Window(X,Y,X+Aux,Y);
		 Clrscr;
		 Window(1,1,120,80);
		 TextColor(Green);
		 Gotoxy(X,Y);
		 Readln(Dato_Str);
		End;
	Until Code=0;
End;

Procedure Validacion_Int_Edicion_Obras (Dato_Str:String; var Dato_Int:Int64); //representa a un error pero por falta de espacio no hay un aviso de ingreso incorrecto!
var 
	Code:word;
	
Begin
	Repeat
	 Val(Dato_Str,Dato_Int,Code);
		If Code<>0 then
		Begin
		 Window(70,17,108,23);
		 Clrscr;
		 TextColor(Green);
		 Gotoxy(70,17);
		 Readln(Dato_Str);
		End;
	Until Code=0;
End;

BEGIN
END.
