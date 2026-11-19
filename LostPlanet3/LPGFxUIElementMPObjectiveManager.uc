class LPGFxUIElementMPObjectiveManager extends LPGFxUIElementWorldObjectManager;

function ObjectiveChangedState()
{
    local /*0x97E50000-0x00000000*/ private @NULL ObjectiveActor[8388609];
    local /*0x97E50000-0x00000000*/ private int Index[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL Element;

    -1
    Element = GetUIElementForActor(ObjectiveActor, Index);
    // End:0x5D
    if(Element != none)
    {
        Element.ObjectiveChangedState();
    }
    //return;    
}

function ObjectiveChangedTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL ObjectiveActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsTouching[8388609];
    local /*0x97E50000-0x00000000*/ private int Index[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL Element;

    -1
    Element = GetUIElementForActor(ObjectiveActor, Index);
    // End:0x67
    if(Element != none)
    {
        Element.ObjectiveChangedTouch(bIsTouching);
    }
    //return;    
}

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
                return LPGFxUIElementMPObjective(Attachments[I].UIElement);
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
    UIElementClass=Class'LPGFxUIElementMPObjective'
}