//=============================================================================
// Feeder to be dripping off of roofs and ledges where a stream led up to.
//=============================================================================
class BloodDripFeeder extends FluidDripFeeder;


// Decompiled with UE Explorer.
defaultproperties
{
    QuantityPerHit=8.0000000
    SplashClass=Class'BloodSplashEmitter'
    TrailClass=Class'BloodTrail'
    TrailStarterClass=Class'BloodTrailStarter'
    PuddleClass=Class'BloodPuddle'
    MyType=3
    Quantity=20.0000000
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter123'
    Emitters[1]=SuperSpriteEmitter'SuperSpriteEmitter124'
    AutoDestroy=true
    bCollideActors=true
}