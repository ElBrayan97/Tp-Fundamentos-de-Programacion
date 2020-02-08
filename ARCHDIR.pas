Unit ARCHDIR;

Interface //Parte Publica
Uses Crt;

Type 
Director=Record
	 APyNom:String;
	 DNI:Int64;
	 Direccion:String;
	 Periodo_Asignacion_Inic:String;
	 Periodo_Asignacion_Fin:String;
	 Telefono:String[20];
	 Activo:boolean;
	End;

T_vec_dir=array [1..6] of Director;	
Archivo_Directores=File of Director;

Var 
Directores:Archivo_Directores;
Direct:Director;
Pos:Integer;

Procedure AbrirD(var Directores:Archivo_Directores);
Procedure LeerD(var Directores:Archivo_Directores; var Direct:Director; Pos:Integer);
Procedure ModificarD(var Directores:Archivo_Directores; var Direct:Director; Pos:Integer);
Procedure GuardarD(var Directores:Archivo_Directores; Direct:Director);
Procedure CerrarD(var Directores:Archivo_Directores);
procedure Cargar_director(var Directores:archivo_Directores; var v:T_vec_dir; var d:integer);
Procedure burbuja_mejorado(var v:T_vec_dir; d:integer);
Procedure Buscar_Director(var Directores:Archivo_Directores; var pos:int64; buscado:String; var Direct:Director);

Implementation //Parte Privada

Procedure AbrirD(Var Directores:Archivo_Directores);
Begin
Assign(Directores,'X:\ARCHDIR.dat');
Reset(Directores);
If (ioresult <> 0) then
	Begin
	 ReWrite(Directores);
	End;
End;

Procedure LeerD(var Directores:Archivo_Directores; var Direct:Director; Pos:Integer);
Begin
 Seek(Directores,Pos);
 Read(Directores,Direct);
End;

Procedure ModificarD(var Directores:Archivo_Directores; var Direct:Director; Pos:Integer);
Begin
seek(Directores,Pos);
Write(Directores,Direct);
End;

Procedure GuardarD(var Directores:Archivo_Directores; Direct:Director);
Begin
seek(Directores,FileSize(Directores));
write(Directores,Direct);
End;

Procedure CerrarD(Var Directores:Archivo_Directores);
Begin
 Close (Directores);
End;

Procedure Cargar_Director(var Directores:Archivo_Directores;var v:T_vec_dir;var d:integer);
var pos:integer;
Begin
AbrirD (Directores);
pos:=0;
while (not eof (Directores)) do
	begin
	LeerD(Directores ,Direct,pos);
	if Direct.activo=True then	
		begin
		inc(d);
		v[d].ApyNom:=Direct.ApyNom;
		v[d].DNI:=Direct.DNI;
		V[d].Direccion:=Direct.Direccion;
		v[d].Periodo_Asignacion_Inic:=Direct.Periodo_Asignacion_Inic;
		v[d].Periodo_Asignacion_Fin:=Direct.Periodo_Asignacion_Fin;
		v[d].Telefono:=Direct.Telefono;
		v[d].Activo:=Direct.Activo;
		End;
	inc(pos);
	End;
End;

Procedure burbuja_mejorado(var v:T_vec_dir;d:integer);
var
i:Integer;
dir:Director;
orden:boolean;
BEGIN
	orden:=false;
	while not(orden)do//mientras no este ordenado 
	begin;
		orden:=true;
		for i:= 1 to d-1 do;
		begin
			if v[i].DNI > v[i+1].DNI then
			begin
				orden:=false;
				dir:=v[i];
				v[i]:=v[i+1];
				v[i+1]:=dir;
			end;
		end;
	end;
end;

Procedure Buscar_Director (var Directores:Archivo_Directores;  var pos:int64;  buscado:String;  var Direct:Director);
var 
	posicion:int64;
	
begin
AbrirD(Directores);
posicion:=0;
pos:=-1;
while (not eof ( Directores)) and (pos=-1) do
	begin
		LeerD (Directores, Direct, posicion);
		If Direct.APyNom=buscado then
		begin
			pos:=posicion;
		end;
		inc(posicion);
	end;	
CerrarD(Directores);
end;

begin
end.
