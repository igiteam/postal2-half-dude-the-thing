class LPAICmd_VsLarocheLoiter extends LPAICmd_Melee within LPAIControllerVsLaroche;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoiterStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseTightAreaLoiter[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRudeGestureStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastUsedRudeGesturIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurReactiveAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurDirectAttackVs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurBerserkAttackVs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurBackOffForDialogCmd[536870913];

function Pushed()
{
    super.Pushed();
    bLoiterStarted = false;
    bUseTightAreaLoiter = false;
    CurReactiveAttack = none;
    bRudeGestureStarted = false;
    LastUsedRudeGesturIndex = -1;
    CurDirectAttackVs = none;
    CurBerserkAttackVs = none;
    CurBackOffForDialogCmd = none;
    //return;    
}

function Popped()
{
    StopPocessLookForAttackOpportunityTimer();
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super(LPAICmd_Attack).SetDesiredEnemy(InEnemy);
    // End:0x93
    if(!Outer.bFightFlagStartOfFightDialogPlayed && InEnemy != none)
    {
        Outer.HandleBossFightPhaseEventMessage(InEnemy, 2);
        Outer.bFightFlagStartOfFightDialogPlayed = true;
    }
    //return;    
}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPAICmd_Attack).NotifyAIResourceChanged(ResAccess);
    //return ReturnValue;    
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
    // End:0x8E
    if(Outer.IsInTightStalkOrLoiterArea())
    {
        bUseTightAreaLoiter = true;
        Outer.myAIPawn.DoSpecialMove(Class'LPSM_VsLarocheTightAreaLoiter', true, false, None, none);        
    }
    else
    {
        bUseTightAreaLoiter = false;
        Outer.myAIPawn.DoSpecialMove(Class'LPSM_VsLarocheLoiter', true, false, None, none);
    }
    //return;    
}

function StopAreaDependentLoiter()
{
    bLoiterStarted = false;
    // End:0x65
    if(bUseTightAreaLoiter)
    {
        bUseTightAreaLoiter = false;
        Outer.myAIPawn.EndSpecialMove(Class'LPSM_VsLarocheTightAreaLoiter');        
    }
    else
    {
        Outer.myAIPawn.EndSpecialMove(Class'LPSM_VsLarocheLoiter');
    }
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

function On_VsLarocheRudeGesture_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bRudeGestureStarted = false;
    //return;    
}

function StartRudeGestureSM()
{
    local /*0x97E50000-0x00000000*/ private int GestureID[8388609];

    // End:0x1D4
    if(!bRudeGestureStarted)
    {
        bRudeGestureStarted = true;
        // End:0x89
        if(GestureID == 0)
        {
            LastUsedRudeGesturIndex = 0;
            Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheRudeGestureA', true, false, On_VsLarocheRudeGesture_Finished);            
        }
        else
        {
            // End:0xF7
            if(GestureID == 1)
            {
                LastUsedRudeGesturIndex = 1;
                Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheRudeGestureB', true, false, On_VsLarocheRudeGesture_Finished);                
            }
            else
            {
                // End:0x167
                if(GestureID == 2)
                {
                    LastUsedRudeGesturIndex = 2;
                    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheRudeGestureC', true, false, On_VsLarocheRudeGesture_Finished);                    
                }
                else
                {
                    // End:0x1D4
                    if(GestureID == 3)
                    {
                        LastUsedRudeGesturIndex = 3;
                        Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheRudeGesturePerform', true, false, None, none);
                    }
                }
            }
        }
    }
    //return;    
}

