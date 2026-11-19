class AnimNodePlayCustomAnim extends AnimNodeBlend
    hidecategories(Object,Object,Object,Object);

var(*) /*0x35EA0000-0x00000000*/ private bool bIsPlayingCustomAnim;
var(*) /*0x35EA0000-0x00000000*/ private float CustomPendingBlendOutTime;

// Export UAnimNodePlayCustomAnim::execPlayCustomAnim(FFrame&, void* const)
native final function PlayCustomAnim()
{
    local /*0x35EA0000-0x00000000*/ private name AnimName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Rate[8388609], BlendInTime, BlendOutTime;
    local /*0x35EA0000-0x00000000*/ private bool bLooping[9437185], bOverride;
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UAnimNodePlayCustomAnim::execPlayCustomAnimByDuration(FFrame&, void* const)
native final function PlayCustomAnimByDuration()
{
    local /*0x35EA0000-0x00000000*/ private name AnimName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Duration[8388609], BlendInTime, BlendOutTime;
    local /*0x35EA0000-0x00000000*/ private bool bLooping[9437185], bOverride;


}

// Export UAnimNodePlayCustomAnim::execStopCustomAnim(FFrame&, void* const)
native final function StopCustomAnim()
{
    local /*0x35EA0000-0x00000000*/ private float BlendOutTime[8388609];


}

final function SetCustomAnim()
{
    local /*0x35EA0000-0x00000000*/ private name AnimName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SeqNode;

    SeqNode = AnimNodeSequence(Children[1].Anim);
    // End:0x68
    if(SeqNode != none)
    {
        SeqNode.SetAnim(AnimName);
    }
    //return;    
}

final function SetActorAnimEndNotification()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewStatus[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SeqNode;

    SeqNode = AnimNodeSequence(Children[1].Anim);
    // End:0x6A
    if(SeqNode != none)
    {
        SeqNode.bCauseActorAnimEnd = bNewStatus;
    }
    //return;    
}

final function GetCustomAnimNodeSeq()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return AnimNodeSequence(Children[1].Anim);
    //return ReturnValue;    
}

final function SetRootBoneAxisOption()
{
    local /*0x35EA0000-0x00000000*/ private byte AxisX[9437185], AxisY, AxisZ;
    local /*0x35EA0000-0x00000000*/ private @NULL AnimSeq;

    0
    0
    0
    AnimSeq = GetCustomAnimNodeSeq();
    // End:0x72
    if(AnimSeq != none)
    {
        AnimSeq.super(AnimNodePlayCustomAnim).SetRootBoneAxisOption(AxisX, AxisY, AxisZ);        
    }
    //return;    
}

defaultproperties
{
    Children=/* Array type was not detected. */
    NodeName="CustomAnim"
}