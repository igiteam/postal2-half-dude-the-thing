class LPAICmdStatus_FlyRamAndExplodeAttack extends LPAICmdStatus_Objective
    editinlinenew;

enum eFlyRamAndExplodeAttack_Status
{
    FlyRamAndExplodeAttack_Status_None,// 0
    FlyRamAndExplodeAttack_Status_StartedAnnounce,// 1
    FlyRamAndExplodeAttack_Status_StartedFlyIn,// 2
    FlyRamAndExplodeAttack_Status_StruckTheTarget,// 3
    FlyRamAndExplodeAttack_Status_StruckPawnOtherThenTheTarget,// 4
    FlyRamAndExplodeAttack_Status_StruckBlockingObject,// 5
    FlyRamAndExplodeAttack_Status_EndedStruckNothingOfNote,// 6
    FlyRamAndExplodeAttack_Status_WaitingToBlowUp,// 7
    FlyRamAndExplodeAttack_Status_BlowingUp,// 8
    FlyRamAndExplodeAttack_Status_DoneUp,// 9
    FlyRamAndExplodeAttack_Status_MAX// 10
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PawnTryingToHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetHeight[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EndOfRamPointChosen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Cmd_Ram_Status[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRamAttackDodgeWindowOpen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRamInteruptedBecauseOfExplosion[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRecoveringAfterFailedStrikedFinsihed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGettingKnockedBackAfterHittingUnmovableObject[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ControllerShowingDodgeMessageTo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL DodgeMessage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL PawnsHitDuringRam[536870913];

function SetDefaults()
{
    super.SetDefaults();
    Cmd_Ram_Status = 0;
    bRamAttackDodgeWindowOpen = false;
    ControllerShowingDodgeMessageTo = none;
    bRamInteruptedBecauseOfExplosion = false;
    PawnTryingToHit = none;
    TargetRadius = -1.0000000;
    TargetHeight = -1.0000000;
    bRecoveringAfterFailedStrikedFinsihed = false;
    bGettingKnockedBackAfterHittingUnmovableObject = false;
    Class'LPAIUtils'.static.EmptyHitList(PawnsHitDuringRam);
    EndOfRamPointChosen = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function Clear()
{
    Cmd_Ram_Status = 0;
    bRamAttackDodgeWindowOpen = false;
    ControllerShowingDodgeMessageTo = none;
    bRamInteruptedBecauseOfExplosion = false;
    PawnTryingToHit = none;
    TargetRadius = -1.0000000;
    TargetHeight = -1.0000000;
    bRecoveringAfterFailedStrikedFinsihed = false;
    bGettingKnockedBackAfterHittingUnmovableObject = false;
    Class'LPAIUtils'.static.EmptyHitList(PawnsHitDuringRam);
    EndOfRamPointChosen = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function StartingRamAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChargeTarget[8388609];

    SetDefaults();
    Class'LPAIUtils'.static.EmptyHitList(PawnsHitDuringRam);
    PawnTryingToHit = ChargeTarget;
    //return;    
}

function StartingRamStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChargeTarget[8388609], TargetPoint;

    Cmd_Ram_Status = 2;
    SetTarget(ChargeTarget);
    EndOfRamPointChosen = TargetPoint;
    //return;    
}

final function GetCmd_Ram_Status()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return Cmd_Ram_Status;
    //return ReturnValue;    
}

function SetChargeInteruptedBecauseOfExplosion()
{
    bRamInteruptedBecauseOfExplosion = true;
    //return;    
}

function WasTheChargeInteruptedBecauseOfExplosion()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bRamInteruptedBecauseOfExplosion;
    //return ReturnValue;    
}

function NotifyStruckPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnHit[8388609];

    Class'LPAIUtils'.static.AddPawnHit(PawnHit, PawnsHitDuringRam);
    // End:0x7E
    if((PawnHit == PawnTryingToHit) || PawnHit.IsHumanControlled())
    {
        Cmd_Ram_Status = 3;        
    }
    else
    {
        // End:0x9E
        if(int(Cmd_Ram_Status) != int(3))
        {
            Cmd_Ram_Status = 4;
        }
    }
    //return;    
}

function StartingAttackAnnounce()
{
    Cmd_Ram_Status = 1;
    //return;    
}

function WasTargetSuccessfullyStruck()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return int(Cmd_Ram_Status) == int(3);
    //return ReturnValue;    
}

function WasNothingHitDuringCharge()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x36
    if((PawnsHitDuringRam.PawnsHit.Length == 0) && !WasBlockingObjectStruck())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function WasBlockingObjectStruck()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return int(Cmd_Ram_Status) == int(5);
    //return ReturnValue;    
}

