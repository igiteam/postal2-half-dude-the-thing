class LPProj_ISSGrenade extends LPProj_GrenadeSticky
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TunedataGrenadeISS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDontJump[536870913];

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super(LPProj_Grenade).InitTuneData(TuneData);
    TunedataGrenadeISS = LPTuneDataWeaponGrenadeISS(TuneData);
    //return;    
}

simulated function @NULL AttachTo()
{
    local /*0x97E50000-0x00000400*/ private @NULL OtherComponent[8388609], HitLocation;

    super.AttachTo(OtherComponent, HitLocation);
    // End:0x58
    if(bDontJump)
    {
        SetTimer(TunedataGrenadeISS.TimeExplodeWhenDontJump, false, 'DoExplosion');        
    }
    else
    {
        SetTimer(TunedataGrenadeISS.TimeJumpAfterSticky, false, 'JumpAndExplode');
    }
    //return;    
}

simulated function JumpAndExplode()
{
    local /*0x97E50000-0x00000000*/ private @NULL X, Y, Z;

    GetAxes(Rotation, X, Y, Z);
    Velocity = Z * TunedataGrenadeISS.JumpInitSpeed;
    CustomGravityScale = TunedataGrenadeISS.JumpCustomGravity;
    SetPhysics(6);
    SetTimer(TunedataGrenadeISS.TimeExplodeAfterJump, false, 'DoExplosion');
    //return;    
}

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_ISSGrenade.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPProj_ISSGrenade.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    CollisionComponent=CollisionCylinder
}