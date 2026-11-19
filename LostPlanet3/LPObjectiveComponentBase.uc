class LPObjectiveComponentBase extends ActorComponent
    abstract;

var(0.25_Pct) /*0x90540000-0x00000400*/ private editfixedsize @NULL ObjectiveDescription[589825];
var(0.25_Pct) /*0x06BA0000-0x00000400*/ private editfixedsize array AnnouncementDialogs[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte ObjectiveType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CurrentPrimaryEventString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsSecondaryObjective;

function ExternalTriggerEvent()
{
    local /*0x97E50000-0x00000000*/ private class EventClassToTrigger[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array EvtList;

    return Owner.FindEventsOfClass(EventClassToTrigger, EvtList, false);
    UpdateCurrentPrimaryEventString(EventClassToTrigger.default.EventString);
    //return ReturnValue;    
}

function IsPrimaryEvent()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string EventString[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bIsSecondaryObjective)
    {
        return false;
    }
    return IsPrimaryEventString(EventString);
    //return ReturnValue;    
}

function IsPrimaryEventString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string EventString[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(EventString)
    {
        // End:0x1F
        case "Begin":
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}

function UpdateCurrentPrimaryEventString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string EventString[8388609];

    // End:0x29
    if(IsPrimaryEventString(EventString))
    {
        CurrentPrimaryEventString = EventString;
    }
    //return;    
}

function SetAsPrimaryObjective()
{
    local /*0x97E50000-0x00000000*/ private bool bPrimary[9437185];

    true
    bIsSecondaryObjective = !bPrimary;
    //return;    
}

defaultproperties
{
    // Reference: LPLocTextSelector'Default__LPObjectiveComponentBase.TxtSelector0'
    begin object name=TxtSelector0 class=Class'LPLocTextSelector'
    end object
    ObjectiveDescription=TxtSelector0
}