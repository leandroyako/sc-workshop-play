//1. Inicialización de MIDI en SuperCollider:

MIDIClient.init;
MIDIIn.connectAll;

//2. Creación de MIDIdefs para responder a mensajes MIDI:
MIDIdef.noteOn(\noteOnTest, {"tecla presionada".postln});

//3. Manejo de datos MIDI (velocidad, número de nota, canal, fuente):
MIDIdef.noteOn(\noteOnTest, {
    arg vel, nn, chan, src;
    [vel, nn].postln;
});

//4. Generación de sonido simple usando MIDI:
(
MIDIdef.noteOn(\noteOnTest, {
    arg vel, nn, chan, src;
    {
        var sig, env;
        sig = LFTri.ar(nn.midicps)!2;
        env = EnvGen.kr(Env.perc, doneAction:2);
        sig = sig * env * vel.linexp(1,127,0.01,0.3);
    }.play;
});
)

//5. Creación de un SynthDef más complejo para manejar polifonía, inflexión de tono y sostenimiento:
(
SynthDef.new(\tone, {
    arg freq=440, amp=0.3, gate=0, bend=0;
    var sig, env;
    sig = LFTri.ar(freq * bend.midiratio)!2;
    env = EnvGen.kr(Env.adsr, gate, doneAction:2);
    sig = sig * env * amp;
    Out.ar(0, sig);
}).add;
)

//6. Implementación de polifonía usando un array para almacenar notas activas:
~notes = Array.newClear(128);

//7. Manejo de mensajes de nota encendida, nota apagada y pitch bend:
(
~bend = 8192;

MIDIdef.noteOn(\noteOnTest, {
	arg vel, nn, chan, src;
	[vel, nn].postln;
	~notes[nn] = Synth.new(
		\tone,
		[
			\freq, nn.midicps,
			\amp, vel.linexp(1,127,0.01,0.3),
			\bend, ~bend.linlin(0,16383,-2,2),
			\gate, 1
		]
	);
});

MIDIdef.noteOff(\noteOffTest, {
	arg vel, nn;
	[vel, nn].postln;
	~notes[nn].set(\gate, 0);
	~notes[nn] = nil;
});

MIDIdef.bend(\bendTest, {
	arg val, chan, src;
	[val, chan, src].postln;
	~bend = val;
	~notes.do{arg synth; synth.set(\bend, val.linlin(0,16383,-2,2))};
}, chan:0);
)


//El tutorial también cubre conceptos como la conversión de valores MIDI a rangos útiles para la síntesis, el manejo de canales MIDI, y sugerencias para expandir el código para incluir más controladores MIDI y efectos de sonido.

/*********** Testing **************/
m = MIDIOut(0, MIDIClient.destinations[0].uid); //especificar uid en Linux
m.noteOn(0, 60, 64);
m.bend(0, 8192);
m.noteOff(0, 60, 64);