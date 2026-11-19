class LPAIControllerTurret extends LPAIController
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TurretPawn;

// Export ULPAIControllerTurret::execGetAssociatedPlayerPRI(FFrame&, void* const)
native simulated function GetAssociatedPlayerPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    TurretPawn = LPAIPawnTurret(inPawn);
    //return;    
}

function CheckFireFacingThreshold()
{
    local /*0x97E50000-0x00000000*/ private @NULL InTarget[8388609];
    local /*0x97E50000-0x00000000*/ private float FacingThresholdAdjust[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TipLoc, TipRot, TipDir, EnemyDir;

    0.0000000
    // End:0x145
    if((InTarget != none) && TurretPawn != none)
    {
        TurretPawn.GetMuzzleLocAndRot(TipLoc, TipRot);
        TipDir = Vector(TipRot);
        EnemyDir = Normal((GetAimLocation(true, 0)) - TipLoc);
        // End:0x145
        if(Class'SPEngine.SPUtil'.static.IsInHorizontalAndVerticalAngleLimit(TipDir, EnemyDir, MyCoverPawn.mySPGFTuneDataPawn.CanFireFacingCosine + FacingThresholdAdjust, MyCoverPawn.mySPGFTuneDataPawn.CanFireFacingCosine + FacingThresholdAdjust))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

protected function _GetBestAimLocationForVisibleTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartLoc[8388609], TargetPawn, ReturnValue, PlayerTarget;

    // End:0x9F
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        PlayerTarget = LPPlayerPawn(TargetPawn);
        // End:0x80
        if(PlayerTarget != none)
        {
            return PlayerTarget.GetProjectileTargetPosition(myAIPawn);            
        }
        else
        {
            return TargetPawn.Location;
        }
    }
    return super(SPGFCoverAIController)._GetBestAimLocationForVisibleTarget(StartLoc, TargetPawn);
    //return ReturnValue;    
}

function AIIsFireLineClear()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PawnTarget;

    // End:0x78
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        PawnTarget = LPPawn(FireTarget);
        // End:0x78
        if(PawnTarget != none)
        {
            // End:0x64
            if(_IsFriendlyBlockingFireLine())
            {
                return false;
            }
            return IsEnemyVisible(PawnTarget);
        }
    }
    return super(SPGFCoverAIController).AIIsFireLineClear();
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerTurret.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerTurret.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerTurret.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerTurret.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerTurret.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerTurret.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerTurret.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    bUseSquad=true
    // Reference: LPAIObjectiveManager'Default__LPAIControllerTurret.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    bUseVisibilityManagerComplexLOSChecks=true
    Components[0]=LPAIObjectiveManager0
}