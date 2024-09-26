/*
1. Interfaz de SuperCollider:
- Espacio de trabajo: Donde se escribe y evalúa el código.
- Ventana de publicación: Muestra resultados y errores.
- Documentación de ayuda: Proporciona información sobre funciones y clases.

2. Evaluación de código:
- Usar Shift+Enter para evaluar una línea.
- Usar Command+Enter para evaluar código entre paréntesis.

3. Sintaxis básica:
- Formato: receptor.mensaje
- Ejemplo:
*/

"Hola Mundo".postln;
3.cubed;

//Bloques de código
(
"Hola Mundo".postln;
3.cubed;
)
/*
4. Manejo de errores:
- Los errores se muestran en la ventana de publicación.
- Tipos comunes: errores de ortografía, sintaxis, caracteres extra o paréntesis faltantes.

5. Variables:
- Locales: Deben ser declaradas con 'var' y usadas en la misma ejecución.
*/
(
	var number;
	number = 3.cubed;
)

//- Globales: Persisten después de la evaluación. Usan letras de 'a' a 'z' o '~' antes del nombre.

~number = 3.cubed

//6. Manipulación de datos:

(
var foo;
foo = 3;
foo = foo.cubed;
foo = foo + 100;
foo = foo/2;
foo;
)

//7. Encadenamiento de operaciones:

3.cubed + 100 / 2;
5.5.trunc.squared;


//8. Comentarios:
//- Una línea: //
//- Múltiples líneas: /* */

/*
9. Uso de la documentación:
- Command+D: Buscar documentación para el cursor.
- Shift+Command+D: Abrir barra de búsqueda de documentación.
*/

play{HPF.ar(({|k|({|i|SinOsc.ar(i/96,Saw.ar(2**(i+k))/Decay.ar(Impulse.ar(0.5**i/k),[k*i+1,k*i+1*2],3**k))}!6).product}!32).sum/2,40)}