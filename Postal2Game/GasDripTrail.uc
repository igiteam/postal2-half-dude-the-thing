///////////////////////////////////////////////////////////////////////////////
// GasDripTrail. 
// 
// A dripping line that forms for a moment after you've sprayed a fluid along
// a 'ceiling' (anything with a negative in the normal.z. 
// This goes away pretty quickly
///////////////////////////////////////////////////////////////////////////////
class GasDripTrail extends FluidDripTrail;


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter131'
    AutoDestroy=true
}