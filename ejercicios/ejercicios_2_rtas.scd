//Mientras completás esta tarea, ten cuidado con tus oídos. Antes de ejecutar código que produzca sonido, baja el volumen de tu sistema casi completamente, quítate los auriculares y monitorea el nivel visual en los medidores de salida (evalúa s.meter). Luego, sube lentamente el volumen de tu sistema.


//Problema 1
//Inicia el servidor de audio de SuperCollider.
s.boot;


//Problema 2
(
x = {
    var senal, frec, frec2, ancho; // no esaba definida freq2
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
(
x = {
	var senal, frecuencia, amplitud;
	frecuencia = LFNoise0.ar(9).exprange(40,500);
	amplitud = LFSaw.ar(9,1).range(0,1).sqrt.sqrt.neg + 1;// .range
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
	// senal = senal * 0.0;
	senal = senal!2;
}.play;
)

x.free;
// la señal se multiplicaba por 0



//Problema 5

(
x = {
	var senal;
	senal = Pulse.ar([100,101], 0.5, 0.04); // falta .ar en Pulse
	senal = senal + SinOsc.ar([150,150.6], 0, 0.15);
	senal = senal + BrownNoise.ar(0.04!2);
	senal = senal * Line.ar(0,1,10);
}.play;
)
x.free;

//Problema 6
{WhiteNoise.ar}.plot(1);

//Problema 7
{LFTri.ar(160)}.plot(4/160);

//Problema 8
{LFTri.ar(160) * Line.ar(0, 1, 4/160)}.plot(4/160);

//Problema 9
//Si creciste con un teléfono fijo en tu casa, o viste ciertas películas clásicas de terror, es posible que hayas escuchado el sonido de un teléfono que ha sido dejado descolgado durante demasiado tiempo. Es un sonido un poco perturbador: una pulsación periódica de encendido-apagado de un tono áspero de rango medio. Para aquellos que no tienen idea de lo que estoy hablando, pega este enlace en tu navegador:

//https://www.youtube.com/watch?v=KO_YErq1M-M

//Crea y reproduce una función UGen que emule este sonido. A través de un análisis de este sonido, puedo decirte que contiene las siguientes frecuencias sinusoidales: [1400,2060,2450,2600].

(
~telefono = {
	var senal, pulso;
	pulso = LFPulse.ar(5);
	senal = SinOsc.ar([1400,2060,2450,2600]);
	senal = Mix.ar(senal);
	senal * pulso !2 * 0.3;
}.play;
)
~telefono.free;


//Problema 10
//Crea y reproduce una función UGen que emule una sirena de policía. Puedes usar este video como referencia:

//https://www.youtube.com/watch?v=1G9mNBUymP8

//Experimenta con diferentes tipos de osciladores para crear el timbre, rango de tono, etc.

(
~sirena = {
    var senal, frecuencia;
    senal = SinOsc.ar(0.2).range(690, 1226);
    frecuencia = LFTri.ar(senal)!2 * 0.1;
}.play;
)
~sirena.free;

//Problema de yapa
//Quizás estés familiarizado con un tipo muy distintivo de aspersor de césped. Pega el siguiente enlace en tu navegador para ver una imagen de uno de estos aspersores:

//http://diy.sndimg.com/content/dam/images/diy/fullset/2014/2/24/0/RX-iStock-187558829_Water_Lawn_Sprinkler_h.jpg.rend.hgtvcom.616.462.suffix/1420798717602.jpeg

//Y aquí hay un video de uno de estos aspersores en acción:

//https://www.youtube.com/watch?v=-nA7kUgLykA

//Estos aspersores producen un sonido distintivo mientras funcionan: una serie rápida de ráfagas de ruido durante unos segundos, seguida de ráfagas de ruido a una frecuencia más lenta durante un período de tiempo más largo. Luego, este ciclo se repite. Aquí hay un enlace a un ejemplo de audio claro y simple del sonido en sí:

//https://uofi.box.com/s/vi5qb9h4yh2uv6mcn9dni7ienjj3p318

//Crea y reproduce una función UGen que emule este sonido. Los únicos UGens que necesitarás son WhiteNoise y LFPulse (pero posiblemente más de dos UGens en total).

(
~aspersor = {
    var velocidadAspersor, pulsoAgua, agua;
    // mul en LFPulse controla la duración del pulso (cuánto tiempo permanece encendido el pulso)
    // 82% del tiempo baja frecuencia - 7, 18% del tiempo alta frecuencia - 17
    velocidadAspersor = LFPulse.kr(0.15, 0, 0.18).range(7,17);
    // el pulso de agua vibra entre frecuencia 7 y 17
    // la duración del pulso es el 25% del ciclo
    pulsoAgua = LFPulse.kr(velocidadAspersor, 0, 0.25).range(0,0.1);
    agua = WhiteNoise.ar(pulsoAgua)!2;
}.play;
)
~aspersor.free;