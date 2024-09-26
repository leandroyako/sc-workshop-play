/*****************

Women of the World
Ivor Cutler

arr. Jim O'Rourke

*****************/



//Requiere SC3-plugins: BMoog, DWGBowed

(
s.waitForBoot({
//// SynthDefs

SynthDef(\sinfb, {
	arg freq = 440, atk = 0.01, sus = 0, rel = 1, fb = 0, amp = 0.3, out = 0, pan=0;
	var sig, env;
	env = EnvGen.kr(Env.linen(atk,sus,rel),1,1,0,1,2);
	sig = SinOscFB.ar(freq,fb,1);
	sig = sig*env;
	Out.ar(out,Pan2.ar(sig,pan,amp));
}).add;

SynthDef(\plucking, {
	arg amp = 0.1, freq = 440, decay = 5, coef = 0.1, pan = 0, out = 0;
	var env, sig;
	sig = Pluck.ar(
		in: PinkNoise.ar(amp),
		trig: Impulse.kr(0),
		maxdelaytime: 0.1,
		delaytime: freq.reciprocal,
		decaytime: decay,
		coef: coef);
	DetectSilence.ar(sig, 0.0001, 0.1, 2);
	Out.ar(out, Pan2.ar(sig, pan));

}).add;


SynthDef(\fmbass, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env1, env2, env3, env4, env5, env6, env7, env8;
	freq = freq / 4;
	freq = freq * ((0..1)/1 - 0.5 * 0.0007 + 1);
	env1 = EnvGen.kr(Env([0,1,0.051,0],[0.001,0.01,0.8], [4,-8]), 1);
	env2 = EnvGen.kr(Env([0,1,0.051,0],[0.005,0.5,1.5], [0,-8], releaseNode:2), 1);
	env3 = EnvGen.kr(Env([0,1,1,0],[0.01,0.01,0.2], [0,0,-4], releaseNode:2), gate);
	env4 = EnvGen.kr(Env([0,1,0],[0.002,2.8], [0,-4]), 1);
	env5 = EnvGen.kr(Env([0,1,1,0],[0.001,0.1,0.8], [4,0,-4], releaseNode:2), gate);
	env6 = EnvGen.kr(Env([0,1,0],[0.001,3.0], [0,-4]), 1);

	sig1 = SinOsc.ar(freq * 11 + 0) * env1;
	sig2 = SinOsc.ar(freq * 6 * ( sig1 * 2.5 + 1 )) * env2;
	sig3 = SinOsc.ar(freq * 2 * 1 + 0) * env3;
	sig4 = SinOsc.ar(freq * 1 * ( sig3 * 2.5 + 1 ) + 0) * env4;
	sig5 = SinOsc.ar(freq * 1 * ( sig2 * 2.5 + 1 ) * (sig4 * 2.5 + 1)) * env5;
	sig6 = SinOsc.ar(freq * 2) * env6;

	sig = [sig1, sig2, sig3, sig4, sig5, sig6] * DC.ar([0.0, 0.0, 0.0,  0.0, 0.5, 0.5]);

	sig = sig /2;
	sig = sig.flop.sum;
	sig = sig * EnvGen.ar(\adsr.kr( Env.adsr(0.001,0,1,0.01, 1,-1) ),gate,doneAction:2);
	sig = sig * AmpComp.kr(freq);

	sig = Pan2.ar(sig, pan + [ 0, 0, 0, 0, 0, 0], amp).sum;
	Out.ar(out, sig);
}).add;

SynthDef(\kick, {
	|amp = 1, pan = 0, out = 0|
	var sig =
	FreeVerb.ar(
		Resonz.ar(
			BPF.ar(
				EnvGen.ar(Env.perc(0,0.00001,250, \lin)),
				60, 1, 1), 60, 0.2)
		, 0.4, 0.4, 0.3)
	* 10;
	DetectSilence.ar(sig, 0.0001, 0.1, 2);
	Out.ar(out, Pan2.ar(sig, pan, amp));
}).add;

SynthDef(\bmoog, { |out = 0, pos = 0, freq = 120, amp = 0.5, q = 0.75, mode = 2.0, stretch = 1, gate = 1, maxDelFreq = 2, delFreq = 2, atk = 0.1, dec = 0.3, susLevel = 0.5, rel = 1|
	var sig, env;
	sig = BMoog.ar(
		Mix.ar(LFSaw.ar([freq, freq * 1.5], 0, 0.2)),
		LinExp.kr(LFCub.kr(0.1, 0.5pi), -1, 1, 280, 1500),
		q,
		mode).dup;
	sig = CombN.ar(sig, maxDelFreq, [0.4,0.35],2) * delFreq + (sig * 0.5);
	env = EnvGen.kr(Env.adsr(atk, dec, susLevel, rel), gate, amp, 0, stretch, 2);
	sig = sig * env;
	Out.ar(out, Pan2.ar(sig, pos));
}).add;

SynthDef(\strings, { |out=0, freq=440, amp=0.5,force=1, gate=1, pos=0.07, release = 0.3, c1=0.25,c3=31,pan=0, level = 0.1|
    var vib = Gendy1.kr(1,1,1,1,0.1, 4,mul:0.003,add:1);
    var son = DWGBowedTor.ar(freq*vib, amp,force, gate,pos, release,c1,c3);
    son = DWGSoundBoard.ar(son);
    son = BPF.ar(son,118,1)+son;
    son = BPF.ar(son,430,1)+son;
    son = BPF.ar(son,490,1)+son;
    son = LPF.ar(son,6000);
    Out.ar(out, Pan2.ar(son * 0.1, pan, level));
}).add;

SynthDef(\kalimba, {
	|out = 0, freq = 440, amp = 0.1, mix = 0.1|
	var snd, click;

	snd = SinOsc.ar(freq) * EnvGen.ar(Env.perc(0.03, Rand(3.0, 4.0), 1, -7), doneAction: 2);
	snd = HPF.ar( LPF.ar(snd, 380), 120);

	click = DynKlank.ar(`[
		[240*ExpRand(0.97, 1.02), 2020*ExpRand(0.97, 1.02), 3151*ExpRand(0.97, 1.02)],
		[-9, 0, -5].dbamp,
		[0.8, 0.07, 0.08]
	], BPF.ar(PinkNoise.ar, 6500, 0.1) * EnvGen.ar(Env.perc(0.001, 0.01))) * 0.1;
	snd = (snd*mix) + (click*(1-mix));
	snd = Mix( snd );
	snd = snd + snd.distort;
	snd = snd * 2;
	Out.ar(out, Pan2.ar(snd, 0, amp));
}).add;

/// Tempo

TempoClock.default = TempoClock(101/60);

/// Patterns

Pdef(\g2,
	Pbind(
		\instrument, \plucking,
		\scale,Scale.major,
		\root, 2,
		\octave, 5,
		\degree, Pseq([4, 2, 1, 2, 0, 0] ++ [4, 2, 1, 1.1, 2, 0] ++ [4, 2, 1, 2, 0, 0] ++ [1, 2, -4, -3, 1.1, 2, -3, 0], inf),
		\dur, Pseq([1, 1, 1/4, 1/2, 1/2, 3/4].dup(3).flat ++ [1/4, 1/2, 1/2, 1/4, 1/2, 1/2, 1/2, 1] , inf),
		\amp, Pif(Pfunc({|e| e[\dur] == 1}), {0.5}, {0.3}),
		\atk, 0.01,
		\decay, 4,
	)
);

Pdef(\g1,
	Pbind(
		\instrument, \plucking,
		\scale,Scale.major,
		\root, 2,
		\octave, 5,
		\degree, Pseq([4, 2, 1, 2, 0, 0] ++ [4, 2, 1, 1.1, 2, 0] ++ [4, 2, 1, 2, 0, 0] ++ [1, 2, -4, -3, 1.1, 2, 0] ++ [1, 2, -4, -3, 1.1, 2, -3, 0], inf),
		\dur, Pseq([1, 1, 1/4, 1/2, 1/2, 3/4].dup(3).flat ++ [1/4, 1/2, 1/2, 1/4, 1/2, 1, 1] ++ [1/4, 1/2, 1/2, 1/4, 1/2, 1/2, 1/2, 1] , inf),
		\amp, Pif(Pfunc({|e| e[\dur] == 1}), {0.5}, {0.3}),
		\atk, 0.01,
		\decay, 4,
	)
);

Pdef(\g0,
	Pbind(
		\instrument, \plucking,
		\scale,Scale.major,
		\root, 2,
		\octave, 4,
		\degree, Pseq([4,7], inf),
		\dur, 1/2,
		\amp, 0.15,
		\atk, 0.2,
		\decay, 4,
	)
);

Pdef(\d0,
	Pbind(
		\instrument, \bmoog,
		\scale,Scale.major,
		\root, 2,
		\degree, 0,
		\octave, 3,
		\dur, 16,
		\amp, 0.1,
		\atk, Pkey(\dur)/2,
		\rel, Pkey(\dur)/2,
	)
);

Pdef(\b0,
	Pbind(
		\instrument, \fmbass,
		\scale,Scale.major,
		\root, 2,
		\octave, 4,
		\degree, Pseq([4,7].dup(5).flat ++ [0,7], inf),
		\dur, 1/2,
		\amp, 0.05,
		\legato, 1.1
	)
);

Pdef(\k0, Pbind(\instrument, \kick, \amp, 0.4));

Pdef(\m0b,
	Ppar( [\sinfb, \plucking].collect({|instr, i|
		i = i + 1 * 0.1;
		Pbind(
			\instrument, instr,
			\scale,Scale.major,
			\root, 2,
			\octave, [5, 6, 7],
			\degree, Pseq([
				Pn(Pseq([2,0,-3,\, 2,0,-3, \, 2]), 4),
				Pseq([1,2,1,0,1,0,1,2,1,0], 1)
			], inf),
			\dur, Pseq([
				Pn(Pseq([1/2, 1/4, 1/4, Rest(1/4), 1/4, 1/4, 1/4, Rest(1/2), (1/2 + 1)], 1), 4),
				Pseq([3/4, 3/4, 2/4, 3/4, 3/4, 2/4, 3/4, 3/4, 2/4, 2], 1)
			], inf),
			\amp, [0.5, 0.4, 0.3]*i+0.05,
			\atk, 0.001,
			\decay, 5,
			\fb, [0.5, 0.1, 0.1]
		)
	})
	)
);

Pdef(\m0a,
	Ppar( [\kalimba,\sinfb, \plucking].collect({|instr, i|
		i = i + 1 * 0.1;
		Pbind(
			\instrument, instr,
			\scale,Scale.major,
			\root, 2,
			\octave, [5,6,7],
			\degree, Pseq([
				Pn(Pseq([2,0,-3,\, 2,0,-3, \, 2]), 4),
				Pseq([1,2,1,0,1,0,1,2,1,0], 1)
			], inf),
			\dur, Pseq([
				Pn(Pseq([1/2, 1/4, 1/4, Rest(1/4), 1/4, 1/4, 1/4, Rest(1/2), (1/2 + 1)], 1), 4),
				Pseq([3/4, 3/4, 2/4, 3/4, 3/4, 2/4, 3/4, 3/4, 2/4, 2], 1)
			], inf),
			\amp, 0.7 * i,
			\atk, 0.001,
			\decay, 5,
			\fb, [0, 0, 0.1]
		)
	})
	)
);

Pdef(\m1,
	Ppar( [\sinfb, \plucking].collect({|instr, i|
		i = i + 1 * 0.1;
		Pbind(
			\instrument, instr,
			\scale,Scale.major,
			\root, 2,
			\octave, [5, 6],
			\degree, Pseq([4, 4, 4 ,4 ,4, 3, 4, 0, \, 0, 2, 4, 5, 5, 4, 4, 3, 4, 3, 2, 2, 1, 2, 1, 0], inf),
			\dur, Pseq([1/4, 1/4, 1/4, 1/4, 5/2,  1/2, 1/2, 5/2, Rest(1/4), 1/4, 1/4, 1/4, 3/2, 1/2, 3/2, 1/2, 2/3, 2/3, 2/3, (2+5/2),    1/2, 3/4, 3/4, 2/4, 2+2] , inf),
			\amp, 0.7 * i,
			\atk, 0.001,
			\decay, 5,
			\fb, [0, 0.1, 0.1]
		)
	})
	)
);

Pdef(\m2,
	Pbind(
		\instrument, \kalimba,
		\scale,Scale.major,
		\root, 2,
		\octave, 5,
		\degree, Pseq([7,0,7,0,7]++[6,0,6,0,6]++[5,0,5,0,5]++[4,0,4,0,4]++[5,0,5,0,5]++[4,0,4,0,4]++[3,0,3,0,3]++[2,0,2,0,2]++[0, 2, 1, 2, 1, 0], inf),
		\dur, Pseq([Pseq([2/4, 1/4, 2/4, 1/4, 2/4], 8), Pseq([Rest(1.5),1/2, 3/4, 3/4, 2/4, 2+2],1)], inf),
		\amp, Pseq([Pseq([1, 0.5], 8*2), Pn(0.4, 6)], inf),
		\atk, 0.001,
	)
);

Pdef(\s0,
	Pmono(
		\strings,
		\octave, 4,
		\scale, Scale.major,
		\root, 2,
		\dur, Pseq([4,4,4,4,2,2,2, Rest(2)],inf),
		\degree, Pseq([0,3,4,1,0,4,0,0],inf),
		\amp, Pseq([0.7, 0.7, 0.9, 0.5, 0.5, 0.5, 0.5, 0.5],inf),
		\mtranspose, Pseq([[0,2,4,7], [-3,-1,0,2], [0,2,4,6], [1,2,4,7], [0,2,4,7], [-2,0,2], [0,2,4,7],[0,0,0,0]], inf),
		\force, 1,
		\release, 0.5,
		\level, 0.1
	)
);

Pdef(\s1,
	Pmono(
		\strings,
		\octave, Pstutter(4,Pseq([5,4,3],inf)),
		\scale, Scale.major,
		\root, 2,
		\dur, 2,
		\degree, Pseq([5,0,3,0],inf),
		\amp, Pseq([0.7,0.6,0.5,0.4],inf),
		\mtranspose, Pseq([[0,2,4,0], [0,2,4,7], [0,2,4,7], [0,7,4,9]], inf),
		\force, 1,
		\release, 0.5,
		\level, 0.1
	)
);

//// Routine

~score = Task({

	Pdef(\d0).play;
	Pdef(\g0).play;
	Pdef(\g1).play;
	(5*4).wait;

	Pdef(\b0).play;
	Pdef(\k0).play;
	(5*4).wait;

	Pdef(\g1).stop;
	Pdef(\m0a).play;
	(6*4).wait;

	Pdef(\m0a).stop;
	Pdef(\s0).play;
	Pdef(\m0b).play;
	(6*4).wait;

	Pdef(\s0).stop;
	Pdef(\m0b).stop;
	Pdef(\b0).stop;
	(4*4).wait;

	Pdef(\b0).play;
	Pdef(\m1).play;
	(12*4).wait;

	Pdef(\m1).stop;
	Pdef(\s1).play;
	Pdef(\m2).play;
	(12*4).wait;

	Pdef(\s1).stop;
	Pdef(\m2).stop;
	4.wait;

	Pdef(\s0).play;
	Pdef(\m0b).play;
	(12*4).wait;

	Pdef(\s0).stop;
	Pdef(\m0b).stop;
	Pdef(\g1).play;
	Pdef(\g0).play;
	(10*4).wait;

	Pdef(\g0).stop;
	Pdef(\b0).stop;
	Pdef(\k0).stop;
	(5*4).wait;

	Pdef(\g1).stop;
	(2*4).wait;

	Pdef(\d0).stop;
});

~score.play;
});
)