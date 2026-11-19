class LPGFxUIElementWaypointManager extends LPGFxUIElementWorldObjectManager;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ParentHUDPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte HUDUmbilicalState;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElementWorldObjectManager).Init(MP);
    ParentHUDPlayer = LPGFxMoviePlayerHUD(MoviePlayer);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bRetval;

    bRetval = super(SPGFxUIElementWorldObjectManager).Update(DeltaTime);
    return bRetval;
    //return ReturnValue;    
}

function SetUmbilicalState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    HUDUmbilicalState = NewState;
    I = 0;
    J0x1E:

    // End:0x93 [Loop If]
    if(I < Attachments.Length)
    {
        LPGFxUIElementWaypoint(Attachments[I].UIElement).SetUmbilicalState(HUDUmbilicalState);
        I++;
        // [Loop Continue]
        goto J0x1E;
    }
    //return;    
}

function NotifyWaypointActivated()
{
    local /*0x97E50000-0x00000000*/ private @NULL WaypointMarker[8388609];
    local /*0x97E50000-0x00000000*/ private int AttachIdx;
    local /*0x97E50000-0x00000000*/ private @NULL UIEWaypoint;

    AttachIdx = AddElementForActor(WaypointMarker);
    UIEWaypoint = LPGFxUIElementWaypoint(Attachments[AttachIdx].UIElement);
    UIEWaypoint.Activated(HUDUmbilicalState);
    //return;    
}

function NotifyWaypointDeactivated()
{
    local /*0x97E50000-0x00000000*/ private @NULL WaypointMarker[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL CurWaypoint;

    I = 0;
    J0x0B:

    // End:0xC9 [Loop If]
    if(I < Attachments.Length)
    {
        CurWaypoint = LPBreadcrumb(Attachments[I].AttachedActor);
        // End:0xBB
        if(CurWaypoint == WaypointMarker)
        {
            LPGFxUIElementWaypoint(Attachments[I].UIElement).TurnOff();
            // [Explicit Break]
            goto J0xC9;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0xC9:

    //return;    
}

defaultproperties
{
    UIElementClass=Class'LPGFxUIElementWaypoint'
}