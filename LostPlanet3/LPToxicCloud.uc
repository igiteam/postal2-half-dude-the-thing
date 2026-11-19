class LPToxicCloud extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Team;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OwningController;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class DamageType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageAmount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageAccumulator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageUpdateRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageInitialDelay[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDamageIncappedEnemies;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDamageInstigator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDebugDrawDamageRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIgnoreCollision;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CloudRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel float CloudMaxRadius[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CloudHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CloudMaxHeight[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CloudExpansionRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CloudDuration[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CloudParticleBaseRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CloudParticleBaseHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DissipateTime[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SmokeLifespan[2097153];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL CloudParticles[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DrawCylinder[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel SoundCue CloudSound[2097153];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL CloudSoundComponent[524289];

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x21
    if(VarName == 'CloudMaxRadius')
    {
        InitCloudParticles();
    }
    // End:0x42
    if(VarName == 'CloudSound')
    {
        InitCloudSound();
    }
    //return;    
}

simulated function PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0xA9
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x9F
        if(Instigator != none)
        {
            Team = Instigator.GetTeam();
            LPPC = LPPlayerController(Instigator.Controller);
            // End:0x9F
            if(LPPC != none)
            {
                OwningController = LPPC;
            }
        }
        InitCloud();
    }
    SetRotation(rot(0, 0, 0));
    //return;    
}

function InitCloud()
{
    InitCloudParams();
    CloudMaxRadius = ((CloudMaxRadius > float(0)) ? CloudMaxRadius : 30.0000000);
    CloudMaxHeight = ((CloudMaxHeight > float(0)) ? CloudMaxHeight : 30.0000000);
    SetTimer(DamageInitialDelay, false, 'StartCausingDamage');
    SetTimer(0.1000000, true, 'ExpandCloud');
    InitCloudParticles();
    InitCloudSound();
    //return;    
}

function InitCloudParams()
{
    //return;    
}

simulated function InitCloudParticles()
{
    local /*0x97E50000-0x00000000*/ private @NULL ParticleScale;
    local /*0x97E50000-0x00000000*/ private float TotalEmitterTime;

    ParticleScale = (vect(1.0000000, 1.0000000, 1.0000000) * CloudMaxRadius) / CloudParticleBaseRadius;
    ParticleScale.Z = CloudMaxHeight / CloudParticleBaseHeight;
    CloudParticles.SetActive(true);
    CloudParticles.SetScale3D(ParticleScale);
    CloudParticles.SetFloatParameter('SmokeLifespan', SmokeLifespan);
    TotalEmitterTime = ((DamageInitialDelay + CloudDuration) - SmokeLifespan) + DissipateTime;
    SetTimer(TotalEmitterTime, false, 'StopEmitters');
    // End:0x22D
    if(bDebugDrawDamageRadius)
    {
        DrawCylinder.CylinderRadius = CloudMaxRadius;
        DrawCylinder.CylinderTopRadius = CloudMaxRadius;
        DrawCylinder.CylinderHeight = CloudMaxHeight;
        DrawCylinder.CylinderHeightOffset = CloudMaxHeight / float(2);
        // End:0x22D
        if(!DrawCylinder.bAttached)
        {
            AttachComponent(DrawCylinder);
            DrawCylinder.SetHidden(false);
        }
    }
    //return;    
}

simulated function InitCloudSound()
{
    local /*0x97E50000-0x00000000*/ private float TotalSoundTime;

    // End:0x80
    if(CloudSound != none)
    {
        CloudSoundComponent = CreateAudioComponent(CloudSound, true, true, true, Location, true);
        TotalSoundTime = ((DamageInitialDelay + CloudDuration) + DissipateTime) - 0.1000000;
        SetTimer(TotalSoundTime, false, 'FadeOutSound');
    }
    //return;    
}

function StartCausingDamage()
{
    SetTimer(DamageUpdateRate, true, 'CauseDamage');
    SetTimer(CloudDuration, false, 'Expire');
    //return;    
}

function CauseDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL P, LPP;
    local /*0x97E50000-0x00000000*/ private int DamageToApply;
    local /*0x97E50000-0x00000000*/ private bool bFriendlyFire;
    local /*0x97E50000-0x00000000*/ private @NULL CloudTraceLoc;

    DamageAccumulator += DamageAmount;
    DamageToApply = int(DamageAccumulator);
    bFriendlyFire = SPGameInfo(WorldInfo.Game).bAllowFriendlyFire;
    CloudTraceLoc = Location;
    CloudTraceLoc.Z += CloudHeight;
    // End:0x30C
    foreach OverlappingActors(Class'Engine.Pawn', P, CloudRadius,, true)
    {
        // End:0x30B
        if(((bFriendlyFire || Team == none) || int(P.GetTeamNum()) != int(Team.GetTeamNum())) || bDamageInstigator && P == Instigator)
        {
            LPP = LPPlayerPawn(P);
            // End:0x1BD
            if(((Team == none) && P == Instigator) && !bDamageInstigator)
            {
                continue;                
            }
            // End:0x30B
            if(P.IsAliveAndWell() || ((LPP != none) && LPP.IsAlive()) && !LPP.bIncapacitated || bDamageIncappedEnemies)
            {
                // End:0x30B
                if(bIgnoreCollision || P.FastTrace(CloudTraceLoc, P.GetPawnViewLocation()))
                {
                    P.TakeDamage(DamageToApply, OwningController, Location, P.Location - Location, DamageType,, self);
                }
            }
        }        
    }    
    DamageAccumulator -= float(DamageToApply);
    //return;    
}

function ExpandCloud()
{
    CloudRadius += CloudExpansionRate;
    CloudHeight += CloudExpansionRate;
    // End:0x52
    if(CloudRadius >= CloudMaxRadius)
    {
        CloudRadius = CloudMaxRadius;
    }
    // End:0x7C
    if(CloudHeight >= CloudMaxHeight)
    {
        CloudHeight = CloudMaxHeight;
    }
    // End:0xC0
    if((CloudRadius == CloudMaxRadius) && CloudHeight == CloudMaxHeight)
    {
        ClearTimer('ExpandCloud');
    }
    //return;    
}

function Expire()
{
    ClearTimer('CauseDamage');
    SetCollision(false);
    SetTimer(DissipateTime, false, 'Dissipate');
    // End:0x5E
    if(bDebugDrawDamageRadius)
    {
        DrawCylinder.SetHidden(true);
    }
    //return;    
}

simulated function StopEmitters()
{
    CloudParticles.SetStopSpawning(-1, true);
    //return;    
}

simulated function FadeOutSound()
{
    // End:0x4B
    if(CloudSoundComponent.IsPlaying())
    {
        CloudSoundComponent.FadeOut(0.1000000, 0.0000000);
    }
    //return;    
}

function Dissipate()
{
    Destroy();
    //return;    
}

simulated event Destroyed()
{
    CloudSoundComponent = none;
    super.Destroyed();
    //return;    
}

defaultproperties
{
    DamageType=Class'LPDamageTypeToxicCloud'
    CloudRadius=30.0000000
    CloudMaxRadius=-1.0000000
    CloudMaxHeight=-1.0000000
    CloudExpansionRate=20.0000000
    CloudParticleBaseRadius=100.0000000
    CloudParticleBaseHeight=100.0000000
    DissipateTime=0.8000000
    SmokeLifespan=2.5000000
    // Reference: SPDrawCylinderComponent'Default__LPToxicCloud.DrawCylinderObj'
    begin object name=DrawCylinderObj class=Class'SPEngine.SPDrawCylinderComponent'
    end object
    DrawCylinder=DrawCylinderObj
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bAlwaysRelevant=true
    bKillDuringLevelTransition=true
}