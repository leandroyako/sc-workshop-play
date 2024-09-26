//Mientras completes esta tarea, sé consciente de la seguridad auditiva. Antes de ejecutar código que produzca sonido, baja el volumen del sistema al mínimo, quítate los auriculares y monitorea el nivel visual en los medidores de salida (evalúa s.meter). Luego, sube lentamente el volumen del sistema.


//Problema 1
Array.exprand(16, 100, 2000);

//Problema 2
Array.rand(16, 100, 2000);

//Problema 3
x = Array.exprand(16, 100, 2000).round(50).asInteger;

//Problema 4
x = x ++ Array.rand(4, 50, 2000, 3000).round(50);
x.size;

//Problema 5
x.plot;

//Problema 6
Array.series(12, 350, 350);

//Problema 7
Array.geom(8, 1, 0.5);

//Problema 8
x.select({|n| n % 100 == 0}).size;

//antes de continuar, inicia el servidor de audio:
s.boot;

//Problema 9
(
Array.exprand(5,200,1000).do({ |n|
	{
		var senal;
		senal = SinOsc.ar(n);
		senal = senal * 0.1;
		senal!2;
	}.play;
});
)

//Problema 10
(
x.do({|n|
	{
		var senal;
		senal = SinOsc.ar(n);
		senal = senal * 0.02;
		senal!2;
	}.play;
});
)

//Problema 11
(
x.sort.do({
	|n, i|
	{
		var senal;
		senal = SinOsc.ar(n);
		senal = senal * 0.1 * (0.75 ** i);
		senal!2;
	}.play;
});
)

//Problema de yapa
(
x = x ++ x.collect(
	{|n|
		n + rand(4.0)
	}
);

x.sort.do({
	|n, i|
	{
		var senal;
		senal = SinOsc.ar(n);
		senal = senal * 0.1 * (0.75 ** i);
		senal!2;
	}.play;
});
)