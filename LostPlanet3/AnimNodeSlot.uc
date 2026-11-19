class AnimNodeSlot extends AnimNodeBlendBase
    hidecategories(Object,Object,Object,Object);

var(*) /*0x35EA0000-0x00000000*/ private bool bIsPlayingCustomAnim[131073];
var(*) /*0x02E50000-0x00000000*/ private bool bEarlyAnimEndNotify[65537];
var(*) /*0x02E50000-0x00000000*/ private bool bSkipBlendWhenNotRendered[65537];
var(*) /*0x02E50000-0x00000000*/ private bool bAdditiveAnimationsOverrideSource[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsBeingUsedByInterpGroup[537001985];
var(*) /*0x02E50000-0x00000000*/ private bool bDontAddToAlwaysTickArray[65537];
var(*) /*0x02E50000-0x00000000*/ private bool bDontStopOnMissingAnimation[65537];
var(*) /*0x35EA0000-0x00000000*/ private float PendingBlendOutTime[131073];
var(*) /*0x35EA0000-0x00000000*/ private int CustomChildIndex[131073];
var(*) /*0x35EA0000-0x00000000*/ private int TargetChildIndex[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TargetWeight;
var(*) /*0x35EA0000-0x00000000*/ private float BlendTimeToGo[131073];

// Export UAnimNodeSlot::execPlayCustomAnim(FFrame&, void* const)
native function PlayCustomAnim()
{
    local /*0x35EA0000-0x00000000*/ private name AnimName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Rate[8388609], BlendInTime, BlendOutTime;
    local /*0x35EA0000-0x00000000*/ private bool bLooping[9437185], bOverride;
    local /*0x35EA0000-0x00000000*/ private float StartTime[9437185], EndTime, ReturnValue;


}

// Export UAnimNodeSlot::execPlayCustomAnimByDuration(FFrame&, void* const)
native function PlayCustomAnimByDuration()
{
    local /*0x35EA0000-0x00000000*/ private name AnimName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Duration[8388609], BlendInTime, BlendOutTime;
    local /*0x35EA0000-0x00000000*/ private bool bLooping[9437185], bOverride, ReturnValue;

    true                                
}

// Export UAnimNodeSlot::execGetPlayedAnimation(FFrame&, void* const)
native final function GetPlayedAnimation()
{
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];


}

// Export UAnimNodeSlot::execStopCustomAnim(FFrame&, void* const)
native function StopCustomAnim()
{
    local /*0x35EA0000-0x00000000*/ private float BlendOutTime[8388609];


}

// Export UAnimNodeSlot::execSetAllowPauseAnims(FFrame&, void* const)
native final function SetAllowPauseAnims()
{
    local /*0x35EA0000-0x00000000*/ private bool bSet[8388609];


}

// Export UAnimNodeSlot::execSetCustomAnim(FFrame&, void* const)
native function SetCustomAnim()
{
    local /*0x35EA0000-0x00000000*/ private name AnimName[8388609];


}

// Export UAnimNodeSlot::execSetActorAnimEndNotification(FFrame&, void* const)
native final function SetActorAnimEndNotification()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewStatus[8388609];


}

// Export UAnimNodeSlot::execGetCustomAnimNodeSeq(FFrame&, void* const)
native function GetCustomAnimNodeSeq()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UAnimNodeSlot::execSetRootBoneAxisOption(FFrame&, void* const)
native final function SetRootBoneAxisOption()
{
    local /*0x35EA0000-0x00000000*/ private byte AxisX[9437185], AxisY, AxisZ;

    0
    0
    0                    
}

// Export UAnimNodeSlot::execSetRootBoneRotationOption(FFrame&, void* const)
native final function SetRootBoneRotationOption()
{
    local /*0x35EA0000-0x00000000*/ private byte AxisX[9437185], AxisY, AxisZ;

    0
    0
    0                    
}

// Export UAnimNodeSlot::execTickChildWeights(FFrame&, void* const)
native final function TickChildWeights()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaSeconds[8388609];


}

defaultproperties
{
    bEarlyAnimEndNotify=true
    TargetWeight=/* Array type was not detected. */
    Children=/* Array type was not detected. */
    NodeName="SlotName"
}