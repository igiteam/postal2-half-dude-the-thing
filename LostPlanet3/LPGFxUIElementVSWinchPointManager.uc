class LPGFxUIElementVSWinchPointManager extends LPGFxUIElementWorldObjectManager;

function UpdateWinchPointForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL pos[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFirmGrab[8388609], bPlayerIsBusy;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL WinchPoint;

    I = 0;
    J0x0B:

    // End:0x13D [Loop If]
    if(I < Attachments.Length)
    {
        // End:0x12F
        if((Attachments[I].AttachedActor == TheActor) && (Index == -1) || Attachments[I].Index == Index)
        {
            WinchPoint = LPGFxUIElementVSWinchPoint(Attachments[I].UIElement);
            WinchPoint.SetWorldPosition(pos);
            WinchPoint.SetPlayerIsBusy(bPlayerIsBusy);
            // [Explicit Break]
            goto J0x13D;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x13D:

    //return;    
}

function UpdateWinchPointForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPlayerIsBusy[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL WinchPoint;

    I = 0;
    J0x0B:

    // End:0xCA [Loop If]
    if(I < Attachments.Length)
    {
        // End:0xBC
        if(Attachments[I].AttachedActor == TheActor)
        {
            WinchPoint = LPGFxUIElementVSWinchPoint(Attachments[I].UIElement);
            WinchPoint.SetPlayerIsBusy(bPlayerIsBusy);
            // [Explicit Break]
            goto J0xCA;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0xCA:

    //return;    
}

function AnyWinchPointActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL inTestActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Info;

    // End:0xB8
    foreach Attachments(Info)
    {
        // End:0xB7
        if((Info.bUsed && LPGFxUIElementVSInteractionPoint(Info.UIElement).bDisplayInteractable) && (inTestActor == none) || Info.AttachedActor == inTestActor)
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    UIElementClass=Class'LPGFxUIElementVSWinchPoint'
}