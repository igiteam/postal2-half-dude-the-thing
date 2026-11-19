class LPKyTraversalFindLobSpot extends LPKyTraversalLosFromActors;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> IsThisLocationClaimedOrOccupiedByOtherKnownActorTestEvent;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __IsThisLocationClaimedOrOccupiedByOtherKnownActorTest__Delegate;

delegate IsThisLocationClaimedOrOccupiedByOtherKnownActorTest()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationToTest[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

// Export ULPKyTraversalFindLobSpot::execIsPositionClear(FFrame&, void* const)
protected native function IsPositionClear()
{
    local /*0x97E50000-0x00000000*/ private @NULL pos[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPKyTraversalFindLobSpot::execSetActorNative(FFrame&, void* const)
native function SetActorNative()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestActor[8388609];


}

// Export ULPKyTraversalFindLobSpot::execSetLosFunctionNative(FFrame&, void* const)
native final function SetLosFunctionNative()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];


}

// Export ULPKyTraversalFindLobSpot::execSetFinishCallBackNative(FFrame&, void* const)
native final function SetFinishCallBackNative()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Notify[8388609];


}

// Export ULPKyTraversalFindLobSpot::execSetIsThisLocationClaimedOrOccupiedByOtherKnownActorTestEventNative(FFrame&, void* const)
native final function SetIsThisLocationClaimedOrOccupiedByOtherKnownActorTestEventNative()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];


}

// Export ULPKyTraversalFindLobSpot::execStartAndBindToControllerNative(FFrame&, void* const)
native function StartAndBindToControllerNative()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609], StartPosiion;
    local /*0x97E50000-0x00000000*/ private float explorationRadius[8388609];


}

// Export ULPKyTraversalFindLobSpot::execPostConstructNative(FFrame&, void* const)
native function PostConstructNative();

// Export ULPKyTraversalFindLobSpot::execCreateNative(FFrame&, void* const)
native final function CreateNative()
{
    local /*0x97E50000-0x00000000*/ private @NULL InOuter[8388609], ReturnValue;


}

// Export ULPKyTraversalFindLobSpot::execIsInitializedNative(FFrame&, void* const)
native function IsInitializedNative()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

final function SetIsThisLocationClaimedOrOccupiedByOtherKnownActorTestEvent()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    IsThisLocationClaimedOrOccupiedByOtherKnownActorTestEvent = Callback;
    //return;    
}

protected function CheckLos()
{
    local /*0x97E50000-0x00000000*/ private @NULL VertexInfo[25296897], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LosTest(VertexInfo.Position, TestActor);
    //return ReturnValue;    
}

function WerePositionsUpdated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1E
    if(bBestFound && HasFinishedNormally())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event IsThisLocationNotClaimedOrOccupiedByOtherActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL pos[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2E
    if(IsThisLocationClaimedOrOccupiedByOtherKnownActorTestEvent != none)
    {
        return !IsThisLocationClaimedOrOccupiedByOtherKnownActorTest(pos);
    }
    return true;
    //return ReturnValue;    
}
