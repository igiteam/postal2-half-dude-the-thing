///////////////////////////////////////////////////////////////////////////////
// UrineDripTrail. 
// 
// A dripping line that forms for a moment after you've sprayed a fluid along
// a 'ceiling' (anything with a negative in the normal.z. 
// This goes away pretty quickly
///////////////////////////////////////////////////////////////////////////////
class UrineDripTrail extends FluidDripTrail;


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter161'
    AutoDestroy=true
    LifeSpan=5.0000000
}