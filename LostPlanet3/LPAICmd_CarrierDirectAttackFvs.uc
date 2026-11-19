class LPAICmd_CarrierDirectAttackFvs extends LPAICmd_LeychAttack within LPAIControllerCarrier;

function Pushed()
{
    super.Pushed();
    Outer.CarrierPawn.bMoveBackToLoiterPositionFinished = false;
    Outer.CarrierPawn.TimeStartedMoveBackToLoiterPosition = -1.0000000;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

event SPAborted()
{
    super(LPAICmd_Attack).SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function HaveRequiredAccessForAnnounceDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldPerformAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldPerformDamageAssessmentIfCanNotStrikeAfterMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldPerformSnapTurnBeforeMovingToDamageAssessmentIfCanNotStrikeAfterMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HaveRequiredAccessForMoveToEnemyForStrikeDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HaveRequiredAccessForForStrikingDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldTurnToFaceFocusBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x77
    if(Outer.CarrierPawn != none)
    {
        return ConvertRangeToSeperation2D(Outer.myAIPawn.TuneDataAIPawn.MaxSeperationForDirectPhysicalStrike);
    }
    return 200.0000000;
    //return ReturnValue;    
}

function DoesStillNeedToMoveCloserToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if((EnemyForAttack != none) && !Outer.IsPawnInDirectStrikeZone(EnemyForAttack))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    Outer.CmdCarrierPushBackStrikePof(EnemyForAttack,, 1);
    //return;    
}

function AbortMoveInForStrikeIfStrikeAccessLost()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetPauseBetweenStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierShortWaitBetweenStrikes';
    //return ReturnValue;    
}

function ShouldFaceEnemyWhileMovingToSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function On_LPSM_MoveBackToLoiterPosition_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CarrierPawn.bMoveBackToLoiterPositionFinished = true;
    //return;    
}

function IsMoveBackToLoiterPositionFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float deltaSinceStartedBackUp;

    // End:0x39
    if(Outer.CarrierPawn.bMoveBackToLoiterPositionFinished)
    {
        return true;
    }
    deltaSinceStartedBackUp = Outer.WorldInfo.TimeSeconds - Outer.CarrierPawn.TimeStartedMoveBackToLoiterPosition;
    // End:0xEE
    if(deltaSinceStartedBackUp > Outer.CarrierPawn.MaxTimeToSpendInBackUpSpecialMove)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

state RetreatToMeleePoint
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super.PushedState();
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.CarrierPawn.bMoveBackToLoiterPositionFinished = false;
    Outer.CarrierPawn.TimeStartedMoveBackToLoiterPosition = Outer.WorldInfo.TimeSeconds;
    Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierMoveBackToLoiterPosition', true, true, On_LPSM_MoveBackToLoiterPosition_Finished);
    J0xEE:

    // End:0x11D [Loop If]
    if(!IsMoveBackToLoiterPositionFinished())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xEE;
    }
    Outer.PopCommand(self);
    stop;            
}
