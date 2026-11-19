class LPVSUpgrade_ThermalEnergyAbsorber extends LPUpgradeBase
    editinlinenew;

event IsEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x42
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
    {
        return false;
    }
    return super.IsEnabled();
    //return ReturnValue;    
}
