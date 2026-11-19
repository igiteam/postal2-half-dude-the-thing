class LPSM_ForkArmGrab_HoldCarrierHornBase extends LPSM_ForkArmGrab_HoldStateBased
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    LPAIPawnCarrier(MySPPawn).SetHiveDeflation(1.0000000);
    //return;    
}

function StartInteraction()
{
    super.StartInteraction();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function GetIKTargetAssistSocket()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'None';
    //return ReturnValue;    
}

function NotifyFollowerDamagedByLeader()
{
    local /*0x97E50000-0x00000000*/ private @NULL InDamageParams[25296897], Mat, Tag, CarrierPawn;
    local /*0x97E50000-0x00000000*/ private name IKAssistSocketName;
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    Mat = LPPhysicalMaterial(InDamageParams.HitInfo.PhysMaterial);
    CarrierPawn = LPAIPawnCarrier(FollowerPawn);
    // End:0x356
    if((Mat != none) && CarrierPawn != none)
    {
        vsPawn = LPVSPlayerPawn(MySPPawn);
        Tag = LPPhysMatPropTag_CarrierCoreId(Mat.GetTag(Class'LPPhysMatPropTag_CarrierCoreId'));
        // End:0x356
        if(Tag != none)
        {
            IKAssistSocketName = CarrierPawn.GetIKAssistSocketFromCoreID(Tag.GetCoreId());
            // End:0x356
            if(IKAssistSocketName != 'None')
            {
                // End:0x2E0
                if(CarrierPawn.GetCoreHealth(Tag.GetCoreId()) > float(0))
                {
                    // End:0x284
                    if(((vsPawn.RightArmPartInfo.IKTargetAssistSocket != 'None') && vsPawn.RightArmPartInfo.IKTargetAssistSocket != IKAssistSocketName) && (MySPPawn.WorldInfo.TimeSeconds - vsPawn.RightArmPart.LastArmAssistanceTime) < 0.5000000)
                    {                        
                    }
                    else
                    {
                        vsPawn.RightArmPartInfo.IKTargetAssistSocket = IKAssistSocketName;
                        HitVulnerableCore(LPAIPawn(FollowerPawn));
                    }                    
                }
                else
                {
                    vsPawn.RightArmPartInfo.IKTargetAssistSocket = 'None';
                    vsPawn.RightArmPart.LastArmAssistanceTime = 0.0000000;
                }
            }
        }
    }
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
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
        // End:0x6A
        case Class'LPSMMTypes'.default.SMM_ShockStart:
            MySPPawn.DoSpecialMove(Class'LPSM_ForkArmGrab_Shock',,,, FollowerPawn);
            return true;
        // End:0xFFFF
        default:
            return super.ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    bShowTaserHelp=true
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldCarrierHornBase.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldCarrierHornBase.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldCarrierHornBase.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}