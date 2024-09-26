//Mientras completás esta tarea, ten cuidado con tus oídos. Antes de ejecutar código que produzca sonido, baja el volumen de tu sistema casi completamente, quítate los auriculares y monitorea el nivel visual en los medidores de salida (evalúa s.meter). Luego, sube lentamente el volumen de tu sistema.


//Problema 1
//Inicia el servidor de audio de SuperCollider.


//Problema 2
//El siguiente código produce un error. Evalúa el código y estudia el mensaje de error en la ventana de publicación. Corrige el error y añade un comentario indicando cuál era el problema.

(
x = {
    var senal, frec, ancho;
    frec = LFSaw.ar(1/5,1).exprange(200,1500);
    frec2 = LFNoise0.ar(40!2).range(1,100);
    frec = (frec + frec2).round(50);
    ancho = LFTri.ar(0.2).exprange(0.02,0.5);
	senal = VarSaw.ar(frec, 0, ancho, 0.05);
	senal!2;
}.play;
)
x.free;


//Problema 3
//El siguiente código produce un error. Evalúa el código y estudia el mensaje de error en la ventana de salida. Corrige el error y añade un comentario indicando cuál fue el problema.

(
x = {
	var senal, frecuencia, amplitud;
	frecuencia = LFNoise0.ar(9).exprange(40,500);
	amplitud = LFSaw.ar(9,1),range(0,1).sqrt.sqrt.neg + 1;
	senal = SinOsc.ar(frecuencia, 0, 0.2) * amplitud;
	senal!2;
}.play;
)
x.free;

//Problema 4

(
x = {
	var senal, ruidoHz;
	ruidoHz = LFNoise1.ar(10).exprange(100,5000);
	senal = LFDNoise1.ar(ruidoHz, 0.08);
	senal = senal * 0.0;
	senal = senal!2;
}.play;
)
x.free;


//Problema 5
//El siguiente código no produce un error, pero falla al generar sonido. Corrige el error y añade un comentario indicando cuál fue el problema.

(
x = {
	var senal;
	senal = Pulse([100,101], 0.5, 0.04);
	senal = senal + SinOsc.ar([150,150.6], 0, 0.15);
	senal = senal + BrownNoise.ar(0.04!2);
	senal = senal * Line.ar(0,1,10);
}.play;
)
x.free;


//Problema 6
//Usa el método plot para graficar la forma de onda de un segundo de ruido blanco.


//Problema 7
//Usa el método plot para graficar exactamente 4 ciclos completos de una onda triangular que tiene una frecuencia de 160 Hz.


//Problema 8
//Modifica la gráfica del problema anterior para que la amplitud general de la onda triangular aumente de 0 a 1 durante el transcurso de la gráfica.

//Problema 9
//Si creciste con un teléfono fijo en tu casa, o viste ciertas películas clásicas de terror, es posible que hayas escuchado el sonido de un teléfono que ha sido dejado descolgado durante demasiado tiempo. Es un sonido un poco perturbador: una pulsación periódica de encendido-apagado de un tono áspero de rango medio. Para aquellos que no tienen idea de lo que estoy hablando, pega este enlace en tu navegador:

//https://www.youtube.com/watch?v=KO_YErq1M-M

//Crea y reproduce una función UGen que emule este sonido. A través de un análisis de este sonido, puedo decirte que contiene las siguientes frecuencias sinusoidales: [1400,2060,2450,2600].



//Problema 10
//Crea y reproduce una función UGen que emule una sirena de policía. Puedes usar este video como referencia:

//https://www.youtube.com/watch?v=1G9mNBUymP8

//Experimenta con diferentes tipos de osciladores para crear el timbre, rango de tono, etc.





//Problema de yapa
//Quizás estés familiarizado con un tipo muy distintivo de aspersor de césped. Pega el siguiente enlace en tu navegador para ver una imagen de uno de estos aspersores:

//http://diy.sndimg.com/content/dam/images/diy/fullset/2014/2/24/0/RX-iStock-187558829_Water_Lawn_Sprinkler_h.jpg.rend.hgtvcom.616.462.suffix/1420798717602.jpeg

//Y aquí hay un video de uno de estos aspersores en acción:

//https://www.youtube.com/watch?v=-nA7kUgLykA

//Estos aspersores producen un sonido distintivo mientras funcionan: una serie rápida de ráfagas de ruido durante unos segundos, seguida de ráfagas de ruido a una frecuencia más lenta durante un período de tiempo más largo. Luego, este ciclo se repite. Aquí hay un enlace a un ejemplo de audio claro y simple del sonido en sí:

//https://uofi.box.com/s/vi5qb9h4yh2uv6mcn9dni7ienjj3p318

//Crea y reproduce una función UGen que emule este sonido. Los únicos UGens que necesitarás son WhiteNoise y LFPulse (pero posiblemente más de dos UGens en total).