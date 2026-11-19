class LPPerkRocketTurret extends LPPerkDeployable;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TurretTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class TurretClass;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ProximityGuide[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TranslationDistance;

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

    // End:0x399
    if(MyPlayerController != none)
    {
        LPP = LPPlayerPawn(MyPlayerController.Pawn);
        Loc = PerkManager.DeploymentLocation;
        Loc.Z += TurretClass.default.CylinderComponent.CollisionHeight;
        T = LPP.Spawn(TurretClass,,, Loc, PerkManager.DeploymentRotation,, true);
        // End:0x399
        if(T != none)
        {
            T.SpawnDefaultController();
            C = LPAIController(T.Controller);
            // End:0x1C5
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
    local /*0x97E50000-0x00000000*/ private @NULL Col, Rot, Loc;

    // End:0x1EE
    if(ProximityGuide != none)
    {
        // End:0x5C
        if(PerkManager.bValidationRuleResult)
        {
            Col = TurretTuneData.ValidColor;            
        }
        else
        {
            Col = TurretTuneData.InvalidColor;
        }
        ProximityGuide.SetVectorParameter('InstanceColor', Col);
        Rot = MyPlayerController.MyBasePlayerPawn.GetAimDirection();
        Rot.Pitch = 0;
        Rot.Roll = 0;
        ProximityGuide.SetRotation(Rot);
        Loc = Vector(Rot) * TranslationDistance;
        ProximityGuide.SetTranslation(Loc);
        LPPlayerPawn(MyPlayerController.Pawn).SetDeploymentGhostLocationAndRotation(Loc, Rot);
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
    local /*0x97E50000-0x00000000*/ private float Dist, HeightBetweenDeploymentAndMidsection, MaxHeightVariance;
    local /*0x97E50000-0x00000000*/ private @NULL Offset;

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
    HeightBetweenDeploymentAndMidsection = LPP.Location.Z - Loc.Z;
    MaxHeightVariance = HeightBetweenDeploymentAndMidsection * 0.2500000;
    DeploymentDistanceFromPawn = VSize2D(Loc - LPP.Location);
    Rot = LPP.GetAimDirection();
    Rot.Pitch = 0;
    Rot.Roll = 0;
    Loc = Vector(Rot) * DeploymentDistanceFromPawn;
    Loc += LPP.Location;
    Extent = vect(1.0000000, 1.0000000, 1.0000000);
    Offset = DeploymentOffset;
    Offset.X += float(DeploymentDepth / 2);
    Offset.Y -= float(DeploymentWidth / 2);
    Offset = (Offset >> Rot) + Loc;
    Class'SPEngine.SPUtil'.static.DistanceToGround(Offset, Extent, Norm, Dist);
    // End:0x38B
    if(Abs(Dist - HeightBetweenDeploymentAndMidsection) > MaxHeightVariance)
    {
        return false;
    }
    Offset = DeploymentOffset;
    Offset.X += float(DeploymentDepth / 2);
    Offset.Y += float(DeploymentWidth / 2);
    Offset = (Offset >> Rot) + Loc;
    Class'SPEngine.SPUtil'.static.DistanceToGround(Offset, Extent, Norm, Dist);
    // End:0x48C
    if(Abs(Dist - HeightBetweenDeploymentAndMidsection) > MaxHeightVariance)
    {
        return false;
    }
    Loc += (DeploymentOffset >> Rot);
    Class'SPEngine.SPUtil'.static.DistanceToGround(Loc, Extent, Norm, Dist);
    Loc.Z -= Dist;
    bCanDeploy = CanSpawnHere(Loc, Rot);
    // End:0x54F
    if(!bCanDeploy)
    {
        return false;
    }
    PerkManager.DeploymentLocation = Loc;
    return true;
    //return ReturnValue;    
}

simulated function GetPerkTargetActorType()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return TurretClass;
    //return ReturnValue;    
}

defaultproperties
{
    DeploymentPromptString="<Strings:LostPlanetGame.HUDHintMessages.HUDHint_DeployRocketTurret>"
    PrimePromptString="<Strings:LostPlanetGame.HUDHintMessages.HUDHint_PrepareRocketTurret>"
    DeploymentWidth=120
    DeploymentDepth=80
    DeploymentOffset=(X=60.0000000,Y=0.0000000,Z=0.0000000)
    PerkName="RocketTurret"
    PerkType=EPerkType.PerkType_TotemManual
    PerkIndex=EPerks.EPERK_ROCKETTURRET
    HUDIconName="iconRocketTurret"
    FriendlyName="Automated Rocket Turret"
    Description="Once deployed, it will monitor an arc for enemy incursion and blast anything in its path."
}