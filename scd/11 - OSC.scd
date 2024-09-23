/*
Cómo integrar SuperCollider con el protocolo Open Sound Control (OSC), utilizando la aplicación Open Stage Control como ejemplo.

1. Introducción a OSC:
   - OSC es más rápido, flexible y preciso que MIDI.
   - Los mensajes OSC tienen una dirección de estilo URL y argumentos.
   - Se envían a través de internet usando protocolos como UDP y TCP.

2. Uso de Open Stage Control:
   - Cómo configurar y usar la aplicación Open Stage Control.
   - Cómo crear una interfaz personalizada con el editor Open Stage Control.
   - Proceso de sincronización entre el editor y la aplicación.

3. Configuración en SuperCollider:
   - Se inicia el servidor de SuperCollider.
   - Introducción al uso de OSCdef para manejar mensajes OSC.

4. Ejemplo básico de OSCdef:
*/
(
OSCdef.new(
	\button,
	{
		arg msg, time, addr, port;
		[msg, time, addr, port].postln;
	},
	'/main/button'
)
)
/*

5. Configuración de la conexión OSC en Open Stage Control:
   - Cómo establecer la dirección IP y los puertos correctos.

6. Creación de múltiples OSCdefs para diferentes controles:

*/
(
OSCdef.new(
	\button_1,
	{
		arg msg, time, addr, port;
		("button: "++msg[1]).postln;
	},
	'/button_1',
)
)

//7. Creación de un SynthDef para generar sonido:

(
SynthDef.new(\tone, {
	arg freq=40, nharm=12, detune=0.2, gate=0, pan=0, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env.adsr(0.05,0.1,0.5,3), gate);
	sig = Blip.ar(
		freq * LFNoise1.kr(0.2!16).bipolar(detune).midiratio,
		nharm
	);
	sig = sig * LFNoise1.kr(0.5!16).exprange(0.1,1);
	sig = Splay.ar(sig);
	sig = Balance2.ar(sig[0], sig[1], pan);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

//Probémoslo para asegurarnos de que todo funciona

x = Synth.new(\tone, [\gate, 1])

x.set(\freq, 150)
x.set(\pan, 0.0)
x.set(\nharm, 12)
x.set(\detune, 0.25)
x.set(\amp, 1)
x.set(\gate, 0)

//8. Modificación final de los OSCdefs para controlar el Synth:

(
OSCdef.new(
	\button1,
	{
		arg msg;
		x.set(\gate, msg[1]);
	},
	'/button_1',
);
OSCdef.new(
	\fader1,
	{
		arg msg;
		x.set(\freq, msg[1].linexp(0,1,20,400));
	},
	'/fader_1',
);
OSCdef.new(
	\fader2,
	{
		arg msg;
		x.set(\nharm, msg[1].linlin(0,1,1,50));
	},
	'/fader_2',
);
OSCdef.new(
	\fader3,
	{
		arg msg;
		x.set(\amp, msg[1].linexp(0,1,0.005,1));
	},
	'/fader_3',
);
OSCdef.new(
	\knob1,
	{
		arg msg;
		x.set(\pan, msg[1].linlin(0,1,-1,1));
	},
	'/knob_1',
);
OSCdef.new(
	\knob2,
	{
		arg msg;
		x.set(\detune, msg[1].linexp(0,1,0.01,12));
	},
	'/knob_2',
);
)