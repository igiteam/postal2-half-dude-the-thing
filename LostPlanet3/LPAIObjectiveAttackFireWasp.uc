class LPAIObjectiveAttackFireWasp extends LPAIObjectiveAttackActor within LPAIControllerMedFlyer
    config(AI)
    hidecategories(Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasOutOfReachOfTheFlyGraphLastCheck;

event OnGenerated()
{
    super(LPAIObjectiveAttack).OnGenerated();
    bWasOutOfReachOfTheFlyGraphLastCheck = false;
    //return;    
}

event ShowDebugInfo()
{
    super(LPAIObjectiveAttack).ShowDebugInfo();
    //return;    
}

protected event DisplayDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x97E50000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x97E50000-0x00000000*/ private @NULL Canvas;

    Canvas = HUD.Canvas;
    super(LPAIObjectiveAttack).DisplayDebug(HUD, out_YL, out_YPos);
    Canvas.DrawText("  Is OOR of Fly Graph :" $ string(bWasOutOfReachOfTheFlyGraphLastCheck));
    out_YPos += out_YL;
    HUD.Canvas.SetPos(4.0000000, out_YPos);
    //return;    
}

event GetCostFactor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Factor;
    local /*0x97E50000-0x00000000*/ private @NULL IsenbergTarget;

    Factor = super(LPAIObjectiveAttack).GetCostFactor(InAttackTarget);
    // End:0xBD
    if(Factor > float(0))
    {
        IsenbergTarget = LPAIPawnVSISS(InAttackTarget.Info.Actor);
        // End:0xBD
        if(IsenbergTarget != none)
        {
            Factor *= IsenbergTarget.TuneDataVsISS.CostReductionFactorFireWasp;
        }
    }
    return Factor;
    //return ReturnValue;    
}

protected event CanBeAttacked()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn, StruggleResource;
    local /*0x97E50000-0x00000000*/ private float timeSinceGen;

    inPawn = LPPawn(InAttackTarget.Info.Actor);
    // End:0x3EF
    if(inPawn != none)
    {
        // End:0x142
        if(LPPlayerPawn(inPawn) != none)
        {
            StruggleResource = LPAIResourceStruggle(LPPlayerPawn(inPawn).AIResourceManager.GetResource(Outer.StruggleResourceName));
            // End:0x142
            if(StruggleResource != none)
            {
                // End:0x142
                if(StruggleResource.IsLocked() || !StruggleResource.IsUsable(LPPlayerPawn(inPawn)))
                {
                    return false;
                }
            }
        }
        // End:0x169
        if(Outer.GetIfPerformingReactiveAttack())
        {
            return false;            
        }
        else
        {
            // End:0x19B
            if(!Outer.CanBeMyEnemy(inPawn))
            {
                return false;                
            }
            else
            {
                // End:0x3EF
                if(!CanHaveAttackAccess(inPawn))
                {
                    timeSinceGen = Outer.WorldInfo.TimeSeconds - TimeGenerated;
                    // End:0x3ED
                    if((timeSinceGen > Outer.myAIPawn.TuneDataAIPawn.DelayWithNoFormationBeforeStartingSearchForAltToFormationLocPointToStrikeFrom.GetValue()) && Outer.AltToFormationLocPointToStrikeFromIndexInManager < 0)
                    {
                        // End:0x2D0
                        if(Outer.AIResMortarLocManagerRef == none)
                        {
                            Outer.AcquireAIResMortarLocManagerRef();
                        }
                        // End:0x3ED
                        if(Outer.AIResMortarLocManagerRef != none)
                        {
                            // End:0x3EA
                            if(Outer.StartSearchForBestMortarPosition(inPawn, Outer.myAIPawn.TuneDataAIPawn.MaxFindLobStrikeLocTraversalDistance.GetValue(), Outer.IsValidLobStrikePosition, Outer.FindLobSpotTraversalFinished))
                            {
                                Outer.bRunningSearchForAltToFormationLocPointToStrikeFrom = true;
                            }                            
                        }
                    }
                    return false;
                }
            }
        }
    }
    return true;
    //return ReturnValue;    
}

