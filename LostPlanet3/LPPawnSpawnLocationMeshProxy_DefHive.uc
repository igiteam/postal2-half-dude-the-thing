class LPPawnSpawnLocationMeshProxy_DefHive extends LPPawnSpawnLocationMeshProxy
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation,Object,Debug,Movement,Destruct,Attachment,Collision);

var(0.25_Pct) /*0x81660000-0x00000000*/ private editfixedsize array ProxyDefenderHiveCellDataList[65537];
var(0.25_Pct) /*0x81660000-0x00000000*/ private int AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnce[65537];
var(0.25_Pct) /*0x81660000-0x00000000*/ private float DelayAfterLastLaunchToAllowAnotherLaunchOverRide[65537];
var(0.25_Pct) /*0x81660000-0x00000000*/ private float MinDelayBeforeProtectingCellsAfterNormalDefenderLaunch[65537];
var(0.25_Pct) /*0x81660000-0x00000000*/ private float MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch[65537];
var(0.25_Pct) /*0xA7950000-0x00000000*/ private bool bShouldLaunchDataWhenNotSelected[65537];
var(0.25_Pct) /*0xA7950000-0x00000000*/ private float LengthOfLaunchArrow[65537];
var(0.25_Pct) /*0xA7950000-0x00000000*/ private float LengthOfLaunchEffectsArrow[65537];
var(0.25_Pct) /*0xA7950000-0x00000000*/ private @NULL TurnedOnLaunchArrowColor[65537];
var(0.25_Pct) /*0xA7950000-0x00000000*/ private @NULL TurnedOnLaunchEffectArrowColor[65537];
var(0.25_Pct) /*0xA7950000-0x00000000*/ private @NULL TurnedOnLaunchPathColor[65537];
var(0.25_Pct) /*0xA7950000-0x00000000*/ private @NULL TurnedOffLaunchArrowColor[65537];
var(0.25_Pct) /*0xA7950000-0x00000000*/ private @NULL TurnedOffLaunchEffectArrowColor[65537];
var(0.25_Pct) /*0xA7950000-0x00000000*/ private @NULL TurnedOffLaunchPathColor[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class HiveTypeThatWillBecome;

defaultproperties
{
    AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnce=9
    DelayAfterLastLaunchToAllowAnotherLaunchOverRide=-1.0000000
    MinDelayBeforeProtectingCellsAfterNormalDefenderLaunch=-1.0000000
    MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch=-1.0000000
    LengthOfLaunchArrow=100.0000000
    LengthOfLaunchEffectsArrow=100.0000000
    TurnedOnLaunchArrowColor=(R=0,G=255,B=0,A=0)
    TurnedOnLaunchEffectArrowColor=(R=82,G=127,B=118,A=0)
    TurnedOnLaunchPathColor=(R=0,G=255,B=255,A=0)
    TurnedOffLaunchArrowColor=(R=255,G=0,B=0,A=0)
    TurnedOffLaunchEffectArrowColor=(R=228,G=120,B=51,A=0)
    TurnedOffLaunchPathColor=(R=255,G=127,B=0,A=0)
    // Reference: SkeletalMeshComponent'Default__LPPawnSpawnLocationMeshProxy_DefHive.ProxyMesh0'
    begin object name=ProxyMesh0
    end object
    Components[0]=ProxyMesh0
    Components[1]=none
    Components[2]=none
    bNotifyPrimitiveComponentUpdates=true
}