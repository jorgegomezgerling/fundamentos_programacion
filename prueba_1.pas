{
   sin título.pas
   
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

uses
    crt, unitArchivos; // Asegúrate de incluir tu unidad de archivos aquí

var
    archivo: t_archivo;
    registro: t_institucion;

begin
    clrscr;

    // Aquí puedes llamar a las funciones para probarlas
    crear(archivo); // Ejemplo de llamada a la función crear

    // Puedes seguir llamando a otras funciones para probarlas
    leer_registro(archivo, 1, registro); // Ejemplo de llamada a la función leer_registro

    // Luego puedes mostrar el contenido del registro o realizar otras acciones según la función probada
   // leer_registro(registro);

    // Cierra el archivo al finalizar las pruebas
    cerrar(archivo);

    readkey;
end.
