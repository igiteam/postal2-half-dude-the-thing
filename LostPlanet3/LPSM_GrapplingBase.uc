class LPSM_GrapplingBase extends SPSpecialMove
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SequenceID;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    SequenceID = 0;
    PlaySequence();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MySPPawn.StopCustomAnim(0.2000000);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

simulated function ShouldAutoPlayNextSequence()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function OnAnimDone()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x11
    if(!ShouldAutoPlayNextSequence())
    {
        return;
    }
    PlayNextSequence();
    //return;    
}

simulated function PlayNextSequence()
{
    SequenceID = SequenceID + 1;
    // End:0x3B
    if(SequenceID < (GetNumAnimations()))
    {
        PlaySequence();        
    }
    else
    {
        OnLastAnimDone();
    }
    //return;    
}

simulated function GetNumAnimations()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return AnimationTemplates.Length;
    //return ReturnValue;    
}

simulated function OnLastAnimDone()
{
    // End:0x35
    if(ShouldEndSpecialMoveWhenAllAnimsDone())
    {
        MySPPawn.EndSpecialMove(Class);
    }
    //return;    
}

function GetRootMotionMode()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 3;
    //return ReturnValue;    
}

function GetPlaybackRate()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

function PlaySequence()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private byte TranslationExtraction, RotationExtraction;
    local /*0x97E50000-0x00000000*/ private @NULL CurrAnimSequence;
    local /*0x97E50000-0x00000000*/ private byte RMMode;

    TranslationExtraction = 0;
    RotationExtraction = 0;
    RMMode = 2;
    // End:0x5A
    if(ShouldUseRootMotion(SequenceID))
    {
        TranslationExtraction = 2;
        RMMode = GetRootMotionMode();
    }
    // End:0x7C
    if(ShouldUseRotationExtraction(SequenceID))
    {
        RotationExtraction = 2;
    }
    CurrAnimSequence = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(SequenceID), OnAnimDone,, GetPlaybackRate(), 0.1000000, 0.1000000, ShouldLoop(SequenceID), true, TranslationExtraction, RotationExtraction, true, RMMode);
    return CurrAnimSequence;
    //return ReturnValue;    
}

simulated function ShouldLoop()
{
    local /*0x97E50000-0x00000000*/ private int AnimTemplateIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function ShouldUseRootMotion()
{
    local /*0x97E50000-0x00000000*/ private int AnimTemplateIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function ShouldUseRotationExtraction()
{
    local /*0x97E50000-0x00000000*/ private int AnimTemplateIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function ShouldEndSpecialMoveWhenAllAnimsDone()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    bAllowRotationInterpolation=true
}