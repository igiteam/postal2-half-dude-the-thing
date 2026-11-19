class SPActorFactorySPDImpulseActor extends ActorFactory
    abstract
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

var(__OnDestroyed__Delegate) /*0x02590000-0x00000000*/ private @NULL bAutoFire[65537];
var(__OnDestroyed__Delegate) /*0x02590000-0x00000000*/ private @NULL bAutoDestroy[65537];
var(__OnDestroyed__Delegate) /*0x02590000-0x00000000*/ private byte ImpulseFalloff[65537];
var(__OnDestroyed__Delegate) /*0x02590000-0x00000000*/ private float ImpulseStrength[65537];
var(__OnDestroyed__Delegate) /*0x02590000-0x00000000*/ private float ImpulseRadius[65537];
var(__OnDestroyed__Delegate) /*0x02590000-0x00000000*/ private bool bVelChange[65537];
var(__OnDestroyed__Delegate) /*0x02590000-0x00000000*/ private bool bCauseFracture[65537];

defaultproperties
{
    GameplayActorClass=Class'SPDImpulseActor'
    MenuName="Add Impulse Actor(Destructible)"
    NewActorClass=Class'SPDImpulseActor'
}