class LPAICmd_CarrierLoiter extends LPAICmd_Melee within LPAIControllerCarrier;

enum eAfterLoiterSmEndsBehavior
{
    eAfterLoiterSmEndsBehavior_None,// 0
    eAfterLoiterSmEndsBehavior_ReactionPhysicalAttack,// 1
    eAfterLoiterSmEndsBehavior_BerserkAttack,// 2
    eAfterLoiterSmEndsBehavior_DirectAttack,// 3
    eAfterLoiterSmEndsBehavior_LaunchDefender,// 4
    eAfterLoiterSmEndsBehavior_MAX  // 5
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoiterStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoiterSmEnded[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseTightAreaLoiter[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsingToTheLeftLoiterSms[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNeedToStartLoiterAgainFromTheOtherSide[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMoveBackToLoiterPositionFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeToPlayToOneSideLoiterLoop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedToPlayToTheOneSideLoiterLoop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedMoveBackToLoiterPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AfterLoiterSmEndsBehavior[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurTurnToFaceCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurReactiveAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurLaunchCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LoiterStartTime[536870913];

function Pushed()
{
    super.Pushed();
    bLoiterStarted = false;
    bLoiterSmEnded = false;
    bUseTightAreaLoiter = false;
    CurReactiveAttack = none;
    CurTurnToFaceCmd = none;
    Outer.CarrierPawn.bMoveBackToLoiterPositionFinished = false;
    Outer.CarrierPawn.TimeStartedMoveBackToLoiterPosition = -1.0000000;
    // End:0xE0
    if(RandRange(0.0000000, 1.0000000) < 0.5000000)
    {
        bUsingToTheLeftLoiterSms = true;        
    }
    else
    {
        bUsingToTheLeftLoiterSms = false;
    }
    AfterLoiterSmEndsBehavior = 0;
    MaxTimeToPlayToOneSideLoiterLoop = 5.0000000;
    TimeStartedToPlayToTheOneSideLoiterLoop = -1.0000000;
    bNeedToStartLoiterAgainFromTheOtherSide = false;
    // End:0x157
    if(!Outer.bPerformededIntialLaunchOnPrimaryTargetDetection)
    {
        GotoState('LaunchDefender');        
    }
    else
    {
        StartPocessLookForAttackOpportunityTimer();
    }
    //return;    
}

function Popped()
{
    StopPocessLookForAttackOpportunityTimer();
    StopLoiterSM();
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    Outer.CurrentCarrierAttackCmd = none;
    super.Resumed(OldCommandName);
    DealWith_NeedsToReactAndSwellWhenBecauseAllCellsDestroyedOnEndOfCommittedBehavior(OldCommandName);
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super(LPAICmd_Attack).SetDesiredEnemy(InEnemy);
    //return;    
}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPAICmd_Attack).NotifyAIResourceChanged(ResAccess);
    //return ReturnValue;    
}

function DealWith_NeedsToReactAndSwellWhenBecauseAllCellsDestroyedOnEndOfCommittedBehavior()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[9437185];

    'None'
    // End:0x5A
    if(Outer.bNeedsToReactAndSwellWhenBecauseAllCellsDestroyedOnEndOfCommittedBehavior)
    {
        Outer.CmdPerformReactAndSwellWhenAllCellsDestroyedPof(EnemyForAttack,, 1);
    }
    //return;    
}

function SetLoiterFormationExtents()
{
    // End:0x89
    if(Outer.ShouldUseLoiterFormationResource())
    {
        EnemyForAttack.AIResourceManager.GetResourceLocationExtents(Outer.LoiterFormationResourceName, MeleePatternCenter, MeleePatternRadius);        
    }
    else
    {
        SetMeleeExtents();
    }
    //return;    
}

function ShouldFaceEnemyWhileMovingToSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function StartAreaDependentLoiter()
{
    bLoiterStarted = true;
    bLoiterSmEnded = false;
    TimeStartedToPlayToTheOneSideLoiterLoop = Outer.WorldInfo.TimeSeconds;
    bNeedToStartLoiterAgainFromTheOtherSide = false;
    // End:0x15B
    if(Outer.IsInTightStalkOrLoiterArea())
    {
        bUseTightAreaLoiter = true;
        bUsingToTheLeftLoiterSms = !bUsingToTheLeftLoiterSms;
        // End:0x107
        if(bUsingToTheLeftLoiterSms)
        {
            Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierTightAreaLoiterLeft_In', true, false, LPSM_CarrierTightAreaLoiter_In_Done);            
        }
        else
        {
            Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierTightAreaLoiterRight_In', true, false, LPSM_CarrierTightAreaLoiter_In_Done);
        }        
    }
    else
    {
        bUseTightAreaLoiter = false;
        Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierLoiter', true, false, None, none);
    }
    //return;    
}

function LPSM_CarrierTightAreaLoiter_In_Done()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0x9F
    if(bUseTightAreaLoiter)
    {
        // End:0x5E
        if(bUsingToTheLeftLoiterSms)
        {
            Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierTightAreaLoiterLeft_Loop', true, false);            
        }
        else
        {
            Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierTightAreaLoiterRight_Loop', true, false);
        }
    }
    //return;    
}

function StopAreaDependentLoiter()
{
    bLoiterStarted = false;
    // End:0x148
    if(bUseTightAreaLoiter)
    {
        // End:0xB7
        if(bUsingToTheLeftLoiterSms)
        {
            Outer.myAIPawn.EndSpecialMove(Class'LPSM_CarrierTightAreaLoiterLeft_Loop');
            Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierTightAreaLoiterLeft_Out', true, false, LPSM_CarrierTightAreaLoiter_Out_Done);            
        }
        else
        {
            Outer.myAIPawn.EndSpecialMove(Class'LPSM_CarrierTightAreaLoiterRight_Loop');
            Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierTightAreaLoiterRIght_Out', true, false, LPSM_CarrierTightAreaLoiter_Out_Done);
        }        
    }
    else
    {
        Outer.myAIPawn.EndSpecialMove(Class'LPSM_CarrierLoiter');
        bLoiterSmEnded = true;
    }
    //return;    
}

function LPSM_CarrierTightAreaLoiter_Out_Done()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bLoiterSmEnded = true;
    //return;    
}

function StartLoiterSM()
{
    // End:0x19
    if(!bLoiterStarted)
    {
        StartAreaDependentLoiter();
    }
    //return;    
}

function StopLoiterSM()
{
    // End:0x17
    if(bLoiterStarted)
    {
        StopAreaDependentLoiter();
    }
    //return;    
}

event NotifyOfDangerousAmountOfDamage()
{
    // End:0x5C
    if((int(Outer.GetCurrentCarrierMacroCombatState()) == int(1)) && CurLaunchCmd == none)
    {
        Outer.SetCurrentCarrierMacroCombatState(2);
    }
    //return;    
}

function MoveToMeleeSlotAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (MoveAbortCondition()) || !Outer.HaveLoiterFormationAccess();
    //return ReturnValue;    
}

