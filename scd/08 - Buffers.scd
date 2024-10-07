//1. Los buffers se usan para almacenar, grabar y reproducir audio muestreado.

//2. Para cargar un archivo de audio en un buffer:

~b0 = Buffer.read(s, "/ruta/al/archivo.wav");
~b0.play;

~b0.zero;
~b0.play;

~b0.free;

Buffer.freeAll;


//3. Atributos fundamentales de los buffers:

//   - numFrames: Número de cuadros
//numSamples = numFrames * numChannels

// - numChannels: Número de canales
~b0 = Buffer.readChannel(s, "/ruta/al/archivo.wav", channels:[0]);

//   - duration: Duración en segundos
~b0.duration;

//   - bufnum: Número de buffer asignado
~b0.bufnum;

//   - sampleRate: Tasa de muestreo
~b0.sampleRate;
s.sampleRate; //ojo

~b0.query;
~b0.play;

//4. Para leer parte de un archivo de sonido:
Buffer.read(s, "/ruta/archivo.wav", startFrame, numFrames);
//Ej. Leer 1/2 segundo de un archivo
~b0_part = Buffer.read(s, "/ruta/archivo.wav", 0, s.sampleRate/2);

//5. Para cargar múltiples archivos de sonido:
~bells = Array.new;
~folder = PathName.new("/media/wd1tb/supercollider-code/supercollider-taller/scd/buffers/deskBells");
(
~folder.entries.do({
    arg path;
    ~bells = ~bells.add(Buffer.read(s, path.fullPath));
});
)

~bells.at(0).play;
~bells[0].play;

s.options.numBuffers;

//6. PlayBuf: UGen para reproducción de buffers

(
SynthDef.new(\playbuf_test, {
    arg amp=1, out=0, buf, rate=1, t_trig=1, start=0, loop=0, da=2;
    var sig;
    sig = PlayBuf.ar(
		2,
		buf,
		BufRateScale.kr(buf) * rate,
		t_trig,
		start,
		loop,
		doneAction:da
	);
    sig = sig * amp;
    Out.ar(out, sig);
}).add;
)

Synth(\playbuf_test, [\buf, ~bells[1]]);
~bells[1].play;

Synth(\playbuf_test, [\buf, ~bells[1], \rate, 2]);
Synth(\playbuf_test, [\buf, ~bells[1], \rate, 12.midiratio]);

~apollo11 = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");
//~apollo11 = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01-44_1.aiff"); //original

a = Synth(\playbuf_test, [\buf, ~apollo11]); //Buffer UGen channel mismatch

a = Synth(\playbuf_test, [\buf, ~apollo11, \rate, -1, \start, ~apollo11.numFrames -1]);


//7. BufRd: UGen para lectura de buffers con puntero de audio

(
SynthDef.new(\bufrd_test, {
	arg amp=1, out=0, buf, start, end;
	var sig, ptr;
	ptr = Line.ar(start, end, BufDur.kr(buf), doneAction:2);
	sig = BufRd.ar(2, buf, ptr);
	sig = sig * amp;
	Out.ar(out, sig);
}).add;
)

x = Synth.new(\bufrd_test, [\buf, ~apollo11.bufnum, \start, 0, \end, ~apollo11.numFrames-1, \freq, 0.2]);

//8. Uso de diferentes UGens como punteros para BufRd:

//Phasor
ptr = Phasor.ar(0, BufRateScale.kr(buf) * rate, start, end);

(
SynthDef.new(\bufrd_loop, {
    arg amp=1, out=0, buf, rate=1, start, end;
    var sig, ptr;
    ptr = Phasor.ar(0, BufRateScale.kr(buf) * rate, start, end);
    sig = BufRd.ar(2, buf, ptr);
    sig = sig * amp;
    Out.ar(out, sig);
}).add;
)

x = Synth.new(\bufrd_loop, [\buf, ~apollo11.bufnum, \start, 0, \end, ~apollo11.numFrames-1, \freq, 0.2]);
x.free;

// Sinusoidal
ptr = SinOsc.ar(freq, 3pi/2).range(start, end);

(
SynthDef.new(\bufrd_sine, {
	arg amp=1, out=0, buf, freq=0.2, start, end;
	var sig, ptr;
	ptr = SinOsc.ar(freq, 3pi/2).range(start, end);
	sig = BufRd.ar(2, buf, ptr);
	sig = sig * amp;
	Out.ar(out, sig);
}).add;
)

x = Synth.new(\bufrd_sine, [\buf, ~apollo11.bufnum, \start, 0, \end, ~apollo11.numFrames-1, \freq, 0.1]);
x.free;

// Ruido
ptr = LFDNoise1.ar(freq).range(start, end);

(
SynthDef.new(\bufrd_noise, {
	arg amp=1, out=0, buf, freq=0.75, start, end;
	var sig, ptr;
	ptr = LFDNoise1.ar(freq).range(start, end);
	sig = BufRd.ar(2, buf, ptr);
	sig = sig * amp;
	Out.ar(out, sig);
}).add;
)

x = Synth.new(\bufrd_noise, [\buf, ~bells[0].bufnum, \start, 0, \end, ~bells[0].numFrames-1]);
x.free;

//Utilización de varias capas
w = Synth.new(\bufrd_noise, [\buf, ~bells[0].bufnum, \start, 0, \end, ~bells[0].numFrames-1, \freq, 0.6, \amp, 0.5]);

x = Synth.new(\bufrd_noise, [\buf, ~bells[4].bufnum, \start, 0, \end, ~bells[4].numFrames-1, \freq, 0.8, \amp, 0.5]);

y = Synth.new(\bufrd_noise, [\buf, ~bells[7].bufnum, \start, 0, \end, ~bells[7].numFrames-1, \freq, 0.7, \amp, 0.5]);

z = Synth.new(\bufrd_noise, [\buf, ~bells[6].bufnum, \start, 0, \end, ~bells[6].numFrames-1, \freq, 0.5, \amp, 0.2]);

s.freeAll;


//Manejando un grupo de capas

g = Group.new;

w = Synth.new(\bufrd_noise, [\buf, ~bells[0].bufnum, \start, 0, \end, ~bells[0].numFrames-1, \freq, 2.5, \amp, 0.5], g);

x = Synth.new(\bufrd_noise, [\buf, ~bells[3].bufnum, \start, 0, \end, ~bells[3].numFrames-1, \freq, 3.4, \amp, 0.5], g);

y = Synth.new(\bufrd_noise, [\buf, ~bells[5].bufnum, \start, 0, \end, ~bells[5].numFrames-1, \freq, 2.7, \amp, 0.5], g);

z = Synth.new(\bufrd_noise, [\buf, ~bells[4].bufnum, \start, 0, \end, ~bells[4].numFrames-1, \freq, 3.3, \amp, 0.5], g);

g.set(\freq, 16);
g.set(\freq, 60);
g.set(\freq, 200);
g.set(\freq, 0.16);
g.set(\amp, 0.9);
s.freeAll;