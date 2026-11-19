class LPAICmd_Flee extends LPAICommand within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurDamageAssessmentCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerPawnThatIsDoingMelee[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Duration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SafeSeperation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxFleeDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AICMDWanderParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AICMDFleeParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDontStopDesiredSpeedOnSpeedUpdate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __FleeAbortDelegate__Delegate;

delegate FleeAbortDelegate()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function SetMaxFleeDistance()
{
    local /*0x97E50000-0x00000000*/ private float MaxDist[8388609];

    AICMDFleeParams.explorationRadius = MaxDist;
    //return;    
}

function SetFinishWhenSafe()
{
    local /*0x97E50000-0x00000000*/ private bool InFinishWhenSafe[8388609];

    AICMDFleeParams.bFinishWhenSafe = InFinishWhenSafe;
    //return;    
}

function SetDesiredSeperationFromDanger()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[8388609];

    AICMDFleeParams.DangerRadius = Seperation;
    //return;    
}

function SetFleeFromActors()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn, EnemyCtrl;

    AICMDFleeParams.FleeDangerousBots.Length = 0;
    AICMDFleeParams.FleeDangerousNodes.Length = 0;
    I = 0;
    J0x49:

    // End:0x1D0 [Loop If]
    if(I < FleeFrom.Length)
    {
        // End:0x1C2
        if((FleeFrom[I] != none) && !FleeFrom[I].IsPendingKill())
        {
            EnemyCtrl = Controller(FleeFrom[I]);
            // End:0x10A
            if(EnemyCtrl != none)
            {
                EnemyPawn = EnemyCtrl.Pawn;                
            }
            else
            {
                EnemyPawn = Pawn(FleeFrom[I]);
            }
            // End:0x18F
            if(EnemyPawn != none)
            {
                // End:0x18C
                if(EnemyPawn.Health > 0)
                {
                    AICMDFleeParams.FleeDangerousBots.AddItem(EnemyPawn);                    
                }                
            }
            else
            {
                AICMDFleeParams.FleeDangerousNodes.AddItem(FleeFrom[I]);                
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x49;
    }
    //return;    
}

function FleeAbortDefault()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function PreFleeSetup()
{
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetFleeingMaxSpeedScale(Outer.myAIPawn));
    AICMDFleeParams.bStopWhenHidden = false;
    AICMDFleeParams.computeDestinationInterval = 0.5000000;
    AICMDFleeParams.FleeSpeed = Outer.myAIPawn.GroundSpeed;
    Outer.myAIPawn.bDontStopDesiredSpeedOnSpeedUpdate = false;
    //return;    
}

function NotifyPlayerStartMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHandled;
    local /*0x97E50000-0x00000000*/ private @NULL LeechPawn;

    LeechPawn = LPAIPawnLeech(Outer.MySPPawn);
    // End:0x42
    if(LeechPawn == none)
    {
        return false;
    }
    bHandled = super.NotifyPlayerStartMelee(PlayerPawn);
    // End:0xDC
    if(!bHandled)
    {
        Outer.SetTimer(FRand() * LeechPawn.TuneDataLeech.JumpBackMaxRandomLag, false, 'ReactToStartMelee', self);
        PlayerPawnThatIsDoingMelee = PlayerPawn;
    }
    return true;
    //return ReturnValue;    
}

function ReactToStartMelee()
{
    GotoState('ReactToMelee');
    //return;    
}

function Pushed()
{
    super.Pushed();
    TimeStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Kynapse_ActivateBot(true);
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetFleeingMaxSpeedScale(Outer.myAIPawn));
    bDontStopDesiredSpeedOnSpeedUpdate = Outer.myAIPawn.bDontStopDesiredSpeedOnSpeedUpdate;
    //return;    
}

function Popped()
{
    PlayerPawnThatIsDoingMelee = none;
    Outer.Kynapse_ClearLatentAgent();
    Outer.Kynapse_ActivateBot(false);
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
    Outer.myAIPawn.bDontStopDesiredSpeedOnSpeedUpdate = bDontStopDesiredSpeedOnSpeedUpdate;
    __FleeAbortDelegate__Delegate = FleeAbortDefault;
    super.Popped();
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
    super.Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    Outer.Kynapse_ActivateBot(true);
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetFleeingMaxSpeedScale(Outer.myAIPawn));
    //return;    
}

protected function HasSomethingToFleeFrom()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (AICMDFleeParams.FleeDangerousNodes.Length > 0) || AICMDFleeParams.FleeDangerousBots.Length > 0;
    //return ReturnValue;    
}

function TimerAbortFlee()
{
    // End:0x36
    if(FleeAbortDelegate())
    {
        Outer.PopCommand(self);
    }
    //return;    
}

state StateCmdActive
{Begin:

    // End:0xEC
    if(Outer.CoverIsIn())
    {
        // End:0x89
        if(Outer.CoverActionIsDoing() && !Outer.CanExitCoverFromCoverAction())
        {
            Outer.CoverResetAction();
        }
        J0x89:

        // End:0xCB [Loop If]
        if(Outer.IsTransitioning())
        {
            Outer.Sleep(0.1000000);
            // [Loop Continue]
            goto J0x89;
        }
        Outer.CoverExit();
    }
    J0xEC:

    // End:0x11B [Loop If]
    if(!IsKynapseReady())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xEC;
    }
    // End:0x13B
    if(!HasSomethingToFleeFrom())
    {
        GotoState('StateWander');        
    }
    else
    {
        GotoState('StateFlee');
    }
    stop;            
}

state StateFleeEnded
{Begin:

    Outer.PopCommand(self);
    stop;                
}

state StateWander
{Begin:

    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetFleeingMaxSpeedScale(Outer.myAIPawn));
    AICMDWanderParams.WanderDistance = 10000.0000000;
    Outer.Kynapse_LatentWander(AICMDWanderParams, none, Duration);
    Outer.myAIPawn.DesiredSpeed = 0.0000000;
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
    GotoState('StateFleeEnded');
    stop;            
}

state StateFlee
{Begin:

    PreFleeSetup();
    Outer.SetTimer(0.1000000, true, 'TimerAbortFlee', self);
    Outer.Kynapse_LatentFlee(AICMDFleeParams, none, Duration);
    Outer.ClearTimer('TimerAbortFlee');
    Outer.myAIPawn.DesiredSpeed = 0.0000000;
    GotoState('StateFleeEnded');
    stop;                
}

state ReactToMelee
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x43
        if(CurDamageAssessmentCmd != none)
        {
            Outer.AbortCommand(CurDamageAssessmentCmd);
            CurDamageAssessmentCmd = none;
        }
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function NotifyPlayerStartMelee()
    {
        local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
Begin:

    CurDamageAssessmentCmd = Outer.CmdDamageAssessment(PlayerPawnThatIsDoingMelee, 5.0000000, 5.0000000,, 1);
    CurDamageAssessmentCmd = none;
    GotoState('StateFleeEnded');
    stop;                
}

defaultproperties
{
    Duration=6.0000000
    AICMDWanderParams=(WanderDistance=1500.0000000,WanderPropagationAngle=150.0000000,WanderSpeed=0.0000000,Constraints=none)
    AICMDFleeParams=(bStopWhenHidden=true,bFinishWhenSafe=true,DangerRadius=5000.0000000,explorationRadius=5000.0000000,computeDestinationInterval=1.0000000,FleeDangerousNodes=none,FleeDangerousBots=none,FleeSpeed=0.0000000)
    FleeAbortDelegate=FleeAbortDefault
}