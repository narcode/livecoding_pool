s.boot;
Server.killAll;
//////////LANCE PUTNAM

play{LFSaw.ar(OnePole.ar(Mix(
LFSaw.ar([1,0.99],[0,0.6],100,2000).trunc([1000*0.midiratio,50])*[1,-1]
),0.98)).dup*0.1}


(
SynthDef(\oneLineComposition_00,{
	arg gate=1,freqA=400,freqB=600,lfoRate=1, vol1=1,vol2=0;
	var sound,env;
	env=EnvGen.ar(Env.adsr(0.01,0.3,0.5,1),gate,doneAction:2);

	sound=SinOsc.ar(OnePole.ar(Mix(LFSaw.ar([lfoRate,0.99],[0,0.6],2000,2000).trunc([freqA,freqB])*[1,-1]),0.98)).dup*0.1*vol1;
	sound=sound+(LFSaw.ar(OnePole.ar(Mix(
LFSaw.ar([lfoRate,0.99],[0,0.6],100,2000).trunc([freqA,freqB])*[1,-1]
),0.98)).dup*0.1*vol2);
	sound=sound*env;

	Out.ar([0,1],sound);
	Out.ar([3],sound);

}).send(s);
)

x=Synth(\oneLineComposition_00,[\freqA,1000,\freqB,50,\vol1,0,\vol2,1]);
x.set(\lfoRate,100.1,\freqA,100,\freqB,50,\vol1,1.0,\vol2,1.0);
~x=Synth(\oneLineComposition_00,[\freqA,1000,\freqB,50,\vol1,0,\vol2,1]);
~xxx=Synth(\oneLineComposition_00,[\freqA,1000,\freqB,50,\vol1,0,\vol2,1]);
~xxxx=Synth(\oneLineComposition_00,[\freqA,1000,\freqB,50,\vol1,0,\vol2,1]);
~xxxxxx=Synth(\oneLineComposition_00,[\freqA,1000,\freqB,50,\vol1,0,\vol2,1]);
~x.set(\lfoRate,100.1,\freqA,100,\freqB,50,\vol1,1.0,\vol2,1.0);
~xxx.set(\lfoRate,100.1,\freqA,100,\freqB,50,\vol1,1.0,\vol2,1.0);
~xxxx.set(\lfoRate,100.1,\freqA,10,\freqB,5000,\vol1,1.0,\vol2,1.0);
~xxxxxx.set(\lfoRate,100.1,\freqA,100,\freqB,50,\vol1,1.0,\vol2,1.0);
x.set(\gate,0);
~x.set(\gate,0);
~xxx.set(\gate,0);
~xxxx.set(\gate,0);
~xxxxxx.set(\gate,0);



(
SynthDef(\reverb,{
	arg gate=1;
	var sound,env;
	env=EnvGen.ar(Env.adsr(0.01,0.3,0.5,1),gate,doneAction:2);
	sound=In.ar(3,1);
	sound=FreeVerb.ar(sound,0.99,0.9,0.5,1);
	sound=sound*env;

	Out.ar([0,1],sound);

}).send(s);
)
y=Synth(\reverb);
