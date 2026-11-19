class LPGFxUIElementBombPoint extends LPGFxUIElementMPObjective
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BombActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDangerMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CountdownSeconds;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CountdownDangerThreshold[1073741825];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super.Init(MP);
    BombActor = LPBombActor(AttachedActor);
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    super.SetAttachedActor(TheActor, theIndex);
    BombActor = LPBombActor(AttachedActor);
    //return;    
}

function UpdateObjectiveIcon()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.UpdateObjectiveIcon(DeltaTime);
    switch(BombActor.DeploymentState)
    {
        // End:0xAB
        case 3:
            SetProgress((BombActor.TimeToArmBomb - BombActor.CurrentTimeRemaining) / BombActor.TimeToArmBomb);
            // End:0x182
            break;
        // End:0x105
        case 4:
            SetProgress(BombActor.CurrentTimeRemaining / BombActor.TimeUntilExplode);
            UpdateCountdownTimer();
            // End:0x182
            break;
        // End:0x17F
        case 5:
            SetProgress((BombActor.TimeToDisarmBomb - BombActor.CurrentTimeRemaining) / BombActor.TimeToDisarmBomb);
            UpdateCountdownTimer();
            // End:0x182
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function UpdateCountdownTimer()
{
    local /*0x97E50000-0x00000000*/ private int NewCountdownSeconds;

    // End:0x1B0
    if(MPHUD.bMPObjectiveVisible && !MPHUD.bMPSubObjectiveVisible)
    {
        MPHUD.ShowMPSubObjective(true);
        MPHUD.SetMPSubObjectiveType("timer");
        MPHUD.SetMPSubObjectiveText(Class'SPEngine.SPUtil'.static.GetLocalizedString("<Strings:LostPlanetGame.MPObjectives_GeneralMessages.ObjectiveMessage_BombCountdown>"));
        MPHUD.SetMPSubObjectiveTimerPunctuation(":", Class'SPEngine.SPUtil'.static.GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.Decimal>"));
        CountdownSeconds = -1;
    }
    // End:0x2B2
    if(MPHUD.bMPSubObjectiveVisible)
    {
        NewCountdownSeconds = FCeil(BombActor.GetCountdownTime());
        // End:0x2B2
        if(CountdownSeconds != NewCountdownSeconds)
        {
            CountdownSeconds = NewCountdownSeconds;
            MPHUD.SetMPSubObjectiveTimer(CountdownSeconds);
            // End:0x2B2
            if(!bDangerMode)
            {
                bDangerMode = CountdownSeconds <= CountdownDangerThreshold;
                // End:0x2B2
                if(bDangerMode)
                {
                    MPHUD.SetMPSubObjectiveDangerMode(true);
                }
            }
        }
    }
    //return;    
}

function StopCountdownTimer()
{
    bDangerMode = false;
    MPHUD.SetMPSubObjectiveDangerMode(false);
    MPHUD.SetMPSubObjectiveType("normal");
    MPHUD.ShowMPSubObjective(false);
    //return;    
}

function ObjectiveChangedState()
{
    switch(BombActor.DeploymentState)
    {
        // End:0x2D
        case 0:
        // End:0x32
        case 1:
        // End:0x62
        case 2:
            StopCountdownTimer();
            SetObjectiveState("default");
            ShowProgress(false);
            // End:0x134
            break;
        // End:0x88
        case 3:
            SetObjectiveState("planted");
            ShowProgress(true);
            // End:0x134
            break;
        // End:0xAE
        case 5:
            SetObjectiveState("defused");
            ShowProgress(true);
            // End:0x134
            break;
        // End:0xD4
        case 4:
            SetObjectiveState("planted");
            ShowProgress(true);
            // End:0x134
            break;
        // End:0x106
        case 6:
            StopCountdownTimer();
            SetObjectiveState("detonated");
            ShowProgress(false);
            // End:0x134
            break;
        // End:0xFFFF
        default:
            StopCountdownTimer();
            SetObjectiveState("default");
            ShowProgress(false);
            // End:0x134
            break;
            break;
    }
    //return;    
}

function ShouldHideUI()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.ShouldHideUI() || !BombActor.bEnabled;
    //return ReturnValue;    
}

defaultproperties
{
    CountdownDangerThreshold=10
    ObjectiveType="bomb"
    ObjectiveStateFunc="setMPBombPointState"
    IconOffset=(X=0.0000000,Y=0.0000000,Z=200.0000000)
}