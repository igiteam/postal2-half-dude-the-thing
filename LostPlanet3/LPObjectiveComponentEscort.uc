class LPObjectiveComponentEscort extends LPObjectiveComponentBase;

function IsPrimaryEventString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string EventString[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(EventString)
    {
        // End:0x1D
        case "Begin":
        // End:0x2A
        case "Disarmed":
        // End:0x39
        case "Repaired":
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}

function ExternalTriggerEvent()
{
    local /*0x97E50000-0x00000000*/ private class EventClassToTrigger[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL I;

    // End:0x23
    if(!super.ExternalTriggerEvent(EventClassToTrigger, EventInstigator))
    {
        return false;
    }
    I = LPSnowcatInterpTransport(Owner);
    // End:0x80
    if(I != none)
    {
        return I.ExternalTriggerEvent(EventClassToTrigger, EventInstigator);
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPLocTextSelector'Default__LPObjectiveComponentEscort.TxtSelector0'
    begin object name=TxtSelector0
    end object
    ObjectiveDescription=TxtSelector0
    ObjectiveType=EMPObjectiveType.EMPOT_Escort
}