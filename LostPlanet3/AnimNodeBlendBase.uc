class AnimNodeBlendBase extends AnimNode
    abstract
    hidecategories(Object,Object,Object);

struct native AnimBlendChild
{
    var(*) /*0x02A90000-0x00000000*/ private name Name[65537];
    var(*) /*0x35EA0000-0x00000400*/ private editfixedsize @NULL Anim[524289];
    var(*) /*0x35EA0000-0x00000000*/ private float Weight;
    var(*) /*0x35EA0000-0x00000000*/ private float BlendWeight[537001985];
    var(*) /*0x35EA0000-0x00000000*/ private bool bMirrorSkeleton;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsAdditive;
    var(*) /*0x35EA0000-0x00000000*/ private int DrawY;

    structdefaultproperties
    {
        Name="None"
        Anim=none
        Weight=0.0000000
        BlendWeight=0.0000000
        bMirrorSkeleton=false
        bIsAdditive=false
        DrawY=0
    }
};

var(*) /*0x35EA0000-0x00000400*/ private editfixedsize array Children[4718593];
var(*) /*0x35EA0000-0x00000000*/ private bool bFixNumChildren;
var(*) /*0x02CD0000-0x00000000*/ private byte BlendType[65537];

// Export UAnimNodeBlendBase::execPlayAnim(FFrame&, void* const)
native function PlayAnim()
{
    local /*0x35EA0000-0x00000000*/ private bool bLoop[9437185];
    local /*0x35EA0000-0x00000000*/ private float Rate[9437185], StartTime;

    false
    1.0000000
    0.0000000                    
}

// Export UAnimNodeBlendBase::execStopAnim(FFrame&, void* const)
native function StopAnim();

// Export UAnimNodeBlendBase::execReplayAnim(FFrame&, void* const)
native function ReplayAnim();
