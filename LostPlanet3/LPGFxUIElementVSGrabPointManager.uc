class LPGFxUIElementVSGrabPointManager extends LPGFxUIElementWorldObjectManager;

function UpdateGrabPointForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL pos[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFirmGrab[8388609], bPlayerIsBusy;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL GrabPoint;

    I = 0;
    J0x0B:

    // End:0x166 [Loop If]
    if(I < Attachments.Length)
    {
        // End:0x158
        if((Attachments[I].AttachedActor == TheActor) && (Index == -1) || Attachments[I].Index == Index)
        {
            GrabPoint = LPGFxUIElementVSGrabPoint(Attachments[I].UIElement);
            GrabPoint.SetWorldPosition(pos);
            GrabPoint.SetGrabFirmness(bFirmGrab);
            GrabPoint.SetPlayerIsBusy(bPlayerIsBusy);
            // [Explicit Break]
            goto J0x166;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x166:

    //return;    
}

defaultproperties
{
    UIElementClass=Class'LPGFxUIElementVSGrabPoint'
}