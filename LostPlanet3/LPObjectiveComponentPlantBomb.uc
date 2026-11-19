class LPObjectiveComponentPlantBomb extends LPObjectiveComponentBase;

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
    I = LPBombActor(Owner);
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
        // End:0x27
        case "Armed":
        // End:0x34
        case "Disarmed":
        // End:0x44
        case "Destroyed":
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPLocTextSelector'Default__LPObjectiveComponentPlantBomb.TxtSelector0'
    begin object name=TxtSelector0
    end object
    ObjectiveDescription=TxtSelector0
    ObjectiveType=EMPObjectiveType.EMPOT_Bomb
}