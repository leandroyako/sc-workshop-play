//Mientras completes esta tarea, sé consciente de la seguridad auditiva. Antes de ejecutar código que produzca sonido, baja el volumen del sistema al mínimo, quítate los auriculares y monitorea el nivel visual en los medidores de salida (evalúa s.meter). Luego, sube lentamente el volumen del sistema.


//Problema 1
//Genera una colección de 16 números enteros aleatorios entre 100 y 2000. Usa una distribución exponencial, para que los valores tiendan hacia el extremo inferior de este rango.
Array.exprand(16, 100, 2000);


//Problema 2
//Genera una colección que contenga 16 números enteros impares aleatorios entre 100 y 2000. Usa una distribución lineal, para que los valores estén distribuidos equitativamente a lo largo de este rango.
Array.rand(16, 100, 2000);


//Problema 3
//Genera una colección que contenga 16 números enteros que sean múltiplos de 50 entre 100 y 2000. Usa una distribución exponencial. Además, usa una variable global para almacenar la colección.
x = Array.exprand(16, 100, 2000).round(50).asInteger;


//Problema 4
//Usando la variable global del problema anterior, escribe un código que añada a la colección cuatro múltiplos más de 50 entre 2000 y 3000. Usa una distribución lineal. La misma variable global ahora debe almacenar esta nueva colección más grande.
4.do({x = x.add(rand(50, 2000, 3000).round(50).asInteger)});
x.size;


//Problema 5
//Escribe un código que grafique el contenido de la nueva colección más grande que creaste en el problema anterior. Las colecciones responden al método "plot". (no es necesario pensar demás en este problema).
x.plot;


//Problema 6
//Usa el método "series" para generar una colección de números que representen las frecuencias de los primeros 12 armónicos de la serie de sobretonos, con un fundamental que comienza en 350 Hz (incluye el fundamental, 12 frecuencias en total).
Array.series(12, 350, 350);


//Problema 7
//Usa el método "geom" para generar una colección de 8 números que representen la amplitud de la señal. El primer valor debe ser 1, y cada número subsiguiente debe ser igual a la mitad del número anterior.
Array.geom(8, 1, 0.5);


//Problema 8
//Usa uno o más métodos de iteración (do, collect, select, reject, etc.) para devolver un número entero que corresponda al número de múltiplos de 100 que están contenidos en la colección de 20 valores (almacenado en tu variable global del Problema 4).
x.select({|n| n % 100 == 0}).size;


//antes de continuar, inicia el servidor de audio:
Server.local.boot;



//Problema 9
//Considera la siguiente función UGen, que produce una onda sinusoidal de 2 canales con una frecuencia de 300 Hz y una amplitud de 0.1. Usa iteración para ejecutar esta función cinco veces, de modo que cada instancia tenga una frecuencia aleatoria entre 200 y 1000 (distribución exponencial).

(
Array.exprand(5,200,1000).do({
	|n|
{
	var senal;
	senal = SinOsc.ar(n);
	senal = senal * 0.1;
	senal!2;
}.play;
}
);
)



//Problema 10
//Una vez más, considera la misma función UGen. Esta vez, usa tu variable global que contiene la colección de 20 valores. Itera sobre tu colección, usando los valores dentro como frecuencias para SinOsc.

/***IMPORTANTE***/
//Observa que la amplitud se ha reducido intencionalmente de 0.1 a 0.02, porque 20 formas de onda sumadas son más fuertes que 5. ¡Sé consciente de la seguridad auditiva!

(
x.do({
	|n|
{
	var senal;
	senal = SinOsc.ar(n);
	senal = senal * 0.02;
	senal!2;
}.play;
});
)



//Problema 11
/*
Modifica tu trabajo del problema anterior haciendo los siguientes cambios:

- La colección de frecuencias debe estar ordenado de menor a mayor.

- La amplitud del primer SinOsc debe ser 0.1.

- La amplitud de cada SinOsc subsiguiente debe ser
0.75 veces más fuerte que la anterior (pista: declara
un segundo argumento en tu función de iteración para que
puedas acceder al conteo de la iteración).
*/

//El resultado debe ser un timbre más "cargado" en los graves.

(
x.sort.do({
	|n, i|
{
	var senal;
	senal = SinOsc.ar(n);
	senal = senal * x.size.reciprocal;
	senal!2;
}.play;
});
)


//Pregunta de yapa
//Modifica tu trabajo del problema final para generar 40 generadores SinOsc en lugar de 20. Cada uno de los 20 osciladores originales debe tener un "gemelo" casi idéntico; la única diferencia entre cada original y su copia es que la frecuencia de cada nueva copia debe ser ligeramente más alta que la original, por una cantidad aleatoria de coma flotante entre 0.0 y 4.0. El resultado sonoro debe ser similar, pero ahora con un pulso lento y un sonido de batido. (Pista: el método dupEach puede ser útil).

//tu colección de frecuencias podría verse algo así:
[150, 153.47338628769, 250, 251.30930900574, 300, 302.16426753998, ...etc...]

(
x.addAll(x.collect({|n| n + rand(4.0)})).do({
	|n, i|
{
	var senal;
	senal = SinOsc.ar(n);
	senal = senal * x.size.reciprocal;
	senal!2;
}.play;
});
)
