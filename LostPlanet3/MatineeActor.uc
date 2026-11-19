class MatineeActor extends Actor
    nativereplication
    notplaceable
    hidecategories(AnimDependency,Navigation);

const MAX_AIGROUP_NUMBER = 10;

var(*) /*0x35EA0000-0x00000000*/ private SeqAct_Interp InterpAction[2228225];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsPlaying[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bReversePlayback[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bPaused[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool AllAIGroupsInitialized[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float PlayRate[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float Position[2097153];
var(*) /*0x35EA0000-0x00000000*/ private name AIGroupNames[2097162];
var(*) /*0x35EA0000-0x00000000*/ private @NULL AIGroupPawns[2097162];
var(*) /*0x35EA0000-0x00000000*/ private int AIGroupInitStage[536870922];
var(*) /*0x35EA0000-0x00000000*/ private float ClientSidePositionErrorTolerance;

// Export UMatineeActor::execAddAIGroupActor(FFrame&, void* const)
native function AddAIGroupActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AIGroupInst[8388609];


}

event Update()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AIGroupInst;
    local /*0x35EA0000-0x00000000*/ private int GroupID;

    bIsPlaying = InterpAction.bIsPlaying;
    bReversePlayback = InterpAction.bReversePlayback;
    bPaused = InterpAction.bPaused;
    PlayRate = InterpAction.PlayRate;
    Position = InterpAction.Position;
    bForceNetUpdate = true;
    // End:0xFD
    if(bIsPlaying)
    {
        SetTimer(1.0000000, true, 'CheckPriorityRefresh');        
    }
    else
    {
        ClearTimer('CheckPriorityRefresh');
    }
    // End:0x1C3
    if(InterpAction != none)
    {
        GroupID = 0;
        J0x12B:

        // End:0x1C3 [Loop If]
        if(GroupID < InterpAction.GroupInst.Length)
        {
            AIGroupInst = InterpGroupInstAI(InterpAction.GroupInst[GroupID]);
            // End:0x1B5
            if(AIGroupInst != none)
            {
                AddAIGroupActor(AIGroupInst);
            }
            ++GroupID;
            // [Loop Continue]
            goto J0x12B;
        }
    }
    //return;    
}

function CheckPriorityRefresh()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C;
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x227
    if(InterpAction != none)
    {
        I = 0;
        J0x1A:

        // End:0xA6 [Loop If]
        if(I < InterpAction.GroupInst.Length)
        {
            // End:0x98
            if(InterpGroupInstDirector(InterpAction.GroupInst[I]) != none)
            {
                bNetDirty = true;
                bForceNetUpdate = true;
                return;
            }
            I++;
            // [Loop Continue]
            goto J0x1A;
        }
        // End:0x226
        foreach WorldInfo.AllControllers(Class'Controller', C)
        {
            // End:0x225
            if((C.bIsPlayer && C.Pawn != none) && (InterpAction.LatentActors.Find(C.Pawn) != ) || )
            {
                C.Pawn.Base != none;
                InterpAction.LatentActors.Find(C.Pawn.Base) != ;                                                                
                bNetDirty = true;
                bForceNetUpdate = true;                
                return;
            }            
        }        
    }
    //return;    
}

defaultproperties
{
    PlayRate=1.0000000
    Position=-1.0000000
    ClientSidePositionErrorTolerance=0.1000000
    Components[0]=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bAlwaysRelevant=true
    bReplicateMovement=false
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=1.0000000
    NetPriority=2.7000000
}