class LPProj_PlasmaBlobDF extends LPProj_PlasmaBlob
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlasmaBlobDFTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlasmaBlobDFTuneData_MP;

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    PlasmaBlobDFTuneData = LPTuneDataWeaponPlasmaBlobDF(TuneData);
    //return;    
}

simulated event GetMasterTuneDataReference()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    PlasmaBlobTuneData_MP = PlasmaBlobDFTuneData_MP;
    PlasmaBlobTuneData = PlasmaBlobDFTuneData;
    // End:0x6A
    if((int(WorldInfo.NetMode) > int(NM_Standalone)) && PlasmaBlobTuneData_MP != none)
    {
        return PlasmaBlobTuneData_MP;
    }
    return PlasmaBlobTuneData;
    //return ReturnValue;    
}

simulated function PostBeginPlay()
{
    super(LPProj_AkridBase).PostBeginPlay();
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    //return;    
}

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_PlasmaBlobDF.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPProj_PlasmaBlobDF.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    CollisionComponent=CollisionCylinder
}