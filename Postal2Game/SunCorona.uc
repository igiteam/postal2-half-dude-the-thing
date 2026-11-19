///////////////////////////////////////////////////////////////////////////////
// SunCorona
// Copyright 2015, Running With Scissors, Inc. All Rights Reserved.
//
// Rewrite of RevStudios sunlight code
///////////////////////////////////////////////////////////////////////////////
class SunCorona extends Info
	native
	placeable
	showcategories(Movement);
	
	
///////////////////////////////////////////////////////////////////////////////
// Vars, consts, enums, etc.
///////////////////////////////////////////////////////////////////////////////
struct LensFlare
{
	var() Material Texture;						// Texture of this corona
	var() float Size;							// Size of this corona
	var() float Dist;							// Distance of this corona along the "sun line" from the player to the main sun (1.0 = main sun, 0.0 = at player)
	var Actor Sun;								// Corona-drawing light actor
};

var() array<LensFlare> Coronas;					// List of sun coronas to render
var() float SunDist;							// Distance of main sun corona from player viewpoint
var() bool bActive;								// True if we should render our coronas

///////////////////////////////////////////////////////////////////////////////
// Set up our sun coronas
///////////////////////////////////////////////////////////////////////////////
event PostBeginPlay()
{
	local int i;
	
	Super.PostBeginPlay();
	for (i = 0; i < Coronas.Length; i++)
	{
		Coronas[i].Sun = Spawn(class'RawActor');
		Coronas[i].Sun.bStasis = false;
		Coronas[i].Sun.Style = STY_None;
		Coronas[i].Sun.LightHue = 255;
		Coronas[i].Sun.LightSaturation = 255;
		Coronas[i].Sun.bCorona = true;
		Coronas[i].Sun.Skins[0] = Coronas[i].Texture;
		Coronas[i].Sun.SetDrawScale(Coronas[i].Size);
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    SunDist=2000.0000000
    bActive=true
    Texture=Texture'PostEd.Icons_256.Sunlight'
    DrawScale=0.2500000
    bDirectional=true
}