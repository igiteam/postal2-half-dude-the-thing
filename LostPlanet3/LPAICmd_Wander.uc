class LPAICmd_Wander extends LPAICommand within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Duration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWanderFast;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinSleepBeforeWanderTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxSleepBeforeWanderTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AICMDWanderParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SleepBeforeWanderTime;

function Pushed()
{
    super.Pushed();
    TimeStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Kynapse_ActivateBot(true);
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetWanderingMaxSpeedScale(Outer.myAIPawn));
    //return;    
}

function Popped()
{
    Outer.Kynapse_ClearLatentAgent();
    Outer.Kynapse_ActivateBot(false);
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
    Outer.myAIPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    Outer.myAIPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    super.Popped();
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    Outer.Kynapse_ActivateBot(false);
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
    super.Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    Outer.Kynapse_ActivateBot(true);
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetWanderingMaxSpeedScale(Outer.myAIPawn));
    //return;    
}

function AddConstraint()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewConstraint[8388609];

    AICMDWanderParams.Constraints.AddItem(NewConstraint);    
    //return;    
}

state StateCmdActive
{Begin:

    Outer.Kynapse_ActivateBot(true);
    // End:0x10C
    if(Outer.CoverIsIn())
    {
        // End:0xA9
        if(Outer.CoverActionIsDoing() && !Outer.CanExitCoverFromCoverAction())
        {
            Outer.CoverResetAction();
        }
        J0xA9:

        // End:0xEB [Loop If]
        if(Outer.IsTransitioning())
        {
            Outer.Sleep(0.1000000);
            // [Loop Continue]
            goto J0xA9;
        }
        Outer.CoverExit();
    }
    J0x10C:

    // End:0x13B [Loop If]
    if(!IsKynapseReady())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x10C;
    }
    GotoState('StateWander');
    stop;            
}

state StateWander
{
    function SetWanderParams()
    {
        local /*0x97E50000-0x00000000*/ private float SpeedScale;

        // End:0x1F
        if(bWanderFast)
        {
            SpeedScale = 1.0000000;            
        }
        else
        {
            SpeedScale = Outer.myAIPawn.TuneDataAIPawn.GetWanderingMaxSpeedScale(Outer.myAIPawn);
        }
        Outer.myAIPawn.SetMaxSpeedScale(SpeedScale);
        AICMDWanderParams.WanderDistance = 10000.0000000;
        SleepBeforeWanderTime = RandRange(MinSleepBeforeWanderTime, MaxSleepBeforeWanderTime);
        //return;        
    }
Begin:

    SetWanderParams();
    Outer.Focus = none;
    Outer.Sleep(SleepBeforeWanderTime);
    Outer.Focus = none;
    Outer.Kynapse_LatentWander(AICMDWanderParams, none, Duration);
    Outer.myAIPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    Outer.myAIPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
    GotoState('StateCmdActive');
    stop;                
}

defaultproperties
{
    Duration=10.0000000
    MinSleepBeforeWanderTime=1.0000000
    MaxSleepBeforeWanderTime=2.0000000
    AICMDWanderParams=(WanderDistance=1500.0000000,WanderPropagationAngle=150.0000000,WanderSpeed=0.0000000,Constraints=none)
}