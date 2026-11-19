class CameraModifier extends Object;

var(*) /*0x35EA0000-0x00000000*/ private bool bDisabled;
var(*) /*0x35EA0000-0x00000000*/ private bool bPendingDisable;
var(*) /*0x35EA0000-0x00000000*/ private bool bExclusive;
var(*) /*0x16220000-0x00000000*/ private bool bDebug[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CameraOwner;
var(*) /*0x35EA0000-0x00000000*/ private byte Priority;
var(*) /*0x35EA0000-0x00000000*/ private float AlphaInTime;
var(*) /*0x35EA0000-0x00000000*/ private float AlphaOutTime;
var(*) /*0x35EA0000-0x00000000*/ private float Alpha[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float TargetAlpha[536870913];

function Init()
{
    //return;    
}

// Export UCameraModifier::execModifyCamera(FFrame&, void* const)
native function ModifyCamera()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Camera[8388609];
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutPOV[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCameraModifier::execIsDisabled(FFrame&, void* const)
native function IsDisabled()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

function AddCameraModifier()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Camera[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int BestIdx, ModifierIdx;
    local /*0x35EA0000-0x00000000*/ private @NULL Modifier;

    ModifierIdx = 0;
    J0x0B:

    // End:0x76 [Loop If]
    if(ModifierIdx < Camera.ModifierList.Length)
    {
        // End:0x68
        if(Camera.ModifierList[ModifierIdx] == self)
        {
            return false;
        }
        ModifierIdx++;
        // [Loop Continue]
        goto J0x0B;
    }
    ModifierIdx = 0;
    J0x81:

    // End:0x146 [Loop If]
    if(ModifierIdx < Camera.ModifierList.Length)
    {
        // End:0x138
        if(Camera.ModifierList[ModifierIdx].Class == Class)
        {
            Camera.ModifierList[ModifierIdx] = self;
            CameraOwner = Camera;
            return true;
        }
        ModifierIdx++;
        // [Loop Continue]
        goto J0x81;
    }
    BestIdx = 0;
    ModifierIdx = 0;
    J0x15C:

    // End:0x25A [Loop If]
    if(ModifierIdx < Camera.ModifierList.Length)
    {
        Modifier = Camera.ModifierList[ModifierIdx];
        // End:0x1CD
        if(Modifier == none)
        {            
        }
        else
        {
            // End:0x241
            if(int(Priority) <= int(Modifier.Priority))
            {
                // End:0x23E
                if(bExclusive && int(Priority) == int(Modifier.Priority))
                {
                    return false;
                }
                // [Explicit Break]
                goto J0x25A;
            }
            BestIdx++;
        }
        ModifierIdx++;
        // [Loop Continue]
        goto J0x15C;
    }
    J0x25A:

    Camera.ModifierList.Insert(BestIdx, 1);    
    Camera.ModifierList[BestIdx] = self;
    CameraOwner = Camera;
    return true;
    //return ReturnValue;    
}

function RemoveCameraModifier()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Camera[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int ModifierIdx;

    ModifierIdx = 0;
    J0x0B:

    // End:0xA0 [Loop If]
    if(ModifierIdx < Camera.ModifierList.Length)
    {
        // End:0x92
        if(Camera.ModifierList[ModifierIdx] == self)
        {
            Camera.ModifierList.Remove(ModifierIdx, 1);            
            return true;
        }
        ModifierIdx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

event DisableModifier()
{
    local /*0x35EA0000-0x00000000*/ private bool bImmediate[9437185];

    // End:0x29
    if(bImmediate)
    {
        bDisabled = true;
        bPendingDisable = false;        
    }
    else
    {
        // End:0x44
        if(!bDisabled)
        {
            bPendingDisable = true;
        }
    }
    //return;    
}

function EnableModifier()
{
    bDisabled = false;
    bPendingDisable = false;
    //return;    
}

function ToggleModifier()
{
    // End:0x1A
    if(bDisabled)
    {
        EnableModifier();        
    }
    else
    {
        DisableModifier();
    }
    //return;    
}

simulated function ProcessViewRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ViewTarget[8388609];
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL out_ViewRotation[25165825], out_DeltaRot;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

// Export UCameraModifier::execUpdateAlpha(FFrame&, void* const)
native function UpdateAlpha()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Camera[8388609];
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];


}

defaultproperties
{
    Priority=127
}