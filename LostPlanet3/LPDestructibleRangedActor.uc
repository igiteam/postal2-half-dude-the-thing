class LPDestructibleRangedActor extends SPGFDestructibleObject
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0xA8B80000-0x00000000*/ private float OuterRadius[65537];
var(0.25_Pct) /*0xA8B80000-0x00000000*/ private float InnerRadius[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private const export @NULL OuterCylinder[655361];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private const export @NULL InnerDrawCylinder[655361];
var(0.25_Pct) /*0xA8B80000-0x00000000*/ private float RadiusCheckGranularity[65537];
var(0.25_Pct) /*0xA8B80000-0x00000000*/ private float RadiusCheckTimer[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastRadiusCheck;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CollisionHeight;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    OuterCylinder.SetCylinderSize(OuterRadius, CollisionHeight);
    // End:0xC8
    if(InnerDrawCylinder != none)
    {
        InnerDrawCylinder.CylinderHeight = CollisionHeight * float(2);
        InnerDrawCylinder.CylinderTopRadius = InnerRadius;
        InnerDrawCylinder.CylinderRadius = InnerRadius;
    }
    SetCollision(true, false);
    //return;    
}

event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], PP;
    local /*0x97E50000-0x00000000*/ private bool bStillInRange;

    // End:0x8F
    if(IsTimerActive('CheckPlayerRange'))
    {
        // End:0x61
        foreach TouchingActors(Class'LPBasePlayerPawn', PP)
        {
            // End:0x5D
            if(PP.IsAliveAndWell())
            {
                bStillInRange = true;
            }
            // End:0x61
            break;            
        }        
        // End:0x8F
        if(!bStillInRange)
        {
            ClearTimer('CheckPlayerRange');
            CheckPlayerRange();
        }
    }
    super(Actor).UnTouch(Other);
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, PP;

    // End:0x99
    if(!IsTimerActive('CheckPlayerRange') && IsAlive())
    {
        // End:0x98
        foreach TouchingActors(Class'LPBasePlayerPawn', PP)
        {
            // End:0x97
            if(PP.IsAliveAndWell())
            {
                // End:0x8A
                if(RadiusCheckTimer > float(0))
                {
                    SetTimer(RadiusCheckTimer, true, 'CheckPlayerRange');
                }
                CheckPlayerRange();
                // End:0x98
                break;
            }            
        }        
    }
    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

function CheckPlayerRange()
{
    local /*0x97E50000-0x00000000*/ private float ClosestPlayerDistance, Distance;
    local /*0x97E50000-0x00000000*/ private @NULL ClosestPlayer, PP;
    local /*0x97E50000-0x00000000*/ private float Diff;
    local /*0x97E50000-0x00000000*/ private int Rounded;

    ClosestPlayerDistance = OuterRadius;
    // End:0xC7
    foreach TouchingActors(Class'LPBasePlayerPawn', PP)
    {
        Distance = VSize2D(PP.Location - Location);
        // End:0xC6
        if(Distance <= (ClosestPlayerDistance + PP.GetCollisionRadius()))
        {
            ClosestPlayer = PP;
            ClosestPlayerDistance = Distance;
        }        
    }    
    // End:0xF7
    if(ClosestPlayer == none)
    {
        ClearTimer('CheckPlayerRange');
        OnUnTouchRadius();
        return;
    }
    // End:0x145
    if(Distance <= (InnerRadius + ClosestPlayer.GetCollisionRadius()))
    {
        OnTouchInnerRadius(ClosestPlayer);        
    }
    else
    {
        Diff = OuterRadius - InnerRadius;
        ClosestPlayerDistance -= InnerRadius;
        ClosestPlayerDistance /= Diff;
        ClosestPlayerDistance = 1.0000000 - FClamp(ClosestPlayerDistance, 0.0000000, 1.0000000);
        Rounded = Round(ClosestPlayerDistance * RadiusCheckGranularity);
        // End:0x217
        if(Rounded != LastRadiusCheck)
        {
            OnTouchRadius(ClosestPlayer, ClosestPlayerDistance);
            LastRadiusCheck = Rounded;
        }
    }
    //return;    
}

simulated function OnTouchInnerRadius()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609];

    //return;    
}

simulated function OnTouchRadius()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609];
    local /*0x97E50000-0x00000000*/ private float NormalizedDistance[8388609];

    //return;    
}

simulated function OnUnTouchRadius()
{
    //return;    
}

defaultproperties
{
    OuterRadius=800.0000000
    InnerRadius=200.0000000
    // Reference: CylinderComponent'Default__LPDestructibleRangedActor.CollisionCylinder0'
    begin object name=CollisionCylinder0 class=Class'Engine.CylinderComponent'
    end object
    OuterCylinder=CollisionCylinder0
    RadiusCheckGranularity=10.0000000
    RadiusCheckTimer=0.1000000
    CollisionHeight=200.0000000
    // Reference: AudioComponent'Default__LPDestructibleRangedActor.AmbientSoundComponent0'
    begin object name=AmbientSoundComponent0
    end object
    AmbientSoundComponent=AmbientSoundComponent0
    bUseSinkDepthForGroundClamping=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPDestructibleRangedActor.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: DynamicLightEnvironmentComponent'Default__LPDestructibleRangedActor.MyLightEnvironment2'
    begin object name=MyLightEnvironment2
    end object
    LightEnvironmentToUseForActorSpawnParams=MyLightEnvironment2
    // Reference: SPGFKynapseObstacleComponent'Default__LPDestructibleRangedActor.DefaultSPKynapseObstacleComponent'
    begin object name=DefaultSPKynapseObstacleComponent
    end object
    SPKynapseObstacle=DefaultSPKynapseObstacleComponent
    Components[0]=none
    Components[1]=CollisionCylinder0
    Components[2]=none
    bBlockActors=false
    CollisionComponent=CollisionCylinder0
}