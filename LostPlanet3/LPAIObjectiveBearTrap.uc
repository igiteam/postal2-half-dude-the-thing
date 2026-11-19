class LPAIObjectiveBearTrap extends LPAIObjective within LPAIControllerBurrower
    hidecategories(Object,Object);

event CanBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.bStartAsBearTrap;
    //return ReturnValue;    
}

protected function PerformObjective()
{
    CmdBearTrap();
    Status = 1;
    //return;    
}

function CmdBearTrap()
{
    local /*0x97E50000-0x00000000*/ private float Duration[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    10.0000000
    0
    // End:0x61
    if(int(CmdOption) == int(0))
    {
        Outer.AbortCommand(Outer.CommandList);
    }
    myCommand = LPAICmd_BurrowerBearTrap(Class'LPAICmd_BurrowerBearTrap'.static.InitObjectiveCommand(Outer, self));
    return myCommand;
    //return ReturnValue;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes, BurrowerCtrl;

    BurrowerCtrl = LPAIControllerBurrower(OuterController);
    // End:0x40
    if(BurrowerCtrl.bObjectiveBearTrapGenerated)
    {
        return;
    }
    default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes);
    BurrowerCtrl.bObjectiveBearTrapGenerated = true;
    //return;    
}

defaultproperties
{
    Attribute=(PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_KismetAggressive,bRemoveWhenFinished=true)
}