/*
1. Introducción a los patrones:
   - Los patrones secuencian datos a través de procesos algorítmicos y computacionales.
   - Se usan comúnmente para generar secuencias de Synths.
   - Pueden secuenciar datos MIDI, controlar interfaces gráficas, etc.

2. Recursos recomendados:
- "Pattern Guide" Guía Práctica de Patrones por H. James Harkins
- Capítulo sobre Eventos y Patrones por Ron Kuivila en "The SuperCollider Book"
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
*/
(instrument: \default, freq: 260, dur: 2)

//   - Usa pares símbolo-valor para definir parámetros
(
p = Pbind(
	\type, \note,
);
)

//5. Ejemplo básico de Pbind:
(
p = Pbind(
	\instrument, \sine,
	\dur, Pseq([0.6, 0.15, 0.15], inf),
	\freq, Pseq([330, 247, 370, 220], inf),
).play;
)

p.stop;
/*
6. Patrones aleatorios:
   - Pexprand: distribución exponencial
*/
Pexprand(50, 4000, inf);
/*
    - Pwhite: distribución lineal
*/
Pwhite(2.0, 3.0, inf);

/*
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

//9. Ejemplo con reproducción de buffer:
//   - Carga de sonidos en un diccionario
(
d = Dictionary.new;
d.add(\deskBells -> PathName.new("/media/wd1tb/supercollider-code/supercollider-taller/scd/buffers/deskBells").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	})
);
d.add(\crotales -> PathName.new("/media/wd1tb/supercollider-code/supercollider-taller/scd/buffers/crotales").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	})
);
d.add(\shakers -> PathName.new("/media/wd1tb/supercollider-code/supercollider-taller/scd/buffers/shakers").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	})
);
)

//   - Creación de un SynthDef para reproducción de buffer
(
SynthDef.new(\bufplay, {
	arg buf=0, rate=1, amp=1;
	var sig;
	sig = PlayBuf.ar(2, buf, BufRateScale.ir(buf)*rate, doneAction:2);
	sig = sig * amp;
	Out.ar(0, sig);
}).add;
)

Synth.new(\bufplay, [\buf, d[\deskBells].choose.bufnum]);
//   - Uso de Prand, Pxrand, Pwrand para selección aleatoria
(
p = Pbind(
	\instrument, \bufplay,
	\buf, Pxrand(d[\deskBells], inf),
	\dur, Pseq([1/8], inf),
	\amp, 0.5
).play;
)
p.stop;

//10. Patrones rítmicos:
//    - Uso de \dur y \stretch para definir ritmos
96 //BPM
96/60 //Tiempos por segundo
60/96 //Invertido: segundos por tiempo
60/96*4 //Duración en segundos de un compás de 4 tiempos


(
p = Pbind(
	\instrument, \bufplay,
	\buf, Pxrand(d[\deskBells], inf),
	\dur, Pseq([1/8], inf),
	\stretch, 2.5,
	\amp, 0.5
).play;
)
p.stop;
//    - Anidación de patrones para crear estructuras rítmicas complejas
(
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufplay,
		\dur, Pseq([1/16], inf),
		\stretch, 1.875,
		\buf, Pseq(
			[
				Prand(d[\deskBells], 1),
				Prand(d[\crotales], 7),
				Prand(d[\shakers], 1),
			],inf
		),
		\rate, 1,
		\amp, Pseq([0.8, Pexprand(0.005, 0.2, 7)], inf),
	);
).play;
)

//11. Cuantización de patrones:
//    - Uso de quant para sincronizar patrones

//.play(quant: 2.5)
//ahora probar cambiar \rate

//12. Combinación de múltiples patrones:
//    - Uso de Ppar para reproducir patrones en paralelo

(
p = Pbind(
	\instrument, \bufplay,
	\dur, Pseq([1/16], inf),
	\stretch, 1.875,
	\buf, Pseq(
		[
			Prand(d[\deskBells], 1),
				Prand(d[\crotales], 7),
				Prand(d[\shakers], 1),
		],inf
	),
	\rate, Pexprand(0.8, 1.25, inf),
	\amp, Pseq([0.8, Pexprand(0.005, 0.2, 7)], inf),
);

q = Pbind(
	\instrument, \sine,
	\dur, 1/16,
	\stretch, 1.875,
	\note, Prand([0,3,5,9,10,12],inf),
	\atk, 0.005,
	\rel, Pexprand(0.01, 0.5, inf),
	\amp, Pexprand(0.05,0.5,inf),
	\pan, Pwhite(-0.8, 0.8, inf),
);

x = Ppar([p, q], 1).play;
)

x.stop;
