class LPGib_VsLaroche extends SPGib
    config(Game)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataGibsVsLaroche;

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    TuneDataGibsVsLaroche = LPTuneDataGibs_VsLaroche(TuneData);
    //return;    
}

simulated function DoCustomGibEffects()
{
    //return;    
}

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPGib_VsLaroche.GibLightEnvironmentComp'
    begin object name=GibLightEnvironmentComp
    end object
    GibLightEnvironment=GibLightEnvironmentComp
    Components[0]=GibLightEnvironmentComp
}