protected event CanHaveAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bStrikePossible, bOrbitSlotPossible, bMortarLocPossible;
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;

    bMortarLocPossible = false;
    bStrikePossible = false;
    bMortarLocPossible = false;
    // End:0x172
    if(inActor != none)
    {
        inPawn = LPPawn(inActor);
        // End:0xFE
        if((inPawn != none) && inPawn.IsInAttackVolumeFor(Outer.myAIPawn))
        {
            // End:0xEF
            if(inPawn.IsAttackVolumeAccessPossible(Outer.myAIPawn))
            {
                bStrikePossible = true;                
            }
            else
            {
                bStrikePossible = false;
            }            
        }
        else
        {
            bOrbitSlotPossible = CanHaveOrbitAccessForActor(inActor);
            // End:0x149
            if(!bOrbitSlotPossible)
            {
                bMortarLocPossible = FoundMortarAttackLocForActor(inActor);
            }
        }
        return (bStrikePossible || bOrbitSlotPossible) || bMortarLocPossible;
    }
    return false;
    //return ReturnValue;    
}

event GetCostFactorAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x46
    if(CanHaveOrbitAccessForActor(InAttackTarget.Info.Actor))
    {
        return CostFactor_HaveMeleeAccess;
    }
    return 1.0000000;
    //return ReturnValue;    
}

event GetCostFactorForOffMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

protected function CanHaveOrbitAccessForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;

    // End:0x137
    if(inActor != none)
    {
        inPawn = LPPawn(inActor);
        // End:0x137
        if(inPawn != none)
        {
            // End:0x137
            if(((inPawn != none) && inPawn.AIResourceManager != none) && inPawn.AIResourceManager.HasResource(Outer.OrbitResourceName))
            {
                return inPawn.AIResourceManager.IsAccessPossible(Outer.OrbitResourceName, Outer.myAIPawn);
            }
        }
    }
    return false;
    //return ReturnValue;    
}

protected function FoundMortarAttackLocForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xD3
    if(inActor != none)
    {
        // End:0xD3
        if((Outer.AltToFormationLocPointToStrikeFromIndexInManager >= 0) && Outer.AIResMortarLocManagerRef != none)
        {
            return Outer.AIResMortarLocManagerRef.IsThisLocationValidForMortarAttackingActor(Outer.AltToFormationLocMotarPointToStrikeFrom, Outer.AltToFormationLocPointToStrikeFromIndexInManager, inActor);
        }
    }
    return false;
    //return ReturnValue;    
}

function @NULL IsOffFlyGraph()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;
    local /*0x97E50000-0x00000000*/ private float ReachDistance, Seperation;
    local /*0x97E50000-0x00000000*/ private @NULL DesiredPos;

    Seperation = TargetInfoSeperation(InAttackTarget);
    // End:0x36
    if(Seperation <= AttackRange)
    {
        return false;
    }
    DesiredPos = InAttackTarget.Info.Location;
    BotHandle = SPKynapseFlyingBotHandle(Outer.myAIPawn.myKynapseHandle);
    ReachDistance = Outer.MedFlyerPawn.TuneDataMedFlyer.MaxNodeDistanceForAttackObjectiveFlyCanReachCheck;
    // End:0x144
    if(!BotHandle.PathFinder_FlyCanReach(DesiredPos, ReachDistance, 0.0000000))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

protected function PerformObjective()
{
    Outer.Enemy = Pawn(EnemyInfo.Info.Actor);
    Outer.MyLPEnemy = LPPawn(EnemyInfo.Info.Actor);
    // End:0x1A3
    if(Outer.MyLPEnemy != none)
    {
        Outer.EngagementTarget = Outer.MyLPEnemy;
        CmdAttack(Outer.MyLPEnemy, Outer.CmdStatus_Orbit);
        // End:0x1A0
        if(int(Outer.CmdStatus_Attack.Cmd_Attack_Error) != int(0))
        {
            Status = 4;
        }        
    }
    else
    {
        Status = 4;
    }
    //return;    
}

defaultproperties
{
    AttackRange=80.0000000
    MinimumAttackTimeBeforeSwitchingEnemies=4.0000000
    AttackCmdTable=/* Array type was not detected. */
    Attribute=(GameType=SPAIObjectiveGameType.SPAI_OBJ_GAMETYPE_SINGLE_PLAYER)
}