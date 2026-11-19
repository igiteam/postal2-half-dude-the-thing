class LPAIResLocation extends SPAIResLocation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

// Export ULPAIResLocation::execIsVitalSuitAtLocation(FFrame&, void* const)
private native static final function IsVitalSuitAtLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609], InLocation;
    local /*0x97E50000-0x00000000*/ private float Radius[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResLocation::execIsValidLocationExtraChecksStatic(FFrame&, void* const)
native static function IsValidLocationExtraChecksStatic()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609], InAttributes, InWorldPos;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

static event @NULL ShouldBlockdLosStatic()
{
    local /*0x97E50000-0x00000000*/ private @NULL Blocker[8388609], AIResourceManager, InAttributes, InWorldPos, LosFrom, LosTo;

    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x62
    if((LPBaseVSPlayerPawn(Blocker) == none) && super.ShouldBlockdLosStatic(Blocker, AIResourceManager, InAttributes, InWorldPos, LosFrom, LosTo))
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}
