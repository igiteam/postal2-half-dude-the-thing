class LPFXAction_ReviveProjection extends LPFXActionBase
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool GlobalTurnOffHeadTracking;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForeground;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EKGIcon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VerticalScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VerticalScaleDelta;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InitialHealth;

// Export ULPFXAction_ReviveProjection::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPFXAction_ReviveProjection::execEnd(FFrame&, void* const)
native event End();

// Export ULPFXAction_ReviveProjection::execShutDown(FFrame&, void* const)
native event ShutDown();

function @NULL Begin()
{
    local /*0x97E50000-0x00000400*/ private @NULL FXAManager, LPP, IPP, scaleVec;

    // End:0x34F
    if(!IsActive() || VerticalScaleDelta < 0.0000000)
    {
        FXAManager = FXActionManager();
        // End:0x78
        if(FXAManager != none)
        {
            LPP = LPPlayerPawn(FXAManager.Owner);
        }
        // End:0x34F
        if(LPP != none)
        {
            VerticalScale = 0.0000000;
            VerticalScaleDelta = 4.0000000;
            scaleVec = vect(1.0000000, 1.0000000, 1.0000000);
            scaleVec.Z = VerticalScale;
            LPP.EnableRepairScreenProjection('ReviveWristProjector', scaleVec, true);
            // End:0x1C0
            if(LPP.RepairScreenProjectionSimpleMaterialInstance != none)
            {
                LPP.RepairScreenProjectionSimpleMaterialInstance.SetTextureParameterValue('Repair_Item_Icon', EKGIcon);
                LPP.RepairScreenProjectionSimpleMaterialInstance.SetScalarParameterValue('Progress', 0.0000000);
            }
            bForeground = false;
            // End:0x224
            if(LPP.IsLocallyControlled())
            {
                LPP.RepairScreenProjectionComponent.SetDepthPriorityGroup(1);
            }
            GlobalTurnOffHeadTracking = false;
            // End:0x2C9
            if(LPP.HeadTrackComponent != none)
            {
                GlobalTurnOffHeadTracking = LPP.HeadTrackComponent.m_GlobalTurnOffHeadTracking;
                LPP.HeadTrackComponent.m_GlobalTurnOffHeadTracking = true;
            }
            IPP = LPP.IncapacitatedRevivalTarget;
            // End:0x312
            if(IPP == none)
            {
                InitialHealth = -100.0000000;                
            }
            else
            {
                InitialHealth = IPP.TuneDataPlayerPawn.MinimumHealthThresholdOnInitialRevival;
            }
        }
    }
    super(SPFXActionBase).Begin();
    //return;    
}

function BeginShutdown()
{
    VerticalScaleDelta = -4.0000000;
    //return;    
}

defaultproperties
{
    bIsTickable=true
}