function GetMaxSeperationToDoReactivePhysicalAttackWhilePassiveLoitering()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MaxSeperationToDoReactivePhysicalAttackWhilePassiveLoitering.GetValue();
    //return ReturnValue;    
}

function GetMaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoitering()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoitering.GetValue();
    //return ReturnValue;    
}

function ShouldTryReactionPhysicalAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy, minDistaceToStartStrike;

    // End:0x51
    if(Outer.CarrierPawn.TuneDataCarrier.bOnlyReactionAttack)
    {
        return true;        
    }
    else
    {
        // End:0xA2
        if(Outer.CarrierPawn.TuneDataCarrier.bForceNotAllowedReactionPhysicalAttack)
        {
            return false;            
        }
        else
        {
            // End:0xF0
            if(Outer.CarrierPawn.TuneDataCarrier.bForceBerserkAttack)
            {
                return false;
            }
        }
    }
    // End:0x131
    if(int(Outer.GetCurrentCarrierMacroCombatState()) == int(1))
    {
        minDistaceToStartStrike = GetMaxSeperationToDoReactivePhysicalAttackWhilePassiveLoitering();        
    }
    else
    {
        minDistaceToStartStrike = GetMaxSeperationToDoReactivePhysicalAttackWhileAggitatedLoitering();
    }
    // End:0x17F
    if(IsMyEnemyAlive())
    {
        seperationToEnemy = EnemySeperation();
        // End:0x17F
        if(seperationToEnemy < minDistaceToStartStrike)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldTryDirectAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x87
    if(Outer.CarrierPawn.TuneDataCarrier.bForceBerserkAttack || Outer.CarrierPawn.bAllHiveCellsDestroyed)
    {
        return true;
    }
    // End:0x118
    if((int(Outer.GetCurrentCarrierMacroCombatState()) == int(3)) || Outer.CarrierPawn.TuneDataCarrier.bAllowDirectAttackAfterLaunching)
    {
        // End:0x115
        if(true)
        {
            // End:0x112
            if(IsMyEnemyAlive())
            {
                return true;
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function IsCurrentCarrierMacroCombatStateRightForLaunchingDefenders()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2C
    if(int(Outer.GetCurrentCarrierMacroCombatState()) == int(2))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ProcessShouldTryAndLaunchDefenderElement()
{
    local /*0x97E50000-0x00000000*/ private bool bForceChoice[8388609], ReturnValue;

    // End:0x224
    if(((((IsCurrentCarrierMacroCombatStateRightForLaunchingDefenders()) && !Outer.CarrierPawn.TuneDataCarrier.bForceBerserkAttack) && !Outer.CarrierPawn.bAllHiveCellsDestroyed) && !Outer.CarrierPawn.TuneDataCarrier.bForceCarrierNotToAttack) && !Outer.CarrierPawn.TuneDataCarrier.bNotAllowedToProactivelyLaunchDefenders)
    {
        // End:0x224
        if(Outer.CarrierPawn.IntendedDefendersLaunched.Length <= 0)
        {
            // End:0x221
            if(Outer.CarrierPawn.AreThereAnyCellsAvailableForLaunch())
            {
                // End:0x21E
                if(Outer.HasEnoughTimePassedBetweenDefenderLaunchs() || Outer.CarrierPawn.TuneDataCarrier.bOnlyProactivelyLaunchDefendersAndNothingElse)
                {
                    return true;                    
                }                
            }            
        }
    }
    return false;
    //return ReturnValue;    
}

function ProcessLookForReactionPhysicalAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x12
    if(ShouldTryReactionPhysicalAttack())
    {
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function ProcessShouldTryDirectAttack()
{
    local /*0x97E50000-0x00000000*/ private bool bForceChoice[8388609], ReturnValue;

    // End:0x0F
    if(ShouldTryDirectAttack())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ProcessLookForAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(Outer.bNeedsToReactAndSwellWhenBecauseAllCellsDestroyedOnEndOfCommittedBehavior)
    {
        return false;
    }
    // End:0x4A
    if(Outer.CarrierReactAndSwellWhenAllCellsDestroyedCmd != none)
    {
        return false;
    }
    // End:0x93
    if(!ProcessShouldTryAndLaunchDefenderElement(false))
    {
        // End:0x85
        if(!ProcessLookForReactionPhysicalAttackOpportunity())
        {
            // End:0x82
            if(ProcessShouldTryDirectAttack(false))
            {
                return OnEngagementAttackOptionFullPhysicalDirectAttackApproved();
            }            
        }
        else
        {
            return OnEngagementAttackOptionReactionPhysicalAttackApproved();
        }        
    }
    else
    {
        StopPocessLookForAttackOpportunityTimer();
        OnLaunchDefendersApproved();
        return true;
    }
    return false;
    //return ReturnValue;    
}

function OnEngagementAttackOptionReactionPhysicalAttackApproved()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x43
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
    }
    // End:0x86
    if(MoveToActorCmd != none)
    {
        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
    }
    // End:0xAC
    if(bLoiterStarted)
    {
        AfterLoiterSmEndsBehavior = 1;
        StopAreaDependentLoiter();        
    }
    else
    {
        StopPocessLookForAttackOpportunityTimer();
        GotoStateWithEnemyCheck('ReactionPhysicalAttack');
    }
    return true;
    //return ReturnValue;    
}

function OnEngagementAttackOptionFullPhysicalDirectAttackApproved()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x43
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
    }
    // End:0x86
    if(MoveToActorCmd != none)
    {
        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
    }
    // End:0x12F
    if((int(Outer.GetCurrentCarrierMacroCombatState()) == int(4)) || Outer.CarrierPawn.bAllHiveCellsDestroyed)
    {
        // End:0x10F
        if(bLoiterStarted)
        {
            AfterLoiterSmEndsBehavior = 2;
            StopAreaDependentLoiter();            
        }
        else
        {
            StopPocessLookForAttackOpportunityTimer();
            GotoStateWithEnemyCheck('BerserkAttack');
        }        
    }
    else
    {
        // End:0x155
        if(bLoiterStarted)
        {
            AfterLoiterSmEndsBehavior = 3;
            StopAreaDependentLoiter();            
        }
        else
        {
            StopPocessLookForAttackOpportunityTimer();
            GotoStateWithEnemyCheck('DirectAttack');
        }
    }
    return true;
    //return ReturnValue;    
}

function OnLaunchDefendersApproved()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x43
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
    }
    // End:0x86
    if(MoveToActorCmd != none)
    {
        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
    }
    // End:0xAC
    if(bLoiterStarted)
    {
        AfterLoiterSmEndsBehavior = 4;
        StopAreaDependentLoiter();        
    }
    else
    {
        GotoStateWithEnemyCheck('LaunchDefender');
    }
    return true;
    //return ReturnValue;    
}

