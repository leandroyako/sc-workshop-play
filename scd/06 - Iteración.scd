/*
1. Introducción a la iteración:
- La iteración es un proceso repetitivo que permite ejecutar un bloque de código múltiples veces.
- Comúnmente se usa para iterar sobre una colección de elementos.

2. Uso del método `do`:
- Ejemplo básico:
*/
[6, 4, 0.5, 10, 7].do{ "hola".postln };

//   - Con argumentos:
(
[6, 4, 0.5, 10, 7].do{
	arg item;
	item.squared.postln;
}
)
//   - Con contador:
(
[6, 4, 0.5, 10, 7].do{
	arg item, count;
	[count, item.squared].postln;
}
)

//3. Almacenamiento de resultados:

(
x = Array.newClear(5);
[6, 4, 0.5, 10, 7].do{
	arg item, count;
	x[count] = item.squared;
};
)

//4. Uso del método `collect`:

(
z = [6, 4, 0.5, 10, 7].collect{
	arg item;
	item.squared;
};
)
//   Notación abreviada:

z = [6, 4, 0.5, 10, 7].collect(_.squared);


//5. Iteración con enteros:

5.do{arg item; item.postln};


//6. Aplicación en síntesis de audio:

x = {VarSaw.ar(40!2, 0, 0.05) * 0.1}.play;
x.free;

//- Ejemplo de SynthDef con iteración:

(
SynthDef.new(\iter, {
	var temp, sum;
	sum = 0; //inicializar
	10.do{
		temp = VarSaw.ar(
			40 * {Rand(0.99,1.02)}!2,
			0,
			0.05
		);
		sum = sum + temp;
	};
	sum = sum * 0.05;
	Out.ar(0, sum);
}).add;
)

x = Synth(\iter);
x.free;
/*
7. Importancia de inicializar variables:
- Se debe inicializar `sum` para evitar errores al sumar con `nil`.

8. Mejoras en el sonido:
- Agregar envolvente, agregar argumento de frecuencia, aleatorizar la frecuencia, fase y ciclo de trabajo para obtener un sonido más rico e interesante.
*/

(
SynthDef.new(\iter, {
	arg freq=40;
	var temp, sum, env;
	env = EnvGen.kr(
		Env.perc(0.01, 5, 1, -2),
		doneAction:2
	);
	sum = 0;
	10.do{
		temp = VarSaw.ar(freq * {Rand(0.99,1.02)}!2, {Rand(0.0,1.0)}!2, {ExpRand(0.005, 0.05)}!2);
		sum = sum + temp;
	};
	sum = sum * 0.05 * env;
	Out.ar(0, sum);
}).add;
)

Synth.new(\iter, [\freq, 400]);
Synth.new(\iter, [\freq, 300]);
Synth.new(\iter, [\freq, 250]);
Synth.new(\iter, [\freq, 224]);


Synth.new(\iter, [\freq, 66.midicps]);
Synth.new(\iter, [\freq, 73.midicps]);
Synth.new(\iter, [\freq, 80.midicps]);
Synth.new(\iter, [\freq, 75.midicps]);


(
[53,59,63,68].do{
	arg midinote;
	Synth.new(\iter, [\freq, midinote.midicps]);
};
)


///////////////////

(
SynthDef.new(\iter2, {
	arg freq=200, dev=1.02;
	var temp, sum;
	sum = 0;
	10.do{
		arg count;
		temp = SinOsc.ar(
			freq *
			(count + 1) *
			LFNoise1.kr({Rand(0.05,0.2)}!2).range(dev.reciprocal, dev)
		);
		temp = temp * LFNoise1.kr({Rand(0.5,8)}!2).exprange(0.01, 1);
		sum = sum + temp;
	};
	sum = sum * 0.05;
	Out.ar(0, sum);
}).add;
)

x = Synth(\iter2);

x.set(\dev, 1.05);
x.set(\dev, 1.1);
x.set(\dev, 1.4);

x.free;

//Problemas...
(
SynthDef.new(\iter2, {
	arg freq=200, dev=1.02, num=10; //num como argumento genera un Control
	var temp, sum;
	sum = 0;
	/*
	num.class.postln; ?
	num.source.class.postln; ?
	*/
	num.do{ //no itera
		arg count;
		temp = SinOsc.ar(
			freq *
			(count + 1) *
			LFNoise1.kr({Rand(0.05,0.2)}!2).range(dev.reciprocal, dev)
		);
		temp = temp * LFNoise1.kr({Rand(0.5,8)}!2).exprange(0.01, 1);
		sum = sum + temp;
	};
	sum = sum * 0.05;
	Out.ar(0, sum);
}).add;
)

x = Synth(\iter2, [\num, 10]);
x.free;

x = Synth(\iter2, [\num, 10]);
x.set(\num, 8.7);
x.set(\num, 5.4);
x.free;

~num = 10
~num.class


{Out.ar(0, SoundIn.ar(0))}.play