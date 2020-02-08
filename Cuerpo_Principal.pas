Program Cuerpo_Principal;
Uses  
	crt,MENU;
Var
R:Char;

BEGIN
	Repeat      
	 Menu_Principal();
	 Window (1,1,120,35);
	 TextBackground (Red); {Controla el recuadro ROJO del Cartel de Salida}
	 Gotoxy (41,12); Writeln ('                                    ');
	 Gotoxy (41,13); Writeln ('  '); Gotoxy (75,13); Writeln ('  ');
	 Gotoxy (41,14); Writeln ('  '); Gotoxy (75,14); Writeln ('  ');
	 Gotoxy (41,15); Writeln ('  '); Gotoxy (75,15); Writeln ('  ');
	 Gotoxy (41,16); Writeln ('  '); Gotoxy (75,16); Writeln ('  ');
	 Gotoxy (41,17); Writeln ('  '); Gotoxy (75,17); Writeln ('  ');
	 Gotoxy (41,18); Writeln ('  '); Gotoxy (75,18); Writeln ('  ');
	 Gotoxy (41,19); Writeln ('  '); Gotoxy (75,19); Writeln ('  ');
	 Gotoxy (41,20); Writeln ('  '); Gotoxy (75,20); Writeln ('  ');
	 Gotoxy (41,21); Writeln ('                                    ');
	 
	 TextBackground (Yellow); {Controla el recuadro AMARILLO del Cartel de Salida}
	 Gotoxy (43,13); Writeln ('                                ');
	 Gotoxy (43,14); Writeln ('  '); Gotoxy(73,14); Writeln ('  ');
	 Gotoxy (43,15); Writeln ('  '); Gotoxy(73,15); Writeln ('  ');
	 Gotoxy (43,16); Writeln ('  '); Gotoxy(73,16); Writeln ('  ');
	 Gotoxy (43,17); Writeln ('  '); Gotoxy(73,17); Writeln ('  ');
	 Gotoxy (43,18); Writeln ('  '); Gotoxy(73,18); Writeln ('  ');
	 Gotoxy (43,19); Writeln ('  '); Gotoxy(73,19); Writeln ('  ');
	 Gotoxy (43,20); Writeln ('                                ');
	 
	 TextBackground(Black);
	 TextColor (Red);
	 Gotoxy (45,14); Writeln ('  Desea SALIR del programa? ');
	 Gotoxy (45,15); Writeln ('                            ');
	 Gotoxy (45,16); Writeln ('         0 -> SI            ');
	 Gotoxy (45,17); Writeln ('                            ');
	 Gotoxy (45,18); Writeln ('         1 -> NO            ');
	 Gotoxy (45,19); Writeln ('                            ');
	 Gotoxy (120,30); R:=Readkey;
	Until (R='0') or (R='s') or (R='S');
END.
