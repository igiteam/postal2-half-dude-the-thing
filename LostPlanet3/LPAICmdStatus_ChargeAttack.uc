class LPAICmdStatus_ChargeAttack extends LPAICmdStatus_Objective
    editinlinenew;

enum EChargeAttack_Status
{
    Charge_Status_None,             // 0
    Charge_Status_StartedRunIn,     // 1
    Charge_Status_StartedStrike,    // 2
    Charge_Status_StartedUberClawStrike,// 3
    Charge_Status_StruckTheTarget,  // 4
    Charge_Status_StruckPawnOtherThenTheTarget,// 5
    Charge_Status_StruckBlockingObject,// 6
    Charge_Status_StruckActiveDefense,// 7
    Charge_Status_EndedStruckNothingOfNote,// 8
    Charge_Status_MAX               // 9
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Cmd_Charge_Status[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PawnTryingToHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetHeight[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EndOfChargePointChosen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bChargingAttackDodgeWindowOpen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bChargeInteruptedBecauseOfExplosion[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRecoveringAfterFailedStrikedFinsihed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGettingKnockedBackAfterHittingUnmovableObject[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ControllerShowingDodgeMessageTo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL DodgeMessage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL PawnsHitDuringCharge[536870913];

function SetDefaults()
{
    super.SetDefaults();
    Cmd_Charge_Status = 0;
    bChargingAttackDodgeWindowOpen = false;
    ControllerShowingDodgeMessageTo = none;
    bChargeInteruptedBecauseOfExplosion = false;
    PawnTryingToHit = none;
    TargetRadius = -1.0000000;
    TargetHeight = -1.0000000;
    bRecoveringAfterFailedStrikedFinsihed = false;
    bGettingKnockedBackAfterHittingUnmovableObject = false;
    Class'LPAIUtils'.static.EmptyHitList(PawnsHitDuringCharge);
    EndOfChargePointChosen = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function Clear()
{
    Cmd_Charge_Status = 0;
    bChargingAttackDodgeWindowOpen = false;
    ControllerShowingDodgeMessageTo = none;
    bChargeInteruptedBecauseOfExplosion = false;
    PawnTryingToHit = none;
    TargetRadius = -1.0000000;
    TargetHeight = -1.0000000;
    bRecoveringAfterFailedStrikedFinsihed = false;
    bGettingKnockedBackAfterHittingUnmovableObject = false;
    Class'LPAIUtils'.static.EmptyHitList(PawnsHitDuringCharge);
    EndOfChargePointChosen = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function StartingChargeAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChargeTarget[8388609];

    SetDefaults();
    Class'LPAIUtils'.static.EmptyHitList(PawnsHitDuringCharge);
    PawnTryingToHit = ChargeTarget;
    //return;    
}

function StartingChargeRunIn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChargeTarget[8388609];

    SetDefaults();
    Cmd_Charge_Status = 1;
    SetTarget(ChargeTarget);
    //return;    
}

function StartingChargeStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChargeTarget[8388609], TargetPoint;

    Cmd_Charge_Status = 2;
    SetTarget(ChargeTarget);
    EndOfChargePointChosen = TargetPoint;
    //return;    
}

function StartingUberClawStrike()
{
    Cmd_Charge_Status = 3;
    //return;    
}

final function GetCmd_Charge_Status()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return Cmd_Charge_Status;
    //return ReturnValue;    
}

function IsPerformingUberClawStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return int(Cmd_Charge_Status) == int(3);
    //return ReturnValue;    
}

function SetChargeInteruptedBecauseOfExplosion()
{
    bChargeInteruptedBecauseOfExplosion = true;
    //return;    
}

function WasTheChargeInteruptedBecauseOfExplosion()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bChargeInteruptedBecauseOfExplosion;
    //return ReturnValue;    
}

function NotifyStruckPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnHit[8388609];

    Class'LPAIUtils'.static.AddPawnHit(PawnHit, PawnsHitDuringCharge);
    // End:0x7E
    if((PawnHit == PawnTryingToHit) || PawnHit.IsHumanControlled())
    {
        Cmd_Charge_Status = 4;        
    }
    else
    {
        // End:0x9E
        if(int(Cmd_Charge_Status) != int(4))
        {
            Cmd_Charge_Status = 5;
        }
    }
    //return;    
}

function WasTargetSuccessfullyStruck()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return int(Cmd_Charge_Status) == int(4);
    //return ReturnValue;    
}

function WasNothingHitDuringCharge()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x36
    if((PawnsHitDuringCharge.PawnsHit.Length == 0) && !WasBlockingObjectStruck())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function WasBlockingObjectStruck()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (int(Cmd_Charge_Status) == int(6)) || int(Cmd_Charge_Status) == int(7);
    //return ReturnValue;    
}

function NotifyStruckBlockingObject()
{
    Cmd_Charge_Status = 6;
    //return;    
}

function WasActiveDefenseStruck()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return int(Cmd_Charge_Status) == int(7);
    //return ReturnValue;    
}

function NotifyActiveDefenseStruck()
{
    Cmd_Charge_Status = 7;
    //return;    
}

function GetEndOfChargePointChosen()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return EndOfChargePointChosen;
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
    // End:0x5A
    if(ControllerShowingDodgeMessageTo != none)
    {
        ControllerShowingDodgeMessageTo.myHUD.KismetTextInfo.RemoveItem(DodgeMessage);        
        ControllerShowingDodgeMessageTo = none;
    }
    //return;    
}

function OpenDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewDodgeMessage[8388609];

    // End:0xFA
    if(((PawnTryingToHit != none) && PawnTryingToHit.IsA('LPPlayerPawn')) && PawnTryingToHit.Controller != none)
    {
        // End:0x73
        if(ControllerShowingDodgeMessageTo != none)
        {
            CloseDodgeWindow();
        }
        ControllerShowingDodgeMessageTo = LPPlayerController(PawnTryingToHit.Controller);
        DodgeMessage = NewDodgeMessage;
        ControllerShowingDodgeMessageTo.myHUD.KismetTextInfo.AddItem(DodgeMessage);                
    }
    else
    {
        // End:0x148
        if((PawnTryingToHit != none) && PawnTryingToHit.Controller == none)
        {
            // End:0x148
            if(ControllerShowingDodgeMessageTo != none)
            {
                CloseDodgeWindow();
            }
        }
    }
    //return;    
}

function IsDodgeWindowOpen()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (ControllerShowingDodgeMessageTo != none) && PawnTryingToHit.Controller == ControllerShowingDodgeMessageTo;
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
    PawnsHitDuringCharge=(PawnsHit=none,MaxLifeTimeOfItemInList=-1.0000000,MaxLifeTimeOfVsInList=-1.0000000,MaxLifeTimeOfShutdownVsInList=-1.0000000)
}