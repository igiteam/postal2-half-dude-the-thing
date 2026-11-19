class LPProj_AcidBlob extends LPProj_AkridBase
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AcidBlobTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AcidBlobTuneData_MP;

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    AcidBlobTuneData = LPTuneDataWeaponAcidBlob(TuneData);
    //return;    
}

simulated event GetMasterTuneDataReference()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x44
    if((int(WorldInfo.NetMode) > int(NM_Standalone)) && AcidBlobTuneData_MP != none)
    {
        return AcidBlobTuneData_MP;
    }
    return AcidBlobTuneData;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_AcidBlob.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    CustomGravityScale=2.0000000
    // Reference: CylinderComponent'Default__LPProj_AcidBlob.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    CollisionComponent=CollisionCylinder
}