function StopRudeGestureSM()
{
    // End:0x154
    if(bRudeGestureStarted)
    {
        // End:0x5C
        if(LastUsedRudeGesturIndex == 0)
        {
            Outer.VsLarochePawn.EndSpecialMove(Class'LPSM_VsLarocheRudeGestureA');            
        }
        else
        {
            // End:0xAB
            if(LastUsedRudeGesturIndex == 1)
            {
                Outer.VsLarochePawn.EndSpecialMove(Class'LPSM_VsLarocheRudeGestureB');                
            }
            else
            {
                // End:0xFB
                if(LastUsedRudeGesturIndex == 2)
                {
                    Outer.VsLarochePawn.EndSpecialMove(Class'LPSM_VsLarocheRudeGestureC');                    
                }
                else
                {
                    // End:0x154
                    if(LastUsedRudeGesturIndex == 3)
                    {
                        bRudeGestureStarted = false;
                        Outer.VsLarochePawn.EndSpecialMove(Class'LPSM_VsLarocheRudeGesturePerform');
                    }
                }
            }
        }
    }
    //return;    
}

event NotifyOfDangerousAmountOfDamage()
{
    // End:0x4B
    if(int(Outer.GetCurrentLarocheMacroCombatState()) == int(0))
    {
        Outer.ChangeCurrentLarocheMacroCombatState(1);
    }
    //return;    
}

function MoveToMeleeSlotAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (MoveAbortCondition()) || !Outer.HaveLoiterFormationAccess();
    //return ReturnValue;    
}

function ShouldTryReactionPhysicalAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldTryBerserkAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ProcessLookForReactionPhysicalAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x10
    if(ShouldTryReactionPhysicalAttack())
    {        
    }
    return false;
    //return ReturnValue;    
}

function ProcessShouldTryBerserkAttack()
{
    local /*0x97E50000-0x00000000*/ private bool bForceChoice[8388609], ReturnValue;

    // End:0x10
    if(ShouldTryBerserkAttack())
    {        
    }
    return false;
    //return ReturnValue;    
}

function ProcessLookForAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bshoudldReactionPhysicalAttackImmediately, bshoudldBerserlAttackImmediately;

    bshoudldReactionPhysicalAttackImmediately = false;
    bshoudldReactionPhysicalAttackImmediately = ProcessLookForReactionPhysicalAttackOpportunity();
    bshoudldBerserlAttackImmediately = ProcessShouldTryBerserkAttack(false);
    return bshoudldReactionPhysicalAttackImmediately || bshoudldBerserlAttackImmediately;
    //return ReturnValue;    
}

function OnEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x22
    if(int(TypeOfAttack) == int(14))
    {
        return OnEngagementAttackOptionReactionPhysicalAttackApproved();        
    }
    else
    {
        // End:0x41
        if(int(TypeOfAttack) == int(13))
        {
            return OnEngagementAttackOptionFullPhysicalBerserkAttackApproved();
        }
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
    // End:0x9D
    if(bLoiterStarted)
    {
        StopAreaDependentLoiter();
    }
    GotoStateWithEnemyCheck('ReactionPhysicalAttack');
    return true;
    //return ReturnValue;    
}

function OnEngagementAttackOptionFullPhysicalBerserkAttackApproved()
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
    // End:0x9D
    if(bLoiterStarted)
    {
        StopAreaDependentLoiter();
    }
    GotoStateWithEnemyCheck('BerserkAttack');
    return true;
    //return ReturnValue;    
}

function PerformVsLarocheReactionPhysicalAttackCmd()
{
    //return;    
}

