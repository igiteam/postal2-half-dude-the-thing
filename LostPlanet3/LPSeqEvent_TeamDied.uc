class LPSeqEvent_TeamDied extends SequenceEvent
    forcescriptorder(true)
    hidecategories(Object);

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL PP;

    PP = LPPlayerPawn(Instigator);
    OutputLinks[int(PP.GetTeamNum())].bHasImpulse = true;
    // End:0x11A
    if(LPTeamInfo_MP(PP.PlayerReplicationInfo.Team) != none)
    {
        OutputLinks[((LPTeamInfo_MP(PP.PlayerReplicationInfo.Team).bAttackingTeam) ? 4 : 5)].bHasImpulse = true;
    }
    // End:0x13F
    if(OutputLinks[0].bHasImpulse)
    {        
    }
    else
    {
        // End:0x164
        if(OutputLinks[1].bHasImpulse)
        {            
        }
        else
        {
            // End:0x18A
            if(OutputLinks[2].bHasImpulse)
            {                
            }
            else
            {
                // End:0x1AD
                if(OutputLinks[3].bHasImpulse)
                {
                }
            }
        }
    }
    // End:0x1D3
    if(OutputLinks[4].bHasImpulse)
    {        
    }
    else
    {
        // End:0x1F6
        if(OutputLinks[5].bHasImpulse)
        {
        }
    }
    //return;    
}

defaultproperties
{
    MaxTriggerCount=0
    bPlayerOnly=false
    OutputLinks[0]=(Links=none,LinkDesc="Nevec",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Snow Pirates",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="Akrid",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[3]=(Links=none,LinkDesc="Neutral",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[4]=(Links=none,LinkDesc="Attackers",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[5]=(Links=none,LinkDesc="Defenders",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="MP Team All Dead (LP)"
}