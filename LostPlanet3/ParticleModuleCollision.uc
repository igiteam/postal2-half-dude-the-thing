class ParticleModuleCollision extends ParticleModuleCollisionBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum ParticleAttractorActionType
{
    PAAT_None,                      // 0
    PAAT_Destroy,                   // 1
    PAAT_Freeze,                    // 2
    PAAT_Event,                     // 3
    PAAT_MAX                        // 4
};

struct native ParticleAttractorCollisionAction
{
    var(*) /*0x3A450000-0x00000000*/ private byte Type[65537];
    var(*) /*0x3A450000-0x00000000*/ private editfixedsize string EventName[65537];

    structdefaultproperties
    {
        Type=ParticleAttractorActionType.PAAT_None
        EventName=""
    }
};

var(*) /*0x136C0000-0x00000000*/ private editfixedsize export @NULL DampingFactor[65537];
var(*) /*0x136C0000-0x00000000*/ private editfixedsize export @NULL DampingFactorRotation[65537];
var(*) /*0x136C0000-0x00000000*/ private editfixedsize export @NULL MaxCollisions[65537];
var(*) /*0x136C0000-0x00000000*/ private byte CollisionCompletionOption[65537];
var(*) /*0x136C0000-0x00000000*/ private bool bApplyPhysics[65537];
var(*) /*0x136C0000-0x00000000*/ private bool bPawnsDoNotDecrementCount[65537];
var(*) /*0x136C0000-0x00000000*/ private bool bOnlyVerticalNormalsDecrementCount[65537];
var(*) /*0x3BF40000-0x00000000*/ private bool bDropDetail[65537];
var(*) /*0x3BF40000-0x00000000*/ private bool bCollideOnlyIfVisible[65537];
var(*) /*0x03C30000-0x00000000*/ private bool bCollideWithWorld[65537];
var(*) /*0x03C30000-0x00000000*/ private bool bCollideWithWorldAttractors[65537];
var(*) /*0x136C0000-0x00000000*/ private editfixedsize export @NULL ParticleMass[65537];
var(*) /*0x136C0000-0x00000000*/ private float DirScalar[65537];
var(*) /*0x136C0000-0x00000000*/ private float VerticalFudgeFactor[65537];
var(*) /*0x136C0000-0x00000000*/ private editfixedsize export @NULL DelayAmount[65537];
var(*) /*0x3BF40000-0x00000000*/ private float MaxCollisionDistance[65537];
var(*) /*0x03C30000-0x00000000*/ private editfixedsize array ParticleAttractorCollisionActions[65537];

defaultproperties
{
    DampingFactor=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleCollision.DistributionDampingFactor'
    begin object name=DistributionDampingFactor class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionDampingFactor,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    DampingFactorRotation=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleCollision.DistributionDampingFactorRotation'
    begin object name=DistributionDampingFactorRotation class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionDampingFactorRotation,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    MaxCollisions=(Distribution=// Reference: DistributionFloatUniform'Default__ParticleModuleCollision.DistributionMaxCollisions'
    begin object name=DistributionMaxCollisions class=Class'DistributionFloatUniform'
    end object
    Distribution=DistributionMaxCollisions,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bPawnsDoNotDecrementCount=true
    bDropDetail=true
    bCollideOnlyIfVisible=true
    bCollideWithWorld=true
    ParticleMass=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleCollision.DistributionParticleMass'
    begin object name=DistributionParticleMass class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionParticleMass,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    DirScalar=3.5000000
    VerticalFudgeFactor=0.1000000
    DelayAmount=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleCollision.DistributionDelayAmount'
    begin object name=DistributionDelayAmount class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionDelayAmount,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    MaxCollisionDistance=1000.0000000
    bSpawnModule=true
    bUpdateModule=true
    LODDuplicate=false
}