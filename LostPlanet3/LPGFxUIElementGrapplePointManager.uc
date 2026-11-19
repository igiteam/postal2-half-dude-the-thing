class LPGFxUIElementGrapplePointManager extends LPGFxUIElementWorldObjectManager;

final event SetGrapplePointValidForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bValid[8388609];
    local /*0x97E50000-0x00000000*/ private int Index[9437185], I;
    local /*0x97E50000-0x00000000*/ private @NULL GP;

    -1
    I = 0;
    J0x14:

    // End:0x14A [Loop If]
    if(I < Attachments.Length)
    {
        // End:0x13C
        if((Attachments[I].bUsed && Attachments[I].AttachedActor == TheActor) && (Index == -1) || Attachments[I].Index == Index)
        {
            GP = LPGFxUIElementGrapplePoint(Attachments[I].UIElement);
            GP.SetValid(bValid);
            // [Explicit Break]
            goto J0x14A;
        }
        I++;
        // [Loop Continue]
        goto J0x14;
    }
    J0x14A:

    //return;    
}

function AddElementForActorFound()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int Index[9437185], I;

    -1
    I = 0;
    J0x14:

    // End:0x126 [Loop If]
    if(I < Attachments.Length)
    {
        // End:0x118
        if((Attachments[I].bUsed && Attachments[I].AttachedActor == TheActor) && (Index == -1) || Attachments[I].Index == Index)
        {
            Attachments[I].UIElement.SetActive(true, false);
            // [Explicit Break]
            goto J0x126;
        }
        I++;
        // [Loop Continue]
        goto J0x14;
    }
    J0x126:

    //return;    
}

defaultproperties
{
    UIElementClass=Class'LPGFxUIElementGrapplePoint'
}