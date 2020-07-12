
Unit ARCHOBR;

Interface
//Parte Publica
uses crt;

Type 
    Obra =   Record
        Nombre:   String;
        Artista:   String;
        Anio:   Integer;
        Descripcion:   String;
        Tipo:   String;
        Material:   String;
        Estilo:   String;
        Altura:   Integer;
        Peso:   Real;
        Completo:   String[2];
        Partes:   Byte;
        Codigo_Obra:   Int64;
        Nombre_Museo:   String;
        Activo:   boolean;
    End;

Archivo_Obras = file Of Obra;

Var 
    Obras:   Archivo_Obras;
    Obr:   Obra;
    Posicion:   Integer;

    //METODOS DE APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
Procedure AbrirO (Var Obras:Archivo_Obras);
Procedure LeerO (Var Obras:Archivo_Obras;Var Obr:Obra; Posicion:Integer);
Procedure ModificarO (Var Obras:Archivo_Obras; Var Obr:Obra; Posicion:Integer);
Procedure GuardarO (Var Obras:Archivo_Obras; Var Obr:Obra);
Procedure CerrarO (Var Obras:Archivo_Obras);

//METODOS DE BUSQUEDA Y ORDENAMIENTO
Procedure burbujaO (Var Obras:Archivo_Obras);
Procedure Buscar_Obra_Codigo (Var Obras:Archivo_Obras;Var pos:int64; Code:int64; Var obr:Obra);
//el archivo solo va desde var hasta_obra
Procedure Buscar_Obra_Nombre (Var Obras:Archivo_Obras;Var pos:int64; Name:String; Var obr:Obra);
//METODO PARA PRUEBAS
Procedure Barrido_Obr(Var Obras:Archivo_Obras);

Procedure Secuencia_Obras(var Obras:Archivo_Obras; Nombre:String; var Contador:Int64); //cuenta las obras de un artista



{Procedure Buscar_Museo_en_Obras (var Obras:Archivo_Obras; buscado:String; var obr:Obra);
Procedure Buscar_Artista_en_Obras (var Obras:Archivo_Obras; buscado:Int64 ;var Obr:Obra; x:Byte; y:Byte);
}

Implementation
//Parte Privada

{APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
}

Procedure AbrirO(Var Obras:Archivo_Obras);
Begin
    Assign(Obras,'X:\ARCHOBR.dat');
    Reset(Obras);
    If (ioresult <> 0) Then
        Begin
            ReWrite(Obras);
        End;
End;

Procedure ModificarO(Var Obras:Archivo_Obras; Var Obr:Obra; Posicion:Integer);
Begin
    Seek(Obras,Posicion);
    Write(Obras,Obr);
End;

Procedure LeerO(Var Obras:Archivo_Obras;Var Obr:Obra; Posicion:Integer);
Begin
    Seek(Obras,Posicion);
    Read(Obras,Obr);
End;

Procedure GuardarO(Var Obras:Archivo_Obras; Var Obr:Obra);
Begin
    Seek(Obras,Filesize(Obras));
    Write(Obras,Obr);
End;

Procedure CerrarO(Var Obras:Archivo_Obras);
Begin
    Close(Obras);
End;


Procedure burbujaO(Var Obras:Archivo_Obras);
//BURBUJA MEJORADO PARA ARCHIVOS
Var 
    L, i, j :   LongInt;
    RegA, RegB, RegAux :   Obra;

Begin
    AbrirO(Obras);
    L := FileSize(Obras);
    For j := 1 To (L-1) Do
        Begin
            //mientras no este ordenado
            For i := 0 To (L-j-1) Do
                Begin
                    //Ciclo de i y el adyascente
                    LeerO (Obras, RegA, i);
                    //Obtengo los parametros por los cuales quiero ordenar
                    LeerO (Obras, RegB, i+1);
                    If RegB.Nombre < RegA.Nombre Then
                        Begin
                            RegAux := RegB;
                            ModificarO (Obras, RegAux, i);
                            ModificarO (Obras, RegA, i+1);
                        End;
                End;
        End;
    CerrarO(Obras);
End;


Procedure Barrido_Obr(Var Obras:Archivo_Obras);

Var 
    Punt, Lim : int64;

Begin
    AbrirO(Obras);
    Lim := FileSize(Obras);
    Punt := 0;
		While (Not eof) And (punt <> Lim) Do
        Begin
            LeerO(Obras, Obr, Punt);
				If (Obr.Activo = True) Then
                Begin
                    Writeln(Obr.Nombre);
                End;
            Punt := (Punt + 1);
        End;
    CerrarO(Obras);
End;


Procedure Buscar_Obra_Codigo (Var Obras:Archivo_Obras; Var pos:int64; Code:int64; Var Obr:Obra); // busqueda para saber si el codigo asignado ya esta en uso
Var 
    posicion:   integer;

Begin
    AbrirO(Obras);
    posicion := 0;
    pos := -1;
    While (Not eof ( Obras)) And (pos=-1) Do
        Begin
            LeerO (Obras,Obr, posicion);
            If (Obr.Codigo_Obra = Code) Then
                Begin
                    pos := posicion
                End;
            inc(posicion);
        End;
    CerrarO(Obras);
End;

Procedure Buscar_Obra_Nombre (Var Obras:Archivo_Obras; Var pos:int64; Name:String; Var Obr:Obra); // busqueda de obra por nombre
Var 
    posicion:   integer;

Begin
    AbrirO(Obras);
    posicion := 0;
    pos := -1;
    While (Not eof ( Obras)) And (pos=-1) Do
        Begin
            LeerO (Obras, Obr, posicion);
            If (Obr.Nombre = Name) Then
                Begin
                    pos := posicion
                End;
            inc(posicion)
        End;
    CerrarO(Obras);
End;





{
Procedure Buscar_Museo_en_Obras(var Obras:Archivo_Obras; buscado:String;var Obr:Obra); // Con este procedure recorro el archivo, para mostrar las Obras que pertenecen a un determinado Museo.
var 
 	posicion:integer;                                                                 //Solo muestra, no devuelve ninguna posicion o dato.

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

Procedure Buscar_Artista_en_Obras(var Obras:Archivo_Obras; buscado:Int64 ;var Obr:Obra; x:Byte; y:Byte); // Con este procedure recorro el archivo Obras, para mostrar los Obras que pertenecen a un determinado Artista.
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

Procedure Secuencia_Obras(var Obras:Archivo_Obras; Nombre:String; var Contador:Int64);
var
	Lim, Punt: int64;
	
Begin
	Contador := 0;
    AbrirO(Obras);
    Lim := FileSize(Obras);
    Punt := 0;
		While (Not eof) And (punt = Lim) Do
        Begin
            LeerO(Obras, Obr, Punt);
				If (Obr.Activo = True) and (Obr.Nombre = Nombre) Then
                Begin
                    Inc(Contador);
                End;
            Punt := (Punt + 1);
        End;
    CerrarO(Obras);
End;


Begin
End.
