class ParticleModuleSpawnPerUnit extends ParticleModuleSpawnBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x48AF0000-0x00000000*/ private float UnitScalar[65537];
var(*) /*0x48AF0000-0x00000000*/ private editfixedsize export @NULL SpawnPerUnit[65537];
var(*) /*0x48AF0000-0x00000000*/ private bool bIgnoreSpawnRateWhenMoving[65537];
var(*) /*0x48AF0000-0x00000000*/ private bool bIgnoreMovementAlongX[65537];
var(*) /*0x48AF0000-0x00000000*/ private bool bIgnoreMovementAlongY[65537];
var(*) /*0x48AF0000-0x00000000*/ private bool bIgnoreMovementAlongZ[65537];
var(*) /*0x48AF0000-0x00000000*/ private float MovementTolerance[65537];
var(*) /*0x48AF0000-0x00000000*/ private float MaxFrameDistance[65537];
var(*) /*0x48AF0000-0x00000000*/ private float MinFrameDistance[65537];

defaultproperties
{
    UnitScalar=50.0000000
    SpawnPerUnit=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleSpawnPerUnit.RequiredDistributionSpawnPerUnit'
    begin object name=RequiredDistributionSpawnPerUnit class=Class'DistributionFloatConstant'
    end object
    Distribution=RequiredDistributionSpawnPerUnit,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    MovementTolerance=0.1000000
    bSpawnModule=true
}