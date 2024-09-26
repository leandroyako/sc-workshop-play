/*
1. Arquitectura de SuperCollider:
   - sclang: Lenguaje de programación e intérprete
   - scsynth: Programa de síntesis de audio en tiempo real

2. Iniciar y detener el servidor de audio:
*/
   Server.local.boot;
   Server.local.quit;

   //o
   s.boot;
   s.quit;

//3. Producir sonido básico:

   {SinOsc.ar}.play;

/*
4. Detener sonido:
   - Comando+Punto: Detiene todo el sonido
   - Método .free: Detiene un synth específico
*/
   x = {SinOsc.ar}.play;
   x.free;

/*
5. Generadores de Unidad (UGens):
   - ar: Tasa de audio (44100/48000 muestras por segundo)
   - kr: Tasa de control (64 muestras por segundo por defecto)
   - ir: Tasa de inicialización (un solo valor)

6. Ejemplos de UGens:
*/
   {Saw.ar(220)}.play;
   {Pulse.ar(220)}.play;
   {WhiteNoise.ar}.play;

//7. Modulación de frecuencia:

   {SinOsc.ar(SinOsc.kr(2, 0, 220, 440))}.play;

//8. Uso de variables para estructurar el código:
(
   {
     var modulator, sound;
     modulator = SinOsc.kr(2, 0, 220, 440);
     sound = SinOsc.ar(modulator);
     sound
   }.play;
)
//9. Herramientas útiles:
   s.scope//: Abre un osciloscopio para visualizar señales


//Documentación de ayuda: "Tour of UGens" para ver todos los UGens disponibles