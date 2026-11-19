class LPRepairableVSComponent extends LPRepairablePawnComponent;

function GetRepairInfographic()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPBaseVSPlayerPawn(Owner).RepairInfographic;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPQueryAnimNodeTemplateLogicRepairContext'Default__LPRepairableVSComponent.ContextSelector0'
    begin object name=ContextSelector0
    end object
    ContextSelector=ContextSelector0
}