Unit ARCHOBR;

Interface //Parte Publica
Uses Crt;

Type
Obra=Record
	 Nombre:String;
	 Artista:String;
	 Anio:Integer;
	 Descripcion:String;
	 Tipo:String;
	 Material:String;
	 Estilo:String;
	 Altura:Integer;
	 Peso:Real;
	 Completo:String[2];
	 Partes:Byte;
	 Codigo_Obra:Int64;
	 Nombre_Museo:String;
	 Activo:boolean;
	 Cantidad_Obras:Int64;
	End;
T_vec_obras=array [1..14] of Obra;	
Archivo_Obras=file of Obra;

Var
Obras:Archivo_Obras;
Obr:Obra;
Posicion:Integer;

Procedure AbrirO (var Obras:Archivo_Obras);
Procedure LeerO (var Obras:Archivo_Obras;var Obr:Obra; Posicion:Integer);
Procedure ModificarO (var Obras:Archivo_Obras; var Obr:Obra; Posicion:Integer);
Procedure GuardarO (var Obras:Archivo_Obras; var Obr:Obra);
Procedure CerrarO (var Obras:Archivo_Obras);
Procedure Cargar_Obra (var Obras:Archivo_Obras;var v:T_vec_obras;var d:integer);
Procedure burbuja_mejorado (var v:T_vec_obras;d:integer);
Procedure Buscar_Obra_Codigo (var Obras:Archivo_Obras;var pos:int64; Code:int64; var obr:Obra);//el archivo solo va desde var hasta_obra
Procedure Buscar_Obra_Nombre (var Obras:Archivo_Obras;var pos:int64; Name:String; var obr:Obra);
{Procedure Buscar_Museo_en_Obras (var Obras:Archivo_Obras; buscado:String; var obr:Obra);
Procedure Buscar_Artista_en_Obras (var Obras:Archivo_Obras; buscado:Int64 ;var Obr:Obra; x:Byte; y:Byte);
}
Implementation //Parte Privada

Procedure AbrirO(Var Obras:Archivo_Obras);
Begin
Assign(Obras,'X:\ARCHOBR.dat');
Reset(Obras);
If (ioresult <> 0) Then
	Begin
	 ReWrite(Obras);
	End;
End;

Procedure ModificarO(var Obras:Archivo_Obras; var Obr:Obra; Posicion:Integer);
Begin
Seek(Obras,Posicion);
Write(Obras,Obr);
End;

Procedure LeerO(var Obras:Archivo_Obras;var Obr:Obra; Posicion:Integer);
Begin
Seek(Obras,Posicion);
Read(Obras,Obr);
End;

Procedure GuardarO(var Obras:Archivo_Obras; var Obr:Obra);
Begin
Seek(Obras,Filesize(Obras));
Write(Obras,Obr);
End;

Procedure CerrarO(Var Obras:Archivo_Obras);
Begin
Close(Obras);
End;

Procedure Cargar_Obra(var Obras:Archivo_Obras;var v:T_vec_obras;var d:integer);
var pos:integer;
Begin
AbrirO (Obras);
pos:=0;
while (not eof (Obras)) do
	begin
	LeerO(Obras ,obr,pos);
	if obr.activo=True then	
		begin
		inc(d);
		v[d].Artista:=obr.Artista;
		v[d].Anio:=obr.Anio;
		v[d].Tipo:=obr.Tipo;
		v[d].Material:=obr.Material;
		v[d].Estilo:=obr.Estilo;
		v[d].Altura:=obr.Altura;
		v[d].Peso:=obr.Peso;
		v[d].Completo:=obr.Completo;
		v[d].Partes:=obr.Partes;
		v[d].Codigo_Obra:=obr.Codigo_Obra;
		v[d].Activo:=obr.Activo
		End;
	inc(pos);
	End;
End;

Procedure burbuja_mejorado(var v:T_vec_obras;d:integer);
var
i:Integer;
obr:Obra;
orden:boolean;
BEGIN
	orden:=false;
	while not(orden)do//mientras no este ordenado 
	begin;
		orden:=true;
		for i:= 1 to d-1 do;
		begin
			if v[i].Codigo_Obra > v[i+1].Codigo_Obra then
			begin
				orden:=false;
				obr:=v[i];
				v[i]:=v[i+1];
				v[i+1]:=obr;
			end;
		end;
	end;
end;

Procedure Buscar_Obra_Codigo (var Obras:Archivo_Obras; var pos:int64; Code:int64; var Obr:Obra);
var
	posicion:integer;
begin
posicion:=0;
pos:=-1;
while (not eof ( Obras)) and (pos=-1) do
	begin
		LeerO (Obras,Obr, posicion);
		if (Obr.Codigo_Obra = Code) then
		begin
			pos:=posicion
		end;
		inc(posicion)
	end;
end;

Procedure Buscar_Obra_Nombre (var Obras:Archivo_Obras; var pos:int64; Name:String; var Obr:Obra);

var
	posicion:integer;

Begin
AbrirO(Obras);
posicion:=0;
pos:=-1;
While (not eof ( Obras)) and (pos=-1) do
	Begin
	 LeerO (Obras, Obr, posicion);
	 If (Obr.Nombre = Name) then
		Begin
		 pos:=posicion
		End;
	 inc(posicion)
	End;
CerrarO(Obras);
End;

{
Procedure Buscar_Museo_en_Obras(var Obras:Archivo_Obras; buscado:String;var Obr:Obra); // Con este procedure recorro el archivo, para mostrar las Obras que pertenecen a un determinado Museo.
var posicion:integer;                                                                 //Solo muestra, no devuelve ninguna posicion o dato.
begin
posicion:=0;
while (not eof ( Obras)) do
	begin
		LeerO (Obras,Obr, posicion);
		if Obr.Nombre_Museo = buscado then
		begin
			Writeln(Obr.Codigo_Obra);//Mostraria por ej enccontrado tal cosa...
		end;
		inc(posicion)
	end;	
End;

Procedure Buscar_Artista_en_Obras(var Obras:Archivo_Obras; buscado:Int64 ;var Obr:Obra; x:Byte; y:Byte);// Con este procedure recorro el archivo Obras, para mostrar los Obras que pertenecen a un determinado Artista.
var 
	posicion,contador:Integer;
const
	a=22;

begin
posicion:=0;
contador:=0;
textcolor(green);
while not eof (Obras) do // controla si se llego al final del archivo
	begin
	 LeerO(Obras,Obr,posicion);
	 if (Obr.Artista = buscado) then // controla la existencia del artista
		begin
		 Gotoxy(36,y);
		 Writeln(Obr.Tipo);
		 Gotoxy(x,y);
		 Writeln(Obr.Codigo_Obra); //muestra el codigo de la obra
		 inc(contador);
		 inc(posicion);
		 inc(y);
		end;
	end;
Gotoxy(63,30);Writeln(contador);
end;

}
Begin
End.