function PerformCarrierReactionPhysicalAttackCmd()
{
    CurReactiveAttack = Outer.CmdCarrierReactionPhysicalAttackPof(EnemyForAttack, 1, 1, 5000.0000000, 5000.0000000, none,, 1);
    //return;    
}

function StartDirectAttack()
{
    //return;    
}

function StartBerserkAttack()
{
    //return;    
}

function GetMinSeperationRequiredToMaintainLoiter()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MinSeperationRequiredToMaintainLoiterPof.GetValue();
    //return ReturnValue;    
}

function GetMaxSeperationRequiredToMaintainLoiter()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CarrierPawn.TuneDataCarrier.MaxSeperationRequiredToMaintainLoiterPof.GetValue();
    //return ReturnValue;    
}

function IsCurrentLocationValidLotierSpot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy;

    seperationToEnemy = EnemySeperation();
    // End:0x8F
    if(seperationToEnemy >= (GetMinSeperationRequiredToMaintainLoiter()))
    {
        // End:0x8C
        if(seperationToEnemy <= (GetMaxSeperationRequiredToMaintainLoiter()))
        {
            // End:0x89
            if(IsThereGoodAttackLaneFromThisPossibleLoiterLocation(Outer.CarrierPawn.Location))
            {
                return true;                
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function IsThereGoodAttackLaneFromThisPossibleLoiterLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL LoiterLoc[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array losIgnoreActors, losIgnoreActorsClasses;

    losIgnoreActors.AddItem(Outer.CarrierPawn);    
    losIgnoreActors.AddItem(EnemyForAttack);    
    losIgnoreActorsClasses.AddItem(Class'LPAIPawnMedFlyer');    
    Outer.StartOfLastLoiterLane = LoiterLoc;
    Outer.EndOfLastLoiterLane = EnemyForAttack.Location;
    Outer.bGoodLoiterAttackLandAtLastCheck = Outer.LosTestForAttackLane(Outer.StartOfLastLoiterLane, EnemyForAttack.Location, Outer.CarrierPawn.TuneDataCarrier.RadiusOfCheckForLoiterAttackLane, Outer.CarrierPawn.TuneDataCarrier.RadiusOfCheckForLoiterAttackLane, Outer.LocationOfLoiterLaneBlockage, losIgnoreActors, losIgnoreActorsClasses, Outer.LoiterLaneBlockageImpactInfo);
    return Outer.bGoodLoiterAttackLandAtLastCheck;
    //return ReturnValue;    
}

function ManeuverToSlot()
{
    local /*0x97E50000-0x00000000*/ private @NULL Access[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedSubPos[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceMultiLocation, ResourceLocation, FormationCenter;
    local /*0x97E50000-0x00000000*/ private float FormationConstraintRadius, ReachDistance;
    local /*0x97E50000-0x00000000*/ private bool bCanMove;

    -1
    bCanMove = false;
    Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
    // End:0xC4
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
    }
    // End:0x35E
    if(Access != none)
    {
        ResourceLocation = SPAIResLocation(Access.GetResource());
        // End:0x2AE
        if(ResourceLocation == none)
        {
            ResourceMultiLocation = LPAIResMultiLocation(Access.GetResource());
            // End:0x2AB
            if(ResourceMultiLocation != none)
            {
                ReachDistance = ResourceMultiLocation.ReachDistance();
                FormationCenter = ResourceMultiLocation.GetFormationCenter();
                FormationConstraintRadius = ResourceMultiLocation.GetFormationMoveConstraintRadius();
                // End:0x243
                if((SelectedSubPos >= 0) && SelectedSubPos < ResourceMultiLocation.NumPositions())
                {
                    MeleeSlotPosition = ResourceMultiLocation.GetPosition(SelectedSubPos);                    
                }
                else
                {
                    MeleeSlotPosition = ResourceMultiLocation.GetNearestWorldPosition(Outer.myAIPawn.Location);
                }
                bCanMove = true;
            }            
        }
        else
        {
            ReachDistance = ResourceLocation.ReachDistance();
            FormationCenter = ResourceLocation.GetFormationCenter();
            FormationConstraintRadius = ResourceLocation.GetFormationMoveConstraintRadius();
            MeleeSlotPosition = ResourceLocation.GetWorldPosition();
            bCanMove = true;
        }
    }
    // End:0x5B5
    if(bCanMove)
    {
        MovingToActor = false;
        // End:0x5A6
        if(IsMyEnemyAlive())
        {
            // End:0x59A
            if(!ShouldAttackInsteadOfMovingToMeleeSlot())
            {
                MoveToPositionCmd = Outer.CmdMoveToPosition(MeleeSlotPosition, none, ReachDistance, Outer.CmdStatus_MoveToPosition, 1, GetStopTypeForMoveToMeleeSlot());
                MoveToPositionCmd.SetMovementZDiffAllowanceFactor(Outer.myAIPawn.TuneDataAIPawn.DefaultMovementZDiffAllowanceFactor.GetValue());
                MoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveToMeleeSlotAbortCondition;
                MoveToPositionCmd.bZeroVelocityOnFinish = false;
                MoveToPositionCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
                MoveToPositionCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
                MoveToPositionCmd.AddAreaConstraint(FormationCenter, FormationConstraintRadius, Outer.MyHeight);
                Outer.Focus = none;
            }
            IsManeuvering = true;
        }
        IsManeuvering = false;        
    }
    else
    {
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 2;
    }
    //return;    
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

final function StartPocessLookForAttackOpportunityTimer()
{
    local /*0x97E50000-0x00000000*/ private bool isTimerAlreadyRunning;

    isTimerAlreadyRunning = IsPocessLookForAttackOpportunityTimerActive();
    // End:0xCE
    if(!Outer.bDisableAI && !isTimerAlreadyRunning)
    {
        Outer.SetTimer(Outer.CarrierPawn.TuneDataCarrier.UpdateRateForLoiterPocessLookForAttackOpportunityTimer.GetValue(), true, 'PocessLookForAttackOpportunityTimer', self);        
    }
    //return;    
}

final function StopPocessLookForAttackOpportunityTimer()
{
    Outer.ClearTimer('PocessLookForAttackOpportunityTimer', self);
    //return;    
}

function PausePocessLookForAttackOpportunityTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopPocessLookForAttackOpportunityTimer();        
    }
    else
    {
        StartPocessLookForAttackOpportunityTimer();
    }
    //return;    
}

final function IsPocessLookForAttackOpportunityTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('PocessLookForAttackOpportunityTimer', self);
    //return ReturnValue;    
}

private final function PocessLookForAttackOpportunityTimer()
{
    ProcessLookForAttackOpportunity();
    //return;    
}

state GetMeleeFormationClearence
{
    function GotoMeleeSlot()
    {
        GotoStateWithEnemyCheck('MoveToMeleeSlot');
        //return;        
    }

    function GotoWaitForMeleeSlot()
    {
        GotoStateWithEnemyCheck('WaitForClearence');
        //return;        
    }
Begin:

    Outer.ReleaseStrikeAccess();
    Outer.ReleaseFeintAccess();
    // End:0x5E
    if(IsCurrentLocationValidLotierSpot())
    {
        GotoStateWithEnemyCheck('LoiterForLaunch');
    }
    // End:0xB5
    if(!Outer.HaveLoiterFormationAccess())
    {
        Outer.GetLoiterFormationAccess(EnemyForAttack);
        SetLoiterFormationExtents();
    }
    // End:0x101
    if(Outer.HaveLoiterFormationAccess())
    {
        Outer.Sleep(0.0000000);
        GotoMeleeSlot();        
    }
    else
    {
        GotoStateWithEnemyCheck('LoiterForLaunch');
        Outer.Sleep(0.1000000);
        Outer.PopCommand(self);
    }
    stop;            
}

state MoveCloserToEnemy
{Begin:

    // End:0x37
    if(bCanStrikeBeforeReachingMeleeSlot)
    {
        GetStrikeAccessIfRequiredBeforeAttack();
        // End:0x37
        if(HasAccessToStartAttack())
        {
            GotoStateWithEnemyCheck('BeginStrike');
        }
    }
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

state MoveToMeleeSlot
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        //return;        
    }

    function AttemptStrikeAccess()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function ReGetLoiterFormationAccess()
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearence');
        //return;        
    }

    function DoneWithManeuverToSlot()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.Sleep(0.0100000);
    // End:0x7E
    if(!Outer.LoiterFormationAccess.IsInFront(Outer.CarrierPawn))
    {
        goto 'SlotBehindCarrier';
    }
    // End:0xAC
    if(!Outer.HaveLoiterFormationAccess())
    {
        ReGetLoiterFormationAccess();
    }
    Outer.Sleep(0.0000000);
    ManeuverToSlot(Outer.LoiterFormationAccess);
    // End:0x1DA
    if(DoneWithManeuverToSlot())
    {
        J0xFF:

        // End:0x12C [Loop If]
        if(IsMoving())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0xFF;
        }
        // End:0x15D
        if(!Outer.HaveLoiterFormationAccess())
        {
            ReGetLoiterFormationAccess();            
        }
        else
        {
            // End:0x1C4
            if(HasMoveToSlotFailed())
            {
                // End:0x19B
                if(!Outer.HaveLoiterFormationAccess())
                {
                    ReGetLoiterFormationAccess();                    
                }
                else
                {
                    Outer.ReleaseLoiterFormationAccess();
                    ReGetLoiterFormationAccess();
                }
            }
        }
        GotoStateWithEnemyCheck('LoiterForLaunch');        
    }
    else
    {
        goto 'Begin';
    }
    J0x1E4:

    Outer.Sleep(0.0000000);
    bMoveBackToLoiterPositionFinished = false;
    TimeStartedMoveBackToLoiterPosition = Outer.WorldInfo.TimeSeconds;
    Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierMoveBackToLoiterPosition', true, true, On_LPSM_MoveBackToLoiterPosition_Finished);
    J0x29B:

    // End:0x2CA [Loop If]
    if(!IsMoveBackToLoiterPositionFinished())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x29B;
    }
    GotoStateWithEnemyCheck('LoiterForLaunch');
    stop;            
}

