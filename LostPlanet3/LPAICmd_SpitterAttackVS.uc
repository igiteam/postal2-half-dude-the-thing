class LPAICmd_SpitterAttackVS extends LPAICmd_SpitterAttack within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReactionWidnowForDrillDamage;

function Pushed()
{
    super.Pushed();
    AttackSeperation_SpitAttack = Outer.SpitterPawn.AttackSeperation_SpitAttackVs;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function Fire()
{
    Outer.CmdSpitStrikeVS(EnemyForAttack, AttackSelection.TimeBetweenHunkerAndSpit, false,, 1);
    //return;    
}

function SetTunables()
{
    super.SetTunables();
    AttackSeperation_SpitAttack = Outer.SpitterPawn.AttackSeperation_SpitAttackVs;
    AttackSeperation_TailSting = Outer.SpitterPawn.AttackSeperation_TailStingVs;
    TailStingForwardArcDot = Outer.SpitterPawn.TailStingForwardArcDot;
    AttackSeperation_TalonAttackNormal = Outer.SpitterPawn.AttackSeperation_TalonAttackVs;
    AttackSeperation_TalonAttackReactive = Outer.SpitterPawn.AttackSeperation_TalonAttackVs;
    AttackSelectionNotResined = Outer.SpitterPawn.AttackSelectionVsNotResined;
    AttackSelectionNotResinedSpitDisabled = Outer.SpitterPawn.AttackSelectionVsNotResinedSpitDisabled;
    AttackSelectionNotResinedTailDisabled = Outer.SpitterPawn.AttackSelectionVsNotResinedTailDisabled;
    AttackSelectionResined = Outer.SpitterPawn.AttackSelectionVsResined;
    AttackSelectionTailBurning = Outer.SpitterPawn.AttackSelectionVsTailBurning;
    AttackSeperation_ReactiveTailSting = Outer.SpitterPawn.AttackSeperation_TailStingVs;
    AttackSeperation_ReactiveTailSting.Max = Outer.SpitterPawn.TuneDataSpitter.AttackSeperation_ReactiveTailStingVS_Max.GetValue();
    StalkSpeedScale = Outer.SpitterPawn.StalkSpeedScaleVs;
    AttackSpeedScale = Outer.SpitterPawn.AttackSpeedScaleVs;
    //return;    
}

function IsInRangeForReactiveTailSting()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Range;

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        Range = AttackSeperation_TailSting;
        Range.Min *= 0.2500000;
    }
    Range.Max *= 0.2500000;
    return (IsEnabledTailSting()) && Outer.IsInRange(Range, Seperation);
    //return ReturnValue;    
    @NULL
    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */

    /*@Error*/
}

function RunTimeAdjustAttackSelection()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL As[25165825];
    local /*0x97E50000-0x00000000*/ private float Seperation[8388609];

    super.RunTimeAdjustAttackSelection(As, Seperation);
    //return;    
}

function GetPositionForSpitAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL PositionForAttack[25165825], FormationCenter;
    local /*0x97E50000-0x00000000*/ private float FormationConstraintRadius[25165825], ReachDistance;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceMultiLocation;
    local /*0x97E50000-0x00000000*/ private editfixedsize array AvailablePositions, Candidates;
    local /*0x97E50000-0x00000000*/ private @NULL TargetPos, TargetFacing, RelativePosition, RelativeDirection;
    local /*0x97E50000-0x00000000*/ private float DirectionDot, BestDirectionDot;
    local /*0x97E50000-0x00000000*/ private int I;

    ResourceMultiLocation = LPAIResMultiLocation(GetPositionResource());
    // End:0x2AD
    if((ResourceMultiLocation != none) && IsMyEnemyAlive())
    {
        ResourceMultiLocation.GetWorldPositions(AvailablePositions);
        // End:0x75
        if(AvailablePositions.Length < 1)
        {
            return false;
        }
        // End:0xEA
        if(!EnemyForAttack.Mesh.GetSocketWorldLocationAndRotation('CenterGlass', TargetPos))
        {
            TargetPos = EnemyForAttack.Location;
        }
        TargetFacing = Vector(EnemyForAttack.Rotation);
        ReachDistance = ResourceMultiLocation.ReachDistance();
        FormationCenter = ResourceMultiLocation.GetFormationCenter();
        FormationConstraintRadius = ResourceMultiLocation.GetFormationMoveConstraintRadius();
        BestDirectionDot = float(-2147483647);
        I = 0;
        J0x1AD:

        // End:0x2AD [Loop If]
        if(I < AvailablePositions.Length)
        {
            RelativePosition = AvailablePositions[I] - TargetPos;
            RelativePosition.Z = 0.0000000;
            RelativeDirection = Normal(RelativePosition);
            DirectionDot = RelativeDirection Dot TargetFacing;
            // End:0x29F
            if(DirectionDot > 0.5000000)
            {
                // End:0x29F
                if(DirectionDot > BestDirectionDot)
                {
                    BestDirectionDot = DirectionDot;
                    Candidates.AddItem(AvailablePositions[I]);                    
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x1AD;
        }
    }
    // End:0x303
    if(Candidates.Length > 0)
    {
        PositionForAttack = Candidates[Class'SPEngine.SPUtil'.static.RandRangeInt(0, Candidates.Length - 1)];
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function MoveToSpitAttackLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FormationCenter;
    local /*0x97E50000-0x00000000*/ private float FormationConstraintRadius, ReachDistance;
    local /*0x97E50000-0x00000000*/ private @NULL PositionForAttack;
    local /*0x97E50000-0x00000000*/ private bool bHasPosition;

    bHasPosition = GetPositionForSpitAttack(PositionForAttack, FormationCenter, FormationConstraintRadius, ReachDistance);
    MovingToActor = false;
    // End:0x2EC
    if((IsMyEnemyAlive()) && bHasPosition)
    {
        Outer.Focus = EnemyForAttack;
        Outer.EnableRotation(true);
        MoveToPositionCmd = Outer.CmdMoveToPosition(PositionForAttack, EnemyForAttack, Outer.MyKynapseRadius * 0.5000000, Outer.CmdStatus_MoveToPosition, 1, 0);
        MoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveToFirePositionAbortCondition;
        MoveToPositionCmd.bZeroVelocityOnFinish = false;
        MoveToPositionCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
        MoveToPositionCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
        MoveToPositionCmd.AddAreaConstraint(FormationCenter, FormationConstraintRadius, Outer.MyHeight);
        MoveToPositionCmd.__MoveAvoidanceDelegate__Delegate = DelegateDynamicAvoidance;
        MoveToPositionCmd.SetNotifyOfTouchWhileMovingDelegate(TouchWhileMoving);
        MoveToPositionCmd.SetNotifyOfBumpWhileMovingDelegate(BumpWhileMoving);
        Outer.Focus = EnemyForAttack;
        return true;        
    }
    else
    {
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 2;
    }
    return false;
    //return ReturnValue;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x73
    if(ClassIsChildOf(TypeOfDamage, Class'LPDamageTypeVSDrill'))
    {
        ReactionWidnowForDrillDamage = Outer.SpitterPawn.WorldInfo.TimeSeconds + 0.5000000;
        return true;
    }
    return super(LPAICommand).NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
    //return ReturnValue;    
}

protected function CanTryReactiveTailSting()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        // End:0x7D
        if((IsDoingTailSting()) || IsInState('TailStingReactive'))
        {
        }
        return false;
        // End:0xD5
        if(ReactionWidnowForDrillDamage > Outer.SpitterPawn.WorldInfo.TimeSeconds)
        {
        }
        return true;
        return false;
        //return ReturnValue;        
        @NULL
        stop;
        CmdStatus
    }
    @NULL
}

