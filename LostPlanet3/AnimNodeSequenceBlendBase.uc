class AnimNodeSequenceBlendBase extends AnimNodeSequence
    abstract
    hidecategories(Object,Object,Object);

struct native AnimInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private name AnimSeqName[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL AnimSeq[537001985];
    var(*) /*0x35EA0000-0x00000000*/ private int AnimLinkupIndex[537001985];

    structdefaultproperties
    {
        AnimSeqName="None"
        AnimSeq=none
        AnimLinkupIndex=0
    }
};

struct native AnimBlendInfo
{
    var(*) /*0x02AA0000-0x00000000*/ private name AnimName[65537];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL AnimInfo;
    var(*) /*0x35EA0000-0x00000000*/ private float Weight[536870913];

    structdefaultproperties
    {
        AnimName="None"
        AnimInfo=(AnimSeqName="None",AnimSeq=none,AnimLinkupIndex=0)
        Weight=0.0000000
    }
};

var(*) /*0x02A80000-0x00000400*/ private editfixedsize array Anims[4784129];

defaultproperties
{
    Anims=/* Array type was not detected. */
}