state LoiterForLaunch
{
    ignores PreMove;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopLoiterSM();
        super(SPStateObject).EndState(NextStateName);
        bUseTightAreaLoiter = false;
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        StopLoiterSM();
        bUseTightAreaLoiter = false;
        //return;        
    }

    function Loiter_CanContinue()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bcanContinue;
        local /*0x97E50000-0x00000000*/ private float deltaOfThisSmSet;

        // End:0x3A
        if(Outer.bNeedsToReactAndSwellWhenBecauseAllCellsDestroyedOnEndOfCommittedBehavior || int(AfterLoiterSmEndsBehavior) != int(0))
        {
            return false;
        }
        // End:0xB4
        if(bUseTightAreaLoiter)
        {
            deltaOfThisSmSet = Outer.WorldInfo.TimeSeconds - TimeStartedToPlayToTheOneSideLoiterLoop;
            // End:0xB4
            if(deltaOfThisSmSet > MaxTimeToPlayToOneSideLoiterLoop)
            {
                bNeedToStartLoiterAgainFromTheOtherSide = true;
                return false;
            }
        }
        // End:0x1E6
        if(Outer.HasFlightOfDefenderBeenLaunchedSinceLastDirectAttack())
        {
            // End:0x1E6
            if((Outer.WorldInfo.TimeSeconds - LoiterStartTime) > Outer.CarrierPawn.TuneDataCarrier.MaxLoiterTimeAfterLaunch)
            {
                // End:0x1E6
                if((int(Outer.GetCurrentCarrierMacroCombatState()) <= int(2)) && Outer.CarrierPawn.DoesHaveVulnerableCellsOnSide())
                {
                    Outer.SetCurrentCarrierMacroCombatState(3);
                }
            }
        }
        bcanContinue = Outer.HaveLoiterFormationAccess();
        // End:0x243
        if(!bcanContinue)
        {
            bcanContinue = IsCurrentLocationValidLotierSpot();
            // End:0x243
            if(!bcanContinue)
            {
            }
        }
        return bcanContinue;
        //return ReturnValue;        
    }

    function Loiter_ShouldWait()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function Loiter_ShouldWaitBeforeExitState()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x1E
        if(bUseTightAreaLoiter)
        {
            // End:0x1E
            if(!bLoiterSmEnded)
            {
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function GotoPostLoiterState()
    {
        // End:0x38
        if(Outer.bNeedsToReactAndSwellWhenBecauseAllCellsDestroyedOnEndOfCommittedBehavior)
        {
            DealWith_NeedsToReactAndSwellWhenBecauseAllCellsDestroyedOnEndOfCommittedBehavior('LoiterForLaunch');            
        }
        else
        {
            // End:0x62
            if(int(AfterLoiterSmEndsBehavior) == int(1))
            {
                GotoStateWithEnemyCheck('ReactionPhysicalAttack');                
            }
            else
            {
                // End:0x8C
                if(int(AfterLoiterSmEndsBehavior) == int(2))
                {
                    GotoStateWithEnemyCheck('BerserkAttack');                    
                }
                else
                {
                    // End:0xB6
                    if(int(AfterLoiterSmEndsBehavior) == int(3))
                    {
                        GotoStateWithEnemyCheck('DirectAttack');                        
                    }
                    else
                    {
                        // End:0xE0
                        if(int(AfterLoiterSmEndsBehavior) == int(4))
                        {
                            GotoStateWithEnemyCheck('LaunchDefender');                            
                        }
                        else
                        {
                            GotoStateWithEnemyCheck('GetMeleeFormationClearence');
                        }
                    }
                }
            }
        }
        //return;        
    }

    function CanStartLoiter()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    event NotifyAIResourceChanged()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess;
        local /*0x97E50000-0x00000000*/ private bool bHandled, ReturnVal;

        ReturnVal = false;
        // End:0x2B
        if(int(AfterLoiterSmEndsBehavior) == int(4))
        {
            return ReturnVal;
        }
        ResourceAccess = SPAIResourceAccess(ResAccess);
        bHandled = false;
        // End:0xA9
        if((ResourceAccess != none) && ResourceAccess == Outer.LoiterFormationAccess)
        {
            // End:0xA9
            if(IsCurrentLocationValidLotierSpot())
            {
                bHandled = true;
            }
        }
        // End:0xE9
        if(!bHandled)
        {
            ReturnVal = super(LPAICmd_CarrierLoiter).NotifyAIResourceChanged(ResAccess);
            GotoStateWithEnemyCheck('GetMeleeFormationClearence');
        }
        return ReturnVal;
        //return ReturnValue;        
    }
Begin:

    // End:0x22
    if(!CanStartLoiter())
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    }
    // End:0x6A
    if(!IsCurrentLocationValidLotierSpot() && !Outer.HaveLoiterFormationAccess())
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearenceOnFormationChange');
    }
    goto 'BeginStaticLoiter';
