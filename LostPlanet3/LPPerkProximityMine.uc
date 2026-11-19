class LPPerkProximityMine extends LPPerkDeployable;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MineTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class MineClass;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ProximityGuide[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TranslationDistance;

simulated function Init()
{
    // End:0x37
    if(MineTuneData != none)
    {
        MineClass = MineTuneData.BeaconObjectClass;
    }
    super(LPPerkBase).Init();
    //return;    
}

function SpawnDeployable()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], T, LPP, SpawnLoc, SpawnRot;

    // End:0x230
    if(MyPlayerController != none)
    {
        LPP = LPPlayerPawn(MyPlayerController.Pawn);
        SpawnLoc = PerkManager.DeploymentLocation;
        SpawnRot = PerkManager.DeploymentRotation + rot(0, 32768, 0);
        T = LPP.Spawn(MineClass,,, SpawnLoc, SpawnRot,, true);
        LPP.HandleNotifyShowProp(false, 1);
        // End:0x230
        if(T != none)
        {
            T.Velocity = (Vector(PerkManager.DeploymentRotation) + vect(0.0000000, 0.0000000, 0.4000000)) * MineTuneData.DeploymentVelocity;
            T.bKillDuringLevelTransition = true;
            T.OwningController = MyPlayerController;
            T.Health = int(MineTuneData.Health.GetValue(MyPlayerController));
        }
    }
    return T;
    //return ReturnValue;    
}

function ActivateDeploymentGuides()
{
    local /*0x97E50000-0x00000000*/ private @NULL EP, scaler, LPP;

    super.ActivateDeploymentGuides();
    // End:0x1B
    if(ProximityGuide != none)
    {
        return;
    }
    // End:0x41
    if(MineTuneData.ProximityGuideParticleSystem == none)
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
    ProximityGuide = EP.SpawnEmitterMeshAttachment(MineTuneData.ProximityGuideParticleSystem, MyPlayerController.Pawn.Mesh, 'JO_positionTracker', false);
    // End:0x298
    if(ProximityGuide != none)
    {
        scaler.X = MineTuneData.Radius.GetValue(MyPlayerController) / float(10);
        scaler.Y = scaler.X;
        scaler.Z = 3.0000000;
        ProximityGuide.SetScale3D(scaler);
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

    // End:0x227
    if(ProximityGuide != none)
    {
        // End:0x5C
        if(PerkManager.bValidationRuleResult)
        {
            Col = MineTuneData.ValidColor;            
        }
        else
        {
            Col = MineTuneData.InvalidColor;
        }
        ProximityGuide.SetVectorParameter('InstanceColor', Col);
        Rot = MyPlayerController.MyBasePlayerPawn.GetAimDirection();
        Rot.Pitch = 0;
        Rot.Roll = 0;
        ProximityGuide.SetRotation(Rot);
        Loc = Vector(Rot) * TranslationDistance;
        Loc += (DeploymentOffset >> Rot);
        ProximityGuide.SetTranslation(Loc);
        Rot += rot(0, 32768, 0);
        LPPlayerPawn(MyPlayerController.Pawn).SetDeploymentGhostLocationAndRotation(Loc, Rot);
    }
    //return;    
}

simulated function ValidateDeploymentRules()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Rot, LPP, HitLoc, SpawnLoc, AttachLoc, Extent,
	    Norm, Start, End;

    LPP = LPPlayerPawn(MyPlayerController.Pawn);
    // End:0x42
    if(LPP == none)
    {
        return false;
    }
    AttachLoc = LPP.Mesh.GetBoneLocation('JO_positionTracker');
    Rot = LPP.GetAimDirection();
    Rot.Pitch = 0;
    Rot.Roll = 0;
    DeploymentOffset.Z = 0.0000000;
    Start = Vector(Rot) * TranslationDistance;
    Start += LPP.Location;
    Start += (DeploymentOffset >> Rot);
    End = Start - vect(0.0000000, 0.0000000, 150.0000000);
    Extent = vect(0.0000000, 0.0000000, 0.0000000);
    // End:0x20F
    if(!Class'LPTotemBase'.static.FloorLineCheck(LPP, Start, End, HitLoc, Norm, Extent))
    {
        return false;
    }
    DeploymentOffset.Z = HitLoc.Z - AttachLoc.Z;
    // End:0x2AE
    if(Abs(AttachLoc.Z - HitLoc.Z) > 30.0000000)
    {
        return false;
    }
    SpawnLoc = HitLoc + vect(0.0000000, 0.0000000, 50.0000000);
    // End:0x2F3
    if(!CanSpawnHere(SpawnLoc, Rot))
    {
        return false;
    }
    PerkManager.DeploymentLocation = HitLoc;
    return true;
    //return ReturnValue;    
}

simulated function GetPerkTargetActorType()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return MineTuneData.BeaconObjectClass;
    //return ReturnValue;    
}

defaultproperties
{
    TranslationDistance=63.0000000
    DeploymentPromptString="<Strings:LostPlanetGame.HUDHintMessages.HUDHint_DeployProximityMine>"
    PrimePromptString="<Strings:LostPlanetGame.HUDHintMessages.HUDHint_PrepareProximityMine>"
    DeploymentOffset=(X=0.0000000,Y=13.0000000,Z=0.0000000)
    PerkName="ProximityMine"
    PerkType=EPerkType.PerkType_TotemManual
    PerkIndex=EPerks.EPERK_PROXIMITYMINE
    HUDIconName="iconProximityMine"
    FriendlyName="Proximity Mines"
    Description="Once deployed, detonates on contact with hostile players or Akrid."
}