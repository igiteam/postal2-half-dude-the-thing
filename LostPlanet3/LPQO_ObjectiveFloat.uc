class LPQO_ObjectiveFloat extends SPQO_ObjectiveFloat
    editinlinenew
    hidecategories(Object,Object)
    autoexpandcategories(SPQuestObject_Base,SPQO_Objective);

var(0.25_Pct) /*0xAD800000-0x00000000*/ private float RewardAmount[65537];
var(0.25_Pct) /*0xAD800000-0x00000000*/ private byte RewardType[65537];
var(0.25_Pct) /*0xD0210000-0x00000400*/ private editfixedsize @NULL ProgressText[589825];
var(0.25_Pct) /*0x82080000-0x00000000*/ private name PersistentMapName[65537];
var(0.25_Pct) /*0xD0210000-0x00000000*/ private editfixedsize array HideWorldMapZones[65537];
var(0.25_Pct) /*0xD0210000-0x00000000*/ private @NULL WorldMapIcon[65537];

event ShowStatusChangedUI()
{
    local /*0x97E50000-0x00000000*/ private byte NewStatus[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPPC;

    LPQDD_Float(DynamicData).bItemViewedInJobLog = false;
    LP = Class'Engine.UIInteraction'.static.GetLocalPlayer(0);
    // End:0x94
    if(LP != none)
    {
        LPPC = LPPlayerController(LP.Actor);
    }
    // End:0x155
    if((int(NewStatus) == int(4)) && bShowCompletedMessage)
    {
        // End:0x152
        if(LPPC != none)
        {
            LPPC.myLPHUD.ShowQuestObjectiveCompleteMessage(self);
            // End:0x152
            if(RewardAmount > float(0))
            {
                LPPC.myLPHUD.ShowQuestRewardMessage(RewardAmount, RewardType);
            }
        }        
    }
    else
    {
        // End:0x1FD
        if(int(NewStatus) == int(3))
        {
            Class'LPBreadcrumbManager'.static.GetBreadcrumbManager().NewQuestObjectiveActivated(self, LPPC);
            // End:0x1FA
            if(bShowActivatedMessage)
            {
                // End:0x1FA
                if(LPPC != none)
                {
                    LPPC.myLPHUD.ShowQuestObjectiveActivatedMessage(self);
                }
            }            
        }
        else
        {
            // End:0x264
            if((int(NewStatus) == int(5)) && bShowFailedMessage)
            {
                // End:0x264
                if(LPPC != none)
                {
                    LPPC.myLPHUD.ShowQuestObjectiveFailedMessage(self);
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPQO_ObjectiveFloat.ValueA'
    begin object name=ValueA
    end object
    RequiredValue=ValueA
    // Reference: LPQP_None'Default__LPQO_ObjectiveFloat.DefaultPrereqA'
    begin object name=DefaultPrereqA class=Class'LPQP_None'
    end object
    Prerequisite=DefaultPrereqA
    DynamicDataClass=Class'LPQDD_Float'
}