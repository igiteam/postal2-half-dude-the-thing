class SPDAction_Decal extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x026B0000-0x00000000*/ private float Radius[65537];
var(__OnDestroyed__Delegate) /*0x026B0000-0x00000000*/ private float Height[65537];
var(__OnDestroyed__Delegate) /*0x026B0000-0x00000000*/ private @NULL MaterialToUse[65537];
var(__OnDestroyed__Delegate) /*0x026B0000-0x00000000*/ private float LifeSpan[65537];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private int SortOrder;

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x01C00000-0x00000000*/ private @NULL DecalCreateInfo;

    DecalCreateInfo.Radius = Radius;
    DecalCreateInfo.Height = Height;
    DecalCreateInfo.Material = MaterialToUse;
    DecalCreateInfo.LifeSpan = LifeSpan;
    DecalCreateInfo.SortOrder = ++SortOrder;
    DecalCreateInfo.bForceDynamicRenderElement = true;
    Class'SPDDecal'.static.CreateInstance(Actor, DecalCreateInfo, Actor.Location);
    return 1;
    //return ReturnValue;    
}
