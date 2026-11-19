class LPAIControllerAct1Boss extends LPAIControllerAkridLarge
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BossPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL headControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoBossIntroduction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInTongueAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInRetreat;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRequestRetreat;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCoresVulnerable;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpecialMovePlaying;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceExitLeechWait;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumberOfAttacksPerformed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumberOfStrikesPerformed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSpawned;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeFirstAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastClawAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastTongueAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastBiteAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastLeechSpawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastTaunt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LeechesRemaining;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class BossArmBridgeClass;

function SetAttackResourceNames()
{
    MeleeResourceName = 'IceCrabMelee';
    StrikeResourceName = 'strike';
    //return;    
}

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    BossPawn = LPAIPawnAct1Boss(inPawn);
    bIsInTongueAttack = false;
    bIsInRetreat = true;
    NumberOfAttacksPerformed = 0;
    NumberOfStrikesPerformed = 0;
    TimeSpawned = WorldInfo.TimeSeconds;
    TimeFirstAttack = 0.0000000;
    TimeOfLastClawAttack = 0.0000000;
    TimeOfLastTongueAttack = 0.0000000;
    TimeOfLastBiteAttack = 0.0000000;
    TimeOfLastLeechSpawn = 0.0000000;
    TimeOfLastTaunt = 0.0000000;
    HideBoss();
    //return;    
}

function PawnDied()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super(SPGFCoverAIController).PawnDied(inPawn);
    //return;    
}

function MeleePofInFinished()
{
    //return;    
}

function MeleePofHoldFinished()
{
    //return;    
}

function MeleePofEndFinished()
{
    //return;    
}

function MeleeVsFinished()
{
    //return;    
}

function OnMakeAiAwareOf()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    super(SPAIController).OnMakeAiAwareOf(inAction);
    bIsInRetreat = false;
    //return;    
}

event CoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = LPAICommand(GetActiveCommand());
    // End:0x5D
    if(myCommand != none)
    {
        myCommand.CoreDestroyed(CoreTag, CoreIndex);
    }
    //return;    
}

function ReactToGrenadeGettingStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreGettingHit[8388609];

    //return;    
}

function GetBestIdleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609], ReturnValue, Enemy2D, Boss2D, Dest;

    local /*0x97E50000-0x00000000*/ private float DesTetherRange, MaxTetherRange;

    Enemy2D = EnemyForAttack.Location;
    Enemy2D.Z = 0.0000000;
    Boss2D = BossPawn.TetherLoc;
    Boss2D.Z = 0.0000000;
    DesTetherRange = GetDesiredTetherRange();
    MaxTetherRange = GetMaxTetherRange();
    Dest = Enemy2D + (Normal(Boss2D - Enemy2D) * DesTetherRange);
    Dest.Z = BossPawn.TetherLoc.Z;
    // End:0x1E4
    if(VSizeSq(Dest - BossPawn.TetherLoc) > (MaxTetherRange * MaxTetherRange))
    {
        Dest = BossPawn.TetherLoc + (Normal(Dest - BossPawn.TetherLoc) * MaxTetherRange);
    }
    return Dest;
    //return ReturnValue;    
}

function GetDesiredTetherRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return BossPawn.TuneDataBoss.DesiredIdleRange.GetValue();
    //return ReturnValue;    
}

function GetMaxTetherRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return BossPawn.TuneDataBoss.MaxTetherRange.GetValue();
    //return ReturnValue;    
}

function OutOfTetherRange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float MaxTetherRange;

    MaxTetherRange = GetMaxTetherRange();
    return VSizeSq(BossPawn.Location - BossPawn.TetherLoc) > (MaxTetherRange * MaxTetherRange);
    //return ReturnValue;    
}

