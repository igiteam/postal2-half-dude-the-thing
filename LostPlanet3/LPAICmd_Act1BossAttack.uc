class LPAICmd_Act1BossAttack extends LPAICmd_Attack within LPAIControllerAct1Boss;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurDamageAssessmentCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GenericDelayEndTime[536870913];

function Pushed()
{
    super.Pushed();
    // End:0xAA
    if(IsZero(Outer.BossPawn.TetherLoc))
    {
        Outer.BossPawn.TetherLoc = Outer.BossPawn.Location;
    }
    GotoState('StateCmdActive');
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

simulated function FaceEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewRot;

    Outer.Focus = EnemyForAttack;
    // End:0x11B
    if(EnemyForAttack != none)
    {
        Outer.BossPawn.SetMovementPhysics();
        NewRot = MyPawn.Rotation;
        NewRot.Yaw = Rotator((EnemyForAttackLocation()) - MyPawn.Location).Yaw;
        MyPawn.SetDesiredRotation(NewRot);
    }
    //return;    
}

simulated function FaceLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Loc[8388609], NewRot;

    Outer.Focus = none;
    Outer.SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
    Outer.BossPawn.SetMovementPhysics();
    NewRot = MyPawn.Rotation;
    NewRot.Yaw = Rotator(Loc - MyPawn.Location).Yaw;
    MyPawn.SetDesiredRotation(NewRot);
    //return;    
}

function CanPerformStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xF4
    if(((Outer.BossPawn != none) && int(Outer.BossPawn.Phase) != int(0)) && (Outer.WorldInfo.TimeSeconds - Outer.TimeOfLastAttack) > Outer.BossPawn.GetTimeBetweenAttacks())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CanPerformSpawnLeeches()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x26D
    if(((((Outer.WorldInfo.TimeSeconds - Outer.TimeOfLastLeechSpawn) > Outer.BossPawn.GetTimeBetweenLeechSpawns()) && Outer.BossPawn != none) && Outer.BossPawn.TuneDataBoss.EnableLeechAttack.GetValue() > 0.0000000) && RandRange(0.0000000, 100.0000000) < Outer.BossPawn.TuneDataBoss.ChanceOfLeechAttack.GetValue())
    {
        Outer.TimeOfLastLeechSpawn = Outer.WorldInfo.TimeSeconds;
        // End:0x26D
        if(Outer.GetLeechCount() <= int(Outer.BossPawn.TuneDataBoss.LeechesRemainingBeforeSpawningMore.GetValue()))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function PerformStrike()
{
    //return;    
}

function PerformSpawnLeeches()
{
    Outer.CmdAct1BossSpawnLeeches(EnemyForAttack,, 1);
    //return;    
}

function GetPostStrikeDelay()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.BossPawn.TuneDataBoss.MinDelayTimeAfterStrike, Outer.BossPawn.TuneDataBoss.MaxDelayTimeAfterStrike);
    //return ReturnValue;    
}

function GetPostLeechDelay()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.BossPawn.TuneDataBoss.MinDelayTimeAfterLeechAttack, Outer.BossPawn.TuneDataBoss.MaxDelayTimeAfterLeechAttack);
    //return ReturnValue;    
}

function GetRevealDelay()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.BossPawn.TuneDataBoss.DelayTimeAfterReveal;
    //return ReturnValue;    
}

function CanExitLeechWait()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.bForceExitLeechWait || Outer.GetLeechCount() == 0;
    //return ReturnValue;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function TryToIdle()
    {
        // End:0x78
        if(!Outer.bSpecialMovePlaying)
        {
            Outer.bCoresVulnerable = false;
            FaceEnemy();
            Outer.PlaySM(Class'LPSM_Act1BossIdle');
        }
        //return;        
    }
Begin:

    Outer.Focus = none;
    Outer.SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
    J0x4D:

    // End:0xB0 [Loop If]
    if(Outer.bIsInRetreat)
    {
        Outer.bDoBossIntroduction = true;
        Outer.Sleep(1.0000000);
        // [Loop Continue]
        goto J0x4D;
    }
    // End:0x227
    if(Outer.bDoBossIntroduction && (int(Outer.BossPawn.Phase) == int(4)) || int(Outer.BossPawn.Phase) == int(5))
    {
        Outer.bDoBossIntroduction = false;
        FaceEnemy();
        Outer.PlaySM(Class'LPSM_Act1BossAscend');
        Outer.Sleep(0.5000000);
        Outer.ShowBoss();
        J0x1E2:

        // End:0x224 [Loop If]
        if(Outer.bSpecialMovePlaying)
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x1E2;
        }        
    }
    else
    {
        Outer.ShowBoss();
    }
    GenericDelayEndTime = (GetRevealDelay()) + Outer.WorldInfo.TimeSeconds;
    J0x28F:

    // End:0x2FA [Loop If]
    if(Outer.WorldInfo.TimeSeconds < GenericDelayEndTime)
    {
        TryToIdle();
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x28F;
    }
    J0x2FA:

    // End:0x785 [Loop If]
    if(true)
    {
        // End:0x323
        if(Outer.bIsInRetreat)
        {
            // [Explicit Break]
            goto J0x785;
        }
        // End:0x3A8
        if(Outer.bRequestRetreat)
        {
            Outer.bRequestRetreat = false;
            Outer.KillBossLeeches();
            Outer.CmdAct1BossRetreat();
            // [Explicit Break]
            goto J0x785;
        }
        // End:0x3FE
        if(Outer.BossPawn.IsAlive())
        {
            Outer.ShowBoss();
        }
        // End:0x75B
        if(!Outer.OutOfTetherRange())
        {
            // End:0x4ED
            if(CanPerformStrike())
            {
                PerformStrike();
                GenericDelayEndTime = (GetPostStrikeDelay()) + Outer.WorldInfo.TimeSeconds;
                J0x482:

                // End:0x4ED [Loop If]
                if(Outer.WorldInfo.TimeSeconds < GenericDelayEndTime)
                {
                    TryToIdle();
                    Outer.Sleep(0.0000000);
                    // [Loop Continue]
                    goto J0x482;
                }
            }
            // End:0x75B
            if(CanPerformSpawnLeeches())
            {
                Outer.bForceExitLeechWait = false;
                Outer.LeechesRemaining = int(Outer.BossPawn.TuneDataBoss.LeechSpawnCount.GetValue());
                // End:0x61C
                if(Outer.LeechesRemaining > 0)
                {
                    Outer.BossPawn.TriggerEventClass(Class'LPSeqEvent_Act1BossStartLeeches', Outer.BossPawn, 0);
                }
                J0x61C:

                // End:0x67D [Loop If]
                if(Outer.LeechesRemaining > 0)
                {
                    PerformSpawnLeeches();
                    FaceEnemy();
                    Outer.PlaySM(Class'LPSM_Act1BossIdle');
                }
                Outer.Sleep(0.0000000);
                // End:0x61C
                if(!(CanExitLeechWait()))
                    goto J0x61C;
                GenericDelayEndTime = (GetPostLeechDelay()) + Outer.WorldInfo.TimeSeconds;
                J0x6F0:

                // End:0x75B [Loop If]
                if(Outer.WorldInfo.TimeSeconds < GenericDelayEndTime)
                {
                    TryToIdle();
                    Outer.Sleep(0.0000000);
                    // [Loop Continue]
                    goto J0x6F0;
                }
            }
        }
        TryToIdle();
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x2FA;
    }
    J0x785:

    Outer.PopCommand(self);
    stop;            
}
