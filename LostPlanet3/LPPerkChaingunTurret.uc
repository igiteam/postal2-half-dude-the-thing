class LPPerkChaingunTurret extends LPPerkDeployable;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TurretTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class TurretClass;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ProximityGuide[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TranslationDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TurretPhysMat;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TurretMICs;

simulated function Init()
{
    // End:0x37
    if(TurretTuneData != none)
    {
        TurretClass = TurretTuneData.TurretClass;
    }
    super(LPPerkBase).Init();
    //return;    
}

function SpawnDeployable()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], T, C, LPP, Loc;

    local /*0x97E50000-0x00000000*/ private float Health;

    // End:0x348
    if(MyPlayerController != none)
    {
        LPP = LPPlayerPawn(MyPlayerController.Pawn);
        Loc = PerkManager.DeploymentLocation;
        T = LPP.Spawn(TurretClass,,, Loc, PerkManager.DeploymentRotation,, true);
        // End:0x348
        if(T != none)
        {
            T.SpawnDefaultController();
            C = LPAIController(T.Controller);
            // End:0x174
            if(C != none)
            {
                C.SetTeam(int(LPP.GetTeamNum()));
            }
            T.AddDefaultInventory();
            T.Controller.SwitchToBestWeapon(true);
            Health = TurretTuneData.Health.GetValue(MyPlayerController);
            T.SetHealthMax(int(Health), int(Health));
            T.FiringArc = TurretTuneData.FiringArc.GetValue(MyPlayerController);
            T.BaseEMPDuration = TurretTuneData.EMPDisruptionDuration.GetValue(MyPlayerController);
            T.bKillDuringLevelTransition = true;
            T.OwningController = MyPlayerController;
        }
    }
    return T;
    //return ReturnValue;    
}

function ActivateDeploymentGuides()
{
    local /*0x97E50000-0x00000000*/ private @NULL EP, Vec, leftRot, rightRot;
    local /*0x97E50000-0x00000000*/ private float arc;
    local /*0x97E50000-0x00000000*/ private @NULL Loc, Rot, LPP;

    super.ActivateDeploymentGuides();
    // End:0x1B
    if(ProximityGuide != none)
    {
        return;
    }
    // End:0x41
    if(TurretTuneData.ProximityGuideParticleSystem == none)
    {
        return;
    }
    EP = MyPlayerController.WorldInfo.MyEmitterPool;
    // End:0x8F
    if(EP == none)
    {
        return;
    }
    LPP = LPPlayerPawn(MyPlayerController.Pawn);
    // End:0xD1
    if(LPP == none)
    {
        return;
    }
    PerkManager.DeploymentLocation = vect(0.0000000, 0.0000000, 0.0000000);
    LPP.Mesh.GetSocketWorldLocationAndRotation(TurretTuneData.DeploymentSocket, Loc, Rot);
    Loc = Loc - MyPlayerController.Pawn.Location;
    TranslationDistance = VSize(Loc);
    ProximityGuide = EP.SpawnEmitterMeshAttachment(TurretTuneData.ProximityGuideParticleSystem, MyPlayerController.Pawn.Mesh, 'JO_positionTracker', false);
    // End:0x3DE
    if(ProximityGuide != none)
    {
        Vec.Y = 1.0000000;
        ProximityGuide.SetRotation(Rotator(Vec));
        arc = TurretTuneData.FiringArc.GetValue(MyPlayerController);
        leftRot.Z = -(arc / float(2)) / float(360);
        rightRot.Z = -leftRot.Z;
        ProximityGuide.SetVectorParameter('InitialRotationLeft', leftRot);
        ProximityGuide.SetVectorParameter('InitialRotationRight', rightRot);
        ProximityGuide.SetAbsolute(false, true, false);
    }
    // End:0x483
    if(LPP.Mesh.IsComponentAttached(LPP.PerkGhostMesh))
    {
        Class'SPEngine.SPUtil'.static.FindAndCreateMaterialInstances(LPP.PerkGhostMesh, TurretPhysMat, TurretMICs);
    }
    //return;    
}

function DeactivateDeploymentGuides()
{
    super.DeactivateDeploymentGuides();
    // End:0x81
    if(ProximityGuide != none)
    {
        ProximityGuide.DetachFromAny();
        ProximityGuide.DeactivateSystem();
        ProximityGuide.KillParticlesForced();
        ProximityGuide = none;
    }
    TurretMICs.Length = 0;
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    super.Tick();
    SetGuideColorAndRotation();
    return true;
    //return ReturnValue;    
}

function SetGuideColorAndRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Col, Rot, Loc, MIC;

    // End:0x4D
    if(PerkManager.bValidationRuleResult)
    {
        Col = TurretTuneData.ValidColor;        
    }
    else
    {
        Col = TurretTuneData.InvalidColor;
    }
    // End:0x31F
    if(ProximityGuide != none)
    {
        ProximityGuide.SetVectorParameter('InstanceColor', Col);
        Rot = MyPlayerController.MyBasePlayerPawn.GetAimDirection();
        Rot.Pitch = 0;
        Rot.Roll = 0;
        ProximityGuide.SetRotation(Rot);
        Loc = Vector(Rot) * TranslationDistance;
        Loc.Z = PerkManager.DeploymentLocation.Z - (MyPlayerController.MyBasePlayerPawn.Location.Z - MyPlayerController.MyBasePlayerPawn.CylinderComponent.CollisionHeight);
        Loc.Z -= Class'LPAIPawnTurret'.default.CylinderComponent.CollisionHeight;
        ProximityGuide.SetTranslation(Loc);
        LPPlayerPawn(MyPlayerController.Pawn).SetDeploymentGhostLocationAndRotation(Loc, Rot);
    }
    // End:0x38D
    foreach TurretMICs(MIC)
    {
        MIC.SetScalarParameterValue('IllegalPlacement', ((PerkManager.bValidationRuleResult) ? 0.0000000 : 1.0000000));        
    }    
    //return;    
}

function ValidateDeploymentRules()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Loc, Rot, LPP;
    local /*0x97E50000-0x00000000*/ private bool bCanDeploy;
    local /*0x97E50000-0x00000000*/ private @NULL Extent;
    local /*0x97E50000-0x00000000*/ private float DeploymentDistanceFromPawn;
    local /*0x97E50000-0x00000000*/ private @NULL Norm;
    local /*0x97E50000-0x00000000*/ private float Dist;

    PerkManager.DeploymentLocation = MyPlayerController.Pawn.Location;
    LPP = LPPlayerPawn(MyPlayerController.Pawn);
    // End:0x94
    if(LPP == none)
    {
        return false;
    }
    bCanDeploy = LPP.Mesh.GetSocketWorldLocationAndRotation(TurretTuneData.DeploymentSocket, Loc, Rot);
    // End:0x115
    if(!bCanDeploy)
    {
        return false;
    }
    DeploymentDistanceFromPawn = VSize2D(Loc - LPP.Location);
    Rot = LPP.GetAimDirection();
    Rot.Pitch = 0;
    Rot.Roll = 0;
    Loc = Vector(Rot) * DeploymentDistanceFromPawn;
    Loc += LPP.Location;
    Extent = vect(1.0000000, 1.0000000, 1.0000000);
    Class'SPEngine.SPUtil'.static.DistanceToGround(Loc, Extent, Norm, Dist);
    Loc.Z -= Dist;
    Loc.Z += Class'LPAIPawnTurret'.default.CylinderComponent.CollisionHeight;
    // End:0x4B2
    if(Loc.Z < (MyPlayerController.Pawn.Location.Z - (MyPlayerController.Pawn.CylinderComponent.CollisionHeight * float(2))))
    {
        Loc.Z = MyPlayerController.Pawn.Location.Z - MyPlayerController.Pawn.CylinderComponent.CollisionHeight;
        Loc.Z += Class'LPAIPawnTurret'.default.CylinderComponent.CollisionHeight;
        PerkManager.DeploymentLocation = Loc;
        return false;
    }
    PerkManager.DeploymentLocation = Loc;
    Loc.Z += Class'LPAIPawnTurret'.default.CylinderComponent.CollisionHeight;
    bCanDeploy = CanSpawnHere(Loc, Rot);
    // End:0x563
    if(!bCanDeploy)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function GetPerkTargetActorType()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return TurretClass;
    //return ReturnValue;    
}

defaultproperties
{
    DeploymentPromptString="<Strings:LostPlanetGame.HUDHintMessages.HUDHint_DeployChaingunTurret>"
    PrimePromptString="<Strings:LostPlanetGame.HUDHintMessages.HUDHint_PrepareChaingunTurret>"
    DeploymentWidth=120
    DeploymentDepth=80
    DeploymentOffset=(X=60.0000000,Y=0.0000000,Z=0.0000000)
    PerkName="ChaingunTurret"
    PerkType=EPerkType.PerkType_TotemManual
    PerkIndex=EPerks.EPERK_CHAINGUNTURRET
    HUDIconName="iconChaingunTurret"
    FriendlyName="Automated Chaingun Turret"
    Description="Once deployed, it will monitor an arc for enemy incursion and shred anything in its path."
}