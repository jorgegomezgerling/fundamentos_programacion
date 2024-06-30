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

uses crt, unitArchivos;

var archivo: t_archivo;
    eleccion: integer;
    //segunda_eleccion: integer;
    tecla: char;
    institucion: t_institucion;

begin
    // Crear el archivo si no existe y mostrar su contenido
    abrir(archivo);
    mostrar_archivo(archivo);
    cerrar(archivo);
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
	writeln();
    readln(eleccion);
    case eleccion of
		0: begin // Listo simplemente todas las Instituciones, podría mejorarse y listar por programas. Pero de momento esto me sirve. No es necesario ordenarlo porque ordeno cada vez que inserto.
			//clrscr;
			mostrar_archivo(archivo);
			end;
		2: begin // La idea acá es agregar la institución y mostrarla ya ordenada. Quizás
			clrscr;
			tecla := 'S';
			while tecla <> 'N' do
				begin
					with institucion do
					begin
						writeln('Ingrese el numero de la institución: ');
						readln(numero_institucion);
						
						writeln('Ingrese el nombre de la institución: ');
						readln(nombre_institucion);
						
						writeln('Ingrese el nombre del directivo a cargo: ');
						readln(directivo_cargo);
						
						writeln('Ingrese la latitud: ');
						readln(ubicacion.latitud);
						writeln('Ingrese la longitud: ');
						readln(ubicacion.longitud);
						
						writeln('Ingrese el programa (0: CLP, 1: RAN, 2: PROVINCIA, 3: REFRIGERIO, 4: PRIMERA_INFANCIA, 5: ESPACIOS_DE_CUIDADO, 6: CLUBES, 7: COMUNITARIOS): ');
						readln(programa);
						
						writeln('¿Está activo? (S/N): ');
						readln(activo);
					  end;
					  
					writeln('Creando registro...');
					crear_registro(archivo, institucion);
					writeln('Desea seguir cargando ? S/N: ');
					readln(tecla);
					if tecla = 'N' then
						cerrar(archivo);
				end;
			end;
			5: begin
				mostrar_archivo(archivo);
				writeln('¿Qué institución desea eliminar?');
				readln(eleccion);
				eliminar_registro(archivo, eleccion);
				end;
		else
		writeln('Eleccción inválida.');
	end; 

END.

