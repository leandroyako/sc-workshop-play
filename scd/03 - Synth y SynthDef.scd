/*
1. SynthDef vs. Function.play:
   - SynthDef es más flexible y reutilizable que Function.play
   - Function.play es útil para pruebas rápidas

2. Creación de un SynthDef básico:
*/
(
   SynthDef.new(\sineTest, {
       arg noiseHz=8;
       var freq, amp, sig;
       freq = LFNoise0.kr(noiseHz).exprange(200,1000);
       amp = LFNoise1.kr(12).exprange(0.02,1);
       sig = SinOsc.ar(freq) * amp;
       Out.ar(0, sig);
   }).add
)

//3. Ejecución de un SynthDef:

   x = Synth.new(\sineTest);
   x.free;

//4. Configuración de argumentos al crear un Synth:

   x = Synth.new(\sineTest, [\noiseHz, 32])

//5. Actualización de argumentos de un Synth en ejecución:
   x.set(\noiseHz, 12)

//6. Ejemplo más complejo de SynthDef:

(
   SynthDef.new(\pulseTest, {
       arg fund=40, maxPartial=4;
       var sig1, sig2, freq1, freq2, amp1, amp2;
       freq1 = LFNoise0.kr(4).exprange(fund, fund * maxPartial).round(fund);
       freq2 = LFNoise0.kr(4).exprange(fund, fund * maxPartial).round(fund);
       freq1 = freq1 * LFPulse.kr(8) + 1;
       freq2 = freq2 * LFPulse.kr(6) + 1;
       amp1 = LFPulse.kr(0.5, 0, 0.05);
       amp2 = LFPulse.kr(0.7, 0, 0.05);
       sig1 = Pulse.ar(freq1) * amp1;
       sig2 = Pulse.ar(freq2) * amp2;
       Out.ar(0, sig1);
       Out.ar(1, sig2);
   }).add
)


//7. Uso del SynthDef más complejo:

   x = Synth.new(\pulseTest);
   x.set(\fund, 55, \maxPartial, 16);
   x.free;

/*
8. Conceptos clave:
   - Out.ar para enviar señales a los buses de audio
   - Uso de LFNoise0 y LFPulse para modulación
   - Redondeo de frecuencias con .round()
   - Modulación de amplitud y frecuencia
*/