BeginStaticLoiter:


    bUseTightAreaLoiter = false;
    LoiterStartTime = Outer.WorldInfo.TimeSeconds;
    AfterLoiterSmEndsBehavior = 0;
    Outer.ReleaseStrikeAccess();
    J0xE8:

    // End:0x115 [Loop If]
    if(Loiter_ShouldWait())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xE8;
    }
    Outer.Focus = EnemyForAttack;
    // End:0x1E9
    if(Outer.IsTurnToFaceTargetCommandNeeded(EnemyForAttack, Outer.CarrierPawn.TuneDataCarrier.MinAngleInDegreesNeededForTurnToFaceCommandBeforeStartOfLoiterAnims))
    {
        CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
        CurTurnToFaceCmd = none;
    }
    StartLoiterSM();
    J0x1F3:

    // End:0x220 [Loop If]
    if(Loiter_CanContinue())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x1F3;
    }
    StopLoiterSM();
    J0x22A:

    // End:0x257 [Loop If]
    if(Loiter_ShouldWaitBeforeExitState())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x22A;
    }
    // End:0x284
    if((int(AfterLoiterSmEndsBehavior) == int(0)) && bNeedToStartLoiterAgainFromTheOtherSide)
    {
        goto 'BeginStaticLoiter';
    }
    GotoPostLoiterState();
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    J0x2A1:

    // End:0x2C5 [Loop If]
    if(true)
    {
        Outer.Sleep(1.0000000);
        // [Loop Continue]
        goto J0x2A1;
    }
    stop;            
}

