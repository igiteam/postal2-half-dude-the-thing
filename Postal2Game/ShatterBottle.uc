///////////////////////////////////////////////////////////////////////////////
// ShatterBottle.
//
// The first emitter is the falling glass, the second emitter is the glass
// lying on the ground.
///////////////////////////////////////////////////////////////////////////////
class ShatterBottle extends P2Emitter;

#exec TEXTURE IMPORT File=Textures\WaterSplash2.dds


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter221'
    Emitters[1]=SuperSpriteEmitter'SuperSpriteEmitter23'
    Emitters[2]=SpriteEmitter'SpriteEmitter83'
    LifeSpan=40.0000000
}