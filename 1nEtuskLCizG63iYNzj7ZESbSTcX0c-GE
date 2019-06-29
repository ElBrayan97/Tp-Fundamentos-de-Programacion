unit VALIDACIONES;
{$MODE OBJFPC}

Interface
uses crt,iconos_carteles,sysutils;

Procedure Validacion_Integer (var Dato_Str:String; Var Dato_Int:LongInt; X:Byte; Y:Byte);

Implementation
Procedure Validacion_Integer (var Dato_Str:String; Var Dato_Int:LongInt; X:Byte; Y:Byte);//Verifica si el dato ingresado es un numero!
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
End;

BEGIN
END.
