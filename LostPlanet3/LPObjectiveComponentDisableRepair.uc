class LPObjectiveComponentDisableRepair extends LPObjectiveComponentBase;

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
    I = LPDisableRepairObjective(Owner);
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
    // Reference: LPLocTextSelector'Default__LPObjectiveComponentDisableRepair.TxtSelector0'
    begin object name=TxtSelector0
    end object
    ObjectiveDescription=TxtSelector0
    ObjectiveType=EMPObjectiveType.EMPOT_DisableRepair
}