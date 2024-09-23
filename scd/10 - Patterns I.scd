/*
1. Introducción a los patrones:
   - Los patrones secuencian datos a través de procesos algorítmicos y computacionales.
   - Se usan comúnmente para generar secuencias de Synths.
   - Pueden secuenciar datos MIDI, controlar interfaces gráficas, etc.

2. Recursos recomendados:
   - Guía Práctica de Patrones por H. James Harkins
   - Capítulo sobre Eventos y Patrones por Ron Kuivila en el libro de SuperCollider
   - Tutorial "Understanding Streams, Patterns and Events"
   - Archivo de ayuda de Pattern

3. Ejemplo básico con SynthDef:
*/

(
SynthDef.new(\sine, {
	arg freq=440, atk=0.005, rel=0.3, amp=1, pan=0;
	var sig, env;
	sig = SinOsc.ar(freq);
	env = EnvGen.kr(Env.new([0,1,0],[atk,rel],[1,-1]),doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	sig = sig * env;
	Out.ar(0, sig);
}).add;
)
/*
4. Introducción a Pbind:
   - Genera una secuencia de eventos
   - Usa pares símbolo-valor para definir parámetros

5. Ejemplo básico de Pbind:
*/

(
p = Pbind(
	\instrument, \sine,
	\dur, Pseq([0.6, 0.15, 0.15], inf),
	\freq, Pseq([330, 247, 370, 220], inf),
).play;
)
/*
6. Patrones aleatorios:
   - Pexprand: distribución exponencial
   - Pwhite: distribución lineal

7. Ejemplo complejo con múltiples parámetros:
*/
(
p = Pbind(
	\instrument, \sine,
	\dur, Pwhite(0.05, 0.5, inf),
	\freq, Pexprand(50, 4000, inf),
	\atk, Pwhite(2.0, 3.0, inf),
	\rel, Pwhite(5.0, 10.0, inf),
	\amp, Pexprand(0.01, 0.2, inf),
	\pan, Pwhite(-0.8, 0.8, inf),
).play;
)


//8. Uso de Pdef para manipulación en tiempo real:

(
Pdef(
	\sinepat,
	Pbind(
		\instrument, \sine,
		\dur, Pwhite(0.05, 0.5, inf),
		\midinote, 33,
		\harmonic, Pexprand(1, 80, inf).round,
		\atk, Pwhite(2.0, 3.0, inf),
		\rel, Pwhite(5.0, 10.0, inf),
		\amp, Pkey(\harmonic).reciprocal * 0.3,
		\pan, Pwhite(-0.8, 0.8, inf),
	);
).play;
)
/*
9. Ejemplo con reproducción de buffer:
   - Carga de sonidos en un diccionario
   - Creación de un SynthDef para reproducción de buffer
   - Uso de Prand, Pxrand, Pwrand para selección aleatoria

10. Patrones rítmicos:
    - Uso de \dur y \stretch para definir ritmos
    - Anidación de patrones para crear estructuras rítmicas complejas

11. Cuantización de patrones:
    - Uso de quant para sincronizar patrones

12. Combinación de múltiples patrones:
    - Uso de Ppar para reproducir patrones en paralelo
*/