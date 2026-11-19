class LPTuneDataVSParts extends SPEngineTuneDataBase
    hidecategories(Object,Object);

var(0.25_Pct) /*0x072E0000-0x00000400*/ private editfixedsize @NULL ArmAimAssistTrackSpeed[589825];
var(0.25_Pct) /*0x072E0000-0x00000400*/ private editfixedsize @NULL ArmAimAssistDuration[589825];
var(0.25_Pct) /*0x592D0000-0x00000400*/ private editfixedsize @NULL ForceFeedbackDefault[589825];
var(0.25_Pct) /*0x592D0000-0x00000400*/ private editfixedsize @NULL ForceFeedbackNormalHit[589825];
var(0.25_Pct) /*0x592D0000-0x00000400*/ private editfixedsize @NULL ForceFeedbackSweetSpotHit[589825];
var(0.25_Pct) /*0x592D0000-0x00000400*/ private editfixedsize @NULL ForceFeedbackSuperSweetSpotHit[589825];
var(0.25_Pct) /*0x2AB20000-0x00000400*/ private editfixedsize @NULL DamagePerSecond[589825];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private float DamageTraceLength[65537];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private @NULL DamageTraceExtent[65537];
var(0.25_Pct) /*0xBB430000-0x00000000*/ private float DelayToStartLoopingSound[65537];
var(0.25_Pct) /*0x59780000-0x00000000*/ private float ForkArmGrab_FloatingAimInputScaleX[65537];
var(0.25_Pct) /*0x59780000-0x00000000*/ private float ForkArmGrab_FloatingAimInputScaleY[65537];
var(0.25_Pct) /*0x59780000-0x00000000*/ private float ForkArmGrab_FloatingAimX[65537];
var(0.25_Pct) /*0x59780000-0x00000000*/ private float ForkArmGrab_FloatingAimY[65537];
var(0.25_Pct) /*0x59780000-0x00000000*/ private float ForkArmGrab_StickOnFSMPercent[65537];
var(0.25_Pct) /*0x91F70000-0x00000000*/ private float BaseDrillAnimSpeed[65537];
var(0.25_Pct) /*0x91F70000-0x00000000*/ private float NormalDrillAnimSpeed[65537];
var(0.25_Pct) /*0x91F70000-0x00000000*/ private float NormalDrillAdditiveAnimSpeed[65537];
var(0.25_Pct) /*0x91F70000-0x00000000*/ private float SweetSpotDrillAdditiveAnimSpeed[65537];
var(0.25_Pct) /*0x91F70000-0x00000000*/ private float SuperSweetDrillAdditiveAnimSpeed[65537];
var(0.25_Pct) /*0x91F70000-0x00000000*/ private float WeakDrillAdditiveAnimSpeed[65537];
var(0.25_Pct) /*0x69070000-0x00000000*/ private float MaxReach[65537];
var(0.25_Pct) /*0x69070000-0x00000000*/ private float IKTriggerDelay[65537];
var(0.25_Pct) /*0x69070000-0x00000000*/ private float MinIKBlendTime[65537];
var(0.25_Pct) /*0x69070000-0x00000000*/ private float IKRoomToSpareThreshold[65537];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSParts.ArmAimAssistTrackSpeedA'
    begin object name=ArmAimAssistTrackSpeedA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=250.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ArmAimAssistTrackSpeed=ArmAimAssistTrackSpeedA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSParts.ArmAimAssistDurationA'
    begin object name=ArmAimAssistDurationA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=0.2000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    ArmAimAssistDuration=ArmAimAssistDurationA
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataVSParts.ForceFeedbackDefaultA'
    begin object name=ForceFeedbackDefaultA class=Class'Engine.ForceFeedbackWaveform'
        Samples=/* Array type was not detected. */
    end object
    ForceFeedbackDefault=ForceFeedbackDefaultA
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataVSParts.ForceFeedbackNormalHitA'
    begin object name=ForceFeedbackNormalHitA class=Class'Engine.ForceFeedbackWaveform'
        Samples=/* Array type was not detected. */
    end object
    ForceFeedbackNormalHit=ForceFeedbackNormalHitA
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataVSParts.ForceFeedbackSweetSpotHitA'
    begin object name=ForceFeedbackSweetSpotHitA class=Class'Engine.ForceFeedbackWaveform'
        Samples=/* Array type was not detected. */
    end object
    ForceFeedbackSweetSpotHit=ForceFeedbackSweetSpotHitA
    // Reference: ForceFeedbackWaveform'Default__LPTuneDataVSParts.ForceFeedbackSuperSweetSpotHitA'
    begin object name=ForceFeedbackSuperSweetSpotHitA class=Class'Engine.ForceFeedbackWaveform'
        Samples=/* Array type was not detected. */
    end object
    ForceFeedbackSuperSweetSpotHit=ForceFeedbackSuperSweetSpotHitA
    // Reference: SPFloatDifficulty'Default__LPTuneDataVSParts.DamagePerSecondA'
    begin object name=DamagePerSecondA class=Class'SPEngine.SPFloatDifficulty'
        baseValue=100.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamagePerSecond=DamagePerSecondA
    DamageTraceLength=150.0000000
    DelayToStartLoopingSound=1.0000000
    ForkArmGrab_FloatingAimInputScaleX=1.0000000
    ForkArmGrab_FloatingAimInputScaleY=1.0000000
    ForkArmGrab_FloatingAimX=0.4000000
    ForkArmGrab_FloatingAimY=0.4000000
    BaseDrillAnimSpeed=120.0000000
    SweetSpotDrillAdditiveAnimSpeed=30.0000000
    SuperSweetDrillAdditiveAnimSpeed=60.0000000
    WeakDrillAdditiveAnimSpeed=-100.0000000
    MaxReach=700.0000000
    IKTriggerDelay=0.5000000
    MinIKBlendTime=0.3500000
    IKRoomToSpareThreshold=75.0000000
}