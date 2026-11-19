class LPAIControllerVSISS extends LPAIControllerMech
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte LastKismetEvent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampCloseRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UtilityRig;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPickPlayerNext;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampFireFromOpen;

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    vsPawn = LPAIPawnVSISS(inPawn);
    LastKismetEvent = 4;
    UtilityRig = none;
    // End:0x8A
    foreach WorldInfo.AllPawns(Class'LPBaseVSPlayerPawn', UtilityRig)
    {
        // End:0x8A
        break;        
    }    
    //return;    
}

function SetAttackResourceNames()
{
    MeleeResourceName = 'None';
    StrikeResourceName = 'None';
    StruggleResourceName = 'None';
    FeintResourceName = 'None';
    RangedResourceName = 'VSISSFormation';
    FireResourceName = 'None';
    //return;    
}

function SetKismetEvent()
{
    local /*0x97E50000-0x00000000*/ private byte InKismetEvent[8388609];

    // End:0x6C
    if(int(InKismetEvent) != int(LastKismetEvent))
    {
        vsPawn.TriggerEventClass(Class'LPSeqEvent_IsenbergFight', vsPawn, int(InKismetEvent));
        LastKismetEvent = InKismetEvent;
    }
    //return;    
}

event Stunned()
{
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x7E [Loop If]
    if(myCommand != none)
    {
        myCommand.Stunned();
        myCommand = LPAICommand(myCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event ISSCoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand, ISSStagedAttackCmd;

    myCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0xBB [Loop If]
    if(myCommand != none)
    {
        ISSStagedAttackCmd = LPAICmd_VSISSStagedAttack(myCommand);
        // End:0x87
        if(ISSStagedAttackCmd != none)
        {
            ISSStagedAttackCmd.ISSCoreDestroyed(CoreTag, CoreIndex);
        }
        myCommand = LPAICommand(myCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

function GetNumAkridAlive()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I, NumAkridAlive;
    local /*0x97E50000-0x00000000*/ private @NULL AkridEnemy;

    I = 0;
    J0x0B:

    // End:0xAA [Loop If]
    if(I < TargetList.Length)
    {
        AkridEnemy = LPAIPawnAkrid(TargetList[I].Actor);
        // End:0x9C
        if((AkridEnemy != none) && AkridEnemy.Health > 0)
        {
            NumAkridAlive++;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return NumAkridAlive;
    //return ReturnValue;    
}

function CmdRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_VSISSRangedAttack'.static.InitCommand(self);
    myCommand = LPAICmd_VSISSRangedAttack(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMoveToActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], LookAt;
    local /*0x97E50000-0x00000000*/ private float reachDist[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool bAllowFiring[9437185], b2dDistanceChecks;
    local /*0x97E50000-0x00000000*/ private byte inLookAtStartMoving[9437185];
    local /*0x97E50000-0x00000000*/ private float InMaxSpeedScale[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MoveToActor;

    -1.0000000
    CmdStatus_MoveToActor
    0
    0
    false
    true
    0
    0.0000000
    StopType = 5;
    MoveToActor = super(LPAIController).CmdMoveToActor(Target, LookAt, reachDist, CmdStatus, CmdOption, StopType, bAllowFiring, b2dDistanceChecks, inLookAtStartMoving, InMaxSpeedScale);
    // End:0xE7
    if(MoveToActor != none)
    {
        MoveToActor.bPlayMovingToStationaryOnAborted = true;
    }
    return MoveToActor;
    //return ReturnValue;    
}

function CmdMoveToPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], LookAt;
    local /*0x97E50000-0x00000000*/ private float reachDist[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool bAllowFiring[9437185], b2dDistanceChecks;
    local /*0x97E50000-0x00000000*/ private byte inLookAtStartMoving[9437185];
    local /*0x97E50000-0x00000000*/ private float InMaxSpeedScale[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MoveToPosition;

    none
    -1.0000000
    CmdStatus_MoveToPosition
    0
    0
    false
    true
    0
    0.0000000
    StopType = 5;
    MoveToPosition = super(LPAIController).CmdMoveToPosition(Target, LookAt, reachDist, CmdStatus, CmdOption, StopType, bAllowFiring, b2dDistanceChecks, inLookAtStartMoving, InMaxSpeedScale);
    // End:0xEC
    if(MoveToPosition != none)
    {
        MoveToPosition.bPlayMovingToStationaryOnAborted = true;
    }
    return MoveToPosition;
    //return ReturnValue;    
}

function CmdFireFromOpen()
{
    local /*0x97E50000-0x00000000*/ private int InBursts[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], FireFromOpen;

    0
    CmdStatus_Attack
    1
    FireFromOpen = super(LPAIController).CmdFireFromOpen(InBursts, CmdStatus, CmdOption);
    // End:0x9F
    if(FireFromOpen != none)
    {
        TimeStampFireFromOpen = WorldInfo.TimeSeconds;
        FireFromOpen.SetInterruptible(false);
    }
    return FireFromOpen;
    //return ReturnValue;    
}

function WeaponQuickFinish()
{
    local /*0x97E50000-0x00000000*/ private @NULL VSWeapon;

    VSWeapon = LPBaseVSISSWeapon(vsPawn.Weapon);
    // End:0x5F
    if(VSWeapon != none)
    {
        VSWeapon.QuickFinish();
    }
    //return;    
}

function AIWantsToFaceFiringTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FireDir2D;
    local /*0x97E50000-0x00000000*/ private float dotProduct;

    none
    // End:0x12C
    if(int(vsPawn.GetActiveWeaponID()) == int(2))
    {
        // End:0x51
        if(inActor == none)
        {
            inActor = FireTarget;
        }
        // End:0x71
        if((WeaponIsFiring()) || inActor == none)
        {
            return false;
        }
        FireDir2D = inActor.Location - MyCoverPawn.Location;
        FireDir2D.Z = 0.0000000;
        dotProduct = Normal(FireDir2D) Dot Vector(MyCoverPawn.Rotation);
        // End:0x12A
        if(dotProduct < 0.9659000)
        {
            return true;            
        }
        else
        {
            return false;
        }
    }
    return super(SPGFCoverAIController).AIWantsToFaceFiringTarget(inActor);
    //return ReturnValue;    
}

function WeaponStartFiring()
{
    local /*0x97E50000-0x00000000*/ private int InBurstsToFire[9437185];

    -1
    super(SPGFCoverAIController).WeaponStartFiring(InBurstsToFire);
    vsPawn.NumTimesFiredWeapon++;
    //return;    
}

function PawnLookAtActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];

    // End:0x38
    if(AIWantsToFaceFiringTarget(inActor))
    {
        super(SPGFCoverAIController).PawnLookAtActor(inActor);
        CmdTurnToFaceFocus(1,,, true);
    }
    //return;    
}

function WantsToKeepFiring()
{
    local /*0x97E50000-0x00000000*/ private @NULL Wpn[8388609];
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bWantToFire)
    {
        return false;
    }
    // End:0x49
    if((MyCoverPawn != none) && !MyCoverPawn.CanFireWeapon())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

protected function _GetAimLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartLoc[8388609];
    local /*0x97E50000-0x00000000*/ private bool bActuallyFiring[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL AimTarget[9437185];
    local /*0x97E50000-0x00000000*/ private byte HintLocationType[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], AimLocation, AimUpCorrection, VelocityAimCorrection;

    1
    // End:0x49
    if(vsPawn.bAimLocationLocked)
    {
        return vsPawn.LockedAimLocation;
    }
    AimLocation = super(SPGFCoverAIController)._GetAimLocation(StartLoc, bActuallyFiring, AimTarget, HintLocationType);
    // End:0x1AA
    if((bActuallyFiring && LPWeaponVSISSGrenadeLauncher(vsPawn.Weapon) != none) && LPPlayerPawn(FireTarget) != none)
    {
        AimUpCorrection = vect(0.0000000, 0.0000000, 1.0000000) * vsPawn.TuneDataVsISS.GrenadeAimUpCorrection;
        VelocityAimCorrection = FireTarget.Velocity * vsPawn.TuneDataVsISS.GrenadeAimVelocityCorrection;
        AimLocation = (AimLocation + AimUpCorrection) + VelocityAimCorrection;
    }
    return AimLocation;
    //return ReturnValue;    
}

protected function _GetAccuracyRotationModifier()
{
    local /*0x97E50000-0x00000000*/ private @NULL Wpn[8388609];
    local /*0x97E50000-0x00000000*/ private float InaccuracyPct[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL StartFireLoc[8388609], AimLoc, ReturnValue, AccRot, AccCone_Min, AccCone_Max;

    // End:0x43
    if(Wpn != none)
    {
        Wpn.GetAIAccuracyConeAngles(AccCone_Min, AccCone_Max);        
    }
    else
    {
        AccCone_Min = MyCoverPawn.mySPGFTuneDataPawn.BurstFireAccuracyConeMin;
        AccCone_Max = MyCoverPawn.mySPGFTuneDataPawn.BurstFireAccuracyConeMax;
    }
    AccRot.Pitch = int(GetRangeValueByPct(vect2d(AccCone_Min.X, AccCone_Max.X), InaccuracyPct) * 182.0444000);
    AccRot.Yaw = int(GetRangeValueByPct(vect2d(AccCone_Min.Y, AccCone_Max.Y), InaccuracyPct) * 182.0444000);
    AccRot.Pitch *= -FRand();
    AccRot.Yaw *= (0.5000000 - FRand());
    return AccRot;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerVSISS.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerVSISS.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerVSISS.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerVSISS.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerVSISS.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerVSISS.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    lookWhenStartMoving=ELookAtStartMoving.LAS_LookForward
    // Reference: SPAIReactionManager'Default__LPAIControllerVSISS.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    bAllowDamageWhenDisableAI=true
    // Reference: LPAIObjectiveManager'Default__LPAIControllerVSISS.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}