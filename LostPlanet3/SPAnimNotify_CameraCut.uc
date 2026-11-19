class SPAnimNotify_CameraCut extends AnimNotify
    abstract
    editinlinenew
    collapsecategories
    hidecategories(Object);

enum ESPCameraSocket
{
    CB_CameraSocketA,               // 0
    CB_CameraSocketB,               // 1
    CB_CameraSocketC,               // 2
    CB_Random,                      // 3
    CB_Exit,                        // 4
    CB_MAX                          // 5
};

var(__Filter1__Delegate) /*0x05420000-0x00000000*/ private byte CameraSocketType[65537];
var(__Filter1__Delegate) /*0x05420000-0x00000000*/ private bool bAnimateFOV[65537];
var(__Filter1__Delegate) /*0x05420000-0x00000000*/ private bool bPerformInitialCollisionCheck[65537];
var(__Filter1__Delegate) /*0x05420000-0x00000000*/ private bool bIterateThroughAnimForCollisionCheck[65537];
var(__Filter1__Delegate) /*0x05420000-0x00000000*/ private bool bPerformSocketCollisionCheck[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private class CameraModeParamClass[131073];
var(__Filter1__Delegate) /*0x05420000-0x00000400*/ private @NULL TransitionParams[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private name CameraFOVBoneName[131073];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private name CameraSocketNames[131075];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private name CameraLayerName[131073];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private editfixedsize array SocketChoices;

// Export USPAnimNotify_CameraCut::execCheckPointAgainstWorld(FFrame&, void* const)
native function CheckPointAgainstWorld()
{
    local /*0x043A0000-0x00000000*/ private @NULL Position[8388609], Extent;
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

function SetupCameraSocketChoiceArray()
{
    local /*0x043A0000-0x00000000*/ private byte SocketType[8388609];

    SocketChoices.Length = 0;
    // End:0x4E
    if(int(SocketType) == int(3))
    {
        SocketChoices[0] = 0;
        SocketChoices[1] = 1;
        SocketChoices[2] = 2;        
    }
    else
    {
        // End:0x77
        if(int(SocketType) != int(4))
        {
            SocketChoices[0] = SocketType;
        }
    }
    //return;    
}

event SetCameraMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL CameraManager[8388609], MyPawn, NodeSeq, modeParams, TransParams;

    local /*0x043A0000-0x00000000*/ private float numDirs, probeZMax, probeLen, maxDistToProbe;
    local /*0x043A0000-0x00000000*/ private @NULL BaseBonePos, originOfCollisionCheckPos, extentInfo;
    local /*0x043A0000-0x00000000*/ private int I;
    local /*0x043A0000-0x00000000*/ private @NULL SocketPos, SocketRot, PC;
    local /*0x043A0000-0x00000000*/ private bool TraceActors;

    // End:0x3A
    if(MyPawn == none)
    {
        CameraManager.ClearCameraMode(CameraLayerName);
        return;
    }
    // End:0x74
    if(NodeSeq == none)
    {
        CameraManager.ClearCameraMode(CameraLayerName);
        return;
    }
    PC = SPPlayerController(MyPawn.Controller);
    SetupCameraSocketChoiceArray(CameraSocketType);
    extentInfo = vect(0.0000000, 0.0000000, 0.0000000);
    I = 0;
    J0xDA:

    // End:0x23F [Loop If]
    if(I < SocketChoices.Length)
    {
        modeParams = GetCameraModeParams(MyPawn, NodeSeq);
        // End:0x186
        if(!Class'SPEngine.SPUtil'.static.DoesSocketExist(MyPawn.Mesh, modeParams.CameraSocketName))
        {
            modeParams = none;            
        }
        else
        {
            // End:0x22E
            if(bPerformSocketCollisionCheck)
            {
                MyPawn.Mesh.GetSocketWorldLocationAndRotation(modeParams.CameraSocketName, SocketPos, SocketRot);
                // End:0x228
                if(CheckPointAgainstWorld(SocketPos, extentInfo))
                {
                    modeParams = none;
                    goto J0x231;                    
                }
                else
                {
                    // [Explicit Break]
                    goto J0x23F;
                }                
            }
            else
            {
                // [Explicit Break]
                goto J0x23F;
            }
        }
        J0x231:

        ++I;
        // [Loop Continue]
        goto J0xDA;
    }
    J0x23F:

    BaseBonePos = MyPawn.Mesh.GetBoneLocation(MyPawn.BaseBoneName());
    // End:0x669
    if(bPerformInitialCollisionCheck)
    {
        probeZMax = MyPawn.CylinderComponent.CollisionHeight * 2.0000000;
        originOfCollisionCheckPos = BaseBonePos + SPMakeVector(0.0000000, 0.0000000, probeZMax * 0.5500000);
        // End:0x4C5
        if(((bIterateThroughAnimForCollisionCheck == true) && modeParams != none) && modeParams.CameraSocketName != 'None')
        {
            maxDistToProbe = MyPawn.ComputeMaximumDistanceOfSocketInAnim(modeParams.CameraSocketName, NodeSeq.AnimSeqName, originOfCollisionCheckPos, 1.0000000 / 30.0000000, true);
            // End:0x42F
            if(maxDistToProbe <= 0.0000000)
            {
                CameraManager.ClearCameraMode(CameraLayerName);
                return;
            }
            probeLen = maxDistToProbe * (2.0000000 / 3.0000000);
            extentInfo.X = maxDistToProbe / 3.0000000;
            extentInfo.Y = extentInfo.X;
            TraceActors = false;            
        }
        else
        {
            probeLen = MyPawn.CylinderComponent.CollisionHeight * 0.5000000;
            extentInfo.X = MyPawn.CylinderComponent.CollisionRadius - 1.0000000;
            extentInfo.Y = extentInfo.X;
            TraceActors = true;
        }
        numDirs = 8.0000000;
        extentInfo.Z = probeZMax * 0.4000000;
        // End:0x669
        if(MyPawn.MinOpenSpaceAvailable(originOfCollisionCheckPos, int(numDirs), extentInfo, probeLen, TraceActors) < probeLen)
        {
            CameraManager.ClearCameraMode(CameraLayerName);
            return;
        }
    }
    TransParams = GetCameraTransitionParams();
    // End:0x728
    if((modeParams != none) && modeParams.CameraSocketName != 'None')
    {
        // End:0x6E9
        if(PC != none)
        {
            PC.OnAnimatedCameraSwitch(true);
        }
        CameraManager.SetCameraMode(modeParams, TransParams, CameraLayerName);        
    }
    else
    {
        CameraManager.ClearCameraMode(CameraLayerName, TransParams);
        // End:0x788
        if(PC != none)
        {
            PC.OnAnimatedCameraSwitch(false);
        }
    }
    //return;    
}

function GetCameraModeParams()
{
    local /*0x043A0000-0x00000000*/ private @NULL MyPawn[8388609], NodeSeq, ReturnValue, AnimParams;

    AnimParams = new (self) CameraModeParamClass;
    AnimParams.CameraNodeSequence = NodeSeq;
    AnimParams.CameraSocketName = GetCameraSocketName();
    AnimParams.CameraFOVBoneIndex = GetCameraFOVBoneIndex(MyPawn);
    AnimParams.CameraFOVBoneAxis = GetCameraFOVBoneAxis(AnimParams.CameraSocketName);
    AnimParams.MyPawn = MyPawn;
    return AnimParams;
    //return ReturnValue;    
}

function GetCameraTransitionParams()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return TransitionParams;
    //return ReturnValue;    
}

function GetCameraSocketName()
{
    local /*0x043A0000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private int CameraType;

    CameraType = Rand(SocketChoices.Length);
    SocketChoices.Remove(CameraType, 1);    
    return CameraSocketNames[CameraType];
    //return ReturnValue;    
}

function GetCameraFOVBoneIndex()
{
    local /*0x043A0000-0x00000000*/ private @NULL MyPawn[8388609];
    local /*0x043A0000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x4B
    if(bAnimateFOV)
    {
        return MyPawn.Mesh.MatchRefBone(CameraFOVBoneName);
    }
    return -1;
    //return ReturnValue;    
}

function GetCameraFOVBoneAxis()
{
    local /*0x043A0000-0x00000000*/ private name SocketName[8388609];
    local /*0x043A0000-0x00000000*/ private int ReturnValue[92274689];

    switch(SocketName)
    {
        // End:0x23
        case CameraSocketNames[0]:
            return 0;
        // End:0x33
        case CameraSocketNames[1]:
            return 1;
        // End:0x45
        case CameraSocketNames[2]:
            return 2;
        // End:0xFFFF
        default:
            return 0;
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    bAnimateFOV=true
    bPerformInitialCollisionCheck=true
    CameraModeParamClass=Class'SPCameraModeAnimatedParam'
    CameraFOVBoneName="JO_CameraFOV"
    CameraSocketNames[0]="CameraASocket"
    CameraSocketNames[1]="CameraBSocket"
    CameraSocketNames[2]="CameraCSocket"
    CameraLayerName="Default"
}