////////////////////////////////////////////////////////
/////// OORSPRONG AMSTERDAM - NOVEMBER 23 * 2015 \\\\\\\
////////////////////////////////////////////////////////

///////// FREEESTYLE LIVECODING \\\\\\\\\\\\

Ndef(\n, {}).play

Ndef(\n).fadeTime_(1);

// first sound:
/// add a routine here:
Tdef(\n, {
	loop{
		Ndef(\n, {SinOsc.ar([190, 130]*Line.kr([1, 3/2].choose, [3/2, 6/5].choose, [0.2, 2].choose)) * 0.3 * LFPulse.kr(4).range(0.1, 0.7)}).play(0,2);
		4.wait;
	}
}).play;


Tdef(\n).stop;
Ndef(\n).stop(4);

// sound 2, sporadic:

// ok make it routine:

Tdef(\a, {
loop{
		Ndef(\a, {LPF.ar(WhiteNoise.ar(1), [800, 500, 1234, 2345].choose) * EnvGen.kr(Env.perc(5, 0.01))}).play(0,2);
		([3, 3, 1].choose).wait;
	}
}).play;

Tdef(\a).stop;

/// clone of the routine:

// make the sound better:
Tdef(\b, {
	x = Pseq([8, 2], inf).asStream;
loop{
		Ndef(\r, {SinOsc.ar(["c1".namecps*LFTri.kr(1/6).range(1, 8), "c1".namecps*LFPulse.kr(2).range(1, 4/3)], mul: 0.4)+LPF.ar(WhiteNoise.ar(1), [800, 500, 234, 475].choose) * x.next * EnvGen.kr(Env.perc(0.01, 0.1))}).play(0,2);
		(1/2).wait;
	}
}).play;

Ndef(\n , {LPF.ar(WhiteNoise.ar(0.7), LFTri.kr(1/4).range(100, 2345))*0.1}).play;




Tdef(\b).stop

/// lets add an fx for my laptop mic:
/// shit, will not work...
/// back to my sounds.





