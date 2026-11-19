class WorldAttractor extends Actor
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

enum EWorldAttractorFalloffType
{
    FOFF_Constant,                  // 0
    FOFF_Linear,                    // 1
    FOFF_Exponent,                  // 2
    FOFF_MAX                        // 3
};

struct native WorldAttractorData
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bEnabled;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private byte FalloffType;
    var(*) /*0x35EA0000-0x00000000*/ private float FalloffExponent;
    var(*) /*0x35EA0000-0x00000000*/ private float Range;
    var(*) /*0x35EA0000-0x00000000*/ private float Strength;

    structdefaultproperties
    {
        bEnabled=false
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        FalloffType=EWorldAttractorFalloffType.FOFF_Constant
        FalloffExponent=0.0000000
        Range=0.0000000
        Strength=0.0000000
    }
};

var(*) /*0x50F00000-0x00000000*/ private bool bEnabled[65537];
var(*) /*0x50F00000-0x00000000*/ private float LoopDuration[65537];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentTime;
var(*) /*0x50F00000-0x00000000*/ private byte FalloffType[65537];
var(*) /*0x50F00000-0x00000000*/ private editfixedsize editconst export @NULL FalloffExponent[65537];
var(*) /*0x50F00000-0x00000000*/ private editfixedsize editconst export @NULL Range[65537];
var(*) /*0x50F00000-0x00000000*/ private editfixedsize editconst export @NULL Strength[65537];
var(*) /*0x50F00000-0x00000000*/ private editconst float CollisionRadius[65537];
var(*) /*0x50F00000-0x00000000*/ private editfixedsize editconst export @NULL DragCoefficient[65537];
var(*) /*0x50F00000-0x00000000*/ private editfixedsize editconst export @NULL DragRadius[65537];

function OnSetWorldAttractorParam()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x4C
    if(Action.bEnabledField)
    {
        bEnabled = Action.bEnabled;
    }
    // End:0x96
    if(Action.bFalloffTypeField)
    {
        FalloffType = Action.FalloffType;
    }
    // End:0xE0
    if(Action.bRangeField)
    {
        Range = Action.Range;
    }
    // End:0x12A
    if(Action.bStrengthField)
    {
        Strength = Action.Strength;
    }
    //return;    
}

defaultproperties
{
    bEnabled=true
    FalloffExponent=(MatineeValue=0.0000000,bInMatinee=false,Distribution=// Reference: DistributionFloatConstant'Default__WorldAttractor.DistributionFalloffExponent'
    begin object name=DistributionFalloffExponent class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionFalloffExponent,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Range=(MatineeValue=0.0000000,bInMatinee=false,Distribution=// Reference: DistributionFloatConstant'Default__WorldAttractor.DistributionRange'
    begin object name=DistributionRange class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionRange,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Strength=(MatineeValue=0.0000000,bInMatinee=false,Distribution=// Reference: DistributionFloatConstant'Default__WorldAttractor.DistributionStrength'
    begin object name=DistributionStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionStrength,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    DragCoefficient=(MatineeValue=0.0000000,bInMatinee=false,Distribution=// Reference: DistributionFloatConstant'Default__WorldAttractor.DistributionDragCoefficient'
    begin object name=DistributionDragCoefficient class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionDragCoefficient,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    DragRadius=(MatineeValue=0.0000000,bInMatinee=false,Distribution=// Reference: DistributionFloatConstant'Default__WorldAttractor.DistributionDragRadius'
    begin object name=DistributionDragRadius class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionDragRadius,Type=0,Op=0,LookupTableNumElements=0,LookupTableChunkSize=0,LookupTable=none,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Components[0]=none
}