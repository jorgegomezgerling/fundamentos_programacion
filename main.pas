{
   main.pas
   
   Copyright 2024 jorge <jorge@debian>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}


program main;

uses crt, unitArchivos, SysUtils;

var archivo: t_archivo;
    eleccion, pos, partida, contador, numero: integer;
    segunda_eleccion, tercera_eleccion, cuarta_eleccion: char;
    tecla, opcion: char;
    institucion: t_institucion;
	ascendente: char;
	programa: integer;
begin
	ascendente := 'A';
    // Crear el archivo si no existe y mostrar su contenido
    repeat
		clrscr;
		abrir(archivo);
		writeln();
	
textbackground(Black);	
    clrscr;
    
    // Encabezado del menú
    textColor(Mono);
    writeln('*******************************');
    textcolor(Mono);
    writeln('*            MENU             *');
    textColor(Mono);
    writeln('*******************************');
    
    // Opciones del menú
    TextColor(LightGreen);
    writeln('*  0: Listar Instituciones    *');
    textColor(LightMagenta);
    writeln('*  1: Modificar Institución   *');
    textColor(Yellow);
    writeln('*  2: Agregar Institución     *');
    textColor(LightBlue);
    writeln('*  3: Ordenar Instituciones   *');
    textColor(LightRed);
    writeln('*  4: Listar por Programas    *');
    textColor(LightCyan);
    writeln('*  5: Eliminar Institución    *');
    textColor(Yellow);
    writeln('*  6: Búsqueda Avanzada       *');
    textColor(White);
    writeln('*  7: Salir                   *');
    
    
    textColor(Mono);
    writeln('*******************************');
    writeln();
    textColor(White);

    write('¿Qué desea hacer?: ');
		textcolor(LightGreen);
		readln(eleccion);
		case eleccion of
			0: begin // Listo simplemente todas las Instituciones, podría mejorarse y listar por programas. Pero de momento esto me sirve. No es necesario ordenarlo porque ordeno cada vez que inserto.
				clrscr;
				ordenamiento_burbuja(archivo, ascendente);
				cuarta_eleccion := 'S';
				
				while UpCase(cuarta_eleccion) = 'S' do
					begin
						mostrar_archivo(archivo);
						writeln();
						textcolor(White);
						write('Seleccione el índice de la Institución requerida: ');
						textcolor(LightGreen);
						readln(pos);
						clrscr; // Este es muy optativo; Si se quiere mantener la información en la pantalla o no.
						mostrar_registro(archivo, pos);
						writeln();
						textcolor(White);
			//			writeln('Presione cualquier tecla para continuar...');
				//		readkey;
						textcolor(White);
						write('¿Obtener información adicional de otras Instituciones S/N?: ');
						textcolor(LightGreen);
						readln(cuarta_eleccion);
						clrscr;
					end;
				end;
			1: begin
					clrscr;
					opcion := 'S';
					while UpCase(opcion) <> 'P' do
						begin
							ordenamiento_burbuja(archivo, ascendente);
							clrscr;
							mostrar_archivo(archivo);
							writeln();
							textcolor(White);
							write('Qué Institución desea modificar?: ');
							textcolor(LightGreen);
							readln(pos);
							clrscr; // Para que limpie ni bien selecciono.
							mostrar_registro(archivo, pos);
							modificar_registro(archivo, pos);
							clrscr;
							mostrar_registro(archivo, pos); // Esto comento porque no me esta dando la posibilidad de pasarlo.
							writeln();
							textcolor(Green);
							textbackground(LightGray);
							writeln('*************** Archivo modificado exitosamente ***************');
							writeln();
							textcolor(White);
							textbackground(Black);
							writeln('"M": Seguir modificando la misma Institución');
							writeln('"O" Modificar otra institución');
							writeln('"P" Volver al menú principal');
							readln(opcion);
							while UpCase(opcion) = 'M' do
								begin
									clrscr;
									mostrar_registro(archivo, pos);
									modificar_registro(archivo, pos);
									clrscr;
									mostrar_registro(archivo, pos); // Esto comento porque no me esta dando la posibilidad de pasarlo.
									writeln();
									textcolor(Green);
									textbackground(LightGray);
									writeln('*************** Archivo modificado exitosamente ***************');
									writeln();
									textcolor(White);
									textbackground(Black);
									writeln('"M": Seguir modificando la misma Institución');
									writeln('"O" Modificar otra institución');
									writeln('"P" Volver al menú principal');
									readln(opcion);
									clrscr;
								end;
						end;
						
				end;
			2: begin // La idea acá es agregar la institución y mostrarla ya ordenada. Quizás
				clrscr;
				tecla := 'S';
				ordenamiento_burbuja(archivo, ascendente);
				clrscr;
				while UpCase(tecla) <> 'N' do
					begin
						with institucion do
						begin
							textcolor(White);
							write('Ingrese el numero de la institución: ');
							textcolor(LightGreen);
							readln(numero_institucion);
							
							textcolor(White);
							write('Ingrese el nombre de la institución: ');
							textcolor(LightGreen);
							readln(nombre_institucion);
							
							textcolor(White);							
							write('Ingrese el nombre del directivo a cargo: ');
							textcolor(LightGreen);
							readln(directivo_cargo);
							
							textcolor(White);							
							write('Ingrese la latitud: ');
							textcolor(LightGreen);
							readln(ubicacion.latitud);
							
							textcolor(White);
							write('Ingrese la longitud: ');
							textcolor(LightGreen);
							readln(ubicacion.longitud);
							writeln();
							
							textcolor(White);
							writeln('Programas actuales:');
							writeln();
							writeln('0: CLP');
							writeln('1: RAN');
							writeln('2: PROVINCIA');
							writeln('3: REFRIGERIO');
							writeln('4: PRIMERA INFANCIA');
							writeln('5: ESPACIOS DE CUIDADO');
							writeln('6: CLUBES');
							writeln('7: COMUNITARIOS');
							writeln();
							write('Ingrese el índice del programa correspondiente: ');
							textcolor(LightGreen);
							readln(partida);
						
						case partida of
							0: institucion.programa := CLP;
							1: institucion.programa := RAN;
							2: institucion.programa := PROVINCIA;
							3: institucion.programa := REFRIGERIO;
							4: institucion.programa := PRIMERA_INFANCIA;
							5: institucion.programa := ESPACIOS_DE_CUIDADO;
							6: institucion.programa := CLUBES;
							7: institucion.programa := COMUNITARIOS;
						else
							textcolor(LightRed);
							writeln('Programa inválido.');
						end;
							textcolor(White);
							write('¿Se encuentra activo (S/N)?: ');
							textcolor(LightGreen);
							readln(activo);
						  end;
						 
						writeln();
						textcolor(Yellow);
						writeln('Creando registro...');
						writeln();
						delay(1000);
						textcolor(LightGreen);
						writeln('Registro creado exitosamente.');
						crear_registro(archivo, institucion);
						textcolor(White);
						writeln();
						write('Desea seguir cargando ? S/N: ');
						readln(tecla);
						clrscr;
						if UpCase(tecla) = 'N' then
							cerrar(archivo);
					end;
				end;
			3: begin
				  clrscr;
				  contador := 0;
				  textcolor(White);
				  writeln('Presione "A" para ordenar en forma ascendente "D" para hacerlo en forma descendente.');
				  textcolor(LightGreen);
				  readln(segunda_eleccion);
				  while (UpCase(segunda_eleccion) <> 'A') and (UpCase(segunda_eleccion) <> 'D') and (contador <> 3) do
				  begin
					textcolor(LightRed);
					writeln('Por favor, ingrese una letra válida: ');
					textcolor(LightGreen);
					readln(segunda_eleccion);
					contador := contador + 1;
					//writeln(contador); // Esto lo tenía unicamente para debuggear.
					if contador = 3 then
					begin
					  textcolor(LightRed);
					  textbackground(LightGray);
					  writeln(contador);
					  writeln('Demasiados intentos...');
					  writeln('Redireccionando al menú principal...');
					  readkey;
					end;
				  end;

				  if (contador < 3) and ((UpCase(segunda_eleccion) = 'A') or (UpCase(segunda_eleccion) = 'D')) then
				  begin
					ordenamiento_burbuja(archivo, segunda_eleccion);
					mostrar_archivo(archivo);
					writeln();
					textcolor(White);
					writeln('Presione cualquier tecla para continuar...');
					readkey;
					clrscr;
				  end;
				end;
				
				4: begin
					ordenamiento_burbuja(archivo, ascendente);
					clrscr;
					
					//writeln('Escriba el índice del programa a listar: ');
					
							textcolor(LightRed);
							writeln('Programas actuales:');
							writeln();
							textcolor(White);
							writeln('0: CLP');
							writeln('1: RAN');
							writeln('2: PROVINCIA');
							writeln('3: REFRIGERIO');
							writeln('4: PRIMERA INFANCIA');
							writeln('5: ESPACIOS DE CUIDADO');
							writeln('6: CLUBES');
							writeln('7: COMUNITARIOS');
							writeln();
							textcolor(White);
							write('Ingrese el índice del programa correspondiente: ');
							textcolor(LightGreen);
							readln(programa);
							
							case programa of
								0: listar_por_programa(archivo, CLP);
								1: listar_por_programa(archivo, RAN);
								2: listar_por_programa(archivo, PROVINCIA);
								3: listar_por_programa(archivo, REFRIGERIO);
								4: listar_por_programa(archivo, PRIMERA_INFANCIA);
								5: listar_por_programa(archivo, ESPACIOS_DE_CUIDADO);
								6: listar_por_programa(archivo, CLUBES);
								7: listar_por_programa(archivo, COMUNITARIOS);
						
							end;
						end;

				5: begin
					ordenamiento_burbuja(archivo, ascendente);
					clrscr;
					tercera_eleccion := 'S';
					while UpCase(tercera_eleccion) = 'S' do
						begin
							clrscr;
							mostrar_archivo(archivo);
							writeln();
							textcolor(White);
							write('¿Qué institución desea eliminar?: ');
							textcolor(LightGreen);
							readln(eleccion);
							eliminar_registro(archivo, eleccion);
							textcolor(White);
							writeln();
							write('¿Desea seguir eliminando? S/N: ');
							abrir(archivo);
							readln(tercera_eleccion);
						end;
					end;
				6: begin
						ordenamiento_burbuja(archivo, ascendente);
						clrscr;
						writeln();
						textcolor(White);
						tecla := 'S';

					while UpCase(tecla) <> 'N' do
						begin
						textcolor(White);
						write('Tipee el número de la institución a buscar: ');
						textcolor(LightGreen);
						readln(numero);
						busqueda_binariaprnum(archivo, pos, numero);
						if pos >= 0 then
						  begin
							writeln();
							writeln('Institución encontrada en la posición: ', pos);
							writeln();
							textcolor(LightMagenta);
							writeln('Detalles: ');
							writeln();
							mostrar_registro(archivo, pos);
							writeln();
							textcolor(White);
							write('¿Desea buscar otra institución? S/N: ');
							textcolor(LightGreen);
							readln(tecla);
							writeln();
						  end
						  else
						  begin
							textcolor(LightRed);
							writeln('Institución no encontrada.');
							writeln();
							textcolor(White);
							writeln('¿Desea buscar otra institución? S/N: ');
							textcolor(LightGreen);
							readln(tecla);
						  end;
						 end; 
					//	 readkey;
						 
						
					end;
				7: begin
						ordenamiento_burbuja(archivo, ascendente);
						//clrscr;
						textcolor(Yellow);
						writeln();
						writeln('Saliendo del programa, por favor espera...');
						writeln();
						delay(1000);
						clrscr;
						textcolor(LightGreen);
						writeln('Cerrado con éxito.');
					end;
			else
			writeln('Eleccción inválida.');
		end; 
		//cerrar(archivo);
	until eleccion = 7;
END.

