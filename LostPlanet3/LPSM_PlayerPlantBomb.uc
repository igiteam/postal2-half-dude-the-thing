class LPSM_PlayerPlantBomb extends LPSM_BaseChoreography
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlantTimeLeft;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlantIntroDone;

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
    bPlantIntroDone = true;
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
    bPlantIntroDone = false;
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
    if(PlantTimeLeft > float(0))
    {
        PlantTimeLeft -= DeltaTime;
        // End:0xE7
        if(PlantTimeLeft <= float(0))
        {
            PlantTimeLeft = 0.0000000;
            SMFinishedDelegate = None;
            MySPPawn.EndSpecialMove(Class);
            LPPC = LPPlayerController(MySPPawn.Controller);
            // End:0xE7
            if(LPPC != none)
            {
                LPPC.PlantBombComplete();
            }
        }
    }
    //return;    
}

function SetPlantBombTime()
{
    local /*0x97E50000-0x00000000*/ private float Delay[8388609];

    PlantTimeLeft = Delay;
    //return;    
}

function GetAnimTemplateToPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x37
    if(MySPPawn != none)
    {
        // End:0x2B
        if(bPlantIntroDone)
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