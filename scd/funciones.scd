//1. Introducción a las funciones:
//- Las funciones son objetos que contienen bloques de código ejecutables.
//- Se usan para organizar y reutilizar código.

//2. Creación de funciones básicas:
(
{
	arg a, b;
	a + b;
}
)

//3. Ejecución de funciones:
(
{
	arg a, b;
	a + b;
}.value(2, 3);
)

//4. Asignación de funciones a variables:
(
var myFunction;
myFunction = {
	arg a, b;
	a + b;
};
myFunction.value(5, 7);
)

//5. Funciones para síntesis de audio:
(
var playSound;

playSound = {
	var freq, amp, env;
	freq = 440;
	amp = 0.5;
	env = Env.perc(0.01, 1);
	Out.ar(0, SinOsc.ar(freq, 0, amp) * EnvGen.kr(env, doneAction: 2));
};
playSound.value;
)

//6. Funciones con lógica compleja:
(
	var playRandomSound;

	playRandomSound = {
		var freqs, freq, amp, env;
		freqs = [220, 330, 440, 550, 660];
		freq = freqs.choose;
		amp = 0.5;
		env = Env.perc(0.01, 1);
		Out.ar(0, SinOsc.ar(freq, 0, amp) * EnvGen.kr(env, doneAction: 2));
	};

	playRandomSound.value;
)


//7. Funciones para procesos repetitivos:

(
	var playNoteSequence;

	playNoteSequence = Routine{
		var notes, note, amp, env;
		notes = [220, 330, 440, 550, 660];
		notes.do { |freq|
			amp = 0.5;
			env = Env.perc(0.01, 0.3);
			Out.ar(0, SinOsc.ar(freq, 0, amp) * EnvGen.kr(env, doneAction: 2));
			0.5.wait;
		};
	};

	playNoteSequence.play;
)

//8. Funciones recursivas:
(
var recursiveSound;

recursiveSound = {
	var freq, amp, env;
	freq = 440;
	amp = 0.5;
	env = Env.perc(0.01, 0.5);
	Out.ar(0, SinOsc.ar(freq, 0, amp) * EnvGen.kr(env, doneAction: 2));
	(0.5 + 0.5.rand).wait;
	recursiveSound.value;
};

recursiveSound.value;
)