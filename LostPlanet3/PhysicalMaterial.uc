class PhysicalMaterial extends Object
    collapsecategories
    hidecategories(Object);

enum EPhysEffectType
{
    EPMET_Impact,                   // 0
    EPMET_Slide,                    // 1
    EPMET_MAX                       // 2
};

var(*) /*0x35EA0000-0x00000000*/ private int MaterialIndex[536870913];
var(*) /*0x3C4A0000-0x00000000*/ private float Friction[65537];
var(*) /*0x3C4A0000-0x00000000*/ private float Restitution[65537];
var(*) /*0x3C4A0000-0x00000000*/ private bool bForceConeFriction[65537];
var(*) /*0x01B30000-0x00000000*/ private bool bEnableAnisotropicFriction[65537];
var(*) /*0x01B30000-0x00000000*/ private @NULL AnisoFrictionDir[65537];
var(*) /*0x01B30000-0x00000000*/ private float FrictionV[65537];
var(*) /*0x3C4A0000-0x00000000*/ private float Density[65537];
var(*) /*0x3C4A0000-0x00000000*/ private float AngularDamping[65537];
var(*) /*0x3C4A0000-0x00000000*/ private float LinearDamping[65537];
var(*) /*0x3C4A0000-0x00000000*/ private float MagneticResponse[65537];
var(*) /*0x3C4A0000-0x00000000*/ private float WindResponse[65537];
var(*) /*0x29C00000-0x00000000*/ private float ImpactThreshold[65537];
var(*) /*0x29C00000-0x00000000*/ private float ImpactReFireDelay[65537];
var(*) /*0x29C00000-0x00000000*/ private @NULL ImpactEffect[65537];
var(*) /*0x29C00000-0x00000000*/ private @NULL ImpactSound[65537];
var(*) /*0x47B60000-0x00000000*/ private float SlideThreshold[65537];
var(*) /*0x47B60000-0x00000000*/ private float SlideReFireDelay[65537];
var(*) /*0x47B60000-0x00000000*/ private @NULL SlideEffect[65537];
var(*) /*0x47B60000-0x00000000*/ private @NULL SlideSound[65537];
var(*) /*0x246A0000-0x00000000*/ private @NULL FractureSoundExplosion[65537];
var(*) /*0x246A0000-0x00000000*/ private @NULL FractureSoundSingle[65537];
var(*) /*0x3A1E0000-0x00000000*/ private @NULL Parent[65537];
var(*) /*0x3C4F0000-0x00000400*/ private editfixedsize @NULL PhysicalMaterialProperty[589825];

// Export UPhysicalMaterial::execFindPhysEffectInfo(FFrame&, void* const)
native function FindPhysEffectInfo()
{
    local /*0x35EA0000-0x00000000*/ private byte Type[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated function FindFractureSounds()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OutSoundExplosion[25165825], OutSoundSingle, TestMat;

    OutSoundExplosion = none;
    OutSoundSingle = none;
    TestMat = self;
    J0x21:

    // End:0xEB [Loop If]
    if(((OutSoundExplosion == none) || OutSoundSingle == none) && TestMat != none)
    {
        // End:0x89
        if(OutSoundSingle == none)
        {
            OutSoundSingle = TestMat.FractureSoundSingle;
        }
        // End:0xC0
        if(OutSoundExplosion == none)
        {
            OutSoundExplosion = TestMat.FractureSoundExplosion;
        }
        TestMat = TestMat.Parent;
        // [Loop Continue]
        goto J0x21;
    }
    return;
    //return;    
}

simulated function GetPhysicalMaterialProperty()
{
    local /*0x35EA0000-0x00000000*/ private class DesiredClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x4B
    if((PhysicalMaterialProperty != none) && ClassIsChildOf(PhysicalMaterialProperty.Class, DesiredClass))
    {
        return PhysicalMaterialProperty;        
    }
    else
    {
        // End:0x86
        if(Parent != none)
        {
            return Parent.GetPhysicalMaterialProperty(DesiredClass);            
        }
        else
        {
            return none;
        }
    }
    //return ReturnValue;    
}

defaultproperties
{
    Friction=0.7000000
    Restitution=0.3000000
    Density=1.0000000
    LinearDamping=0.0100000
}