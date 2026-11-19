class LPObjectiveComponentCTF extends LPObjectiveComponentBase;

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
    I = LPCourierItem(Owner);
    // End:0x80
    if(I != none)
    {
        return I.ExternalTriggerEvent(EventClassToTrigger, EventInstigator);
    }
    return false;
    //return ReturnValue;    
}

function IsPrimaryEventString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string EventString[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(EventString)
    {
        // End:0x1D
        case "Begin":
        // End:0x2A
        case "PickedUp":
        // End:0x36
        case "Dropped":
        // End:0x48
        case "ReachedDest":
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

    // End:0x2C
    if(IsPrimaryEventString(EventString))
    {
        CurrentPrimaryEventString = EventString;        
    }
    else
    {
        // End:0x5A
        if(EventString == "ReachedSource")
        {
            CurrentPrimaryEventString = "Begin";
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: LPLocTextSelector'Default__LPObjectiveComponentCTF.TxtSelector0'
    begin object name=TxtSelector0
    end object
    ObjectiveDescription=TxtSelector0
    ObjectiveType=EMPObjectiveType.EMPOT_Courier
}