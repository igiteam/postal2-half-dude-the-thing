class SPCameraActor extends SPEngineCameraActor
    hidecategories(AnimDependency,Navigation);

var(__Filter1__Delegate) /*0x05450000-0x00000400*/ private name ParentFOVBoneName[65537];
var(__Filter1__Delegate) /*0x05450000-0x00000400*/ private int FOVComponentIndex[65537];
var(__Filter1__Delegate) /*0x05450000-0x00000000*/ private bool bFOVParentRelativeTransform[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CameraBlend[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CameraBlendStart[536870913];

// Export USPCameraActor::execUpdatePOV(FFrame&, void* const)
native simulated function UpdatePOV();

// Export USPCameraActor::execRetrieveFOVFromAnimation(FFrame&, void* const)
native static simulated function @NULL RetrieveFOVFromAnimation()
{
    local /*0x043A0000-0x00000400*/ private @NULL SkelComp[8388609];
    local /*0x043A0000-0x00000000*/ private name FOVBone[8388609];
    local /*0x043A0000-0x00000000*/ private int ComponentIndex[8388609];
    local /*0x043A0000-0x00000000*/ private bool bParentRelative[9437185];
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPCameraActor::execForceUpdateComponents(FFrame&, void* const)
native function ForceUpdateComponents()
{
    local /*0x043A0000-0x00000000*/ private bool bCollisionUpdate[9437185], bTransformOnly;

    false
    true                
}

event PerformTransition()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL Loc[25165825], Rot;
    local /*0x043A0000-0x00000000*/ private float FOV[25165825];
    local /*0x043A0000-0x00000000*/ private @NULL Blend;

    // End:0x11
    if(CameraBlend == none)
    {
        return;
    }
    Blend.Location = Loc;
    Blend.Rotation = Rot;
    Blend.FOV = FOV;
    // End:0x15A
    if(CameraBlend.Update(DeltaTime))
    {
        Class'SPCameraTransitionParam'.static.BlendPOVs(CameraBlendStart, Blend, CameraBlend);
        Loc = Blend.Location;
        Rot = Blend.Rotation;
        FOV = Blend.FOV;
    }
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x043A0000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x043A0000-0x00000000*/ private @NULL Canvas;

    Canvas = HUD.Canvas;
    super.DisplayDebug(HUD, out_YL, out_YPos);
    out_YPos = Canvas.CurY;
    //return;    
}

defaultproperties
{
    ParentFOVBoneName="JO_CameraFOV"
    CameraBlendStart=(Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),FOV=90.0000000)
    TickGroup=ETickingGroup.TG_PostAsyncWork
}