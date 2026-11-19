class LPSM_PlayerDisarmBomb extends LPSM_BaseChoreography
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DisarmTimeLeft;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisarmIntroDone;

function IntroAnimDone()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    PlayLoopingAnim();
    //return;    
}

function PlayLoopingAnim()
{
    bEndSpecialMoveOnPlayerMovement = true;
    AnimFinishedDelegate = None;
    bShouldLoop = true;
    bDisarmIntroDone = true;
    PlayAnimation();
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    AnimFinishedDelegate = IntroAnimDone;
    bShouldLoop = false;
    bEndSpecialMoveOnAnimFinish = false;
    bDisarmIntroDone = false;
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0xE7
    if(DisarmTimeLeft > float(0))
    {
        DisarmTimeLeft -= DeltaTime;
        // End:0xE7
        if(DisarmTimeLeft <= float(0))
        {
            DisarmTimeLeft = 0.0000000;
            SMFinishedDelegate = None;
            MySPPawn.EndSpecialMove(Class);
            LPPC = LPPlayerController(MySPPawn.Controller);
            // End:0xE7
            if(LPPC != none)
            {
                LPPC.DisarmBombComplete();
            }
        }
    }
    //return;    
}

function SetDisarmBombTime()
{
    local /*0x97E50000-0x00000000*/ private float Delay[8388609];

    DisarmTimeLeft = Delay;
    //return;    
}

function GetAnimTemplateToPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x37
    if(MySPPawn != none)
    {
        // End:0x2B
        if(bDisarmIntroDone)
        {
            return GetBestSequenceTemplateByIndex(1);            
        }
        else
        {
            return GetBestSequenceTemplateByIndex(0);
        }
    }
    return none;
    //return ReturnValue;    
}

function GetAnimNameToPlay()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Seq;

    Seq = GetAnimTemplateToPlay();
    return Seq.AnimSeqName;
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}