class LPSMMTypes extends SPSpecialMoveMessageTypes;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_ForkArmGrabPressed[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_ForkArmGrabReleased[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_ClawArmStart[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_ClawArmEnd[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_ShockStart[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_ShockEnd[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_WinchPointGrab[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_WinchPointRelease[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_WinchPointZipline[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_WinchPointZiplineBack[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_PlayerRequestsEnterVS[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_PlayerRequestsExitVS[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_PlayerEnteredVS[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_PlayerExitedVS[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_HandleDismemberment[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_HandleCoreDestroyed[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_NextZiplineSequence[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_SnowCrabStartHastyPincerBash[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_SnowCrabStartTauntRoar[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_GrabGameplayTest[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_ShouldIgnoreDamageType[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_VSShieldBlockReleased[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_TakeDamageSetParams[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_GrenadeCanQuickRelease[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_GrenadeReleased[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_GrenadeAborted[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_StruggleStabAttempt[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_StrugglePlayerDying[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_StrugglePhaseChanged[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_StruggleButton[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_StruggleTakeDamage[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_StruggleDodgeButton[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_StrugglePlayCameraAnim[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_StruggleVsBlockAttempt[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_PlayDying[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_CrushVSGrabbedPawn[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_ThrowVSGrabbedPawn[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_TossCrushedPawn[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_AIPawnLanded[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_PawnDiedInClaw[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_ShotgunWantsToFire[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_WeaponStopOverheating[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_WeaponOverheatIdle[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_VSRightArmPartStart[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_VSRightArmPartEnd[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_VSRightArmAltActionPressed[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_VSRightArmAltActionReleased[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_VSForcedRightArmPartEndThroughAnimNotify[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_NewVSRightArmPartSwitchRequest[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_NewVSRightArmPartEquipped[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_ForkArmGrabVictimLidRemoved[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_ForkArmGrabVictimInClaw[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_VSInteractionPointDisable[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_VSInteractionPointEnable[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_VSPlayHitReactionAnimation[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_VSForceAdditiveHitReaction[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_MeleeWhileFrozen[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_PlayTakeDamageEffects[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_PlayJobLogOutro[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_NotifyWeaponTakeOutFinished[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_IsPawnGrabbed[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_CanActiveDefense[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_StartRecovery[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_WinchButtonPressed[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_AnimNotifyDodge[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_MeleeTakedownAllowed[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_AbortJobLog[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_PlayerMeleeHitPawn[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_AllowSMToContinueOnIgnoreMoveInput[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SMM_AllowMunitionsLockerAccess[131073];

defaultproperties
{
    SMM_ForkArmGrabPressed="SMM_ForkArmGrabPressed"
    SMM_ForkArmGrabReleased="SMM_ForkArmGrabReleased"
    SMM_ShockStart="SMM_ShockStart"
    SMM_ShockEnd="SMM_ShockEnd"
    SMM_PlayerRequestsEnterVS="SMM_PlayerRequestsEnterVS"
    SMM_PlayerRequestsExitVS="SMM_PlayerRequestsExitVS"
    SMM_PlayerEnteredVS="SMM_PlayerEnteredVS"
    SMM_PlayerExitedVS="SMM_PlayerExitedVS"
    SMM_HandleDismemberment="SMM_HandleDismemberment"
    SMM_HandleCoreDestroyed="SMM_HandleCoreDestroyed"
    SMM_NextZiplineSequence="SMM_NextZiplineSequence"
    SMM_SnowCrabStartHastyPincerBash="SMM_SnowCrabStartHastyPincerBash"
    SMM_GrabGameplayTest="SMM_GrabGameplayTest"
    SMM_ShouldIgnoreDamageType="SMM_ShouldIgnoreDamageType"
    SMM_VSShieldBlockReleased="SMM_VSShieldBlockReleased"
    SMM_TakeDamageSetParams="SMM_TakeDamageSetParams"
    SMM_GrenadeCanQuickRelease="SMM_GrenadeCanQuickRelease"
    SMM_GrenadeReleased="SMM_GrenadeReleased"
    SMM_StruggleStabAttempt="SMM_StruggleStabAttempt"
    SMM_StrugglePlayerDying="SMM_StrugglePlayerDying"
    SMM_StrugglePhaseChanged="SMM_StrugglePhaseChanged"
    SMM_StruggleButton="SMM_StruggleButton"
    SMM_StruggleTakeDamage="SMM_StruggleTakeDamage"
    SMM_StrugglePlayCameraAnim="SMM_StrugglePlayCameraAnim"
    SMM_StruggleVsBlockAttempt="SMM_StruggleVsBlockAttempt"
    SMM_PlayDying="SMM_PlayDying"
    SMM_CrushVSGrabbedPawn="SMM_CrushVSGrabbedPawn"
    SMM_ThrowVSGrabbedPawn="SMM_ThrowVSGrabbedPawn"
    SMM_TossCrushedPawn="SMM_TossCrushedPawn"
    SMM_AIPawnLanded="SMM_AIPawnLanded"
    SMM_PawnDiedInClaw="SMM_PawnDiedInClaw"
    SMM_ShotgunWantsToFire="SMM_ShotgunWantsToFire"
    SMM_WeaponStopOverheating="SMM_WeaponStopOverheating"
    SMM_WeaponOverheatIdle="SMM_WeaponOverheatIdle"
    SMM_VSRightArmPartStart="SMM_VSRightArmPartStart"
    SMM_VSRightArmPartEnd="SMM_VSRightArmPartEnd"
    SMM_VSRightArmAltActionPressed="SMM_VSRightArmAltActionPressed"
    SMM_VSRightArmAltActionReleased="SMM_VSRightArmAltActionReleased"
    SMM_NewVSRightArmPartSwitchRequest="SMM_NewVSRightArmPartSwitchRequest"
    SMM_NewVSRightArmPartEquipped="SMM_NewVSRightArmPartEquipped"
    SMM_ForkArmGrabVictimLidRemoved="SMM_ForkArmGrabVictimLidRemoved"
    SMM_VSInteractionPointDisable="SMM_VSInteractionPointDisable"
    SMM_VSInteractionPointEnable="SMM_VSInteractionPointEnable"
    SMM_VSPlayHitReactionAnimation="SMM_VSPlayHitReactionAnimation"
    SMM_VSForceAdditiveHitReaction="SMM_VSForceAdditiveHitReaction"
    SMM_MeleeWhileFrozen="SMM_MeleeWhileFrozen"
    SMM_PlayTakeDamageEffects="SMM_PlayTakeDamageEffects"
    SMM_PlayJobLogOutro="SMM_PlayJobLogOutro"
    SMM_NotifyWeaponTakeOutFinished="SMM_NotifyWeaponTakeOutFinished"
    SMM_IsPawnGrabbed="SMM_IsPawnGrabbed"
    SMM_CanActiveDefense="SMM_CanActiveDefense"
    SMM_StartRecovery="SMM_StartRecovery"
    SMM_WinchButtonPressed="SMM_WinchButtonPressed"
    SMM_AnimNotifyDodge="SMM_AnimNotifyDodge"
    SMM_MeleeTakedownAllowed="SMM_MeleeTakedownAllowed"
    SMM_AbortJobLog="SMM_AbortJobLog"
    SMM_PlayerMeleeHitPawn="SMM_PlayerMeleeHitPawn"
    SMM_AllowSMToContinueOnIgnoreMoveInput="SMM_AllowSMToContinueOnIgnoreMoveInput"
    SMM_AllowMunitionsLockerAccess="SMM_AllowMunitionsLockerAccess"
}