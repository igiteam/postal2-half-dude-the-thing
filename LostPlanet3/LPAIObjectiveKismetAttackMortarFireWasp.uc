class LPAIObjectiveKismetAttackMortarFireWasp extends LPAIObjectiveKismetAttackMortarBase within LPAIControllerFireWasp
    config(AI)
    hidecategories(Object,Object,Object,Object);

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.IsValid();
    //return ReturnValue;    
}

function InitFromKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], KismetData;

    super.InitFromKismet(InKismetObjectiveData);
    KismetData = LPAIOD_FireWaspMortarAttack(InKismetObjectiveData);
    // End:0x1DD
    if(KismetData != none)
    {
        MortarAttackSetupInfo.MinHeightDelta = KismetData.MinHeightDelta;
        MortarAttackSetupInfo.MaxHeightDelta = KismetData.MaxHeightDelta;
        MortarAttackSetupInfo.HeightErrorBuffer = KismetData.HeightErrorBuffer;
        MortarAttackSetupInfo.bUseHeightInsteadOfPitchForEvaluations = KismetData.bUseHeightInsteadOfPitchForEvaluations;
        MortarAttackSetupInfo.MinPitchAllowedInDegrees = KismetData.MinPitchAllowedInDegrees;
        MortarAttackSetupInfo.MaxPitchAllowedInDegrees = KismetData.MaxPitchAllowedInDegrees;
        MortarAttackSetupInfo.PitchErrorBufferInDegrees = KismetData.PitchErrorBufferInDegrees;
    }
    //return;    
}

static function @NULL CreateNewObjectiveForEnemy()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, InInfo, ReturnValue, Obj;

    Obj = LPAIObjectiveKismetAttackMortarFireWasp(default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes));
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

    Obj = LPAIObjectiveKismetAttackMortarFireWasp(default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes));
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