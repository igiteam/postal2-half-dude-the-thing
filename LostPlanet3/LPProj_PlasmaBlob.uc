class LPProj_PlasmaBlob extends LPProj_AkridBase
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlasmaBlobTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlasmaBlobTuneData_MP;

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    PlasmaBlobTuneData = LPTuneDataWeaponPlasmaBlob(TuneData);
    //return;    
}

simulated event GetMasterTuneDataReference()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x44
    if((int(WorldInfo.NetMode) > int(NM_Standalone)) && PlasmaBlobTuneData_MP != none)
    {
        return PlasmaBlobTuneData_MP;
    }
    return PlasmaBlobTuneData;
    //return ReturnValue;    
}

simulated event Destroyed()
{
    super.Destroyed();
    //return;    
}

function GetBiotoxTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_PlasmaBlob.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    CustomGravityScale=2.0000000
    // Reference: CylinderComponent'Default__LPProj_PlasmaBlob.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    CollisionComponent=CollisionCylinder
}