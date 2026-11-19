class LPGFxUIElementCreditsForDamageManager extends LPGFxUIElementWorldObjectManager;

function GetUIElementForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL ObjectiveActor[8388609];
    local /*0x97E50000-0x00000000*/ private int Index[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    -1
    I = 0;
    J0x14:

    // End:0x141 [Loop If]
    if(I < Attachments.Length)
    {
        // End:0x133
        if((Attachments[I].bUsed && Attachments[I].AttachedActor == ObjectiveActor) && (Index == -1) || Attachments[I].Index == Index)
        {
            // End:0x133
            if(Attachments[I].UIElement != none)
            {
                return LPGFxUIElementCreditsForDamage(Attachments[I].UIElement);
            }
        }
        I++;
        // [Loop Continue]
        goto J0x14;
    }
    return none;
    //return ReturnValue;    
}

function CleanupOrphans()
{
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL Element;

    // End:0xEB
    foreach Attachments(Element, Idx)
    {
        // End:0xEA
        if((Element.bUsed && Element.UIElement != none) && LPGFxUIElementCreditsForDamage(Element.UIElement).bRecycle)
        {
            Element.UIElement.SetActive(false, false);
            MarkAttachmentUnused(Idx);
        }        
    }    
    //return;    
}

defaultproperties
{
    UIElementClass=Class'LPGFxUIElementCreditsForDamage'
}