function NotifyStruckBlockingObject()
{
    Cmd_Ram_Status = 5;
    //return;    
}

function GetEndOfRamPointChosen()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return EndOfRamPointChosen;
    //return ReturnValue;    
}

private final function SetTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChargeTarget[8388609];

    // End:0xB6
    if(PawnTryingToHit != ChargeTarget)
    {
        // End:0x98
        if(PawnTryingToHit != none)
        {
            TargetRadius = Class'LPAIUtils'.static.KynapseAdjustedRadius(PawnTryingToHit);
            TargetHeight = PawnTryingToHit.CylinderComponent.CollisionHeight;            
        }
        else
        {
            TargetRadius = -1.0000000;
            TargetHeight = -1.0000000;
        }
    }
    PawnTryingToHit = ChargeTarget;
    //return;    
}

function CloseDodgeWindow()
{
    // End:0x1A
    if(ControllerShowingDodgeMessageTo != none)
    {
        ControllerShowingDodgeMessageTo = none;
    }
    //return;    
}

function OpenDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewDodgeMessage[8388609];

    // End:0x91
    if((PawnTryingToHit != none) && PawnTryingToHit.IsA('LPPlayerPawn'))
    {
        // End:0x4D
        if(ControllerShowingDodgeMessageTo != none)
        {
            CloseDodgeWindow();
        }
        ControllerShowingDodgeMessageTo = LPPlayerController(PawnTryingToHit.Controller);
        DodgeMessage = NewDodgeMessage;
    }
    //return;    
}

function IsDodgeWindowOpen()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ControllerShowingDodgeMessageTo != none;
    //return ReturnValue;    
}

function HasTargetPawn()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return PawnTryingToHit != none;
    //return ReturnValue;    
}

function GetTargetPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return PawnTryingToHit;
    //return ReturnValue;    
}

function SetToHavingStartedRecoveringAfterFailedStrikedFinsihed()
{
    bRecoveringAfterFailedStrikedFinsihed = true;
    //return;    
}

function SetToHavingFinishedRecoveringAfterFailedStrikedFinsihed()
{
    bRecoveringAfterFailedStrikedFinsihed = false;
    //return;    
}

function IsRecoveringAfterFailedStrikedFinsihed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bRecoveringAfterFailedStrikedFinsihed;
    //return ReturnValue;    
}

function SetToStartedGettingKnockedBackAfterHittingUnmovableObject()
{
    bGettingKnockedBackAfterHittingUnmovableObject = true;
    //return;    
}

function SetToFinishedGettingKnockedBackAfterHittingUnmovableObject()
{
    bGettingKnockedBackAfterHittingUnmovableObject = false;
    //return;    
}

function IsGettingKnockedBackAfterHittingUnmovableObject()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bGettingKnockedBackAfterHittingUnmovableObject;
    //return ReturnValue;    
}

defaultproperties
{
    PawnsHitDuringRam=(PawnsHit=none,MaxLifeTimeOfItemInList=-1.0000000,MaxLifeTimeOfVsInList=-1.0000000,MaxLifeTimeOfShutdownVsInList=-1.0000000)
}