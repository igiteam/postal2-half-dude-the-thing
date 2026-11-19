class SPActorFactorySPDSoundActor extends ActorFactory
    abstract
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

var(__OnDestroyed__Delegate) /*0x025C0000-0x00000000*/ private @NULL Sound[65537];
var(__OnDestroyed__Delegate) /*0x025C0000-0x00000000*/ private float ExtraDelay[65537];
var(__OnDestroyed__Delegate) /*0x025C0000-0x00000000*/ private float FadeInTime[65537];
var(__OnDestroyed__Delegate) /*0x025C0000-0x00000000*/ private float FadeOutTime[65537];
var(__OnDestroyed__Delegate) /*0x025C0000-0x00000000*/ private bool ShowDebug[65537];

defaultproperties
{
    GameplayActorClass=Class'SPDSoundActor'
    MenuName="Add Sound Actor(Destructible)"
    NewActorClass=Class'SPDSoundActor'
}