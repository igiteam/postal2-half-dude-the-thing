class LPSeqAct_TeamRespawnPool extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TeamNum;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ModifierCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAbsoluteCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int OutputCount;

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL TI;

    // End:0x22
    if((TeamNum > 1) || TeamNum < 0)
    {
        return;
    }
    TI = LPTeamInfo_MP(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI.Teams[TeamNum]);
    // End:0x9A
    if(TI == none)
    {
        return;
    }
    // End:0xE8
    if(InputLinks[0].bHasImpulse)
    {
        OutputCount = TI.GetRemainingLives();        
    }
    else
    {
        // End:0x264
        if(InputLinks[1].bHasImpulse)
        {
            // End:0x264
            if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().Role) == int(ROLE_Authority))
            {
                // End:0x264
                if(TI.bUseTeamLives)
                {
                    // End:0x1ED
                    if(bAbsoluteCount)
                    {
                        TI.MaxTeamLives += (ModifierCount - TI.TeamLives);
                        TI.TeamLives = ModifierCount;                        
                    }
                    else
                    {
                        // End:0x264
                        if(TI.GetRemainingLives() >= 0)
                        {
                            TI.TeamLives += ModifierCount;
                            TI.MaxTeamLives += ModifierCount;
                        }
                    }
                }
            }
        }
    }
    OutputLinks[0].bHasImpulse = true;
    //return;    
}

defaultproperties
{
    bCallHandler=false
    InputLinks[0]=(LinkDesc="Query",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Add",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Int',LinkedVariables=none,LinkDesc="TeamNum",LinkVar="None",PropertyName="TeamNum",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Int',LinkedVariables=none,LinkDesc="Count",LinkVar="None",PropertyName="OutputCount",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[2]=(ExpectedType=Class'Engine.SeqVar_Int',LinkedVariables=none,LinkDesc="Modifier",LinkVar="None",PropertyName="ModifierCount",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[3]=(ExpectedType=Class'Engine.SeqVar_Bool',LinkedVariables=none,LinkDesc="Absolute",LinkVar="None",PropertyName="bAbsoluteCount",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Team Respawn Pool"
}