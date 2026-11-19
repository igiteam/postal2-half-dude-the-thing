class LPCuttingFracture extends LPFracturedSMActorMovable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSIP[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int Visibility[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PercentageOfFractureMeshToBeBroken[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PercentCompleted[538968065];

function RegisterVSIP()
{
    local /*0x97E50000-0x00000000*/ private @NULL newIP[8388609];
    local /*0x97E50000-0x00000000*/ private float InPercentageToBeBroken[8388609];

    VSIP = newIP;
    PercentageOfFractureMeshToBeBroken = InPercentageToBeBroken;
    // End:0x46
    if(PercentageOfFractureMeshToBeBroken > float(1))
    {
        PercentageOfFractureMeshToBeBroken /= float(100);
    }
    PercentCompleted = 0.0000000;
    //return;    
}

simulated function IsDamagedByDamageType()
{
    local /*0x97E50000-0x00000000*/ private class dmgType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3F
    if((dmgType == Class'LPDamageTypeVSWelder') && VSIP.VSPawnOwner != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function IsFracturedByDamageType()
{
    local /*0x97E50000-0x00000000*/ private class dmgType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3F
    if((dmgType == Class'LPDamageTypeVSWelder') && VSIP.VSPawnOwner != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0xBB
    if((DamageType == Class'LPDamageTypeVSWelder') && VSIP.VSPawnOwner != none)
    {
        super(SPFracturedStaticMeshActor).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        PostFractureTakeDamage();
        VSIP.NotifyFractureActorHit(self, HitLocation);
    }
    //return;    
}

simulated function GetProgress()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return PercentCompleted;
    //return ReturnValue;    
}

simulated function PostFractureTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int TotalFragments, VisibleFragments;
    local /*0x97E50000-0x00000000*/ private float PercentageVisible, PercentageVisibleForBreak;

    // End:0x166
    if(int(Role) == int(ROLE_Authority))
    {
        TotalFragments = FracturedStaticMeshComponent.GetNumFragments();
        VisibleFragments = FracturedStaticMeshComponent.GetNumVisibleFragments();
        // End:0x166
        if(TotalFragments != VisibleFragments)
        {
            PercentageVisible = float(VisibleFragments) / float(TotalFragments);
            PercentageVisibleForBreak = 1.0000000 - PercentageOfFractureMeshToBeBroken;
            // End:0x136
            if(PercentageVisible <= PercentageVisibleForBreak)
            {
                PercentCompleted = 1.0000000;
                VSIP.VSPawnOwner.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_ForkArmGrabVictimLidRemoved, self);                
            }
            else
            {
                PercentCompleted = 1.0000000 - ((PercentageVisible - PercentageVisibleForBreak) / PercentageOfFractureMeshToBeBroken);
            }
        }
    }
    //return;    
}

defaultproperties
{
    Visibility=1
    PercentageOfFractureMeshToBeBroken=90.0000000
    bReplicateDestroyedFragmentInfo=true
    bDestroyAfterFullyCleanedUp=true
    // Reference: FracturedStaticMeshComponent'Default__LPCuttingFracture.FracturedStaticMeshComponent0'
    begin object name=FracturedStaticMeshComponent0
    end object
    FracturedStaticMeshComponent=FracturedStaticMeshComponent0
    KynapseObstacleComponent=none
    // Reference: SPFracturedSkinnedMeshComponent'Default__LPCuttingFracture.SPFracturedSkinnedComponent0'
    begin object name=SPFracturedSkinnedComponent0
    end object
    SkinnedComponent=SPFracturedSkinnedComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPCuttingFracture.LightEnvironment0'
    begin object name=LightEnvironment0
    end object
    Components[0]=LightEnvironment0
    Components[1]=FracturedStaticMeshComponent0
    Components[2]=SPFracturedSkinnedComponent0
    bShadowParented=false
    bProjTarget=false
    CollisionComponent=FracturedStaticMeshComponent0
}