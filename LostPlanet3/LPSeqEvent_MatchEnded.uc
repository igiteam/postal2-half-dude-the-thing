class LPSeqEvent_MatchEnded extends SequenceEvent
    forcescriptorder(true)
    hidecategories(Object);

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPP;
    local /*0x97E50000-0x00000000*/ private byte myTeamNo, winnerTeamNo;
    local /*0x97E50000-0x00000000*/ private @NULL Winner, GRI, LPGRI;

    OutputLinks[1].bHasImpulse = false;
    OutputLinks[2].bHasImpulse = false;
    OutputLinks[3].bHasImpulse = false;
    OutputLinks[4].bHasImpulse = false;
    OutputLinks[5].bHasImpulse = false;
    OutputLinks[6].bHasImpulse = false;
    OutputLinks[7].bHasImpulse = false;
    OutputLinks[8].bHasImpulse = false;
    OutputLinks[9].bHasImpulse = false;
    LPPC = LPPlayerController(GetController(Instigator));
    // End:0x192
    if(LPPC != none)
    {
        myTeamNo = LPPC.GetTeamNum();        
    }
    else
    {
        LPP = LPPlayerPawn(GetPawn(Instigator));
        // End:0x1F3
        if(LPP != none)
        {
            myTeamNo = LPP.GetTeamNum();            
        }
    }
    GRI = Class'Engine.WorldInfo'.static.GetWorldInfo().GRI;
    // End:0x285
    if(GRI != none)
    {
        Winner = GRI.Winner;
        LPGRI = LPGRI_Base_MP(GRI);
    }
    // End:0x3AC
    if(Winner != none)
    {
        winnerTeamNo = Winner.GetTeamNum();
        OutputLinks[1].bHasImpulse = int(winnerTeamNo) == int(myTeamNo);
        OutputLinks[2].bHasImpulse = !OutputLinks[1].bHasImpulse;
        OutputLinks[3].bHasImpulse = int(winnerTeamNo) == 0;
        OutputLinks[4].bHasImpulse = !OutputLinks[3].bHasImpulse;        
    }
    else
    {
        OutputLinks[6].bHasImpulse = true;
    }
    // End:0x5D5
    if(LPGRI != none)
    {
        // End:0x5D5
        if(LPGRI.IsMatchComplete())
        {
            OutputLinks[5].bHasImpulse = true;
            // End:0x4EA
            if(LPGRI.RoundsWonTeam1 > LPGRI.RoundsWonTeam2)
            {
                OutputLinks[7].bHasImpulse = LPGRI.Team1Index == 0;
                OutputLinks[8].bHasImpulse = !OutputLinks[7].bHasImpulse;                
            }
            else
            {
                // End:0x5B3
                if(LPGRI.RoundsWonTeam2 > LPGRI.RoundsWonTeam1)
                {
                    OutputLinks[8].bHasImpulse = LPGRI.Team1Index == 0;
                    OutputLinks[7].bHasImpulse = !OutputLinks[8].bHasImpulse;                    
                }
                else
                {
                    OutputLinks[9].bHasImpulse = true;
                }
            }
        }
    }
    OutputLinks[0].bHasImpulse = true;
    //return;    
}

defaultproperties
{
    MaxTriggerCount=0
    bPlayerOnly=false
    OutputLinks[0]=(Links=none,LinkDesc="Round Ended",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="My Team Won",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="My Team Lost",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[3]=(Links=none,LinkDesc="NEVEC Won Round",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[4]=(Links=none,LinkDesc="Pirates Won Round",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[5]=(Links=none,LinkDesc="All Rounds Ended",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[6]=(Links=none,LinkDesc="Round Ended In Draw",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[7]=(Links=none,LinkDesc="NEVEC Won Match",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[8]=(Links=none,LinkDesc="Pirates Won Match",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[9]=(Links=none,LinkDesc="Match Ended In Draw",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Match Ended (LP)"
}