//1. Visualización de niveles de audio:
s.meter;
/*
2. Expansión multicanal básica:
- Un solo UGen produce un canal de audio
- Una Array de UGens produce múltiples canales de audio
*/
x = {[SinOsc.ar(300), SinOsc.ar(500)]}.play;
x.free;

//3. Expansión multicanal eficiente:
x = {SinOsc.ar([300, 500])}.play;
x.free;

//4. Operaciones con UGens multicanal:
(
x = {
	var amp, sig;
	amp = SinOsc.kr([7,1]).range(0,1);
	sig = SinOsc.ar([300,500]);
	sig = sig * amp;
}.play;
)
x.free;

//5. Operaciones con señales de diferente número de canales:
(
x = {
	var amp, sig;
	amp = SinOsc.kr(7).range(0,1);
	sig = SinOsc.ar([300,500]);
	sig = sig * amp;
}.play;
)
x.free;

//6. Uso del UGen Mix para combinar múltiples canales:

(
x = {
	var amp, sig;
	amp = SinOsc.kr([7, 1, 2, 0.2, 6]).range(0,1);
	sig = SinOsc.ar([300, 500, 700, 900, 1100]);
	sig = sig * amp;
	sig = Mix(sig) * 0.25;
	//sig = Mix(sig).dup(2) * 0.25;
	//sig = Splay.ar(sig) * 0.25;
}.play;
)
x.free;

//Atención a la duplicación de instancias de UGens vs. expansión multicanal de argumentos
x = {PinkNoise.ar(0.5)!2}.play;
x.free;
x = {PinkNoise.ar(0.5!2)}.play;
x.free;

rrand(50,1200)!4;
{rrand(50,1200)}!4;

//Atención a no utilizar la expansión multicanal involuntariamente
(
SynthDef.new(\multi, {
	/*
	...
	...
	*/
	Out.ar([0,1], sig);
}).add;
)


//7. Panoramización con Pan2:

(
x = {
	var sig, pan;
	sig = SinOsc.ar(400);
	pan = SinOsc.kr(0.5).range(-1, 1);
	Pan2.ar(sig, pan);
}.play;
)
x.free;