/*
1. EnvGen y Env:
- EnvGen es una herramienta para generación de envolventes
- Permite el uso de envolventes con puntos de quiebre (Env)
- Incluye un argumento de puerta (gate) para mantener y reactivar envolventes

2. Creación básica de Env:
*/
Env.new.plot

/*
3. Argumentos principales de Env.new:
- levels: array de valores que EnvGen producirá
- times: array de tiempos entre niveles
- curve: determina la interpolación entre puntos

4. Ejemplo de Env personalizado:
*/
Env.new([0,1,0.1,0],[0.5,1,2]).plot;

/*
5. Interpolación exponencial:
*/
Env.new([0.01,1,0.1,0.01],[0.5,1,2], \exp).plot;
/*
6. Curvaturas específicas:
*/
Env.new([0,1,0.1,0], [0.5,1,2], [3,-3,0]).plot;
/*
7. Uso de EnvGen con t_gate para reactivación:
*/
(
x = {
	arg t_gate=1;
	var sig, env;
	env = EnvGen.kr(Env.new([0,1,0.1,0], [0.5,1,2], [3,-3,0]), t_gate);
	sig = Pulse.ar(LFPulse.kr(8).range(600,900)) * env;
}.play
)
/*
8. Ejemplos de SynthDef con EnvGen:
- Ataque rápido y caída lenta:
*/
(
SynthDef.new(\sineEnv, {
	var env, sig;
	env = EnvGen.ar(Env.new([0, 1, 0], [0.01, 1]), doneAction: 2);
	sig = SinOsc.ar(440) * env;
	Out.ar(0, sig);
}).add;
)
x = Synth.new(\sineEnv);

//   - Ataque lento y caída rápida:
(
	SynthDef.new(\sineEnv, {
		var env, sig;
		env = EnvGen.ar(Env.new([0, 1, 0], [1, 0.01]), doneAction: 2);
		sig = SinOsc.ar(440) * env;
		Out.ar(0, sig);
	}).add;
)
x = Synth.new(\sineEnv);

//   - Ciclo de ataque y liberación:
(
	SynthDef.new(\sineEnv, {
		var env, sig;
		env = EnvGen.ar(Env.new([0, 1, 0.5, 0], [0.01, 0.5, 0.5]), doneAction: 2);
		sig = SinOsc.ar(440) * env;
		Out.ar(0, sig);
	}).add;
)
x = Synth.new(\sineEnv);

//9. Uso del argumento gate para control de tiempo:
(
	SynthDef.new(\sineEnv, {
		arg dur=2, gate=1;
		var env, sig;
		env = EnvGen.ar(Env.new([0, 1, 0], [0.01, 1]), gate: gate, doneAction: 2);
		sig = SinOsc.ar(440) * env;
		Out.ar(0, sig);
	}).add;
)
x = Synth.new(\sineEnv);
x.set(\gate, 0);  // Termina el Synth