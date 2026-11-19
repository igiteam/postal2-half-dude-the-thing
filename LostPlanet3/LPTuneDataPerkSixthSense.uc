class LPTuneDataPerkSixthSense extends LPTuneDataPerkAbilityBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0xBA0A0000-0x00000000*/ private float DetectAngle[65537];
var(0.25_Pct) /*0xBA0A0000-0x00000000*/ private bool bDetectNonADS[65537];
var(0.25_Pct) /*0xBA0A0000-0x00000000*/ private bool bDetectOnCamera[65537];
var(0.25_Pct) /*0xBA0A0000-0x00000000*/ private bool bRetaggingAllowed[65537];
var(0.25_Pct) /*0xBA0A0000-0x00000000*/ private float TagAngle[65537];
var(0.25_Pct) /*0xBA0A0000-0x00000400*/ private editfixedsize @NULL TagAcquisitionTime[589825];
var(0.25_Pct) /*0xBA0A0000-0x00000400*/ private editfixedsize @NULL TagDuration[589825];
var(0.25_Pct) /*0xBA0A0000-0x00000000*/ private float TakedownWarningRange[65537];
var(0.25_Pct) /*0xBA0A0000-0x00000000*/ private float TakedownWarningAngle[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float UpdateRate;

defaultproperties
{
    DetectAngle=15.0000000
    bRetaggingAllowed=true
    TagAngle=15.0000000
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkSixthSense.TagAcquisitionTimeA'
    begin object name=TagAcquisitionTimeA class=Class'LPFloatUpgrade'
        baseValue=2.0000000
    end object
    TagAcquisitionTime=TagAcquisitionTimeA
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkSixthSense.TagDurationA'
    begin object name=TagDurationA class=Class'LPFloatUpgrade'
        baseValue=5.0000000
    end object
    TagDuration=TagDurationA
    TakedownWarningRange=300.0000000
    TakedownWarningAngle=35.0000000
    UpdateRate=0.1000000
    // Reference: LPFloatUpgrade'Default__LPTuneDataPerkSixthSense.CapacityCostA'
    begin object name=CapacityCostA
    end object
    CapacityCost=CapacityCostA
    OwningPerkClass=Class'LPPerkSixthSense'
    // Reference: LPShopInterface'Default__LPTuneDataPerkSixthSense.LPShopInterfaceA'
    begin object name=LPShopInterfaceA
    end object
    ShopInterface=LPShopInterfaceA
}