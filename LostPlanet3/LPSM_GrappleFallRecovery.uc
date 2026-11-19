class LPSM_GrappleFallRecovery extends LPSM_GrapplingHook
    config(Game);

function HookAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    super.HookAnimFinished(Node, InUserData, bInterrupted);
    //return;    
}

function NextSequence()
{
    SequenceID = SequenceID + 1;
    // End:0x45
    if(!bDisableCollision)
    {
        bDisableCollision = true;
        TogglePawnCollision(MySPPawn, false);
    }
    PlaySequence();
    //return;    
}

function SetupSequenceIds()
{
    SetupAsNormal();
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}