class LPAIResSepiaLobStrikePlayer extends LPAIResSepiaStrike within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function Init()
{
    super.Init();
    //return;    
}

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    super(SPAIResource).SetFromTuneData();
    ThePawn = LPBasePlayerPawn(OuterActor);
    // End:0x101
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        TimeToTrackAccessesOver = ThePawn.TuneDataBasePlayerPawn.Sepia_TimeToTrackLobStrikesOver.GetValue();
        MaxNumberOfAcceccessOverTrackedTime = ThePawn.TuneDataBasePlayerPawn.Sepia_MaxNumberOfLobStrikesOverTrackedTime.GetValue();
    }
    //return;    
}

function NotifyOfFailedStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL LoserPawn[8388609];

    NotifyOfNeedToRecycleAccess(LoserPawn);
    //return;    
}

function IsDensityOfStrikesOverTimeTooHighToAllowAnotherStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsDensityOfAccessesOverTimeTooHighToAllowAnotherAccess();
    //return ReturnValue;    
}
