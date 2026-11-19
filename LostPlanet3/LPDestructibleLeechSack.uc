class LPDestructibleLeechSack extends SPGFDestructibleObject
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LeechActorClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LeechControllerClass;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL FactoryAI[524289];
var(0.25_Pct) /*0x7E0E0000-0x00000000*/ private float ProximityRadius[65537];
var(0.25_Pct) /*0x7E0E0000-0x00000000*/ private float ProximityHeight[65537];
var(0.25_Pct) /*0x7E0E0000-0x00000000*/ private bool bExplodeOnProximityTouch[65537];
var(0.25_Pct) /*0x7E0E0000-0x00000000*/ private bool bSpawnLeechOnExplode[65537];
var(0.25_Pct) /*0x7E0E0000-0x00000000*/ private bool bSpawnDeadLeechOnDestroy[65537];
var(0.25_Pct) /*0x7E0E0000-0x00000000*/ private bool bDisableStruggleMode[65537];
var(0.25_Pct) /*0x1D290000-0x00000000*/ private bool bEnableCascadeDamage[65537];
var(0.25_Pct) /*0x1D290000-0x00000000*/ private bool bCascadeOnLeechSpawn[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanExplode;
var(0.25_Pct) /*0x7E0E0000-0x00000000*/ private bool bEnabled[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bProximityTouch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsCascading;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDied;
var(0.25_Pct) /*0x7E0E0000-0x00000000*/ private int LeechLimit[65537];
var(0.25_Pct) /*0x1D290000-0x00000000*/ private float CascadeRadius[65537];
var(0.25_Pct) /*0x1D290000-0x00000000*/ private float CascadeDelay[65537];
var(0.25_Pct) /*0x7E0E0000-0x00000000*/ private @NULL BurstSound[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private const export @NULL DrawCylinder[655361];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private const export @NULL ColCylinder[655361];

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetCollision(true, false);
    ColCylinder.SetCylinderSize(ProximityRadius, ProximityHeight);
    SetCollisionSize(ProximityRadius, ProximityHeight);
    bCanExplode = true;
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25165825];

    super.CreateCheckpointRecord(Record);
    Record.bDied = bDied;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25296897];

    // End:0x43
    if(Record.bDied)
    {
        bDied = true;
        ShutDownObject();
        ShutDown();        
    }
    else
    {
        super.ApplyCheckpointRecord(Record);
    }
    //return;    
}

simulated function ConditionalDestroy()
{
    local /*0x97E50000-0x00000000*/ private bool bNoActualDestroy[9437185], ReturnValue;

    false
    // End:0x61
    if(FactoryAI != none)
    {
        // End:0x61
        if(!IsInPersistentLevel(true))
        {
            // End:0x61
            if(FactoryAI.SpawnedActors.Length > 0)
            {
                ShutDown();
                bDied = true;
                return false;
            }
        }
    }
    // End:0x9B
    if(!bNoActualDestroy)
    {
        bDied = true;
        // End:0x91
        if(SpawnedFromActorFactory != none)
        {
            Destroy();            
        }
        else
        {
            ShutDown();
        }
    }
    return true;
    //return ReturnValue;    
}

simulated event FellOutOfWorld()
{
    local /*0x97E50000-0x00000000*/ private class dmgType[8388609];

    // End:0x21
    if(ConditionalDestroy(true))
    {
        super(Actor).FellOutOfWorld(dmgType);
    }
    //return;    
}

simulated event OutsideWorldBounds()
{
    // End:0x18
    if(ConditionalDestroy(true))
    {
        super(Actor).OutsideWorldBounds();
    }
    //return;    
}

simulated function VolumeBasedDestroy()
{
    local /*0x97E50000-0x00000000*/ private @NULL PV[8388609];

    // End:0x21
    if(ConditionalDestroy(true))
    {
        super(Actor).VolumeBasedDestroy(PV);
    }
    //return;    
}

event TriggerDestroyedEvent()
{
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], Leech, Egg;

    super.TriggerDestroyedEvent(EventInstigator);
    // End:0x3A
    if(BurstSound != none)
    {
        PlaySound(BurstSound);
    }
    // End:0xA5
    if(bSpawnDeadLeechOnDestroy)
    {
        Leech = SpawnLeech(none);
        // End:0xA5
        if(Leech != none)
        {
            Leech.Died(EventInstigator, Class'LPDamageTypeForced', Location);
        }
    }
    // End:0x1FC
    if(bEnableCascadeDamage)
    {
        // End:0x1FB
        foreach OverlappingActors(Class'LPDestructibleLeechSack', Egg, CascadeRadius,, true)
        {
            // End:0x1FA
            if(((Egg.bEnabled && Egg.IsAlive()) && !Egg.bIsCascading) && Egg != self)
            {
                // End:0x1FA
                if(VSize(Egg.Location - self.Location) <= CascadeRadius)
                {
                    // End:0x1DB
                    if(bProximityTouch)
                    {
                        // End:0x1D8
                        if(bCascadeOnLeechSpawn)
                        {
                            Egg.CascadeSpawn();
                        }
                        // End:0x1FA
                        continue;
                    }
                    Egg.CascadeDestroy();
                }
            }            
        }        
    }
    bCanExplode = false;
    ConditionalDestroy();
    //return;    
}

simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0xC6
    if(((((bEnabled && bExplodeOnProximityTouch) && int(Role) == int(ROLE_Authority)) && IsAlive()) && bCanExplode) && Other.IsA('LPPlayerPawn'))
    {
        // End:0x95
        if(bSpawnLeechOnExplode)
        {
            SpawnLeech(Other);
        }
        TakeDamage(100000, none, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeForced');
    }
    //return;    
}

simulated function CascadeDestroy()
{
    bIsCascading = true;
    SetTimer(CascadeDelay, false, 'CascadeDestroyTimer');
    //return;    
}

simulated function CascadeSpawn()
{
    bIsCascading = true;
    SetTimer(CascadeDelay, false, 'CascadeSpawnTimer');
    //return;    
}

simulated function CascadeDestroyTimer()
{
    // End:0x75
    if(((bEnabled && int(Role) == int(ROLE_Authority)) && IsAlive()) && bCanExplode)
    {
        TakeDamage(100000, none, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeForced');        
    }
    else
    {
        bIsCascading = false;
    }
    //return;    
}

simulated function CascadeSpawnTimer()
{
    // End:0x9C
    if((((bEnabled && bExplodeOnProximityTouch) && int(Role) == int(ROLE_Authority)) && IsAlive()) && bCanExplode)
    {
        // End:0x68
        if(bSpawnLeechOnExplode)
        {
            SpawnLeech(none);
        }
        TakeDamage(100000, none, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeForced');        
    }
    else
    {
        bIsCascading = false;
    }
    //return;    
}

simulated function SpawnLeech()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], ReturnValue, ToPlayer, Leech;
    local /*0x97E50000-0x00000000*/ private int LeechCount;

    bProximityTouch = true;
    // End:0x70
    foreach WorldInfo.AllPawns(Class'LPAIPawnLeech', Leech)
    {
        // End:0x6F
        if(Leech.IsAlive())
        {
            LeechCount++;
        }        
    }    
    // End:0x1DF
    if((LeechCount < LeechLimit) || LeechLimit == 0)
    {
        // End:0x119
        if(Other != none)
        {
            ToPlayer = Rotator(Location - Other.Location);
            ToPlayer.Roll = 0;
            ToPlayer.Pitch = 0;
        }
        Leech = LPAIPawnLeech(Class'SPEngine.SPUtil'.static.SpawnActor(FactoryAI, LeechActorClass, LeechControllerClass, Location, ToPlayer));
        // End:0x1D5
        if((Leech != none) && bDisableStruggleMode)
        {
            LPAIController(Leech.Controller).bStruggleModeDisabled = true;
        }
        return Leech;
    }
    return none;
    //return ReturnValue;    
}

simulated function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: LPActorFactoryAI'Default__LPDestructibleLeechSack.DefaultActorFactory'
    begin object name=DefaultActorFactory class=Class'LPActorFactoryAI'
    end object
    FactoryAI=DefaultActorFactory
    ProximityRadius=450.0000000
    ProximityHeight=50.0000000
    bExplodeOnProximityTouch=true
    bSpawnLeechOnExplode=true
    bEnableCascadeDamage=true
    bCascadeOnLeechSpawn=true
    bEnabled=true
    LeechLimit=5
    CascadeRadius=250.0000000
    CascadeDelay=0.2500000
    // Reference: SPDrawCylinderComponent'Default__LPDestructibleLeechSack.DrawCylinder0'
    begin object name=DrawCylinder0 class=Class'SPEngine.SPDrawCylinderComponent'
    end object
    DrawCylinder=DrawCylinder0
    // Reference: CylinderComponent'Default__LPDestructibleLeechSack.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'Engine.CylinderComponent'
    end object
    ColCylinder=CollisionCylinder
    // Reference: AudioComponent'Default__LPDestructibleLeechSack.AmbientSoundComponent0'
    begin object name=AmbientSoundComponent0
    end object
    AmbientSoundComponent=AmbientSoundComponent0
    bUseSinkDepthForGroundClamping=true
    bDefaultKynapseObstacleOn=false
    // Reference: DynamicLightEnvironmentComponent'Default__LPDestructibleLeechSack.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: DynamicLightEnvironmentComponent'Default__LPDestructibleLeechSack.MyLightEnvironment2'
    begin object name=MyLightEnvironment2
    end object
    LightEnvironmentToUseForActorSpawnParams=MyLightEnvironment2
    // Reference: SPGFKynapseObstacleComponent'Default__LPDestructibleLeechSack.DefaultSPKynapseObstacleComponent'
    begin object name=DefaultSPKynapseObstacleComponent
    end object
    SPKynapseObstacle=DefaultSPKynapseObstacleComponent
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=DrawCylinder0
    bNoDelete=false
    // Reference: LPTeamAssignmentInteractionMetaData'Default__LPDestructibleLeechSack.IntMetaA'
    begin object name=IntMetaA class=Class'LPTeamAssignmentInteractionMetaData'
        TeamNumber=ELPTeams.LPTeam_Akrid
    end object
    InteractionMetaData=IntMetaA
    CollisionComponent=CollisionCylinder
}