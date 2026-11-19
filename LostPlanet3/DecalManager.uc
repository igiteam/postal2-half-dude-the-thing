class DecalManager extends Actor
    config(Game)
    notplaceable
    hidecategories(AnimDependency,Navigation);

struct native ActiveDecalInfo
{
    var(*) /*0x35EA0000-0x00000400*/ private export @NULL Decal[524289];
    var(*) /*0x35EA0000-0x00000000*/ private float LifetimeRemaining;

    structdefaultproperties
    {
        Decal=none
        LifetimeRemaining=0.0000000
    }
};

var(*) /*0x35EA0000-0x00000400*/ private export @NULL DecalTemplate[524289];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array PoolDecals[524289];
var(*) /*0x35EA0000-0x00000000*/ private int MaxActiveDecals;
var(*) /*0x35EA0000-0x00000000*/ private input float DecalLifeSpan[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float DecalDepthBias;
var(*) /*0x35EA0000-0x00000000*/ private @NULL DecalBlendRange;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export array ActiveDecals;

// Export UDecalManager::execAreDynamicDecalsEnabled(FFrame&, void* const)
native static final function AreDynamicDecalsEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event @NULL DecalFinished()
{
    local /*0x35EA0000-0x00000400*/ private @NULL Decal[8388609];

    // End:0x4C
    if(Decal != none)
    {
        Decal.ResetToDefaults();
        PoolDecals[PoolDecals.Length] = Decal;
    }
    //return;    
}

function CanSpawnDecals()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return AreDynamicDecalsEnabled();
    //return ReturnValue;    
}

static final function @NULL SetDecalParameters()
{
    local /*0x35EA0000-0x00000400*/ private @NULL TheDecal[8388609], DecalMaterial, DecalLocation, DecalOrientation;
    local /*0x35EA0000-0x00000000*/ private float Width[8388609], Height, Thickness;
    local /*0x35EA0000-0x00000000*/ private bool bNoClip[8388609];
    local /*0x35EA0000-0x00000000*/ private float DecalRotation[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL HitComponent[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bProjectOnTerrain[8388609], bProjectOnSkeletalMeshes;
    local /*0x35EA0000-0x00000000*/ private name HitBone[8388609];
    local /*0x35EA0000-0x00000000*/ private int HitNodeIndex[8388609], HitLevelIndex, InFracturedStaticMeshComponentIndex;
    local /*0x35EA0000-0x00000000*/ private float DepthBias[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL BlendRange[8388609];

    TheDecal.Location = DecalLocation;
    TheDecal.Orientation = DecalOrientation;
    TheDecal.DecalRotation = DecalRotation;
    TheDecal.Width = Width;
    TheDecal.Height = Height;
    TheDecal.FarPlane = Thickness * 0.5000000;
    TheDecal.NearPlane = -TheDecal.FarPlane;
    TheDecal.bNoClip = bNoClip;
    TheDecal.HitComponent = HitComponent;
    TheDecal.HitBone = HitBone;
    TheDecal.HitNodeIndex = HitNodeIndex;
    TheDecal.HitLevelIndex = HitLevelIndex;
    TheDecal.SetDecalMaterial(DecalMaterial);
    TheDecal.bProjectOnTerrain = bProjectOnTerrain;
    TheDecal.bProjectOnSkeletalMeshes = bProjectOnSkeletalMeshes;
    TheDecal.FracturedStaticMeshComponentIndex = InFracturedStaticMeshComponentIndex;
    TheDecal.DepthBias = DepthBias;
    TheDecal.BlendRange = BlendRange;
    //return;    
}

protected function @NULL GetPooledComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000400*/ private @NULL Result;

    J0x00:
    // End:0xC8 [Loop If]
    if(PoolDecals.Length > 0)
    {
        I = PoolDecals.Length - 1;
        Result = PoolDecals[I];
        PoolDecals.Remove(I, 1);        
        // End:0xBA
        if(((Result != none) && !Result.IsPendingKill()) && !Result.IsWaitingForResetToDefaultsToComplete())
        {
            // [Explicit Break]
            goto J0xC8;            
        }
        else
        {
            Result = none;
        }
        // [Loop Continue]
        goto J0x00;
    }
    J0xC8:

    // End:0x189
    if(Result == none)
    {
        // End:0x154
        if((MaxActiveDecals > 0) && ActiveDecals.Length >= MaxActiveDecals)
        {
            Result = ActiveDecals[0].Decal;
            Result.ResetToDefaults();
            ActiveDecals.Remove(0, 1);            
        }
        Result = new (self) DecalTemplate.Class (DecalTemplate);
    }
    return Result;
    //return ReturnValue;    
}

function @NULL SpawnDecal()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DecalMaterial[8388609], DecalLocation, DecalOrientation;
    local /*0x35EA0000-0x00000000*/ private float Width[8388609], Height, Thickness;
    local /*0x35EA0000-0x00000000*/ private bool bNoClip[8388609];
    local /*0x35EA0000-0x00000000*/ private float DecalRotation[9437185];
    local /*0x35EA0000-0x00000400*/ private @NULL HitComponent[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bProjectOnTerrain[9437185], bProjectOnSkeletalMeshes;
    local /*0x35EA0000-0x00000000*/ private name HitBone[9437185];
    local /*0x35EA0000-0x00000000*/ private int HitNodeIndex[9437185], HitLevelIndex;
    local /*0x35EA0000-0x00000000*/ private float InDecalLifeSpan[9437185];
    local /*0x35EA0000-0x00000000*/ private int InFracturedStaticMeshComponentIndex[9437185];
    local /*0x35EA0000-0x00000000*/ private float InDepthBias[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL InBlendRange[9437185], ReturnValue, Result, DecalInfo;

    FRand() * 360.0000000;    
    true        
    -1
    -1
    DecalLifeSpan
    -1
    DecalDepthBias
    DecalBlendRange
    // End:0x68
    if(!CanSpawnDecals())
    {
        return none;
    }
    Result = GetPooledComponent();
    SetDecalParameters(Result, DecalMaterial, DecalLocation, DecalOrientation, Width, Height, Thickness, bNoClip, DecalRotation, HitComponent, bProjectOnTerrain, bProjectOnSkeletalMeshes, HitBone, HitNodeIndex, HitLevelIndex, -1, InDepthBias, InBlendRange);
    AttachComponent(Result);
    DecalInfo.Decal = Result;
    DecalInfo.LifetimeRemaining = InDecalLifeSpan;
    ActiveDecals.AddItem(DecalInfo);    
    return Result;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: DecalComponent'Default__DecalManager.BaseDecal'
    begin object name=BaseDecal class=Class'DecalComponent'
    end object
    DecalTemplate=BaseDecal
    DecalLifeSpan=10.0000000
    DecalDepthBias=-0.0000600
    DecalBlendRange=(X=89.5000000,Y=180.0000000)
    TickGroup=ETickingGroup.TG_DuringAsyncWork
}