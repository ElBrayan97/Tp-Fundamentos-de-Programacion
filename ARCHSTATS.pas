Unit ARCHSTATS;

{ Notas del Algoritmo
 Deje mas anotaciones en el libro de practica de Calculo (el de tapa rayada verde y que en la primera hoja tiene sticks de notas) 
 la idea de como funciona eeste archivo esta masomenos planteada en la ultima hoja de ese cuadrnillo}


Interface //Parte Publica
Uses Crt;
	
Const
	N=200; // hay casi 200 paises, un par mas no hara daño :P
Type
Estadistica=Record
	 cant_museos, cant_artistas, cant_obras, museosxpais :Integer; //cantidades de entidades/personas/objetos
	 pais:string;
	 Activo:Boolean;
	End;
	
vec_estadistica=array [1..N] of Estadistica;
Archivo_Estadisticas = File of Estadistica;

Var
Arch_Stats:Archivo_Estadisticas;
Stat:Estadistica;

Procedure AbrirStat(var Arch_Stats:Archivo_Estadisticas);
Procedure LeerStat(var Arch_Stats:Archivo_Estadisticas; var Stat:Estadistica; Pos:Integer);
Procedure ModificarStat(var Arch_Stats:Archivo_Estadisticas; var Stat:Estadistica; Pos:Integer);
Procedure GuardarStat(var Arch_Stats:Archivo_Estadisticas; var Stat:Estadistica);
Procedure CerrarStat(var Arch_Stats:Archivo_Estadisticas);
Procedure Cargar_Stats(var Arch_Stats:Archivo_Estadisticas; var V:vec_estadistica; var d:integer);

{}

Procedure Buscar_Stat_cant_museos(var Arch_Stats:Archivo_Estadisticas; var pos:integer; buscado:integer; var Stat:Estadistica);
Procedure Buscar_Stat_cant_obras(var Arch_Stats:Archivo_Estadisticas; var pos:integer; buscado:integer; var Stat:Estadistica);
Procedure Buscar_Stat_cant_artistas(var Arch_Stats:Archivo_Estadisticas; var pos:integer; buscado:integer; var Stat:Estadistica);
Procedure Buscar_Stat_pais(var Arch_Stats:Archivo_Estadisticas; var pos:integer; buscado:String; var Stat:Estadistica);

{}

Implementation //Parte Privada

Procedure AbrirStat(var Arch_Stats:Archivo_Estadisticas);
Begin
Assign(Arch_Stats,'X:\ARCHSTATS.dat');
Reset(Arch_Stats);
If (ioresult <> 0) then
	Begin
	 Rewrite(Arch_Stats);
	End;
End;


Procedure LeerStat(var Arch_Stats:Archivo_Estadisticas; var Stat:Estadistica; Pos:Integer);
Begin
Seek(Arch_Stats,Pos);
Read(Arch_Stats,Stat);
End;


Procedure ModificarStat(var Arch_Stats:Archivo_Estadisticas; var Stat:Estadistica; Pos:Integer);
Begin
Seek(Arch_Stats,Pos);
Write(Arch_Stats,Stat);
End;


Procedure GuardarStat(Var Arch_Stats:Archivo_Estadisticas; Var Stat:Estadistica);
Begin
Seek(Arch_Stats,Filesize(Arch_Stats));
Write(Arch_Stats,Stat);
End;


Procedure CerrarStat(Var Arch_Stats:Archivo_Estadisticas);
Begin
	Close(Arch_Stats);
End;


Procedure Cargar_Stats(var Arch_Stats:Archivo_Estadisticas;var V:vec_estadistica;var d:integer);
var 
	pos:integer;
	
Begin
AbrirStat(Arch_Stats);
pos:=0;
while (not eof (Arch_Stats)) do
	begin
	 LeerStat(Arch_Stats,Stat,pos);
	 if Stat.activo=True then	
		begin
		 inc(d);
		 V[d].cant_museos:=Stat.cant_museos;
		 V[d].cant_obras:=Stat.cant_obras;
		 V[d].cant_artistas:=Stat.cant_artistas;
		 V[d].pais:=Stat.pais;
		 V[d].museosxpais:=Stat.museosxpais;
		 V[d].Activo:=Stat.Activo;
		End;
	 inc(pos);
	End;
End;


Procedure Buscar_Stat_cant_museos(var Arch_Stats:Archivo_Estadisticas; var pos:integer; buscado:integer; var Stat:Estadistica);
var 
	posicion:integer;

begin
posicion:=0;
pos:=-1;
while (not eof (Arch_Stats)) and (pos=-1) do
	begin
	 LeerStat(Arch_Stats, Stat, posicion);
	 if Stat.cant_museos=buscado then
		begin
		 pos:=posicion
		end;
	 inc(posicion)
	end;	
end;		


Procedure Buscar_Stat_cant_obras(var Arch_Stats:Archivo_Estadisticas; var pos:integer; buscado:integer; var Stat:Estadistica);
var 
	posicion:integer;

begin
posicion:=0;
pos:=-1;
while (not eof (Arch_Stats)) and (pos=-1) do
	begin
	 LeerStat(Arch_Stats, Stat, posicion);
	 if Stat.cant_museos=buscado then
		begin
		 pos:=posicion
		end;
	 inc(posicion)
	end;	
end;	


Procedure Buscar_Stat_cant_artistas(var Arch_Stats:Archivo_Estadisticas; var pos:integer; buscado:integer; var Stat:Estadistica);
var 
	posicion:integer;

begin
posicion:=0;
pos:=-1;
while (not eof (Arch_Stats)) and (pos=-1) do
	begin
	 LeerStat(Arch_Stats, Stat, posicion);
	 if Stat.cant_museos=buscado then
		begin
		 pos:=posicion
		end;
	 inc(posicion)
	end;	
end;	


Procedure Buscar_Stat_pais(var Arch_Stats:Archivo_Estadisticas; var pos:integer; buscado:string; var Stat:Estadistica);
var 
	posicion:integer;

begin
posicion:=0;
pos:=-1;
while (not eof (Arch_Stats)) and (pos=-1) do
	begin
	 LeerStat(Arch_Stats, Stat, posicion);
	 if Stat.pais=buscado then
		begin
		 pos:=posicion
		end;
	 inc(posicion)
	end;	
end;


begin
end.
