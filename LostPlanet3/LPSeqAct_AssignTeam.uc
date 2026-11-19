class LPSeqAct_AssignTeam extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x827B0000-0x00000000*/ private byte TeamNumber[65537];

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL A;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL TeamMetaData, AIC;

    // End:0x47
    if(Targets.Length == 0)
    {
        ScriptLog("WARNING: Missing Target for Assign Team");        
    }
    else
    {
        Idx = 0;
        J0x52:

        // End:0x27B [Loop If]
        if(Idx < Targets.Length)
        {
            A = Actor(Targets[Idx]);
            // End:0xA2
            if(A == none)
            {                
            }
            else
            {
                // End:0x131
                if(A.InteractionMetaData == none)
                {
                    TeamMetaData = new Class'LPTeamAssignmentInteractionMetaData';
                    TeamMetaData.TeamNumber = TeamNumber;
                    A.InteractionMetaData = TeamMetaData;                    
                }
                else
                {
                    // End:0x1A7
                    if(LPTeamAssignmentInteractionMetaData(A.InteractionMetaData) != none)
                    {
                        LPTeamAssignmentInteractionMetaData(A.InteractionMetaData).TeamNumber = TeamNumber;                        
                    }
                    else
                    {
                        // End:0x235
                        if(Pawn(A) != none)
                        {
                            AIC = AIController(Pawn(A).Controller);
                            // End:0x232
                            if(AIC != none)
                            {
                                AIC.SetTeam(int(TeamNumber));
                            }                            
                        }
                        else
                        {
                            ScriptLog("WARNING: Cant change team for " @ string(A));
                        }
                    }
                }
            }
            Idx++;
            // [Loop Continue]
            goto J0x52;
        }
    }
    //return;    
}

defaultproperties
{
    TeamNumber=ELPTeams.LPTeam_Akrid
    bCallHandler=false
    ObjName="Assign Team"
}