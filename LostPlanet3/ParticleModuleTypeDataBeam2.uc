class ParticleModuleTypeDataBeam2 extends ParticleModuleTypeDataBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum EBeam2Method
{
    PEB2M_Distance,                 // 0
    PEB2M_Target,                   // 1
    PEB2M_Branch,                   // 2
    PEB2M_MAX                       // 3
};

enum EBeamTaperMethod
{
    PEBTM_None,                     // 0
    PEBTM_Full,                     // 1
    PEBTM_Partial,                  // 2
    PEBTM_MAX                       // 3
};

struct BeamTargetData
{
    var(*) /*0x06D60000-0x00000000*/ private name TargetName[65537];
    var(*) /*0x06D60000-0x00000000*/ private float TargetPercentage[65537];

    structdefaultproperties
    {
        TargetName="None"
        TargetPercentage=0.0000000
    }
};

var(*) /*0x06D00000-0x00000000*/ private byte BeamMethod[65537];
var(*) /*0x4B530000-0x00000000*/ private byte TaperMethod[65537];
var(*) /*0x06D00000-0x00000000*/ private int TextureTile[65537];
var(*) /*0x06D00000-0x00000000*/ private float TextureTileDistance[65537];
var(*) /*0x06D00000-0x00000000*/ private int Sheets[65537];
var(*) /*0x06D00000-0x00000000*/ private int MaxBeamCount[65537];
var(*) /*0x06D00000-0x00000000*/ private float Speed[65537];
var(*) /*0x06D00000-0x00000000*/ private int InterpolationPoints[65537];
var(*) /*0x06D00000-0x00000000*/ private bool bAlwaysOn[65537];
var(*) /*0x41420000-0x00000000*/ private bool RenderGeometry[65537];
var(*) /*0x41420000-0x00000000*/ private bool RenderDirectLine[65537];
var(*) /*0x41420000-0x00000000*/ private bool RenderLines[65537];
var(*) /*0x41420000-0x00000000*/ private bool RenderTessellation[65537];
var(*) /*0x06D00000-0x00000000*/ private int UpVectorStepSize[65537];
var(*) /*0x0CE00000-0x00000000*/ private name BranchParentName[65537];
var(*) /*0x1CF80000-0x00000000*/ private editfixedsize export @NULL Distance[65537];
var(*) /*0x4B530000-0x00000000*/ private editfixedsize export @NULL TaperFactor[65537];
var(*) /*0x4B530000-0x00000000*/ private editfixedsize export @NULL TaperScale[65537];

defaultproperties
{
    BeamMethod=EBeam2Method.PEB2M_Target
    TextureTile=1
    Sheets=1
    Speed=10.0000000
    RenderGeometry=true
    Distance=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleTypeDataBeam2.DistributionDistance'
    begin object name=DistributionDistance class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionDistance,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    TaperFactor=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleTypeDataBeam2.DistributionTaperFactor'
    begin object name=DistributionTaperFactor class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionTaperFactor,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    TaperScale=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleTypeDataBeam2.DistributionTaperScale'
    begin object name=DistributionTaperScale class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionTaperScale,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
}