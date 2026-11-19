//=====================================================================================
// MuzzleFlash_SawnOff
// Created by Man Chrzan for xPatch 2.0
//
// Special emitter for Sawn-Off, with 2 particles.
// (MaxParticles is a const so it can't be setup through weapon, sadly)
//=====================================================================================
class MuzzleFlash_SawnOff extends xMuzzleFlashEmitter;


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitterSawnOff'
    Emitters[1]=SpriteEmitter'SpriteEmitter348'
    Emitters[2]=SpriteEmitter'SpriteEmitter349'
    AutoDestroy=true
}