//Batuhan Bozkurt (refactored by Charles Celeste Hutchins)
f={|t|Pbind(\note,Pseq([-1,1,6,8,9,1,-1,8,6,1,9,8]+5,319),\dur,t)};Ptpar([0,f.(1/6),12,f.(0.1672)],1).play//#supercollider reich RT @earslap