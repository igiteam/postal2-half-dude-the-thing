class SoundNodeLooping extends SoundNode
    editinlinenew
    hidecategories(Object,Object);

var(*) /*0x2FFA0000-0x00000000*/ private bool bLoopIndefinitely[65537];
var(*) /*0x2FFA0000-0x00000000*/ private float LoopCountMin[65537];
var(*) /*0x2FFA0000-0x00000000*/ private float LoopCountMax[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export transient @NULL LoopCount;

defaultproperties
{
    bLoopIndefinitely=true
    LoopCountMin=1000000.0000000
    LoopCountMax=1000000.0000000
}