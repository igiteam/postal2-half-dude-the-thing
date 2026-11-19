class LPProj_GLauncherAcid extends LPProj_Grenade
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private class ClassAcidPool[536870913];

simulated function @NULL DoImpact()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, Impact, AcidPool;

    local /*0x97E50000-0x00000000*/ private bool bSpawnAcidPool;
    local /*0x97E50000-0x00000000*/ private @NULL End;

    StopExplosionTimer();
    DoExplosion();
    // End:0x148
    if(Pawn(Other) != none)
    {
        End = HitLocation;
        End.Z -= float(200);
        // End:0x144
        foreach Other.TraceActors(Class'Engine.Actor', Impact.HitActor, Impact.HitLocation, Impact.HitNormal, End, HitLocation,, Impact.HitInfo)
        {
            // End:0x143
            if(Pawn(Impact.HitActor) == none)
            {
                bSpawnAcidPool = true;
                // End:0x144
                break;
            }            
        }                
    }
    else
    {
        bSpawnAcidPool = true;
        Impact.HitActor = Other;
        Impact.HitLocation = HitLocation;
        Impact.HitNormal = HitNormal;
    }
    // End:0x247
    if(bSpawnAcidPool && ClassAcidPool != none)
    {
        AcidPool = ClassAcidPool.static.CreateInstance(Instigator, Impact);
        AcidPool.Instigator = Instigator;
    }
    //return;    
}

simulated function GetVisibleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Location;
    //return ReturnValue;    
}

defaultproperties
{
    bIsGrenade=false
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_GLauncherAcid.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPProj_GLauncherAcid.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    bBounce=false
    CollisionComponent=CollisionCylinder
}