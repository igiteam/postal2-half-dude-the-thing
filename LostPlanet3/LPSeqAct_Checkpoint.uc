class LPSeqAct_Checkpoint extends SPSeqAct_Checkpoint
    forcescriptorder(true)
    hidecategories(Object);

const BEFORE_THE_STORM_CHECKPOINT_SLOT = 2;

var(0.25_Pct) /*0x82890000-0x00000000*/ private bool bBeforeTheStormCheckpoint[65537];

function GetPreferredSaveSlot()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x10
    if(bBeforeTheStormCheckpoint)
    {
        return 2;
    }
    return -1;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPLocTextSelector'Default__LPSeqAct_Checkpoint.DefPropCPLocSelector'
    begin object name=DefPropCPLocSelector class=Class'LPLocTextSelector'
    end object
    CheckpointDisplayNameLoc=DefPropCPLocSelector
    ObjName="Checkpoint (LP)"
}