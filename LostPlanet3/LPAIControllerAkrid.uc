class LPAIControllerAkrid extends LPAIController
    config(AI)
    hidecategories(AnimDependency,Navigation);

enum eTurtleState
{
    eTurtleState_None,              // 0
    eTurtleState_GoingIntoTurtle,   // 1
    eTurtleState_GoingIntoDoneWaitingToLoopTurtle,// 2
    eTurtleState_LoopingTurtle,     // 3
    eTurtleState_LoopingDoneWaitingToEndTurtle,// 4
    eTurtleState_CommingOutOfTurtle,// 5
    eTurtleState_CommingOutDoneWaitingToEnd,// 6
    eTurtleState_MAX                // 7
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyAkridPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantsNewEnemy[536870913];

// Export ULPAIControllerAkrid::execSetWantsNewEnemy(FFrame&, void* const)
native function SetWantsNewEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool bInWantsNewEnemy[8388609];


}

// Export ULPAIControllerAkrid::execSetEnemy(FFrame&, void* const)
native function SetEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewEnemy[8388609];


}

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    MyAkridPawn = LPAIPawnAkrid(inPawn);
    MyAkridPawn.SetMaxSpeedScale(MyAkridPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(MyAkridPawn));
    //return;    
}

function CleanUpForBeingPutBackIntoPoolOnDeath()
{
    super.CleanUpForBeingPutBackIntoPoolOnDeath();
    //return;    
}

function SetDefaultTeam()
{
    SetTeam(2);
    //return;    
}

function BurstStart()
{
    MyAkridPawn.NotifyStartOfRangedBurstFire();
    //return;    
}

function BurstStop()
{
    MyAkridPawn.StopRangedBurstFire();
    //return;    
}

function BurstIsFiring()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return MyAkridPawn.bPerformingBurstFire;
    //return ReturnValue;    
}

function DrawFiring()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];

    //return;    
}

function ValidateThisAsLobStrikeLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationToTest[8388609];
    local /*0x97E50000-0x00000000*/ private int HeightTierToTest[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Pawn2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int IndexIntoValidationInfoList[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bableToGoToStrikeLocation, bisThereAClearLobAttackLane;
    local /*0x97E50000-0x00000000*/ private @NULL outPossibleLobFirePointToStrikeFrom;
    local /*0x97E50000-0x00000000*/ private int currentLobZoneIn;

    myAIPawn.LobStrikeLocValidationInfoList[IndexIntoValidationInfoList].bCalulatedThisEngagement = true;
    bableToGoToStrikeLocation = CalculateRangedLobPointToStrikeFrom(outPossibleLobFirePointToStrikeFrom, LocationToTest, Pawn2Attack, myAIPawn.TuneDataAIPawn.RangedLobStrikeInfoByTier[HeightTierToTest].HeightAboveTargetForLobRangedStrikeInUU, myAIPawn.TuneDataAIPawn.RangedLobStrikeInfoByTier[HeightTierToTest].XY_DistanceFromTargetForLobRangedStrikeInUU, 100.0000000, myAIPawn.TuneDataAIPawn.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane);
    // End:0x2A2
    if((bableToGoToStrikeLocation && myAIPawn.TuneDataAIPawn.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane) || !myAIPawn.TuneDataAIPawn.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane)
    {
        bisThereAClearLobAttackLane = IsThereClearLobAttackLaneFromGivenLoc(outPossibleLobFirePointToStrikeFrom, Pawn2Attack, HeightTierToTest, IndexIntoValidationInfoList, currentLobZoneIn);
        // End:0x29F
        if(bisThereAClearLobAttackLane)
        {
            MyAkridPawn.SetAimInfoForRangedLobStrike(Pawn2Attack.Location, Pawn2Attack, HeightTierToTest,, myAIPawn.TuneDataAIPawn.HieghtOffTargetPointForEndOfLobFireArc);
            return true;            
        }        
    }
    return false;
    //return ReturnValue;    
}

function WantsNewEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return false;
    }
    return bWantsNewEnemy;
    //return ReturnValue;    
}