function StartCommandForChargeAttack()
{
    Outer.CmdPerformChargeAttackVS(EnemyForAttack, -1.0000000, Outer.CmdStatus_ChargeAttack, 1);
    //return;    
}

function IsInAngularRangeForSpit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL RelativeDirection, EnemyFacing;

    RelativeDirection = Outer.SpitterPawn.Location - EnemyForAttack.Location;
    RelativeDirection.Z = 0.0000000;
    RelativeDirection = Normal(RelativeDirection);
    EnemyFacing = Vector(EnemyForAttack.Rotation);
    // End:0xDE
    if((EnemyFacing Dot RelativeDirection) > 0.5000000)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsInPositionForSpitAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        return (IsInRangeForSpiAttack(Seperation)) && IsInAngularRangeForSpit();
    }
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

state TailSting
{
    function DoTailSting()
    {
        Outer.CmdTailStingVS(EnemyForAttack, AttackSelection.TimeBetweenHunkerAndSting);
        //return;        
    }
    stop;    
}

state TailStingReactive
{
    function DoTailSting()
    {
        ReactionWidnowForDrillDamage = 0.0000000;
        Outer.CmdTailStingVS(EnemyForAttack, 0.0000000, true);
        //return;        
    }
    stop;    
}

state TailStingQuick
{
    function DoTailSting()
    {
        RepeatCount = Class'SPEngine.SPUtil'.static.RandRangeInt(TailStingQuick_RepeatCount_Min, TailStingQuick_RepeatCount_Max);
        Outer.CmdTailStingQuickVS(EnemyForAttack, AttackSelection.TimeBetweenHunkerAndSting, RepeatCount);
        //return;        
    }
    stop;    
}

state Stalk
{
    function ShouldBackUpDuringStalk()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
    stop;    
}

state SpitAttack
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        super.EndState(NextState);
        Outer.ReleaseStrikeAccess();
        Outer.ReleaseRangedAccess();
        //return;        
    }

    function GetEnemyTooFarDistance()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return AttackSeperation_SpitAttack.Max * 3.0000000;
        //return ReturnValue;        
    }

    event DelegateDynamicAvoidance()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function ShouldFire()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x39
        if(!Outer.HaveStrikeAccess())
        {
            GetStrikeAccess(EnemyForAttack);
        }
        return Outer.HaveStrikeAccess();
        return false;
        //return ReturnValue;        
    }

    function MoveClose()
    {
        ManeuverForAttack(AttackSeperation_SpitAttack.Min, AttackSeperation_SpitAttack.Max, EnemyForAttack);
        //return;        
    }

    protected function CanTryReactiveTalonAttack()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */
        /*@Error*/;
    }
Begin:

    // End:0x38
    if(!Outer.HaveRangedAccess())
    {
        GetRangedAccess(EnemyForAttack);
    }
    // End:0x66
    if(!Outer.HaveRangedAccess())
    {
        GotoDefaultAttackState();
    }
    // End:0x9D
    if(!IsInPositionForSpitAttack())
    {
        MoveToSpitAttackLocation();
        Outer.Sleep(0.0000000);
    }
    // End:0x110
    if(FRand() < 0.5000000)
    {
        PushStateWithEnemyCheck('BackUpBeforeSpit');
        Outer.Sleep(0.0000000);
        // End:0x110
        if(!IsInPositionForSpitAttack())
        {
            MoveToSpitAttackLocation();
            Outer.Sleep(0.0000000);
        }
    }
    // End:0x17A
    if(IsMyEnemyAlive())
    {
        MoveClose();
        Outer.Sleep(0.0000000);
        // End:0x17A
        if(ShouldFire())
        {
            Fire();
            Outer.ReleaseStrikeAccess();
        }
    }
    Outer.Sleep(0.0000000);
    GotoDefaultAttackState();
    stop;            
}
