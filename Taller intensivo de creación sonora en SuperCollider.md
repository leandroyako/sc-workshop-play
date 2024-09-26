![[sc.png]]
SuperCollider es un entorno y lenguaje de programación para síntesis de audio en tiempo real y composición algorítmica. Este proyecto de código abierto es muy utilizado por músicos experimentales, artistas sonoros, investigadores de audio y compositores.

#### Requisitos: 
Conocimientos básicos de audio digital. 
Preferentemente experiencia con algún lenguaje de programación.
En lo posible traer parlante (con cable miniplug) o auriculares. Si prefieren traer sus propias notebooks pueden utilizar los parlantes integrados.

#### Día 1 (4hs)
##### 1. Introducción a SuperCollider
- Qué es SuperCollider y sus aplicaciones
- Ventajas de la síntesis y composición algorítmica

[Dan Tepfer's Natural Machines](https://www.youtube.com/watch?v=YivLzr9DD3k&list=PLUzNnspxG1f5Bks6R8ckCzDSEn__psaO8&index=1)
[Benoît and the Mandelbrots @ Stadtgeburtstag Karlsruhe](https://www.youtube.com/watch?v=zeNszro5dQ8)
[Live Coding with SCTweets and hand gestures](https://www.youtube.com/watch?v=B0zgNv8c8GI)
 [Teaser: SuperCollider + Eurorack + tablas in Shanghai, 2024-07-25](https://www.youtube.com/watch?v=FvZqfO10FA4)
 [Solstice Night Stream December 2022](https://www.youtube.com/watch?v=977AbvG2s04)
 [Signes - Playmodes](https://www.playmodes.com/home/signes/)
 [Singularity - Roosna & Flak](https://roosnaflak.com/performances/singularity/)

##### 2. Configuración del entorno
- Instalación de SuperCollider
		https://supercollider.github.io/downloads
- Familiarización con la interfaz
	 ![[01 - Navegando el entorno.scd]]
##### 3. Conceptos básicos
- Sintaxis del lenguaje
	Ejercicios:
	![[ejercicios_0.scd]]
	
	![[ejercicios_1.scd]]
	
	![[ejercicios_2.scd]]
	
	![[ejercicios_3.scd]]
- Servidor de audio y cliente
	 ![[02 - Haciendo sonido.scd]]

##### 4. Generación de sonido
- Osciladores básicos (SinOsc, Saw, Pulse)
	![[03 - Synth y SynthDef.scd]]
- Envolventes (Env, EnvGen)
	 ![[04 - Envolvenes y doneAction.scd]]

##### 5. Manipulación del sonido
- Filtros (LPF, HPF, BPF)
- Efectos (reverb, delay, granulador)
	![[07 - Arquitectura del servidor.scd]]
- Buffers (PlayBuf)
	![[08 - Buffers.scd]]
#### Día 2 (4hs)
##### 6. Secuenciación y patrones
- Introducción a Patterns
- Creación de secuencias rítmicas y melódicas
	![[10 - Patterns I.scd]]

##### 7. Comunicación y control externo
- MIDI: Configuración, MIDIIn, MIDIOut
	 ![[09 - MIDI.scd]]
- OSC: Configuración, envío y recepción de mensajes
	![[11 - OSC.scd]]

##### 8. Interactividad
- Uso de GUI para controlar parámetros
- Creación de interfaces personalizadas básicas
- Práctica guiada y aplicación de conceptos
	![[14 - GUI.scd]]

##### 9. Trabajo final y repositorio público
- Introducción al trabajo final: Creación de una pieza sonora utilizando código provisto
- Explicación de los requisitos y objetivos del trabajo final
- Demostración del código base que se utilizará como punto de partida
- Instrucciones para la personalización y expansión del código
- Presentación del repositorio público donde se reunirán los trabajos
- [Guía para subir el trabajo al repositorio (uso básico de Git/GitHub)](obsidian://open?vault=supercollider-taller&file=instructivo-git)

##### 10. Recursos adicionales y cierre

- Documentación y tutoriales en línea
	- [@elifieldsteel](https://www.youtube.com/watch?v=yRzsOOiJ_p4&list=PLPYzvS8A_rTaNDweXe6PX4CXSGq4iEWYC&pp=iAQB)
	- [A Gentle Introduction To SuperCollider](https://ccrma.stanford.edu/~ruviaro/texts/A_Gentle_Introduction_To_SuperCollider.pdf)
	
- Comunidad y foros de SuperCollider
	- https://scsynth.org
	- [Discord](https://discord.gg/PVUmDyx7p8)
	- https://sccode.org/
- Revisión de los conceptos clave del taller
- Sesión de preguntas y respuestas
- Conclusión y siguientes pasos para continuar aprendiendo

Detalles adicionales sobre el trabajo final y el repositorio:

- Cada participante creará una pieza sonora de 2-3 minutos utilizando el código base proporcionado.
- El código base incluirá ejemplos de síntesis, secuenciación y efectos vistos durante el taller.
- Los participantes deberán modificar y expandir el código para crear su propia composición única.
- Se animará a los participantes a experimentar con los conceptos aprendidos durante el taller.
- El repositorio público se creará en GitHub bajo el nombre "SuperCollider-Workshop-Play".
- Cada participante creará una carpeta con su nombre en el repositorio y subirá su código final y un archivo de audio de su composición.
- Se proporcionarán instrucciones paso a paso para hacer fork del repositorio, clonar, commit y push de los cambios.
- El repositorio servirá como muestra del trabajo realizado en el taller y como recurso para futuros estudiantes.




