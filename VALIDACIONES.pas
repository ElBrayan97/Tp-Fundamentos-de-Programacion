unit VALIDACIONES;
//{$MODE OBJFPC} necesario para usar el Try

Interface
uses crt,iconos_carteles,sysutils;

//Procedure Validacion_Integer (var Dato_Str:String; Var Dato_Int:LongInt; X:Byte; Y:Byte);
Procedure Validacion_Integer(Dato_Str:String; var Dato_Int:LongInt; X:Byte; Y:Byte);
Procedure Validacion_Integer2(Dato_Str:String; var Dato_Int:LongInt; X:Byte; Y:Byte);

Implementation
{Procedure Validacion_Integer (var Dato_Str:String; Var Dato_Int:LongInt; X:Byte; Y:Byte);//Verifica si el dato ingresado es un numero!
Var
	Aux:Byte;
BEGIN
Dato_Int:=0;
	Repeat
	 Aux:=Length(Dato_Str);
		Try
		 Dato_Int:=StrtoInt(Dato_Str);
		except
		 on EConvertError DO 
			Begin
			 Dato_Ingresado_Erroneo(X,Y,Aux);
			 TextColor(Green);
			 Gotoxy(X,Y);
			 Readln(Dato_Str);
			End;
		End;
	Until (Dato_Int <> 0);
Exit;
End;}

Procedure Validacion_Integer(Dato_Str:String; var Dato_Int:LongInt; X:Byte; Y:Byte);
var 
Code:word;
Aux:Byte;

Begin
Aux:=Length(Dato_Str);
	Repeat
	 Val(Dato_Str,Dato_Int,Code);
		If Code<>0 then
		Begin
		 Dato_Ingresado_Erroneo(X,Y);
		 Window(X,Y,X+Aux,Y);
		 Clrscr;
		 Window(1,1,120,80);
		 TextColor(Green);
		 Gotoxy(X,Y);
		 Readln(Dato_Str);
		End;
	Until Code=0;
End;

Procedure Validacion_Integer2(Dato_Str:String; var Dato_Int:LongInt; X:Byte; Y:Byte);
var 
Code:word;
Aux:Byte;

Begin
Aux:=Length(Dato_Str);
	Repeat
	 Val(Dato_Str,Dato_Int,Code);
		If Code<>0 then
		Begin
		 Dato_Ingresado_Erroneo(X,Y);
		 Window(X,Y,X+Aux,Y);
		 Clrscr;
		 Window(1,1,120,80);
		 TextColor(Green);
		 Gotoxy(X,Y);
		 Readln(Dato_Str);
		End;
	Until Code=0;
End;

BEGIN
END.
