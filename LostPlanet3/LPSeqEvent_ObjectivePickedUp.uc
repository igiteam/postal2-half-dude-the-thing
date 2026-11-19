class LPSeqEvent_ObjectivePickedUp extends LPSeqEvent_ObjectiveBase
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AnnouncementNameAkrid;

function @NULL HandleAnnouncement()
{
    local /*0x97E50000-0x00000400*/ private @NULL Comp[8388609];
    local /*0x97E50000-0x00000000*/ private int InstigatorTeam;

    // End:0x148
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Client))
    {
        InstigatorTeam = int(Instigator.GetTeamNum());
        // End:0xD7
        if(((InstigatorTeam != 0) && InstigatorTeam != 1) && int(AnnouncementNameAkrid) != int(0))
        {
            Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(AnnouncementNameAkrid,,, Comp);            
        }
        else
        {
            // End:0x148
            if(((InstigatorTeam != 0) || InstigatorTeam != 1) && int(AnnouncementName) != int(0))
            {
                Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(AnnouncementName,, InstigatorTeam, Comp);
            }
        }
    }
    //return;    
}

defaultproperties
{
    AnnouncementNameAkrid=eAnnouncementEventName.AEN_ObjectivePickedUpAkrid
    EventString="PickedUp"
    AnnouncementName=eAnnouncementEventName.AEN_ObjectivePickedUp
    OutputLinks[0]=(Links=none,LinkDesc="NEVEC",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Pirates",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="Akrid",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Objective Picked Up (LP)"
}