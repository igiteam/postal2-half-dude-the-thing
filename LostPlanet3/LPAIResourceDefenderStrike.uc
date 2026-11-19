class LPAIResourceDefenderStrike extends SPAIResource within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeSinceLastStrikeStart_WithCarrier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeSinceLastStrikeEnd_WithCarrier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeSinceLastStrikeStart_NoCarrier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeSinceLastStrikeEnd_NoCarrier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastAccessGivenTime[536870913];

// Export ULPAIResourceDefenderStrike::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    super.SetFromTuneData();
    ThePawn = LPBasePlayerPawn(OuterActor);
    // End:0x14F
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        MinTimeSinceLastStrikeStart_WithCarrier = ThePawn.TuneDataBasePlayerPawn.Defender_TimeSinceLastStrikeStart_WithCarrier;
        MinTimeSinceLastStrikeEnd_WithCarrier = ThePawn.TuneDataBasePlayerPawn.Defender_TimeSinceLastStrikeEnd_WithCarrier;
        MinTimeSinceLastStrikeStart_NoCarrier = ThePawn.TuneDataBasePlayerPawn.Defender_TimeSinceLastStrikeStart_NoCarrier;
        MinTimeSinceLastStrikeEnd_NoCarrier = ThePawn.TuneDataBasePlayerPawn.Defender_TimeSinceLastStrikeEnd_NoCarrier;
    }
    //return;    
}

defaultproperties
{
    UniqueName="DefenderStrike"
}