class LPTVCamera extends LPCameraActor
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL HelperCone[524289];
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private float MaxOperationalPitch[65537];
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private float MaxOperationalYaw[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ParentVolumes;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DistanceFromTargetSquared;
var(0.25_Pct) /*0x8A8F0000-0x00000000*/ private @NULL DefaultLookAtTarget[65537];

simulated event PreBeginPlay()
{
    ParentVolumes.Length = 0;
    //return;    
}

simulated event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x2C
    if(HelperCone != none)
    {
        DetachComponent(HelperCone);
    }
    //return;    
}

simulated function AddParentVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL Vol[8388609];

    // End:0x32
    if(ParentVolumes.Find(Vol) < )
    {        
        ParentVolumes.AddItem(Vol);        
    }
    //return;    
}

simulated function IsActorVisible()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Class'SPEngine.SPUtil'.static.WorldLineTest(A.Location, Location);
    //return ReturnValue;    
}

defaultproperties
{
    MaxOperationalPitch=45.0000000
    MaxOperationalYaw=45.0000000
    Components[0]=none
    Components[1]=none
    Components[2]=none
}