function DealWithGreandeJustGluedToMe()
{
    local /*0x97E50000-0x00000000*/ private @NULL InGrenade[8388609];

    // End:0x38
    if(MyAkridPawn.bRejectsAnyAttachedGrenades)
    {
        PrepGrenadeForBeingSpitOut(InGrenade);        
    }
    else
    {
        // End:0x1E6
        if(MyAkridPawn.bAbsorbsAnyAttachedGrenades)
        {
            MyAkridPawn.Health = int(float(MyAkridPawn.Health) + MyAkridPawn.TuneDataAkrid.HowMuchToIncreaseHealthByWhenConsumingGrenade.GetValue());
            // End:0x1E3
            if((MyAkridPawn.DrawScale * MyAkridPawn.TuneDataAkrid.HowMuchToIncreaseSizeByWhenConsumingGrenade) < MyAkridPawn.TuneDataAkrid.MaxSizeToIncreaseSizeByWhenConsumingGrenade)
            {
                MyAkridPawn.SetDrawScale(MyAkridPawn.DrawScale * MyAkridPawn.TuneDataAkrid.HowMuchToIncreaseSizeByWhenConsumingGrenade);
            }            
        }
        else
        {
            // End:0x2F7
            if(InGrenade != none)
            {
                InGrenade.StopSimulating();
                InGrenade.SetBase(MyAkridPawn,, MyAkridPawn.Mesh, InGrenade.BoneNameGluedTo);
                InGrenade.SetHardAttach(true);
                InGrenade.ExplosionTemplate = MyAkridPawn.TuneDataAkrid.DroneSwallowedInternalExplosionTemplate;
                SetTimer(0.0100000, true, 'BlowMeUpAfterSwallowingGreande', self);
            }
        }
    }
    return;
    //return;    
}

function BlowMeUpAfterSwallowingGreande()
{
    //return;    
}

function PrepGrenadeForBeingSpitOut()
{
    local /*0x97E50000-0x00000000*/ private @NULL InGrenade[8388609];

    // End:0x11F
    if(InGrenade != none)
    {
        InGrenade.SetBase(Pawn,, Pawn.Mesh, InGrenade.BoneNameGluedTo);
        InGrenade.SetHardAttach(true);
        // End:0x11F
        if(MyAkridPawn.TuneDataAIPawn.bSpitOutGrenadeOnAnimNotifyRejecting.GetValue() == float(0))
        {
            SetTimer(MyAkridPawn.TuneDataAkrid.DelayBetweenGrenadeGluedAndRejection, false, 'SpitGrenadeBackOutTimer', self);
        }
    }
    //return;    
}

function SpitGrenadeBackOutTimer()
{
    //return;    
}

function SpitGrenadeBackOut()
{
    local /*0x97E50000-0x00000000*/ private @NULL InGrenade[8388609], spitOutVelocity;
    local /*0x97E50000-0x00000000*/ private float randTimeToBoom;

    // End:0x232
    if(InGrenade != none)
    {
        InGrenade.Init(Vector(Pawn.Rotation));
        spitOutVelocity = Vector(Pawn.Rotation) * MyAkridPawn.TuneDataAkrid.SpeedToGiveToGrenadeWhenRejecting;
        spitOutVelocity.Z = MyAkridPawn.TuneDataAkrid.ExtraVerticalSpeedToGiveToGrenadeWhenRejecting;
        InGrenade.SetVelocity(spitOutVelocity);
        randTimeToBoom = RandRange(MyAkridPawn.TuneDataAkrid.MinTimeToExplosionGiveToGrenadeWhenRejecting.GetValue(), MyAkridPawn.TuneDataAkrid.MaxTimeToExplosionGiveToGrenadeWhenRejecting.GetValue());
        InGrenade.RestartForAkridSpitOut(MyAkridPawn, randTimeToBoom);
        InGrenade.GetSkeletalMesh().SetHidden(false);
    }
    //return;    
}

function IsValidForAIToggle()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x6B
    if((!super(SPAIController).IsValidForAIToggle() || MySPPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_WinchStruggleBase')) || MySPPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSWinchArmGrabbedPawn'))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsOnFire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SPP, ActiveDOT;
    local /*0x97E50000-0x00000000*/ private int I;

    SPP = SPPawn(Pawn);
    // End:0x18D
    if(SPP != none)
    {
        I = 0;
        J0x36:

        // End:0x18D [Loop If]
        if(I < SPP.DOTComponent.ActiveDOTs.Length)
        {
            ActiveDOT = SPP.DOTComponent.ActiveDOTs[I];
            // End:0x17F
            if((ClassIsChildOf(ActiveDOT.DOTInfo.DamageType, Class'LPDamageTypeARIncendiaryDOT') || ClassIsChildOf(ActiveDOT.DOTInfo.DamageType, Class'LPDamageTypeVSWelderDOT')) || ClassIsChildOf(ActiveDOT.DOTInfo.DamageType, Class'LPDamageTypeParticleIncendiaryDOT'))
            {
                return true;
            }
            I++;
            // [Loop Continue]
            goto J0x36;
        }
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerAkrid.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerAkrid.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerAkrid.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerAkrid.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerAkrid.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerAkrid.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerAkrid.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerAkrid.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}