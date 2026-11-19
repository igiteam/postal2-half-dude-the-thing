class LPFXAction_RepairScreenSimple extends LPFXActionBase
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool GlobalTurnOffHeadTracking;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForeground;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL PawnRepairFXComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL VSRepairFXComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL PawnRepairSoundComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL VSRepairSoundComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefaultRepairIcon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VerticalScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VerticalScaleDelta;

// Export ULPFXAction_RepairScreenSimple::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPFXAction_RepairScreenSimple::execEnd(FFrame&, void* const)
native event End();

// Export ULPFXAction_RepairScreenSimple::execShutDown(FFrame&, void* const)
native event ShutDown();

function @NULL Begin()
{
    local /*0x97E50000-0x00000400*/ private @NULL FXAManager, LPP, RepairIcon, ParticleAimLoc, outLoc, ParticleAimRot,
	    outRot, scaleVec;

    // End:0x8A5
    if(!IsActive() || VerticalScaleDelta < 0.0000000)
    {
        FXAManager = FXActionManager();
        // End:0x78
        if(FXAManager != none)
        {
            LPP = LPPlayerPawn(FXAManager.Owner);
        }
        // End:0x8A5
        if(LPP != none)
        {
            VerticalScale = 0.0000000;
            VerticalScaleDelta = 4.0000000;
            scaleVec = vect(1.0000000, 1.0000000, 1.0000000);
            scaleVec.Z = VerticalScale;
            LPP.EnableRepairScreenProjection('RepairWristProjector', scaleVec, true);
            // End:0x202
            if(LPP.RepairScreenProjectionSimpleMaterialInstance != none)
            {
                // End:0x19A
                if(LPP.CurrentRepairComponent != none)
                {
                    RepairIcon = LPP.CurrentRepairComponent.GetRepairInfographic();
                }
                // End:0x1BC
                if(RepairIcon == none)
                {
                    RepairIcon = DefaultRepairIcon;
                }
                LPP.RepairScreenProjectionSimpleMaterialInstance.SetTextureParameterValue('Repair_Item_Icon', RepairIcon);
            }
            bForeground = false;
            // End:0x266
            if(LPP.IsLocallyControlled())
            {
                LPP.RepairScreenProjectionComponent.SetDepthPriorityGroup(1);
            }
            GlobalTurnOffHeadTracking = false;
            // End:0x30B
            if(LPP.HeadTrackComponent != none)
            {
                GlobalTurnOffHeadTracking = LPP.HeadTrackComponent.m_GlobalTurnOffHeadTracking;
                LPP.HeadTrackComponent.m_GlobalTurnOffHeadTracking = true;
            }
            LPP.Mesh.GetSocketWorldLocationAndRotation('VSRepairEffect', outLoc, outRot);
            ParticleAimRot = LPP.Rotation;
            ParticleAimRot.Pitch = LPP.GetAimDirection().Pitch;
            ParticleAimRot.Yaw += 2700;
            ParticleAimLoc = outLoc + (Vector(ParticleAimRot) * float(200));
            // End:0x5C5
            if(false)
            {
                // End:0x4D2
                if(PawnRepairFXComponent == none)
                {
                    PawnRepairFXComponent = LPP.TuneDataPawnFXEventBindings.PlayEventFXAtLoc('PlayerToVSRepair', outLoc, Rotator(ParticleAimLoc - outLoc), LPP, none, none);
                    PawnRepairFXComponent.__OnSystemFinished__Delegate = None;                    
                }
                else
                {
                    PawnRepairFXComponent.ActivateSystem(true);
                }
                // End:0x5A5
                if(VSRepairFXComponent == none)
                {
                    VSRepairFXComponent = LPP.TuneDataPawnFXEventBindings.PlayEventFXAtLoc('VSToPlayerRepair', ParticleAimLoc, Rotator(outLoc - ParticleAimLoc), LPP, none, none);
                    VSRepairFXComponent.__OnSystemFinished__Delegate = None;                    
                }
                else
                {
                    VSRepairFXComponent.ActivateSystem(true);
                }
            }
            // End:0x8A5
            if(true)
            {
                // End:0x6AF
                if(PawnRepairSoundComponent == none)
                {
                    PawnRepairSoundComponent = AudioComponent(LPP.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('PlayerVSRepair', 'None', LPP, LPP.Mesh, none));
                    // End:0x6AC
                    if(PawnRepairSoundComponent != none)
                    {
                        PawnRepairSoundComponent.bAutoDestroy = false;
                        PawnRepairSoundComponent.bStopWhenOwnerDestroyed = true;
                    }                    
                }
                else
                {
                    // End:0x735
                    if(!PawnRepairSoundComponent.IsPlaying() || PawnRepairSoundComponent.IsFadingOut())
                    {
                        PawnRepairSoundComponent.Stop();
                        PawnRepairSoundComponent.Play();
                    }
                }
                // End:0x81F
                if(VSRepairSoundComponent == none)
                {
                    VSRepairSoundComponent = AudioComponent(LPP.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('VSRepairPositional', 'None', LPP, none, none));
                    // End:0x81C
                    if(VSRepairSoundComponent != none)
                    {
                        VSRepairSoundComponent.bAutoDestroy = false;
                        VSRepairSoundComponent.bStopWhenOwnerDestroyed = true;
                        VSRepairSoundComponent.bUseOwnerLocation = false;
                    }                    
                }
                else
                {
                    // End:0x8A5
                    if(!VSRepairSoundComponent.IsPlaying() || VSRepairSoundComponent.IsFadingOut())
                    {
                        VSRepairSoundComponent.Stop();
                        VSRepairSoundComponent.Play();
                    }
                }
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