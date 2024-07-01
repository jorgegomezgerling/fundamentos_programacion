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
    eleccion, pos, partida: integer;
    segunda_eleccion, tercera_eleccion, cuarta_eleccion: char;
    tecla: char;
    institucion: t_institucion;
	ascendente: char;
begin
	ascendente := 'A';
    // Crear el archivo si no existe y mostrar su contenido
    repeat
		clrscr;
		abrir(archivo);
		writeln();
		writeln('--------------- MENU ---------------');
		writeln();
		writeln('0: Listar Instituciones');
		writeln('1: Modificar Institución');
		writeln('2: Agregar Institución');
		writeln('3: Ordenar Instituciones');
		writeln('4: Buscar Institución');
		writeln('5: Eliminar Institución');
		writeln('6: Salir.');
		writeln();
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
						writeln('¿Qué Institucion desea saber en detalle?: ');
						readln(pos);
						clrscr; // Este es muy optativo; Si se quiere mantener la información en la pantalla o no.
						mostrar_registro(archivo, pos);
						writeln();
						writeln('Presione cualquier tecla para continuar...');
						readkey;
						clrscr;
						writeln('¿Desea seguir obteniendo información adicional de otras Instituciones: S/N?');
						readln(cuarta_eleccion);
						clrscr;
					end;
				end;
			2: begin // La idea acá es agregar la institución y mostrarla ya ordenada. Quizás
				clrscr;
				tecla := 'S';
				while UpCase(tecla) <> 'N' do
					begin
						with institucion do
						begin
							write('Ingrese el numero de la institución: ');
							readln(numero_institucion);
							
							write('Ingrese el nombre de la institución: ');
							readln(nombre_institucion);
							
							write('Ingrese el nombre del directivo a cargo: ');
							readln(directivo_cargo);
							
							write('Ingrese la latitud: ');
							readln(ubicacion.latitud);
							write('Ingrese la longitud: ');
							readln(ubicacion.longitud);
							
							writeln('Programa:');
							writeln();
							writeln('0: CLP');
							writeln('1: RAN');
							writeln('2: PROVINCIA');
							writeln('3: REFRIGERIO');
							writeln('4: PRIMERA INFANCIA');
							writeln('5: ESPACIOS DE CUIDADO');
							writeln('6: CLUBES');
							writeln('7: COMUNITARIOS');
							
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
							writeln('Programa inválido.');
						end;
																			
							write('¿Está activo? (S/N): ');
							readln(activo);
						  end;
						  
						writeln('Creando registro...');
						writeln();
						crear_registro(archivo, institucion);
						writeln('Desea seguir cargando ? S/N: ');
						readln(tecla);
						clrscr;
						if UpCase(tecla) = 'N' then
							cerrar(archivo);
					end;
				end;
				3: begin
						clrscr;
						writeln('Presione "A" para ordenar en forma ascendente "D" para hacerlo en forma descendente.');
						readln(segunda_eleccion);
						ordenamiento_burbuja(archivo, segunda_eleccion);
						mostrar_archivo(archivo);
						writeln();
						writeln('Presione cualquier tecla para continuar...');
						readkey;
						clrscr;
					end;
				5: begin
					tercera_eleccion := 'S';
					while UpCase(tercera_eleccion) = 'S' do
						begin
							clrscr;
							mostrar_archivo(archivo);
							writeln();
							writeln('¿Qué institución desea eliminar?');
							readln(eleccion);
							eliminar_registro(archivo, eleccion);
							
							writeln('¿Desea seguir eliminando? S/N');
							abrir(archivo);
							readln(tercera_eleccion);
						end;
					
					end;
				6: begin
						writeln('Saliendo del programa...');
					end;
			else
			writeln('Eleccción inválida.');
		end; 
		//cerrar(archivo);
	until eleccion = 6;
END.

