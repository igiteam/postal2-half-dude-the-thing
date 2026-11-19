class LPSM_PlayerZipline extends SPSpecialMoveStateBased
    config(Game);

enum EZiplineReturnAnim
{
    eZiplineGrappleFire,            // 0
    eZiplineHold,                   // 1
    eZiplineTransition,             // 2
    eZiplineCount,                  // 3
    EZiplineReturnAnim_MAX          // 4
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SequenceID;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ShouldLoop;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurPlayingAnimSeq;

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
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.StopFullBodyAnim(0.5000000);
    //return;    
}

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    //return;    
}

protected function InternalCanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HookAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x29
    if((SequenceID + 1) < 18)
    {
        SequenceID = SequenceID + 1;
    }
    PlaySequence();
    //return;    
}

function NextSequence()
{
    // End:0x1D
    if(SequenceID < 1)
    {
        SequenceID = 1;        
    }
    else
    {
        // End:0x3C
        if(SequenceID < 2)
        {
            SequenceID = 2;            
        }
        else
        {
            SequenceID = 2;
        }
    }
    PlaySequence();
    //return;    
}

function PlaySequence()
{
    CurPlayingAnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(SequenceID), HookAnimFinished,, 1.0000000, 0.2500000, 0.2500000, ShouldLoop[SequenceID], true,,, true);
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x40
        case Class'LPSMMTypes'.default.SMM_NextZiplineSequence:
            NextSequence();
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x80
    if(((MySPPawn != none) && LPPlayerPawn(MySPPawn) != none) && LPPlayerPawn(MySPPawn).ZiplineLogicAnimTree != none)
    {
        return LPPlayerPawn(MySPPawn).ZiplineLogicAnimTree;
    }
    return super(SPSpecialMove).GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

defaultproperties
{
    ShouldLoop=/* Array type was not detected. */
    AnimationTemplateNodeNames=/* Array type was not detected. */
}