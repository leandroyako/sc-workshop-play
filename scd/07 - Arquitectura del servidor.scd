//1. Iniciar el servidor y visualizarlo.

s.boot;
s.plotTree;
s.meter;

s.makeGui;
//Barra de estado: Avg CPU, Peak CPU, UGens, Synths, Groups, SynthDefs.

//2. CreandoSynthDefs (generación básica de sonido)

(
SynthDef.new(\blip, {
	var freq, trig, sig;
	freq = LFNoise0.kr(3).exprange(300,1200).round(300);
	sig = SinOsc.ar(freq) * 0.25;
	trig = Dust.kr(2);
	sig = sig * EnvGen.kr(Env.perc(0.01, 0.2), trig);
	Out.ar(0, sig);
}).add;
)

//3. Uso de Buses para enrutar Señales

s.options.numAudioBusChannels;
s.options.numOutputBusChannels;
s.options.numInputBusChannels;

(
SynthDef.new(\blip, {
	arg out;
	var freq, trig, sig;
	freq = LFNoise0.kr(3).exprange(300,1200).round(300);
	sig = SinOsc.ar(freq) * 0.25;
	trig = Dust.kr(2);
	sig = sig * EnvGen.kr(Env.perc(0.01, 0.2), trig);
	Out.ar(out, sig);
}).add;

SynthDef.new(\reverb, {
	arg in, out=0;
	var sig;
	sig = In.ar(in, 1);
	sig = FreeVerb.ar(sig, 0.5, 0.8, 0.2)!2;
	Out.ar(out, sig);
}).add;
)

~reverbBus = Bus.audio(s, 1);
y = Synth.new(\reverb, [\in, ~reverbBus]);
x = Synth.new(\blip, [\out, ~reverbBus]);


//4. Buses Multicanal y Enrutamiento de Señales
(
SynthDef.new(\blip, {
	arg out;
	var freq, trig, sig;
	freq = LFNoise0.kr(3).exprange(300,1200).round(300);
	sig = SinOsc.ar(freq) * 0.25;
	trig = Dust.kr(2);
	sig = sig * EnvGen.kr(Env.perc(0.01, 0.2), trig);
	sig = Pan2.ar(sig, LFNoise1.kr(10));
	Out.ar(out, sig);
}).add;

SynthDef.new(\reverb, {
	arg in, out=0;
	var sig;
	sig = In.ar(in, 2);
	sig = FreeVerb.ar(sig, 0.5, 0.8, 0.2);
	Out.ar(out, sig);
}).add;
)

~reverbBus2 = Bus.audio(s, 2);
y = Synth.new(\reverb, [\in, ~reverbBus2]);
x = Synth.new(\blip, [\out, ~reverbBus2]);

//5. Orden de Ejecución

x = Synth.new(\blip, [\out, ~reverbBus2], s);
y = Synth.new(\reverb, [\in, ~reverbBus2], s, \addToTail);

//6. Uso de Grupos para Gestionar el Orden de Nodos

~sourceGrp = Group.new;
~fxGrp = Group.after(~sourceGrp);
x = Synth.new(\blip, [\out, ~reverbBus2], ~sourceGrp);
y = Synth.new(\reverb, [\in, ~reverbBus2], ~fxGrp);

//7. Iteración sobre Múltiples Synths
(
SynthDef.new(\blip, {
	arg out, fund=300, dens=2, decay=0.2;
 var freq, trig, sig;
	freq = LFNoise0.kr(3).exprange(fund, fund*4).round(fund);
	sig = SinOsc.ar(freq) * 0.25;
	trig = Dust.kr(dens);
	sig = sig * EnvGen.kr(Env.perc(0.01, decay), trig);
	sig = Pan2.ar(sig, LFNoise1.kr(10));
	Out.ar(out, sig);
}).add;
)

(
8.do{
	Synth.new(\blip, [
		\out, ~reverbBus2,
		\fund, exprand(60,300).round(30)
	],
	~sourceGrp)
}
)

//8. Control de Múltiples Synths en un Grupo

~sourceGrp.set(\decay, 0.05);
~sourceGrp.set(\dens, 12);
~sourceGrp.set(\dens, 0.25);
~sourceGrp.set(\decay, 5);
~sourceGrp.freeAll;