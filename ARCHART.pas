Unit ARCHART;

Interface //Parte Publica
Uses Crt;

Type 
Artista=Record
	 DNI:Int64;
	 Nombre:String;
	 Direccion:String;
	 Fecha_Nacimiento:String;
	 Activo:Boolean;
	End;
T_vec_art=array [1..5] of Artista;
Archivo_Artistas=File of Artista;

Var
Artistas:Archivo_Artistas;//esta es la variable para abrir el archivo.
Artist:Artista;//esta es la variable del tipo del registro para leer en el archivo.

Procedure AbrirA(var Artistas:Archivo_Artistas);
Procedure LeerA(var Artistas:Archivo_Artistas; var Reg:Artista; Pos:Integer);
Procedure ModificarA(var Artistas:Archivo_Artistas; var Reg:Artista; Pos:Integer);
Procedure GuardarA(var Artistas:Archivo_Artistas; Reg:Artista);
Procedure CerrarA(var Artistas:Archivo_Artistas);
Procedure Cargar_Artista(var Artistas:Archivo_Artistas;var v:T_vec_art;var d:integer);
Procedure burbuja_mejorado(var v:T_vec_art;d:integer);
Procedure Buscar_Artista(var Artistas:Archivo_Artistas; var Pos:integer; buscado:Int64; var art:Artista);


Implementation //Parte Privada

Procedure AbrirA(Var Artistas:Archivo_Artistas);
Begin
Assign(Artistas,'X:\ARCHART.dat');
Reset(Artistas);
If (IOResult <> 0) then
	Begin
	 ReWrite(Artistas);
	End;
End;

Procedure LeerA(var Artistas:Archivo_Artistas; var Reg:Artista; Pos:Integer); //Lee una posicion "Pos" del archivo y lo muestra 
Begin
 seek(Artistas,Pos);
 read(Artistas,Reg);
End;

Procedure ModificarA(var Artistas:Archivo_Artistas; var Reg:Artista; Pos:Integer);
Begin
Seek(Artistas,Pos);
Write(Artistas,Reg);
End;

Procedure GuardarA(var Artistas:Archivo_Artistas; Reg:Artista);
Begin
Seek(Artistas,FileSize(Artistas));
Write(Artistas,Reg);
End;

Procedure CerrarA(var Artistas:Archivo_Artistas);
Begin
Close(Artistas);
End;

Procedure Cargar_Artista(var Artistas:Archivo_Artistas;var v:T_vec_art;var d:integer);//"d" es el limie que indica el numero de elementos en el vector.
var pos:integer;
Begin
AbrirA(Artistas);
pos:=0;
while (not eof (Artistas)) do
	begin
	LeerA(Artistas ,Artist,pos);
	if Artist.activo=True then	
		begin
		inc(d);
		v[d].DNI:=Artist.DNI;
		v[d].Nombre:=Artist.Nombre;
		V[d].Direccion:=Artist.Direccion;
		v[d].Fecha_Nacimiento:=Artist.Fecha_Nacimiento;
		v[d].Activo:=Artist.Activo;
		End;
	inc(pos);
	End;
End;

Procedure burbuja_mejorado(var v:T_vec_art;d:integer);
var
i:Integer;
art:Artista;
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
				art:=v[i];
				v[i]:=v[i+1];
				v[i+1]:=art;
			end;
		end;
	end;
end;

Procedure Buscar_Artista(var Artistas:Archivo_Artistas; var pos:integer; buscado:Int64; var art:Artista);
var 
	posicion:integer;

Begin
Posicion:=0;
Pos:=-1;
while (not eof ( Artistas)) and (pos=-1) do
	begin
		LeerA (Artistas, Artist, Posicion);
		if Artist.DNI=buscado then
		begin
			Pos:=Posicion
		end;
		Inc(Posicion)
	end;	
end;		

BEGIN
END.
