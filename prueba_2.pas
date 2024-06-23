{
   prueba_2.pas
   
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


program PruebaArchivo;

uses unitArchivos;

var archivo: t_archivo;
	institucion: t_institucion;
	pos: integer;

begin

	crear(archivo);

with institucion do
begin
    writeln('Ingrese el nombre de la institución: ');
    readln(nombre_institucion);
    
    writeln('Ingrese el nombre del directivo a cargo: ');
    readln(directivo_cargo);
    
    writeln('Ingrese la latitud: ');
    readln(ubicacion.latitud);
    
    writeln('Ingrese la longitud: ');
    readln(ubicacion.longitud);
    
    writeln('Ingrese el programa (CLP, RAN, PROVINCIA, REFRIGERIO, PRIMERA_INFANCIA, ESPACIOS_DE_CUIDADO, CLUBES, COMUNITARIOS): ');
    readln(programa);
    
    writeln('¿Está activo? (S/N): ');
    readln(activo);
end;

	
	crear_registro(archivo, institucion);
	
    // Mostrar el registro en la posición 0
    pos := 0;
    mostrar_registro(archivo, pos);

end.