function CmdHitReaction()
{
    local /*0x97E50000-0x00000000*/ private float PostReactionPauseTime[8388609];
    local /*0x97E50000-0x00000000*/ private class HitReactionSpecialMove[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    none
    0
    return super(LPAIController).CmdHitReaction(PostReactionPauseTime, HitReactionSpecialMove, CmdOption);
    //return ReturnValue;    
}

function CmdAct1BossTunedStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyToStrike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_Act1BossTunedStrike'.static.InitCommand(self);
    myCommand = LPAICmd_Act1BossTunedStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(EnemyToStrike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdAct1BossRetreat()
{
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    // End:0x2E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    bIsInRetreat = true;
    Class'LPAICmd_Act1BossRetreat'.static.InitCommand(self);
    myCommand = LPAICmd_Act1BossRetreat(GetActiveCommand());
    return myCommand;
    //return ReturnValue;    
}

function CmdAct1BossSpawnLeeches()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyToStrike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_Act1BossSpawnLeeches'.static.InitCommand(self);
    myCommand = LPAICmd_Act1BossSpawnLeeches(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(EnemyToStrike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdAct1BossStruggleModeBridge()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_Act1BossStruggleModeBridge'.static.InitCommand(self);
    myCommand = LPAICmd_Act1BossStruggleModeBridge(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function StopFollowingEnemy()
{
    Focus = none;
    SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
    //return;    
}

function OnAct1BossMoreLeeches()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x83
    if((GetLeechCount()) <= int(BossPawn.TuneDataBoss.LeechesRemainingBeforeSpawningMore.GetValue()))
    {
        LeechesRemaining += inAction.NumRequested;
    }
    //return;    
}

function OnAct1BossExitLeechWait()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    bForceExitLeechWait = true;
    //return;    
}

function OnAct1BossForceAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], A, LPPC, BossArm;

    // End:0x2D
    if(inAction.bForceRetreat)
    {
        CmdAct1BossRetreat();
    }
    // End:0x5B
    if(inAction.bForceAwake)
    {
        bIsInRetreat = false;
    }
    // End:0x1F7
    if(inAction.bTeleportToDestination && inAction.Dest.Length > 0)
    {
        A = Actor(inAction.Dest[0]);
        // End:0x1F7
        if(A != none)
        {
            Pawn.SetLocation(A.Location);
            Pawn.SetRotation(A.Rotation);
            BossPawn.TetherLoc = A.Location;
            Pawn.ForceNetRelevant();
            Pawn.bUpdateSimulatedPosition = true;
            Pawn.bNetDirty = true;
        }
    }
    // End:0x2BF
    if(inAction.bMoveToDestination && inAction.Dest.Length > 0)
    {
        A = Actor(inAction.Dest[0]);
        // End:0x2BF
        if(A != none)
        {
            BossPawn.TetherLoc = A.Location;
        }
    }
    // End:0x433
    if(inAction.bBeginBridgeStruggleMode && inAction.Dest.Length > 0)
    {
        LPPC = LPPlayerController(inAction.Dest[0]);
        // End:0x433
        if(LPPC != none)
        {
            ForceStruggleModeNow(LPPawn(LPPC.Pawn));
            BossArm = Spawn(BossArmBridgeClass,,, BossPawn.TuneDataBoss.BridgeArmSpawnLoc, BossPawn.TuneDataBoss.BridgeArmSpawnRot,, true);
            // End:0x433
            if(BossArm != none)
            {
                BossArm.SetHidden(false);
            }
        }
    }
    //return;    
}

function AllArmsPlaySpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SM[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Arm;

    // End:0x83
    foreach WorldInfo.AllPawns(Class'LPAIPawnAct1BossArm', Arm)
    {
        Arm.EndCurrentSpecialMove();
        Arm.DoSpecialMove(SM, true);        
    }    
    //return;    
}

function HideBoss()
{
    BossPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    BossPawn.SetPhysics(0);
    BossPawn.hide(true);
    BossPawn.SetCollision(false, false);
    BossPawn.Mesh.SetBlockRigidBody(false);
    //return;    
}

function ShowBoss()
{
    BossPawn.hide(false);
    BossPawn.SetCollision(true, true);
    BossPawn.Mesh.SetBlockRigidBody(true);
    //return;    
}

function NotifyPlayerStumble()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    // End:0x3A
    foreach WorldInfo.AllPawns(Class'LPPlayerPawn', LPP)
    {
        // End:0x3A
        break;        
    }    
    // End:0x69
    if(LPP != none)
    {
        LPP.NotifyShouldStumble();
    }
    //return;    
}

