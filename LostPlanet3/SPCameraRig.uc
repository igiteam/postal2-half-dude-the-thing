class SPCameraRig extends SPViewTarget
    abstract
    hidecategories(Object,Object);

// Export USPCameraRig::execCopyFrom(FFrame&, void* const)
native simulated function CopyFrom()
{
    local /*0x043A0000-0x00000000*/ private @NULL Other[8388609];


}

simulated function Reset()
{
    //return;    
}

simulated function EnforceLimits()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

simulated function ConvertFromTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[8388609];

    //return;    
}

// Export USPCameraRig::execAdjustFromTViewTarget(FFrame&, void* const)
native simulated function AdjustFromTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25296897];


}

// Export USPCameraRig::execConvertToTViewTarget(FFrame&, void* const)
native simulated function ConvertToTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25165825];


}

final function BlendRig()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C;
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

simulated function EnableCollision()
{
    local /*0x043A0000-0x00000000*/ private bool bOn[8388609];

    //return;    
}

simulated function EnableCollisionDisplayFeelers()
{
    local /*0x043A0000-0x00000000*/ private bool bOn[8388609];

    //return;    
}

simulated function CheckValid()
{
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];

    HUD.Canvas.SetDrawColor(224, 255, 0);
    HUD.Canvas.DrawText("      " @ (ToString()), true);
    //return;    
}
