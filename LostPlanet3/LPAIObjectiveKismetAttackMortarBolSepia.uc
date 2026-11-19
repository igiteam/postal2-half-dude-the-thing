class LPAIObjectiveKismetAttackMortarBolSepia extends LPAIObjectiveKismetAttackMortarBase within LPAIControllerSepia
    config(AI)
    hidecategories(Object,Object,Object,Object);

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.IsValid();
    //return ReturnValue;    
}

static function @NULL CreateNewObjectiveForEnemy()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, InInfo, ReturnValue, Obj;

    Obj = LPAIObjectiveKismetAttackMortarBolSepia(default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes));
    // End:0xDA
    if(Obj != none)
    {
        // End:0xB2
        if(Obj.TheTarget == none)
        {
            Obj.TheTarget = InInfo.Actor;
        }
        Obj.UpdateTarget(InInfo);
    }
    return Obj;
    //return ReturnValue;    
}

static function @NULL CreateNewObjectiveForFixedMortarFromSightWithNoGivenEnemy()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, Obj;

    Obj = LPAIObjectiveKismetAttackMortarBolSepia(default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes));
    // End:0x53
    if(Obj != none)
    {
    }
    //return;    
}

protected function PerformObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = Outer.CmdMortarAttackPof(TheTarget, LocationToLaunchFrom, MortarAttackSetupInfo, None, None, None, none, 0);
    // End:0xC9
    if(myCommand != none)
    {
        myCommand.SetBeSuperAggressive(true);
        myCommand.SetSPAIObjective(self);
    }
    //return;    
}

defaultproperties
{
    MortarAttackSetupInfo=(MinLobStrikesBetweenDamageAssessments=4,MaxLobStrikesBetweenDamageAssessments=7)
}