state LaunchDefender
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StartPocessLookForAttackOpportunityTimer();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event PoppedState()
    {
        StartPocessLookForAttackOpportunityTimer();
        super(SPStateObject).PoppedState();
        //return;        
    }

    event NotifyAIResourceChanged()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function DetermineNumberOfLaunches()
    {
        // End:0xF6
        if(Outer.NumLaunchSequencesTodo <= 0)
        {
            Outer.NumLaunchSequencesTodo = Class'SPEngine.SPUtil'.static.RandRangeInt(int(Outer.CarrierPawn.TuneDataCarrier.MinNumberOfLaunchSequences), int(Outer.CarrierPawn.TuneDataCarrier.MaxNumberOfLaunchSequences));
        }
        //return;        
    }
Begin:

    DetermineNumberOfLaunches();
    CurLaunchCmd = Outer.CmdLaunchDefendersPof(EnemyForAttack, Outer.CmdStatus_Strike, 1);
    CurLaunchCmd = none;
    // End:0x105
    if((LPVSPlayerPawn(Outer.MyLPEnemy) != none) && !Outer.CarrierPawn.TuneDataCarrier.bOnlyProactivelyLaunchDefendersAndNothingElse)
    {
        Outer.SetCurrentCarrierMacroCombatState(3);
    }
    // End:0x1EB
    if((Outer.NumLaunchSequencesTodo == 1) && Outer.CarrierPawn.DistanceBetweenCollisionCylinders(Outer.MyLPEnemy) > Outer.CarrierPawn.TuneDataCarrier.MinDistanceToTargetForDirectAttackWithDefenders)
    {
        Outer.SetCurrentCarrierMacroCombatState(3);
    }
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

state ReactionPhysicalAttack
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        StartPocessLookForAttackOpportunityTimer();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        StartPocessLookForAttackOpportunityTimer();
        //return;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    PerformCarrierReactionPhysicalAttackCmd();
    // End:0x5F
    if(int(Outer.GetCurrentCarrierMacroCombatState()) == int(1))
    {
        Outer.SetCurrentCarrierMacroCombatState(2);
    }
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

state DirectAttack
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        StartPocessLookForAttackOpportunityTimer();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        StartPocessLookForAttackOpportunityTimer();
        //return;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    StartDirectAttack();
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;                    
}

state BerserkAttack
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        StartPocessLookForAttackOpportunityTimer();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        StartPocessLookForAttackOpportunityTimer();
        //return;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    StartBerserkAttack();
    GotoStateWithEnemyCheck('BerserkAttack');
    stop;                    
}

defaultproperties
{
    bShouldStalk=true
    MinAttackRange=200.0000000
    MaxAttackRange=250.0000000
}