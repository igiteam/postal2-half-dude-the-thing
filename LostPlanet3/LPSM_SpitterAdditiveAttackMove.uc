class LPSM_SpitterAdditiveAttackMove extends SPSpecialMove
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMoveInProgress;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLooping;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUpperBody;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpitterPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayBackRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendInTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendOutTime;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    bMoveInProgress = false;
    SpitterPawn = LPAIPawnSpitter(MySPPawn);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    bMoveInProgress = false;
    // End:0x5C
    if(bUpperBody)
    {
        SpitterPawn.StopUpperBodyAnim(0.1500000);        
    }
    else
    {
        SpitterPawn.StopAdditiveAnim(0.1500000);
    }
    //return;    
}

simulated function AnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    SpitterPawn.ServerEndSpecialMove(default.Class);
    //return;    
}

simulated function StartAnim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xF4
    if(!bMoveInProgress)
    {
        bMoveInProgress = true;
        // End:0x92
        if(bUpperBody)
        {
            SpitterPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), AnimFinished,, PlayBackRate, BlendInTime, BlendOutTime, bLooping, true,,,,, true);            
        }
        else
        {
            SpitterPawn.PlayAdditiveAnimationSequence(GetBestSequenceTemplateByIndex(0), AnimFinished,, PlayBackRate, BlendInTime, BlendOutTime, bLooping, true);
        }
    }
    return true;
    //return ReturnValue;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(GameSpecialMove).Tick(DeltaTime);
    StartAnim();
    //return;    
}

defaultproperties
{
    PlayBackRate=1.0000000
    BlendInTime=0.1000000
    BlendOutTime=0.1500000
    AnimationTemplateNodeNames=/* Array type was not detected. */
}