class LPSM_SentinelSearch extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SearchEndTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MySentPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LaserTargetLocation;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    MySentPawn = LPAIPawnSentinel(MySPPawn);
    super.SpecialMoveStarted(bForced, PrevMove);
    SearchEndTime = MySPPawn.WorldInfo.TimeSeconds + MySentPawn.TuneDataSentinel.SearchDelay;
    // End:0x139
    if(MySentPawn.Controller.Enemy != none)
    {
        LaserTargetLocation = MySentPawn.Controller.Enemy.Location;        
    }
    else
    {
        LaserTargetLocation = LPAIControllerSentinel(MySPPawn.Controller).AssignRandomSearchNote();
    }
    LPAIControllerSentinel(MySPPawn.Controller).StartTargetLaser(LaserTargetLocation);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    LPAIControllerSentinel(MySPPawn.Controller).CleanUpSearch();
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function FoundEnemy()
{
    MySPPawn.EndSpecialMove(Class);
    LPAIControllerSentinel(MySPPawn.Controller).bFinishedSearch = true;
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentLaserSpot;

    super.Tick(DeltaTime);
    // End:0x4A
    if((MySPPawn == none) || MySPPawn.Controller == none)
    {
        return;
    }
    // End:0x290
    if(MySPPawn.WorldInfo.TimeSeconds > SearchEndTime)
    {
        // End:0x116
        if(MySPPawn.Controller.Enemy != none)
        {
            LaserTargetLocation = MySPPawn.Controller.Enemy.Location;
        }
        CurrentLaserSpot = LPAIControllerSentinel(MySPPawn.Controller).UpdateLaserPoint(LaserTargetLocation);
        MySentPawn.StemSkelControl.ControlStrength = FInterpTo(MySentPawn.StemSkelControl.ControlStrength, 1.0000000, DeltaTime, 4.0000000);
        MySentPawn.StemSkelControl.BoneRotation.Yaw = Rotator(CurrentLaserSpot - MySPPawn.Location) - MySPPawn.Rotation.Yaw;
    }
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}