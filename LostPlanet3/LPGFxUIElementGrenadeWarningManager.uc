class LPGFxUIElementGrenadeWarningManager extends LPGFxUIElementWorldObjectManager;

function RemoveUnusedElements()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x70 [Loop If]
    if(I < Attachments.Length)
    {
        // End:0x62
        if(Attachments[I].AttachedActor == none)
        {
            RemoveElementForIndex(I);
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function GetUIElementForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Grenade[8388609];
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
        if((Attachments[I].bUsed && Attachments[I].AttachedActor == Grenade) && (Index == -1) || Attachments[I].Index == Index)
        {
            // End:0x133
            if(Attachments[I].UIElement != none)
            {
                return LPGFxUIElementGrenadeWarning(Attachments[I].UIElement);
            }
        }
        I++;
        // [Loop Continue]
        goto J0x14;
    }
    return none;
    //return ReturnValue;    
}

defaultproperties
{
    UIElementClass=Class'LPGFxUIElementGrenadeWarning'
}