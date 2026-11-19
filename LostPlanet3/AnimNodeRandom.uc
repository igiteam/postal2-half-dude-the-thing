class AnimNodeRandom extends AnimNodeBlendList
    hidecategories(Object,Object,Object,Object,Object);

struct native RandomAnimInfo
{
    var(*) /*0x3F990000-0x00000000*/ private float Chance[65537];
    var(*) /*0x3F990000-0x00000000*/ private byte LoopCountMin[65537];
    var(*) /*0x3F990000-0x00000000*/ private byte LoopCountMax[65537];
    var(*) /*0x3F990000-0x00000000*/ private float BlendInTime[65537];
    var(*) /*0x3F990000-0x00000000*/ private @NULL PlayRateRange[65537];
    var(*) /*0x3F990000-0x00000000*/ private bool bStillFrame[65537];
    var(*) /*0x35EA0000-0x00000000*/ private byte LoopCount[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private float LastPosition[536870913];

    structdefaultproperties
    {
        Chance=1.0000000
        LoopCountMin=0
        LoopCountMax=0
        BlendInTime=0.2500000
        PlayRateRange=(X=1.0000000,Y=1.0000000)
        bStillFrame=false
        LoopCount=0
        LastPosition=0.0000000
    }
};

var(*) /*0x02DD0000-0x00000400*/ private editfixedsize array RandomInfo[4259841];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PlayingSeqNode[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int PendingChildIndex[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bPickedPendingChildIndex[536870913];

defaultproperties
{
    PendingChildIndex=-1
    ActiveChildIndex=-1
}