//=============================================================================
// I3DL2Listener: Base class for I3DL2 room effects.
//=============================================================================

class I3DL2Listener extends Object
	abstract
	editinlinenew
	native;


var()			float		EnvironmentSize;
var()			float		EnvironmentDiffusion;
var()			int			Room;
var()			int			RoomHF;
var()			int			RoomLF;
var()			float		DecayTime;
var()			float		DecayHFRatio;
var()			float		DecayLFRatio;
var()			int			Reflections;
var()			float		ReflectionsDelay;
var()			vector		ReflectionsPan;
var()			int			Reverb;
var()			float		ReverbDelay;
var()			vector		ReverbPan;
var()			float		EchoTime;
var()			float		EchoDepth;
var()			float		ModulationTime;
var()			float		ModulationDepth;
var()			float		RoomRolloffFactor;
var()			float		AirAbsorptionHF;
var()			float		HFReference;
var()			float		LFReference;
var()			bool		bDecayTimeScale;
var()			bool		bReflectionsScale;
var()			bool		bReflectionsDelayScale;
var()			bool		bReverbScale;
var()			bool		bReverbDelayScale;
var()			bool		bEchoTimeScale;
var()			bool		bModulationTimeScale;
var()			bool		bDecayHFLimit;

var	transient	int			Environment;
var transient	int			Updated;


// Decompiled with UE Explorer.
defaultproperties
{
    EnvironmentSize=7.5000000
    EnvironmentDiffusion=1.0000000
    Room=-1000
    RoomHF=-100
    DecayTime=1.4900000
    DecayHFRatio=0.8300000
    DecayLFRatio=1.0000000
    Reflections=-2602
    ReflectionsDelay=0.0070000
    Reverb=200
    ReverbDelay=0.0110000
    EchoTime=0.2500000
    ModulationTime=0.2500000
    AirAbsorptionHF=-5.0000000
    HFReference=5000.0000000
    LFReference=250.0000000
    bDecayTimeScale=true
    bReflectionsScale=true
    bReflectionsDelayScale=true
    bReverbScale=true
    bReverbDelayScale=true
    bEchoTimeScale=true
    bDecayHFLimit=true
}