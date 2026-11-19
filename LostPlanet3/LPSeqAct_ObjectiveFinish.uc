class LPSeqAct_ObjectiveFinish extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0xC9910000-0x00000000*/ private byte WinningTeam[65537];
var(0.25_Pct) /*0xC9910000-0x00000000*/ private byte LosingTeam[65537];

simulated event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL WI, LPPC, ScenarioGRI;

    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    // End:0x1D0
    if(int(WI.NetMode) != int(NM_Standalone))
    {
        // End:0x13A
        foreach WI.AllControllers(Class'LPPlayerController', LPPC)
        {
            // End:0xE0
            if(int(LPPC.GetTeamNum()) == int(LosingTeam))
            {
                LPPC.IncrementStat('Stat_NumObjectivesLost');
            }
            // End:0x139
            if(int(LPPC.GetTeamNum()) == int(WinningTeam))
            {
                LPPC.ServerIncrementStat('Stat_ObjectivesCompleted');
            }            
        }        
        // End:0x1D0
        if(int(WI.Role) == int(ROLE_Authority))
        {
            ScenarioGRI = LPGRI_Scenario_MP(WI.GRI);
            // End:0x1D0
            if(ScenarioGRI != none)
            {
                ScenarioGRI.ObjectivesCompleted[int(WinningTeam)]++;
            }
        }
    }
    //return;    
}

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Objective Actor",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Finish Objective (LP)"
}