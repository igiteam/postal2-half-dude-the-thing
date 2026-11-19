class LPAIResSepiaStrike extends SPAIResourceDensityControlled within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function Init()
{
    super.Init();
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

defaultproperties
{
    TimeToTrackAccessesOver=5.0000000
    MaxNumberOfAcceccessOverTrackedTime=2.0000000
    AdHocTeamAccessToHoldAccessOnToWhileBeingUsedName="strike"
    UniqueName="SepiaStrike"
    MaxUsers=20
}