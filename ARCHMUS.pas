Unit ARCHMUS;

Interface //Parte Publica
Uses Crt;
	
Type
Museo=Record
	 Codigo, Telefono : Int64;
	 Nombre, Calle, Ciudad, Pais, Name_Director : String;
	 Activo : Boolean;
	End;
T_vec_mus=array [1..9] of Museo;
Archivo_Museos = File of Museo;
Var
	Museos:Archivo_Museos;
	Mus:Museo;
Procedure AbrirM( var Museos:Archivo_Museos);
Procedure LeerM (var Museos:Archivo_Museos; var Mus:Museo; Pos:Integer);
Procedure ModificarM (var Museos:Archivo_Museos; var Mus:Museo; Pos:integer);
Procedure GuardarM (Var Museos:Archivo_Museos; Var Mus:Museo);
Procedure CerrarM (var Museos:Archivo_Museos);
Procedure Cargar_Museos (var Museos:Archivo_Museos;var v:T_vec_mus;var d:integer);
Procedure burbuja_mejorado (var v:T_vec_mus;d:integer);
Procedure Buscar_Museo_Codigo (var Museos:Archivo_Museos; var pos:int64; codigo_buscado:int64; var Mus:Museo);
Procedure Buscar_Museo_Nombre (var Museos:Archivo_Museos;var pos:int64; Nombre:String; var Mus:Museo);
Implementation //Parte Privada

Procedure AbrirM(var Museos : Archivo_Museos);
Begin
Assign(Museos,'X:\ARCHMUS.dat');
Reset(Museos);
If (ioresult <> 0) then
	Begin
	 Rewrite(Museos);
	End;
End;

Procedure LeerM(var Museos:Archivo_Museos; var Mus:Museo; Pos:Integer);
Begin
Seek(Museos,Pos);
Read(Museos,Mus);
End;

Procedure ModificarM(var Museos:Archivo_Museos; var Mus:Museo; Pos:Integer);
Begin
Seek(Museos,Pos);
Write(Museos,Mus);
End;

Procedure GuardarM (Var Museos:Archivo_Museos; Var Mus:Museo);
Begin
Seek(Museos,Filesize(Museos));
Write(Museos,Mus);
End;

Procedure CerrarM (Var Museos:Archivo_Museos);
Begin
	Close(Museos);
End;

Procedure Cargar_Museos(var Museos:Archivo_Museos;var v:T_vec_mus;var d:integer);
var 
	pos:integer;
	
Begin
AbrirM (Museos);
pos:=0;
while (not eof (Museos)) do
	begin
	LeerM(Museos ,Mus,pos);
	if Mus.activo=True then	
		begin
		inc(d);
		v[d].Codigo:=Mus.Codigo;
		v[d].Name_Director:=Mus.Name_Director;
		V[d].Telefono:=Mus.Telefono;
		v[d].Ciudad:=Mus.Ciudad;
		v[d].Calle:=Mus.Calle;
		v[d].Pais:=Mus.Pais;
		v[d].Nombre:=Mus.Nombre;
		v[d].Activo:=Mus.Activo;
		End;
	inc(pos);
	End;
End;

Procedure burbuja_mejorado(var v:T_vec_mus;d:integer);
var
	i:Integer;
	Muss:Museo;
	orden:boolean;

BEGIN
orden:=false;
	while not(orden)do//mientras no este ordenado 
	begin;
		orden:=true;
		for i:= 1 to d-1 do;
		begin
			if v[i].Codigo > v[i+1].Codigo then
			begin
				orden:=false;
				Muss:=v[i];
				v[i]:=v[i+1];
				v[i+1]:=Muss;
			end;
		end;
	end;
END;

Procedure Buscar_Museo_Codigo(var Museos:Archivo_Museos;var pos:int64; codigo_buscado:int64; var Mus:Museo);
var 
	posicion:int64;

Begin
AbrirM(Museos); // Apertura del Archivo de Museos
posicion:=0;
pos:=-1;
While (not eof (Museos)) and (pos=-1) do
	Begin
		LeerM (Museos, Mus, posicion);
		if (Mus.Codigo = codigo_buscado) then
		Begin
			pos:=posicion;
		End;
		inc(posicion);
	End;
CerrarM(Museos); // Cierre del Archivo de Museos
End;

Procedure Buscar_Museo_Nombre(var Museos:Archivo_Museos; var pos:int64; Nombre:String; var Mus:Museo);
var
	posicion : int64;

Begin
AbrirM(Museos); // Apertura del Archivo de Museos
posicion := 0;
pos := -1;
While (not eof (Museos)) and (pos = -1) do
	Begin
	 LeerM(Museos, Mus, posicion);
	 If (Mus.Nombre = Nombre)then
		Begin
		 pos := posicion;
		End;
	 inc(posicion);
	End;
CerrarM(Museos); // Cierre del Archivo de Museos
End;

begin
end.