function NotifySpawnLeeches()
{
    local /*0x97E50000-0x00000000*/ private @NULL T, BestT;
    local /*0x97E50000-0x00000000*/ private float BestWeight, RandWeight, Angle;

    // End:0x48
    if(((BossPawn == none) || !BossPawn.bBirthLeeches) || LeechesRemaining < 1)
    {
        return;
    }
    LeechesRemaining--;
    BestT = none;
    BestWeight = 0.0000000;
    // End:0x185
    foreach AllActors(Class'LPAct1BossLeechTarget', T)
    {
        Angle = Normal(T.Location - BossPawn.Location) Dot Vector(BossPawn.Rotation);
        // End:0x184
        if(Angle > 0.8660000)
        {
            // End:0x184
            if(!T.bIsOwned)
            {
                RandWeight = RandRange(1.0000000, 100.0000000);
                // End:0x184
                if(RandWeight > BestWeight)
                {
                    BestWeight = RandWeight;
                    BestT = T;
                }
            }
        }        
    }    
    // End:0x23A
    if(BestT != none)
    {
        BestT.SetOwned(BossPawn.TuneDataBoss.LeechCocoonTime.GetValue());
        BossPawn.SpawnLeechSack(BestT.Location);
    }
    //return;    
}

function ForceStruggleModeNow()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private class StruggleModeClass[9437185];

    none
    ShowBoss();
    CmdAct1BossStruggleModeBridge(EnemyForStruggleMode,, 0);
    //return;    
}

function SMFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bSpecialMovePlaying = false;
    //return;    
}

function PlaySM()
{
    local /*0x97E50000-0x00000000*/ private class SM[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InteractionActor[9437185];

    BossPawn.DoSpecialMove(SM, true, true, SMFinished, InteractionActor);
    bSpecialMovePlaying = true;
    //return;    
}

static function GetLeechCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], LeechCount;
    local /*0x97E50000-0x00000000*/ private @NULL Leech, Sack;

    // End:0x9F
    foreach Class'Engine.WorldInfo'.static.GetWorldInfo().AllPawns(Class'LPAIPawnLeech', Leech)
    {
        // End:0x9E
        if(Leech.bIsBossLeech && Leech.IsAlive())
        {
            LeechCount++;
        }        
    }    
    // End:0x176
    foreach Class'Engine.WorldInfo'.static.GetWorldInfo().AllActors(Class'LPLeechSackBoss', Sack)
    {
        // End:0x175
        if((!Sack.bDeleteMe && Sack.MyActorDestructComponent != none) && Sack.MyActorDestructComponent.HitPoints > 0)
        {
            LeechCount++;
        }        
    }    
    return LeechCount;
    //return ReturnValue;    
}

function KillBossLeeches()
{
    local /*0x97E50000-0x00000000*/ private @NULL Leech;

    // End:0xEB
    foreach WorldInfo.AllPawns(Class'LPAIPawnLeech', Leech)
    {
        // End:0xEA
        if(Leech.bIsBossLeech && Leech.IsAlive())
        {
            Leech.TakeDamage(1000000, self, Leech.Location, Normal(Leech.Velocity), Class'LPDamageTypeForced');
        }        
    }    
    //return;    
}

simulated function GetRoomCenter()
{
    local /*0x97E50000-0x00000000*/ private bool bFaceIt[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], NewRot, TVec, T, BestT;

    local /*0x97E50000-0x00000000*/ private float BestTDist;

    TVec = BossPawn.Location + (Vector(BossPawn.Rotation) * 500.0000000);
    // End:0x11F
    foreach AllActors(Class'LPAct1BossLeechTarget', T)
    {
        // End:0x11E
        if(T.bBossTargetOnly)
        {
            // End:0x11E
            if((BestT == none) || VSizeSq(T.Location - TVec) < BestTDist)
            {
                BestT = T;
                BestTDist = VSizeSq(T.Location - TVec);
            }
        }        
    }    
    // End:0x242
    if(BestT != none)
    {
        // End:0x223
        if(bFaceIt)
        {
            Focus = none;
            SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
            NewRot = BossPawn.Rotation;
            NewRot.Yaw = Rotator(BestT.Location - BossPawn.Location).Yaw;
            BossPawn.SetDesiredRotation(NewRot);
        }
        return BestT.Location;
    }
    return TVec;
    //return ReturnValue;    
}

function TurnToCenter()
{
    GetRoomCenter(true);
    BossPawn.LineSweepHitTester.ResetHits();
    //return;    
}

function DelayedTurnToCenter()
{
    local /*0x97E50000-0x00000000*/ private float Time[8388609];

    SetTimer(Time, false, 'TurnToCenter');
    //return;    
}

defaultproperties
{
    bDoBossIntroduction=true
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerAct1Boss.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerAct1Boss.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerAct1Boss.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerAct1Boss.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerAct1Boss.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerAct1Boss.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerAct1Boss.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerAct1Boss.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
    SupportedEvents=/* Array type was not detected. */
}