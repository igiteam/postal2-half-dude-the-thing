class LPSM_PlayerEjectedFromVS extends SPSM_PlayAnimBase
    config(Game);

enum EEjectAnims
{
    EEjA_FrontNice,                 // 0
    EEjA_RearNice,                  // 1
    EEjA_Front,                     // 2
    EEjA_Rear,                      // 3
    EEjA_FrontHard,                 // 4
    EEjA_RearHard,                  // 5
    EEjA_RearDeath,                 // 6
    EEjA_Safety,                    // 7
    EEjA_SafetyNice,                // 8
    EEjA_MAX                        // 9
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerRotation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CamTransitionCubicParam;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CamTransitionCutParam;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VSAnimNames;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    PlayerPawn = LPPlayerPawn(MySPPawn);
    //return;    
}

function GetDesiredAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x88
    if(int(PlayerPawn.ExitType) == int(0))
    {
        // End:0x58
        if(int(PlayerPawn.ExitDirection) == int(2))
        {
            return 8;            
        }
        else
        {
            // End:0x86
            if(int(PlayerPawn.ExitDirection) == int(0))
            {
                return 0;                
            }
            else
            {
                return 1;
            }
        }
    }
    // End:0xB7
    if(int(PlayerPawn.ExitDirection) == int(2))
    {
        return 7;        
    }
    else
    {
        // End:0x115
        if(int(PlayerPawn.ExitDirection) == int(0))
        {
            // End:0x10F
            if(int(PlayerPawn.ExitType) == int(2))
            {
                return 4;                
            }
            else
            {
                return 2;
            }            
        }
        else
        {
            // End:0x144
            if(int(PlayerPawn.ExitType) == int(3))
            {
                return 6;                
            }
            else
            {
                // End:0x173
                if(int(PlayerPawn.ExitType) == int(2))
                {
                    return 5;                    
                }
                else
                {
                    return 3;
                }
            }
        }
    }
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], SocketLocation, SocketRotation, LPC;
    local /*0x97E50000-0x00000000*/ private bool bSocketPos;

    PlayerRotation = MySPPawn.Rotation;
    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x245
    if(PlayerPawn.IsLocallyControlled())
    {
        LPC = LPPlayerController(MySPPawn.Controller);
        LPC.myLPHUD.RemoveMessageLayer(24);
        // End:0x14A
        if(int(PlayerPawn.ExitDirection) == int(1))
        {
            MySPPawn.SetRotation(PlayerRotation + MakeRotator(0, int(182.0444000 * float(180)), 0));
            bSocketPos = false;            
        }
        else
        {
            // End:0x182
            if(int(PlayerPawn.ExitDirection) == int(0))
            {
                bSocketPos = false;                
            }
            else
            {
                // End:0x1B7
                if(int(PlayerPawn.ExitDirection) == int(2))
                {
                    bSocketPos = false;
                }
            }
        }
        // End:0x20D
        if(bSocketPos)
        {
            MySPPawn.SetLocation(SocketLocation);
            MySPPawn.SetRotation(SocketRotation);
        }
        PlayerPawn.Controller.GotoState('EjectVSState');
    }
    MySPPawn.SetHidden(false);
    MySPPawn.ClearTimer('BecomeVisible');
    CamParams.CheckCameraCollision = false;
    CamParams.bCollideCamera = false;
    CamParams.bConstrainPlayerInFOV = false;
    CamParams.bConstrainEnemyInFOV = false;
    CamParams.CheckCameraCollision = false;
    CamParams.AnimatedFOV = 85.0000000;
    CamParams.MyPawn = MySPPawn;
    CamParams.CameraFOVBoneName = 'None';
    CamParams.FloatingAimThresholdMinX = 0.0000000;
    CamParams.FloatingAimThresholdMaxX = 0.0000000;
    CamParams.FloatingAimThresholdMinY = 0.0000000;
    CamParams.FloatingAimThresholdMaxY = 0.0000000;
    CamTransitionCutParam.bCutDestMode = true;
    LPC.ChangeCameraMode(CamParams, CamTransitionCutParam);
    PlayVSAdditive();
    //return;    
}

function PlayVSAdditive()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimTemplateRoot, AnimSeq, vsPawn;
    local /*0x97E50000-0x00000000*/ private editfixedsize array VSAnimTemplates;
    local /*0x97E50000-0x00000000*/ private int Index;

    vsPawn = LPBaseVSPlayerPawn(PlayerPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    // End:0x68
    if(vsPawn == none)
    {
        return;
    }
    vsPawn.PlayerVSLogicAnimTree.FindAnimNodes(VSAnimNames, VSAnimTemplates, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
    Index = GetDesiredAnimIndex();
    // End:0x11A
    if((Index >= 0) && Index < VSAnimTemplates.Length)
    {
        AnimTemplateRoot = SPAnimNodeTemplateLogicNamedRoot(VSAnimTemplates[Index]);
    }
    // End:0x12B
    if(AnimTemplateRoot == none)
    {
        return;
    }
    AnimSeq = AnimTemplateRoot.GetBestSequenceTemplate(vsPawn);
    // End:0x16E
    if(AnimSeq == none)
    {
        return;
    }
    vsPawn.PlayAdditiveAnimationSequence(AnimSeq,,,, 0.0000000, 0.1000000);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, WorldAimVec, CameraLoc, LPC;

    MySPPawn.SetRotation(PlayerRotation);
    LPC = LPPlayerController(MySPPawn.Controller);
    WorldAimVec = Vector(MySPPawn.Rotation);
    CameraLoc = MySPPawn.Location - WorldAimVec;
    // End:0x15D
    if(LPC != none)
    {
        LPC.PlayerCamera.SetCameraViewPoint(MySPPawn, CameraLoc, MySPPawn.Rotation, LPC.PlayerCamera.GetFOVAngle());
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x1D3
    if(LPC != none)
    {
        LPC.SetDefaultCam(CamTransitionCutParam);
        LPC.GotoState('PlayerWalking');
    }
    // End:0x278
    if(int(PlayerPawn.ExitType) == int(3))
    {
        MySPPawn.TakeDamage(PlayerPawn.HealthMax, LPC, PlayerPawn.Location, vect(0.0000000, 0.0000000, 200.0000000), Class'LPDamageTypeForced');
    }
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_ShouldIgnoreDamageType:
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

event AnimNotifySpecialMove()
{
    LPPlayerController(PlayerPawn.Controller).WinchBoneDetach();
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerEjectedFromVS.CamParamObj'
    begin object name=CamParamObj class=Class'LPCameraModeAimControlAnimatedParam'
        AnimatedFOV=85.0000000
    end object
    CamParams=CamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_PlayerEjectedFromVS.CamTransitionCubicParamObj'
    begin object name=CamTransitionCubicParamObj class=Class'LPCameraTransitionCubicParam'
    end object
    CamTransitionCubicParam=CamTransitionCubicParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_PlayerEjectedFromVS.CamTransitionCutParamObj'
    begin object name=CamTransitionCutParamObj class=Class'LPCameraTransitionCutParam'
    end object
    CamTransitionCutParam=CamTransitionCutParamObj
    VSAnimNames=/* Array type was not detected. */
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    AnimTemplateTree=AnimTree'PlayerMoveAnimTemplate.PlayerVSAnimations'
    BlendInTime=0.0000000
    BlendOutTime=0.0000000
    bManageRootMotionMode=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}