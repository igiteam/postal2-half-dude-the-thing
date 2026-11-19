class SPActorFactorySPDLightActor extends ActorFactoryLight
    abstract
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Object);

var(__OnDestroyed__Delegate) /*0x01880000-0x00000000*/ private float Brightness[65537];
var(__OnDestroyed__Delegate) /*0x01880000-0x00000000*/ private @NULL LightColor[65537];
var(__OnDestroyed__Delegate) /*0x01880000-0x00000000*/ private float LightRadius[65537];
var(__OnDestroyed__Delegate) /*0x01880000-0x00000000*/ private float FadeDownTime[65537];

defaultproperties
{
    Brightness=1.0000000
    LightColor=(R=255,G=255,B=255,A=0)
    LightRadius=200.0000000
    MenuName="Add Light Actor(Destructible)"
    NewActorClass=Class'SPDLightActor'
}