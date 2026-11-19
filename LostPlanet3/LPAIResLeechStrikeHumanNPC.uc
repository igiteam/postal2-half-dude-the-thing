class LPAIResLeechStrikeHumanNPC extends LPAIResLeechStrike within SPAIResourceManager
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
    ThePawn = LPAIPawnHumanSoldier(OuterActor);
    // End:0x101
    if((ThePawn != none) && ThePawn.TuneDataHumanSoldier != none)
    {
        TimeToTrackAccessesOver = ThePawn.TuneDataHumanSoldier.Leech_TimeToTrackStrikesOver.GetValue();
        MaxNumberOfAcceccessOverTrackedTime = ThePawn.TuneDataHumanSoldier.Leech_MaxNumberOfStrikesOverTrackedTime.GetValue();
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
