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
    segunda_eleccion: integer;

BEGIN

begin
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
		0: begin
			clrscr;
			mostrar_archivo(archivo);
			end;
		1: begin
			clrscr;
			writeln('¿Desea listar todas las instituciones o realizar búsqueda por nombre?');
			writeln('0: Busqueda por nombre: ');
			writeln('1: Listar todas: ');
			
			end;
		else
		writeln('Eleccción inválida.');
	end; 
end;

END.

