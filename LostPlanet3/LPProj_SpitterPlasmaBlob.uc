class LPProj_SpitterPlasmaBlob extends LPProj_AkridBase
    hidecategories(AnimDependency,Navigation);

simulated function DoExplosion()
{
    super.DoExplosion();
    //return;    
}

simulated function CanThisPawnBeDamagedByPhysicalContactWithTheBlob()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn2Test[8388609];
    local /*0x97E50000-0x00000000*/ private float ammountOfDamage[25165825];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamageToApply[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SpitTarget;

    SpitTarget = LPPlayerPawn(Pawn2Test);
    // End:0x4F
    if(SpitTarget != none)
    {
        TypeOfDamageToApply = MyDamageType;
        ammountOfDamage = 2.0000000;
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    //return;    
}

simulated event @NULL ShouldIgnoreCollision()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPProj_SpitterPlasmaBlob(Other) != none)
    {
        return true;
    }
    return super.ShouldIgnoreCollision(Other, OtherComp, HitLocation, HitNormal);
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_SpitterPlasmaBlob.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPProj_SpitterPlasmaBlob.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    CollisionComponent=CollisionCylinder
}