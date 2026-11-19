class LPSeqAct_PlayMPAnnouncement extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x06B30000-0x00000000*/ private byte AnnouncementEventName[65537];
var(0.25_Pct) /*0x06B30000-0x00000000*/ private int BroadcastToTeamNum[65537];
var(0.25_Pct) /*0x06B30000-0x00000000*/ private bool bPlayCustomAnnouncement[65537];
var(0.25_Pct) /*0x2A970000-0x00000000*/ private bool bCustomAnnouncementShouldOverride[65537];
var(0.25_Pct) /*0x2A970000-0x00000000*/ private bool bCustomAnnouncementShouldQueue[65537];
var(0.25_Pct) /*0x2A970000-0x00000000*/ private editfixedsize array CustomNevecAkEvents[65537];
var(0.25_Pct) /*0x2A970000-0x00000000*/ private editfixedsize array CustomPiratesAkEvents[65537];

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL WI, LPPC;

    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    // End:0x153
    if((int(WI.NetMode) != int(NM_Client)) && int(WI.NetMode) != int(NM_Standalone))
    {
        // End:0x128
        if(bPlayCustomAnnouncement)
        {
            // End:0x124
            foreach WI.AllControllers(Class'LPPlayerController', LPPC)
            {
                // End:0x123
                if((BroadcastToTeamNum == -1) || int(LPPC.GetTeamNum()) == BroadcastToTeamNum)
                {
                    LPPC.ClientReceiveSeqActAnnouncement(self);
                }                
            }                        
        }
        else
        {
            Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(AnnouncementEventName);
        }
    }
    //return;    
}

function GetAkEvent()
{
    local /*0x97E50000-0x00000000*/ private int MyTeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private byte bShouldOverride[25165825], bShouldQueue;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int RandomIdx;

    bShouldOverride = ((bCustomAnnouncementShouldOverride) ? 1 : 0);
    bShouldQueue = ((bCustomAnnouncementShouldQueue) ? 1 : 0);
    // End:0x97
    if(MyTeamNum == 0)
    {
        RandomIdx = Class'SPEngine.SPUtil'.static.RandRangeInt(0, CustomNevecAkEvents.Length - 1);
        return CustomNevecAkEvents[RandomIdx];        
    }
    else
    {
        RandomIdx = Class'SPEngine.SPUtil'.static.RandRangeInt(0, CustomPiratesAkEvents.Length - 1);
        return CustomPiratesAkEvents[RandomIdx];
    }
    return none;
    //return ReturnValue;    
}

defaultproperties
{
    BroadcastToTeamNum=-1
    VariableLinks=none
    ObjName="Play MP Announcement (LP)"
}