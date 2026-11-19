class LPGFxUIElementReticle extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastPositionX;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastPositionY;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AimHalfWidth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AimHalfHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastCHColor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastShow;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ReticleRoot;

// Export ULPGFxUIElementReticle::execSetPosition(FFrame&, void* const)
native function SetPosition()
{
    local /*0x97E50000-0x00000000*/ private float PosX[8388609], PosY;


}

event SetColor()
{
    local /*0x97E50000-0x00000000*/ private int R[8388609], G, B;

    //return;    
}

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    LastPositionX = 9999.0000000;
    LastPositionY = 9999.0000000;
    LastCHColor.R = 0;
    LastCHColor.G = 0;
    LastCHColor.B = 0;
    LastCHColor.A = 255;
    bLastShow = false;
    AimHalfWidth = 0.0000000;
    AimHalfHeight = 0.0000000;
    //return;    
}

function NotifyWeaponFired()
{
    //return;    
}

// Export ULPGFxUIElementReticle::execNativeUpdate(FFrame&, void* const)
native function NativeUpdate()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0x3E
    if(bShouldBeActive)
    {
        NativeUpdate(DeltaTime);
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

// Export ULPGFxUIElementReticle::execShouldBeVisible(FFrame&, void* const)
native function ShouldBeVisible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGFxUIElementReticle::execGetPosition(FFrame&, void* const)
native function GetPosition()
{
    local /*0x97E50000-0x00000000*/ private float PosX[25165825], PosY;


}

// Export ULPGFxUIElementReticle::execGetAimHalfSize(FFrame&, void* const)
native function GetAimHalfSize()
{
    local /*0x97E50000-0x00000000*/ private float Width[25165825], Height;


}

function NotifyShoulderAimCameraActive()
{
    //return;    
}

function NotifyShoulderAimCameraInactive()
{
    //return;    
}

function RefreshReticleType()
{
    //return;    
}

function SetAimedInteractionPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Point[8388609], WorldPos;

    //return;    
}