simulated function IsLeftArmGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if(CurDirectAttackVs != none)
    {
        return CurDirectAttackVs.IsLeftArmGrabPointAbleToBeGrabed();        
    }
    else
    {
        // End:0x64
        if(CurBerserkAttackVs != none)
        {
            return CurBerserkAttackVs.IsLeftArmGrabPointAbleToBeGrabed();            
        }
        else
        {
            // End:0x93
            if(CurBackOffForDialogCmd != none)
            {
                return CurBackOffForDialogCmd.IsLeftArmGrabPointAbleToBeGrabed();
            }
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function IsLeftShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if(CurDirectAttackVs != none)
    {
        return CurDirectAttackVs.IsLeftShoulderGrabPointAbleToBeGrabed();        
    }
    else
    {
        // End:0x64
        if(CurBerserkAttackVs != none)
        {
            return CurBerserkAttackVs.IsLeftShoulderGrabPointAbleToBeGrabed();            
        }
        else
        {
            // End:0x93
            if(CurBackOffForDialogCmd != none)
            {
                return CurBackOffForDialogCmd.IsLeftShoulderGrabPointAbleToBeGrabed();
            }
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function IsRightShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if(CurDirectAttackVs != none)
    {
        return CurDirectAttackVs.IsRightShoulderGrabPointAbleToBeGrabed();        
    }
    else
    {
        // End:0x64
        if(CurBerserkAttackVs != none)
        {
            return CurBerserkAttackVs.IsRightShoulderGrabPointAbleToBeGrabed();            
        }
        else
        {
            // End:0x93
            if(CurBackOffForDialogCmd != none)
            {
                return CurBackOffForDialogCmd.IsRightShoulderGrabPointAbleToBeGrabed();
            }
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function IsRightBicepGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if(CurDirectAttackVs != none)
    {
        return CurDirectAttackVs.IsRightBicepGrabPointAbleToBeGrabed();        
    }
    else
    {
        // End:0x64
        if(CurBerserkAttackVs != none)
        {
            return CurBerserkAttackVs.IsRightBicepGrabPointAbleToBeGrabed();            
        }
        else
        {
            // End:0x93
            if(CurBackOffForDialogCmd != none)
            {
                return CurBackOffForDialogCmd.IsRightBicepGrabPointAbleToBeGrabed();
            }
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if(CurDirectAttackVs != none)
    {
        return CurDirectAttackVs.IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed();        
    }
    else
    {
        // End:0x64
        if(CurBerserkAttackVs != none)
        {
            return CurBerserkAttackVs.IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed();            
        }
        else
        {
            // End:0x93
            if(CurBackOffForDialogCmd != none)
            {
                return CurBackOffForDialogCmd.IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed();
            }
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if(CurDirectAttackVs != none)
    {
        return CurDirectAttackVs.IsCockpitCrossBarGrabPointAbleToBeGrabed();        
    }
    else
    {
        // End:0x64
        if(CurBerserkAttackVs != none)
        {
            return CurBerserkAttackVs.IsCockpitCrossBarGrabPointAbleToBeGrabed();            
        }
        else
        {
            // End:0x93
            if(CurBackOffForDialogCmd != none)
            {
                return CurBackOffForDialogCmd.IsCockpitCrossBarGrabPointAbleToBeGrabed();
            }
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function IsRightInnerShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if(CurDirectAttackVs != none)
    {
        return CurDirectAttackVs.IsRightInnerShoulderGrabPointAbleToBeGrabed();        
    }
    else
    {
        // End:0x64
        if(CurBerserkAttackVs != none)
        {
            return CurBerserkAttackVs.IsRightInnerShoulderGrabPointAbleToBeGrabed();            
        }
        else
        {
            // End:0x93
            if(CurBackOffForDialogCmd != none)
            {
                return CurBackOffForDialogCmd.IsRightInnerShoulderGrabPointAbleToBeGrabed();
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function ManeuverToSlotForWaitingForEnemyRecovery()
{
    local /*0x97E50000-0x00000000*/ private @NULL Access[8388609], ResourceMultiLocation, ResourceLocation, FormationCenter;
    local /*0x97E50000-0x00000000*/ private float FormationConstraintRadius;
    local /*0x97E50000-0x00000000*/ private bool bCanMove;

    bCanMove = false;
    Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
    // End:0xBB
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
    }
    // End:0x290
    if(Access != none)
    {
        ResourceLocation = SPAIResLocation(Access.GetResource());
        // End:0x209
        if(ResourceLocation == none)
        {
            ResourceMultiLocation = LPAIResMultiLocation(Access.GetResource());
            // End:0x206
            if(ResourceMultiLocation != none)
            {
                FormationCenter = ResourceMultiLocation.GetFormationCenter();
                FormationConstraintRadius = ResourceMultiLocation.GetFormationMoveConstraintRadius();
                MeleeSlotPosition = ResourceMultiLocation.GetNearestWorldPosition(Outer.myAIPawn.Location);
                bCanMove = true;
            }            
        }
        else
        {
            FormationCenter = ResourceLocation.GetFormationCenter();
            FormationConstraintRadius = ResourceLocation.GetFormationMoveConstraintRadius();
            MeleeSlotPosition = ResourceLocation.GetWorldPosition();
            bCanMove = true;
        }
    }
    // End:0x4BB
    if(bCanMove)
    {
        MovingToActor = false;
        // End:0x4AC
        if(IsMyEnemyAlive())
        {
            // End:0x4A0
            if(!ShouldAttackInsteadOfMovingToMeleeSlot())
            {
                MoveToPositionCmd = Outer.CmdMoveToPosition(MeleeSlotPosition, none, 200.0000000, Outer.CmdStatus_MoveToPosition, 1, 2);
                MoveToPositionCmd.SetMovementZDiffAllowanceFactor(Outer.myAIPawn.TuneDataAIPawn.DefaultMovementZDiffAllowanceFactor.GetValue());
                MoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveToMeleeSlotAbortCondition;
                MoveToPositionCmd.bZeroVelocityOnFinish = false;
                MoveToPositionCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
                MoveToPositionCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
                MoveToPositionCmd.AddAreaConstraint(FormationCenter, FormationConstraintRadius, Outer.MyHeight);
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

function ManeuverToSlotToGetInRangeOfEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Access[8388609], ResourceMultiLocation, ResourceLocation, FormationCenter;
    local /*0x97E50000-0x00000000*/ private float FormationConstraintRadius;
    local /*0x97E50000-0x00000000*/ private bool bCanMove;

    bCanMove = false;
    Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
    // End:0xBB
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
    }
    // End:0x290
    if(Access != none)
    {
        ResourceLocation = SPAIResLocation(Access.GetResource());
        // End:0x209
        if(ResourceLocation == none)
        {
            ResourceMultiLocation = LPAIResMultiLocation(Access.GetResource());
            // End:0x206
            if(ResourceMultiLocation != none)
            {
                FormationCenter = ResourceMultiLocation.GetFormationCenter();
                FormationConstraintRadius = ResourceMultiLocation.GetFormationMoveConstraintRadius();
                MeleeSlotPosition = ResourceMultiLocation.GetNearestWorldPosition(Outer.myAIPawn.Location);
                bCanMove = true;
            }            
        }
        else
        {
            FormationCenter = ResourceLocation.GetFormationCenter();
            FormationConstraintRadius = ResourceLocation.GetFormationMoveConstraintRadius();
            MeleeSlotPosition = ResourceLocation.GetWorldPosition();
            bCanMove = true;
        }
    }
    // End:0x4A3
    if(bCanMove)
    {
        MovingToActor = false;
        // End:0x4A0
        if(IsMyEnemyAlive())
        {
            // End:0x4A0
            if(!ShouldAttackInsteadOfMovingToMeleeSlot())
            {
                MoveToPositionCmd = Outer.CmdMoveToPosition(MeleeSlotPosition, none, 200.0000000, Outer.CmdStatus_MoveToPosition, 1, 2);
                MoveToPositionCmd.SetMovementZDiffAllowanceFactor(Outer.myAIPawn.TuneDataAIPawn.DefaultMovementZDiffAllowanceFactor.GetValue());
                MoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveToMeleeSlotAbortCondition;
                MoveToPositionCmd.bZeroVelocityOnFinish = false;
                MoveToPositionCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
                MoveToPositionCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
                MoveToPositionCmd.AddAreaConstraint(FormationCenter, FormationConstraintRadius, Outer.MyHeight);
            }
        }        
    }
    else
    {
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 2;
    }
    //return;    
}

function HandleWaitingToNextOpportunityToHandleThisBossPhaseEvent()
{
    // End:0x3E
    if(int(Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent) == int(36))
    {
        GotoStateWithEnemyCheck('BackOffToSawGenDestroyedAndTaserStartUp');
        return;
    }
    // End:0x7C
    if(int(Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent) == int(37))
    {
        GotoStateWithEnemyCheck('BackOffToSawGenDestroyedAndEnergyShield');
        return;
    }
    // End:0xBA
    if(int(Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent) == int(38))
    {
        GotoStateWithEnemyCheck('BackOffToTaserGenDestroyedAndEnergyShield');
        return;
    }
    // End:0xF8
    if(int(Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent) == int(39))
    {
        GotoStateWithEnemyCheck('BackOffToJustTaserGenDestroyed');
        return;
    }
    // End:0x136
    if(int(Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent) == int(40))
    {
        GotoStateWithEnemyCheck('BackOffToHipDestroyedAndStartBackUpSawGen');
        return;
    }
    Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent = 41;
    //return;    
}

final function StartPocessLookForAttackOpportunityTimer()
{
    local /*0x97E50000-0x00000000*/ private bool isTimerAlreadyRunning;

    isTimerAlreadyRunning = IsPocessLookForAttackOpportunityTimerActive();
    // End:0xCE
    if(!Outer.bDisableAI && !isTimerAlreadyRunning)
    {
        Outer.SetTimer(Outer.VsLarochePawn.TuneDataVsLaroche.UpdateRateForLoiterPocessLookForAttackOpportunityTimer.GetValue(), true, 'PocessLookForAttackOpportunityTimer', self);        
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
    // End:0x95
    if(!Outer.HaveLoiterFormationAccess())
    {
        Outer.GetLoiterFormationAccess(EnemyForAttack);
        SetLoiterFormationExtents();
    }
    // End:0xE1
    if(Outer.HaveLoiterFormationAccess())
    {
        Outer.Sleep(0.0000000);
        GotoMeleeSlot();        
    }
    else
    {
        Outer.PopCommand(self);
    }
    stop;            
}

state MoveCloserToEnemy
{Begin:

    // End:0x33
    if(int(Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent) != int(41))
    {
        HandleWaitingToNextOpportunityToHandleThisBossPhaseEvent();
    }
    // End:0x1C8
    if(bCanStrikeBeforeReachingMeleeSlot)
    {
        // End:0x15C
        if((((((int(Outer.GetCurrentLarocheMacroCombatState()) == int(1)) || int(Outer.GetCurrentLarocheMacroCombatState()) == int(2)) || int(Outer.GetCurrentLarocheMacroCombatState()) == int(3)) || int(Outer.GetCurrentLarocheMacroCombatState()) == int(4)) || int(Outer.GetCurrentLarocheMacroCombatState()) == int(5)) || int(Outer.GetCurrentLarocheMacroCombatState()) == int(6))
        {
            GotoStateWithEnemyCheck('BasicAttack');            
        }
        else
        {
            // End:0x1C8
            if((int(Outer.GetCurrentLarocheMacroCombatState()) == int(7)) || int(Outer.GetCurrentLarocheMacroCombatState()) == int(8))
            {
                GotoStateWithEnemyCheck('GetMeleeFormationClearenceBeforeBackOffAndWaitForEnemyRecovery');                
            }
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

    GotoStateWithEnemyCheck('LoiterBeforeAttacking');
    stop;                    
}

state LoiterBeforeAttacking
{
    ignores PreMove;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopLoiterSM();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        StopLoiterSM();
        //return;        
    }

    function Loiter_CanContinue()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x4A
        if(int(Outer.GetCurrentLarocheMacroCombatState()) == int(0))
        {
            return Outer.HaveLoiterFormationAccess();
        }
        return false;
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

        return false;
        //return ReturnValue;        
    }

    function GotoPostLoiterState()
    {
        // End:0x3D
        if(int(Outer.GetCurrentLarocheMacroCombatState()) != int(0))
        {
            GotoStateWithEnemyCheck('BasicAttack');
        }
        //return;        
    }

    function CanStartLoiter()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
Begin:

    // End:0x22
    if(!CanStartLoiter())
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    }
    // End:0x59
    if(!Outer.HaveLoiterFormationAccess())
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearenceOnFormationChange');
    }
    goto 'BeginStaticLoiter';
BeginStaticLoiter:


    Outer.ReleaseStrikeAccess();
    J0x82:

    // End:0xAF [Loop If]
    if(Loiter_ShouldWait())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x82;
    }
    J0xAF:

    // End:0x120 [Loop If]
    if(Loiter_CanContinue())
    {
        // End:0xDB
        if(LastUsedRudeGesturIndex >= 2)
        {
            LastUsedRudeGesturIndex = -1;
        }
        StartRudeGestureSM(++LastUsedRudeGesturIndex);
        J0xF0:

        // End:0x11D [Loop If]
        if(bRudeGestureStarted)
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0xF0;
        }
        // [Loop Continue]
        goto J0xAF;
    }
    J0x120:

    // End:0x14D [Loop If]
    if(Loiter_ShouldWaitBeforeExitState())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x120;
    }
    GotoPostLoiterState();
    J0x157:

    // End:0x17B [Loop If]
    if(true)
    {
        Outer.Sleep(1.0000000);
        // [Loop Continue]
        goto J0x157;
    }
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
    PerformVsLarocheReactionPhysicalAttackCmd();
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;                    
}

state BasicAttack
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0x73
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        // End:0x6A
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    CurDirectAttackVs = Outer.CmdVsLarocheDirectAttackVs(EnemyForAttack, int(Outer.VsLarochePawn.TuneDataVsLaroche.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.VsLarochePawn.TuneDataVsLaroche.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.VsLarochePawn.TuneDataVsLaroche.MinAmountOfDamageRequiredToStopDirectAttack.GetValue(), Outer.VsLarochePawn.TuneDataVsLaroche.MaxAmountOfDamageRequiredToStopDirectAttack.GetValue(), none,, 1);
    CurDirectAttackVs = none;
    // End:0x233
    if((int(Outer.GetCurrentLarocheMacroCombatState()) == int(7)) || int(Outer.GetCurrentLarocheMacroCombatState()) == int(8))
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearenceBeforeBackOffAndWaitForEnemyRecovery');        
    }
    else
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    }
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
    CurBerserkAttackVs = Outer.CmdVsLarocheBerserkAttackVs(EnemyForAttack, int(Outer.VsLarochePawn.TuneDataVsLaroche.MinNumberOfStrikeAttemptsWhenBerserkAttack.GetValue()), int(Outer.VsLarochePawn.TuneDataVsLaroche.MaxNumberOfStrikeAttemptsWhenBerserkAttack.GetValue()), Outer.VsLarochePawn.TuneDataVsLaroche.MinAmountOfDamageRequiredToStopBerserkAttack.GetValue(), Outer.VsLarochePawn.TuneDataVsLaroche.MaxAmountOfDamageRequiredToStopBerserkAttack.GetValue(), none,, 1);
    CurBerserkAttackVs = none;
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

state BackOffToSawGenDestroyedAndTaserStartUp
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0x73
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        // End:0x6A
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    CurBackOffForDialogCmd = Outer.CmdBackoffToSawGenDestroyedAndTaserStartUp(Outer.VsLarochePawn.TuneDataVsLaroche.MaxTimeInBackoffToSawGenDestroyedAndTaserStartUp, Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent, Outer.VsLarochePawn.TuneDataVsLaroche.DelayAfterDialogCleanUpBeforeEndingCommandForSawGenDestroyedAndTaserStartUp,, 1);
    CurBackOffForDialogCmd = none;
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

state BackOffToSawGenDestroyedAndEnergyShield
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0x73
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        // End:0x6A
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    CurBackOffForDialogCmd = Outer.CmdBackoffToSawGenDestroyedAndEnergyShield(Outer.VsLarochePawn.TuneDataVsLaroche.MaxTimeInBackoffToSawGenDestroyedAndEnergyShield, Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent, Outer.VsLarochePawn.TuneDataVsLaroche.DelayAfterDialogCleanUpBeforeEndingCommandForSawGenDestroyedAndEnergyShield,, 1);
    CurBackOffForDialogCmd = none;
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

state BackOffToTaserGenDestroyedAndEnergyShield
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0x73
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        // End:0x6A
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    CurBackOffForDialogCmd = Outer.CmdBackoffToTaserGenDestroyedAndEnergyShield(Outer.VsLarochePawn.TuneDataVsLaroche.MaxTimeInBackoffToTaserGenDestroyedAndEnergyShield, Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent, Outer.VsLarochePawn.TuneDataVsLaroche.DelayAfterDialogCleanUpBeforeEndingCommandForTaserGenDestroyedAndEnergyShield,, 1);
    CurBackOffForDialogCmd = none;
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

state BackOffToJustTaserGenDestroyed
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0x73
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        // End:0x6A
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    CurBackOffForDialogCmd = Outer.CmdBackoffToJustTaserGenDestroyed(Outer.VsLarochePawn.TuneDataVsLaroche.MaxTimeInBackoffToJustTaserGenDestroyed, Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent, Outer.VsLarochePawn.TuneDataVsLaroche.DelayAfterDialogCleanUpBeforeEndingCommandForJustTaserGenDestroyed,, 1);
    CurBackOffForDialogCmd = none;
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

state BackOffToHipDestroyedAndStartBackUpSawGen
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0x73
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        // End:0x6A
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    CurBackOffForDialogCmd = Outer.CmdBackOffToHipDestroyedAndStartBackUpSawGen(Outer.VsLarochePawn.TuneDataVsLaroche.MaxTimeInBackoffToHipDestroyedAndStartBackUpSawGen, Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent, Outer.VsLarochePawn.TuneDataVsLaroche.DelayAfterDialogCleanUpBeforeEndingCommandForHipDestroyedAndStartBackUpSawGen,, 1);
    CurBackOffForDialogCmd = none;
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

state BackOffToShowOffSaw
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0x73
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        // End:0x6A
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    CurBackOffForDialogCmd = Outer.CmdBackoffToShowOffSaw(Outer.VsLarochePawn.TuneDataVsLaroche.MaxTimeInBackoffToShowOffSawDialog, Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent, Outer.VsLarochePawn.TuneDataVsLaroche.DelayAfterDialogCleanUpBeforeEndingCommandForShowOffSawDialog,, 1);
    CurBackOffForDialogCmd = none;
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

state BackOffToStartBackUpGenerator
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0x73
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        // End:0x6A
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    CurBackOffForDialogCmd = Outer.CmdBackoffToStartBackUpGen(Outer.VsLarochePawn.TuneDataVsLaroche.MaxTimeInBackoffToStartUpBackSawGenDialog, Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent, Outer.VsLarochePawn.TuneDataVsLaroche.DelayAfterDialogCleanUpBeforeEndingCommandForStartUpBackSawGenDialog,, 1);
    CurBackOffForDialogCmd = none;
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

state BackoffForThirdMajorComponentDestroyedNotifyForLaRocheNotSoSnarkyDramaticDialogOpportunity
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0x73
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        // End:0x6A
        if((int(Outer.GetCurrentLarocheMacroCombatState()) != int(7)) && int(Outer.GetCurrentLarocheMacroCombatState()) != int(8))
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    CurBackOffForDialogCmd = Outer.CmdBackoffForDramaticDialogOpportunity(Outer.VsLarochePawn.TuneDataVsLaroche.MaxTimeInBackoffForThirdMajorComponentDestroyedNotSoSnarkyCommentDialog, Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent, Outer.VsLarochePawn.TuneDataVsLaroche.DelayAfterDialogCleanUpBeforeEndingCommandForThirdMajorComponentDestroyedNotSoSnarkyCommentDialog,, 1);
    CurBackOffForDialogCmd = none;
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

state GetMeleeFormationClearenceBeforeBackOffAndWaitForEnemyRecovery
{
    function GotoMeleeSlot()
    {
        GotoStateWithEnemyCheck('BackOffAndWaitForEnemyRecovery');
        //return;        
    }
Begin:

    Outer.ReleaseStrikeAccess();
    Outer.ReleaseFeintAccess();
    // End:0x95
    if(!Outer.HaveLoiterFormationAccess())
    {
        Outer.GetLoiterFormationAccess(EnemyForAttack);
        SetLoiterFormationExtents();
    }
    // End:0xE1
    if(Outer.HaveLoiterFormationAccess())
    {
        Outer.Sleep(0.0000000);
        GotoMeleeSlot();        
    }
    else
    {
        Outer.Sleep(3.0000000);
        goto 'Begin';
    }
    stop;                
}

state BackOffAndWaitForEnemyRecovery
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
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
        GotoStateWithEnemyCheck('GetMeleeFormationClearenceBeforeBackOffAndWaitForEnemyRecovery');
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
    // End:0x4B
    if(!Outer.HaveLoiterFormationAccess())
    {
        ReGetLoiterFormationAccess();
    }
    Outer.Sleep(0.0000000);
    Outer.CmdBackoffAfterTaseringOrEmpingJimsUR(Outer.VsLarochePawn.TuneDataVsLaroche.MaxTimeInBackoffForWaitAfterTaseringJim, 41, Outer.VsLarochePawn.TuneDataVsLaroche.DelayAfterDialogCleanUpBeforeEndingCommandForWaitAfterTaseringJim,, 1);
    GotoStateWithEnemyCheck('WaitForEnemyRecovery');
    stop;                    
}

state WaitForEnemyRecovery
{
    ignores PreMove;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopLoiterSM();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        StopLoiterSM();
        //return;        
    }

    function Loiter_CanContinue()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x76
        if((int(Outer.GetCurrentLarocheMacroCombatState()) == int(7)) || int(Outer.GetCurrentLarocheMacroCombatState()) == int(8))
        {
            return Outer.HaveLoiterFormationAccess();
        }
        return false;
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

        return false;
        //return ReturnValue;        
    }

    function GotoPostLoiterState()
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearence');
        //return;        
    }

    function CanStartLoiter()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
Begin:

    // End:0x22
    if(!CanStartLoiter())
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearenceBeforeBackOffAndWaitForEnemyRecovery');
    }
    // End:0x59
    if(!Outer.HaveLoiterFormationAccess())
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearenceBeforeBackOffAndWaitForEnemyRecovery');
    }
    goto 'BeginStaticLoiter';
BeginStaticLoiter:


    Outer.ReleaseStrikeAccess();
    J0x82:

    // End:0xAF [Loop If]
    if(Loiter_ShouldWait())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x82;
    }
    J0xAF:

    // End:0x120 [Loop If]
    if(Loiter_CanContinue())
    {
        // End:0xDB
        if(LastUsedRudeGesturIndex >= 2)
        {
            LastUsedRudeGesturIndex = -1;
        }
        StartRudeGestureSM(++LastUsedRudeGesturIndex);
        J0xF0:

        // End:0x11D [Loop If]
        if(bRudeGestureStarted)
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0xF0;
        }
        // [Loop Continue]
        goto J0xAF;
    }
    J0x120:

    // End:0x14D [Loop If]
    if(Loiter_ShouldWaitBeforeExitState())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x120;
    }
    GotoPostLoiterState();
    J0x157:

    // End:0x17B [Loop If]
    if(true)
    {
        Outer.Sleep(1.0000000);
        // [Loop Continue]
        goto J0x157;
    }
    stop;                    
}

defaultproperties
{
    bShouldStalk=true
    bCanStrikeBeforeReachingMeleeSlot=true
    MinAttackRange=200.0000000
    MaxAttackRange=250.0000000
}