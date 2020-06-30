
Unit ARCHART;

Interface
//Parte Publica
uses crt;

Type 
    Artista =   Record
        DNI:   Int64;
        Nombre:   String;
        Direccion:   String;
        Fecha_Nacimiento:   String;
        Activo:   Boolean;
    End;
    Archivo_Artistas =   File Of Artista;

Var 
    Artistas :   Archivo_Artistas;
    //esta es la variable para abrir el archivo.
    Artist :   Artista;
    //esta es la variable del tipo del registro para leer en el archivo.

    //METODOS DE APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
	
Procedure AbrirA(Var Artistas:Archivo_Artistas);
Procedure LeerA(Var Artistas:Archivo_Artistas; Var Reg:Artista; Pos:Integer);
Procedure ModificarA(Var Artistas:Archivo_Artistas; Var Reg:Artista; Pos:Integer
);
Procedure GuardarA(Var Artistas:Archivo_Artistas; Reg:Artista);
Procedure CerrarA(Var Artistas:Archivo_Artistas);

//METODOS DE BUSQUEDA Y ORDENAMIENTO

Procedure burbuja_mejoradoA(Var Artistas:Archivo_Artistas);
Procedure Buscar_Artista(Var Artistas:Archivo_Artistas; Var Pos:int64; Nombre:String; Var art:Artista);

Procedure procesar_archivo(Var Artistas:Archivo_Artistas);
// METODO DE PRUEBAS

Procedure Barrido_Art(Var Artistas:Archivo_Artistas);

Implementation
//Parte Privada

{APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
}

Procedure AbrirA(Var Artistas:Archivo_Artistas);
Begin
    Assign(Artistas,'X:\ARCHART.dat');
    Reset(Artistas);
    If (ioresult <> 0) Then
        Begin
            ReWrite(Artistas);
        End;
End;


Procedure LeerA(Var Artistas:Archivo_Artistas; Var Reg:Artista; Pos:Integer);
//Lee una posicion "Pos" del archivo y lo muestra 
Begin
    seek(Artistas,Pos);
    read(Artistas,Reg);
End;


Procedure ModificarA(Var Artistas:Archivo_Artistas; Var Reg:Artista; Pos:Integer);
Begin
    Seek(Artistas,Pos);
    Write(Artistas,Reg);
End;


Procedure GuardarA(Var Artistas:Archivo_Artistas; Reg:Artista);
Begin
    Seek(Artistas,FileSize(Artistas));
    Write(Artistas,Reg);
End;


Procedure CerrarA(Var Artistas:Archivo_Artistas);
Begin
    Close(Artistas);
End;

{METODOS DE ORDENAMIENTO Y BUSQUEDA
}

Procedure burbuja_mejoradoA(Var Artistas:Archivo_Artistas);
//BURBUJA MEJORADO PARA ARCHIVOS

Var 
    L, i, j :   LongInt;
    RegA, RegB, RegAux :   Artista;

Begin
    AbrirA(Artistas);
    L := FileSize(Artistas);
    For j := 1 To (L-1) Do
        Begin
            //mientras no este ordenado
            For i := 0 To (L-j-1) Do
                Begin
                    //Ciclo de i y el adyascente
                    LeerA (Artistas, RegA, i);
                    //Obtengo los parametros por los cuales quiero ordenar
                    LeerA (Artistas, RegB, i+1);
                    If RegB.Nombre < RegA.Nombre Then
                        Begin
                            RegAux := RegB;
                            ModificarA (Artistas, RegAux, i);
                            ModificarA (Artistas, RegA, i+1);
                        End;
                End;
        End;
    CerrarA(Artistas);
End;

Procedure Buscar_Artista(Var Artistas:Archivo_Artistas; Var pos:int64; Nombre:String; Var art:Artista);
Var 
    posicion :   int64;

Begin
    AbrirA(Artistas);
    // Apertura del Archivo
    Posicion := 0;
    pos := -1;
    While (Not eof ( Artistas)) And (pos=-1) Do
        // Mientras no sea el final del archivo y la variable pos siga siendo -1
        Begin
            LeerA (Artistas, Artist, Posicion);
            // Se lee el registro del archivo que esta en la Posicion...
            If Artist.Nombre = Nombre Then


                // Si el nombre del artista del registro coincide con el Nombre Buscado
                Begin
                    pos := Posicion
                           // se devuelve la posicion del registro en el archivo
                End;
            Inc(Posicion);
        End;
    CerrarA(Artistas);
    // Cierre del Archivo
End;

{METODOS PARA PRUEBAS
* }

Procedure Barrido_Art(Var Artistas:Archivo_Artistas);

Var 
    Punt, Lim :   int64;
    Registro :   Artista;

Begin
    clrscr;
    // borrar!
    AbrirA(Artistas);
    Lim := FileSize(Artistas);
    Punt := 0;
    While (Not eof) And (punt <> Lim) Do
        Begin
            LeerA(Artistas,Registro,Punt);
            If Registro.Activo = True Then
                Begin
                    Writeln(Registro.Nombre);
                    readkey;
                End;
            Punt := (Punt+1);
        End;
    CerrarA(Artistas);
End;


Procedure procesar_archivo(Var Artistas:Archivo_Artistas);
// barrido para estadisticas

Var
    y, puntero :   integer; //variables de control (posicion eje y, y el puntero del archivo)

Begin
    y := 8;
    puntero := 0; // inicio del archivo a tratar
    AbrirA (Artistas); // abrir archivo
    Gotoxy(77,4);
    Writeln (filesize(Artistas));
    While Not eof(Artistas) Do
        Begin
            If (y <= 27) Then // 27 es el tamaño de filas de la tabla
                Begin
                    LeerA (Artistas, Artist, puntero);
                    gotoxy(36,y);
                    Writeln (Artist.Nombre);
                    gotoxy(80,y);
                    inc (y);
                    // posicion en la pantalla
                    inc (puntero);
                    // posicion en el archivo
                End;
        End;
    CerrarA (Artistas);
    burbuja_mejoradoA (Artistas);
    readkey;
End;


Begin
End.
