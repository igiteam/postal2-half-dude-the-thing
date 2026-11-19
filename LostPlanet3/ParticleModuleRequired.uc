class ParticleModuleRequired extends ParticleModule
    editinlinenew
    hidecategories(Object,Object,Cascade);

enum EParticleSortMode
{
    PSORTMODE_None,                 // 0
    PSORTMODE_ViewProjDepth,        // 1
    PSORTMODE_DistanceToView,       // 2
    PSORTMODE_Age_OldestFirst,      // 3
    PSORTMODE_Age_NewestFirst,      // 4
    PSORTMODE_MAX                   // 5
};

enum EEmitterNormalsMode
{
    ENM_CameraFacing,               // 0
    ENM_Spherical,                  // 1
    ENM_Cylindrical,                // 2
    ENM_MAX                         // 3
};

var(*) /*0x1FAF0000-0x00000000*/ private @NULL Material[65537];
var(*) /*0x1FAF0000-0x00000000*/ private float PivotOffsetX[65537];
var(*) /*0x1FAF0000-0x00000000*/ private float PivotOffsetY[65537];
var(*) /*0x1FAF0000-0x00000000*/ private byte ScreenAlignment[65537];
var(*) /*0x1FAF0000-0x00000000*/ private byte SortMode[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte ParticleBurstMethod;
var(*) /*0x4AE90000-0x00000000*/ private byte InterpolationMethod[65537];
var(*) /*0x35FE0000-0x00000000*/ private byte EmitterNormalsMode[65537];
var(*) /*0x1FAF0000-0x00000000*/ private bool bAllowImageFlipping[65537];
var(*) /*0x1FAF0000-0x00000000*/ private bool bSquareImageFlipping[65537];
var(*) /*0x1FAF0000-0x00000000*/ private bool bUseLocalSpace[65537];
var(*) /*0x1FAF0000-0x00000000*/ private bool bKillOnDeactivate[65537];
var(*) /*0x1FAF0000-0x00000000*/ private bool bKillOnCompleted[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient bool bRequiresSorting;
var(*) /*0x1FAF0000-0x00000000*/ private bool bUseLegacyEmitterTime[65537];
var(*) /*0x1E920000-0x00000000*/ private bool bEmitterDurationUseRange[65537];
var(*) /*0x1E920000-0x00000000*/ private bool bDurationRecalcEachLoop[65537];
var(*) /*0x1C330000-0x00000000*/ private bool bEmitterDelayUseRange[65537];
var(*) /*0x1C330000-0x00000000*/ private bool bDelayFirstLoopOnly[65537];
var(*) /*0x4AE90000-0x00000000*/ private bool bScaleUV[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bDirectUV;
var(*) /*0x302A0000-0x00000000*/ private bool bOverrideSystemMacroUV[65537];
var(*) /*0x41420000-0x00000000*/ private bool bUseMaxDrawCount[65537];
var(*) /*0x1FAF0000-0x00000000*/ private bool bOrbitModuleAffectsVelocityAlignment[65537];
var(*) /*0x1E920000-0x00000000*/ private float EmitterDuration[65537];
var(*) /*0x1E920000-0x00000000*/ private float EmitterDurationLow[65537];
var(*) /*0x1E920000-0x00000000*/ private int EmitterLoops[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export @NULL SpawnRate;
var(*) /*0x35EA0000-0x00000200*/ private editfixedsize array BurstList[524289];
var(*) /*0x1C330000-0x00000000*/ private float EmitterDelay[65537];
var(*) /*0x1C330000-0x00000000*/ private float EmitterDelayLow[65537];
var(*) /*0x4AE90000-0x00000000*/ private int SubImages_Horizontal[65537];
var(*) /*0x4AE90000-0x00000000*/ private int SubImages_Vertical[65537];
var(*) /*0x35EA0000-0x00000000*/ private float RandomImageTime;
var(*) /*0x4AE90000-0x00000000*/ private int RandomImageChanges[65537];
var(*) /*0x302A0000-0x00000000*/ private @NULL MacroUVPosition[65537];
var(*) /*0x302A0000-0x00000000*/ private float MacroUVRadius[65537];
var(*) /*0x41420000-0x00000000*/ private int MaxDrawCount[65537];
var(*) /*0x35EA0000-0x00000000*/ private float DownsampleThresholdScreenFraction;
var(*) /*0x35FE0000-0x00000000*/ private @NULL NormalsSphereCenter[65537];
var(*) /*0x35FE0000-0x00000000*/ private @NULL NormalsCylinderDirection[65537];

defaultproperties
{
    bUseLegacyEmitterTime=true
    bUseMaxDrawCount=true
    EmitterDuration=1.0000000
    SpawnRate=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleRequired.RequiredDistributionSpawnRate'
    begin object name=RequiredDistributionSpawnRate class=Class'DistributionFloatConstant'
    end object
    Distribution=RequiredDistributionSpawnRate,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    SubImages_Horizontal=1
    SubImages_Vertical=1
    MaxDrawCount=500
    NormalsSphereCenter=(X=0.0000000,Y=0.0000000,Z=100.0000000)
    NormalsCylinderDirection=(X=0.0000000,Y=0.0000000,Z=1.0000000)
    bSpawnModule=true
    bUpdateModule=true
}