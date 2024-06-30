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
    tecla, palabra: char;
    eleccion: integer;
 

begin
	
    // Crear el archivo si no existe y mostrar su contenido
    //abrir(archivo);
    //mostrar_archivo(archivo);
    //cerrar(archivo);

    // Crear y agregar registros
    abrir(archivo);
    tecla := 'S';
    {while tecla <> 'N' do
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
    
		writeln('Creando registro...');

		writeln('Desea seguir cargando ? S/N: ');
		readln(tecla);
		
		if tecla = 'N' then
			cerrar(archivo);
	  end;
    end;}
   
    // Mostrar y modificar registros
    abrir(archivo);
    mostrar_archivo(archivo);
   // writeln('Qué Institución desea modificar?');
   // readln(pos);
   // mostrar_registro(archivo, pos);
    
   // modificar_registro(archivo, pos);
   // mostrar_registro(archivo, pos);
    palabra := 'N';
    ordenamiento_burbuja(archivo, palabra);
    mostrar_archivo(archivo);
    cerrar(archivo); // Pruebo cuestion de SSH 
    end. // Segunda prueba
