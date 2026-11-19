class AnimNodeBlendByBase extends AnimNodeBlendList
    hidecategories(Object,Object,Object,Object);

enum EBaseBlendType
{
    BBT_ByActorTag,                 // 0
    BBT_ByActorClass,               // 1
    BBT_MAX                         // 2
};

var(*) /*0x02CE0000-0x00000000*/ private byte Type[65537];
var(*) /*0x02CE0000-0x00000000*/ private name ActorTag[65537];
var(*) /*0x02CE0000-0x00000000*/ private class ActorClass[65537];
var(*) /*0x02CE0000-0x00000000*/ private float BlendTime[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedBase[536870913];

defaultproperties
{
    BlendTime=0.2000000
    Children=/* Array type was not detected. */
    bFixNumChildren=true
}