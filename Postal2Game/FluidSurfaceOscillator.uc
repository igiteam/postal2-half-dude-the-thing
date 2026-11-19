//=============================================================================
// FluidSurfaceOscillator.
//=============================================================================
class FluidSurfaceOscillator extends Actor
	native
	placeable;


#exec Texture Import File=Textures\FluidSurfaceOscillator.bmp Name=S_FluidSurfaceOscillator Mips=Off MASKED=1

// FluidSurface to oscillate
var() edfindable FluidSurfaceInfo	FluidInfo;
var() float							Frequency;
var() byte							Phase;
var() float							Strength;
var() float							Radius;

var transient const float			OscTime;


// Decompiled with UE Explorer.
defaultproperties
{
    Frequency=1.0000000
    Strength=10.0000000
    bHidden=true
    Texture=Texture'S_FluidSurfaceOscillator'
    DrawScale=0.2500000
}