class LPSM_PlayerDeployDeployableBase extends SPSpecialMoveStateBased
    config(Game);

enum EDeployableSequence
{
    EDeployableSequence_Deploying,  // 0
    EDeployableSequence_Priming,    // 1
    EDeployableSequence_Arise,      // 2
    EDeployableSequence_MAX         // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte SequenceID;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PlaybackType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDeployedOK;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayBackRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DeployTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PerkIndex;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    PRI = LPPRI(inPawn.PlayerReplicationInfo);
    // End:0xD8
    if((PRI != none) && PerkIndex >= 0)
    {
        PlayBackRate = PRI.GetReplicatedPerkDeployRate(byte(PerkIndex));
        DeployTime = PRI.GetReplicatedPerkDeployTime(byte(PerkIndex));        
    }
    //return;    
}

protected function InternalCanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SequenceFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPC, LPP;

    LPC = LPPlayerController(MySPPawn.Controller);
    LPP = LPPlayerPawn(MySPPawn);
    switch(SequenceID)
    {
        // End:0xD8
        case 0:
            // End:0x93
            if(LPC != none)
            {
                LPC.DeployAnimationDeployNotify();
            }
            bDeployedOK = true;
            LPP.SetTimer(DeployTime, false, 'StandUpAfterDeployment');
            NextSequence();
            // End:0x138
            break;
        // End:0xEA
        case 1:
            NextSequence();
            // End:0x138
            break;
        // End:0x112
        case 2:
            MySPPawn.EndCurrentSpecialMove();
            // End:0x138
            break;
        // End:0xFFFF
        default:
            MySPPawn.EndCurrentSpecialMove();
            // End:0x138
            break;
            break;
    }
    //return;    
}

function NextSequence()
{
    SequenceID = byte(int(SequenceID) + 1);
    PlaySequence();
    //return;    
}

function PlaySequence()
{
    // End:0x33
    if(AnimationTemplateNodeNames[int(SequenceID)] == 'None')
    {
        SequenceFinished(none, 0, false);        
    }
    else
    {
        switch(PlaybackType)
        {
            // End:0xBD
            case 0:
                MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(int(SequenceID)), SequenceFinished,, PlayBackRate, 0.2500000, 0.2500000, int(SequenceID) == int(1), true,,, true);
                // End:0x140
                break;
            // End:0x135
            case 1:
                MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(int(SequenceID)), SequenceFinished,, PlayBackRate, 0.2500000, 0.2500000, int(SequenceID) == int(1), true,,, true);
                // End:0x140
                break;
            // End:0x13D
            case 2:
                // End:0x140
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super(SPSpecialMove).SpecialMoveStarted(bForced, PrevMove);
    SequenceID = 0;
    PlaySequence();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPP;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x57
    if(int(PlaybackType) == int(1))
    {
        MySPPawn.StopUpperBodyAnim(0.5000000);        
    }
    else
    {
        MySPPawn.StopFullBodyAnim(0.5000000);
    }
    LPP = LPPlayerPawn(MySPPawn);
    // End:0xFD
    if((LPP != none) && LPP.IsTimerActive('StandUpAfterDeployment'))
    {
        LPP.ClearTimer('StandUpAfterDeployment');
    }
    //return;    
}

defaultproperties
{
    PlayBackRate=1.0000000
    PerkIndex=-1
    AnimationTemplateNodeNames=/* Array type was not detected. */
}