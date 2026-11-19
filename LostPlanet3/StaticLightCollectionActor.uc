class StaticLightCollectionActor extends Light
    config(Engine)
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array LightComponents[655361];
var(*) /*0x35EA0000-0x00000000*/ private int MaxLightComponents[1073741825];

defaultproperties
{
    MaxLightComponents=3000
    Components=none
}