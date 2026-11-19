class LPThermalEnergyPocketActor extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

struct CheckpointRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabled;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EnergyRemaining;

    structdefaultproperties
    {
        bEnabled=false
        EnergyRemaining=0.0000000
    }
};

var(0.25_Pct) /*0x894B0000-0x00000000*/ private bool bInitiallyEnabled[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bEnabled[2097153];
var(0.25_Pct) /*0x51F80000-0x00000000*/ private bool bResetEnergyToMax[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSExtractionOnly;
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private editfixedsize string FriendlyThermalPostName[65537];
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private @NULL MapLocation[65537];
var(0.25_Pct) /*0x894B0000-0x00000000*/ private float Radius[2162689];
var(0.25_Pct) /*0x51F80000-0x00000000*/ private float MaxEnergy[2162689];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel float EnergyRemaining[2097153];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private const export @NULL DrawCylinder[655361];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPThermalEnergyPostMeshActor ThermalPosts[2097158];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumThermalPosts[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ThermalPocketTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxPostsPlayerCanErect;
var(0.25_Pct) /*0x894B0000-0x00000000*/ private float PocketProximityPingMaxDistance[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private transient name GameFlowPocketFullName;
var(0.25_Pct) /*0x894B0000-0x00000000*/ private name GameFlowPostStatusName[65537];
var(0.25_Pct) /*0x894B0000-0x00000400*/ private editfixedsize @NULL ThermalEnergyAvailableQuestObjective[589825];

// Export ULPThermalEnergyPocketActor::execProcessGameFlowStatus(FFrame&, void* const)
native function ProcessGameFlowStatus();

// Export ULPThermalEnergyPocketActor::execSetTPostStatus(FFrame&, void* const)
native function SetTPostStatus()
{
    local /*0x97E50000-0x00000000*/ private bool NewStatus[8388609];


}

// Export ULPThermalEnergyPocketActor::execGetTPostStatus(FFrame&, void* const)
native function GetTPostStatus()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event GetMasterTuneDataReference()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ThermalPocketTuneData;
    //return ReturnValue;    
}

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    ThermalPocketTuneData = LPTuneDataThermalEnergyPocket(TuneData);
    // End:0x9F
    if(ThermalPocketTuneData != none)
    {
        MaxPostsPlayerCanErect = ThermalPocketTuneData.MaxPostsPlayerCanErect;
        // End:0x9F
        if(PocketProximityPingMaxDistance <= float(0))
        {
            PocketProximityPingMaxDistance = ThermalPocketTuneData.PocketProximityPingMaxDistance;
        }
    }
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25165825];

    Record.bEnabled = bEnabled;
    Record.EnergyRemaining = EnergyRemaining;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    bEnabled = Record.bEnabled;
    EnergyRemaining = Record.EnergyRemaining;
    SetEnabled(bEnabled);
    //return;    
}

simulated function ResetPocket()
{
    local /*0x97E50000-0x00000000*/ private @NULL Post;
    local /*0x97E50000-0x00000000*/ private float Distance;
    local /*0x97E50000-0x00000000*/ private int Item;

    EnergyRemaining = MaxEnergy;
    // End:0x15E
    if(int(Role) == int(ROLE_Authority))
    {
        Item = 0;
        J0x32:

        // End:0x65 [Loop If]
        if(Item < 6)
        {
            ThermalPosts[Item] = none;
            ++Item;
            // [Loop Continue]
            goto J0x32;
        }
        Item = 0;
        // End:0x14A
        foreach DynamicActors(Class'LPThermalEnergyPostMeshActor', Post)
        {
            Distance = VSize(Post.Location - self.Location);
            // End:0x149
            if(Distance <= Radius)
            {
                ThermalPosts[Item] = Post;
                Post.AttachToPocket(self);
                Post.ResetPost();
                ++Item;
            }            
        }        
        NumThermalPosts = Item;
    }
    SetEnabled(false);
    //return;    
}

simulated function Reset()
{
    ResetPocket();
    // End:0x32
    if(int(Role) == int(ROLE_Authority))
    {
        SetEnabled(bInitiallyEnabled);
    }
    super.Reset();
    //return;    
}

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;

    NumThermalPosts = 0;
    Reset();
    // End:0x57
    if(WorldInfo != none)
    {
        LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    }
    // End:0xC9
    if(LPMI != none)
    {
        Idx = LPMI.ThermalEnergyPocketActors.Find(self);        
        // End:0xC9
        if(Idx == -1)
        {
            LPMI.ThermalEnergyPocketActors.AddItem(self);            
        }
    }
    // End:0xE0
    if(bEnabled)
    {
        TryToRestoreState();
    }
    super.PostBeginPlay();
    //return;    
}

function TryToRestoreState()
{
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL P;

    // End:0x183
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        // End:0xEE
        if(GetTPostStatus())
        {
            Idx = 0;
            J0x41:

            // End:0xEE [Loop If]
            if(Idx < NumThermalPosts)
            {
                // End:0xB6
                foreach LocalPlayerControllers(Class'Engine.PlayerController', P)
                {
                    ThermalPosts[Idx].SetPlayerController(LPPlayerController(P));
                    // End:0xB6
                    break;                    
                }                
                ThermalPosts[Idx].SetExtracting();
                ++Idx;
                // [Loop Continue]
                goto J0x41;
            }
        }
        // End:0x183
        if(HasOperationalThermalPost())
        {
            ProcessGameFlowStatus();
            TriggerEventClass(Class'LPSeqEvent_StartNesting', self);
            Idx = 0;
            J0x127:

            // End:0x183 [Loop If]
            if(Idx < NumThermalPosts)
            {
                ThermalPosts[Idx].ForceCapacity(EnergyRemaining > float(0));
                ++Idx;
                // [Loop Continue]
                goto J0x127;
            }
        }
    }
    //return;    
}

simulated function SetEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x9F
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x77
        if(bEnable && !bEnabled)
        {
            Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(9);
            TriggerEventClass(Class'LPSeqEvent_ThermalEnergyPocketActivated', self);
            PlayStartupAudio();
        }
        // End:0x9F
        if(!bEnable && bEnabled)
        {
            PlayShutdownAudio();
        }
    }
    bEnabled = bEnable;
    SetVisible(bEnabled);
    // End:0xDF
    if(bEnabled)
    {
        TryToRestoreState();
    }
    //return;    
}

simulated function SetVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];
    local /*0x97E50000-0x00000000*/ private int A;

    // End:0x10
    if(bEnable)
    {        
    }
    A = 0;
    J0x1B:

    // End:0x73 [Loop If]
    if(A < NumThermalPosts)
    {
        ThermalPosts[A].ParentPocketStateHasChanged(bEnable);
        ++A;
        // [Loop Continue]
        goto J0x1B;
    }
    //return;    
}

function SetRemainingEnergy()
{
    local /*0x97E50000-0x00000000*/ private float Remain[8388609];
    local /*0x97E50000-0x00000000*/ private bool bTriggerEvents[9437185];

    false
    EnergyRemaining = Remain;
    // End:0x5A
    if(EnergyRemaining <= float(0))
    {
        EnergyRemaining = 0.0000000;
        SetEnabled(false);
        // End:0x5A
        if(bTriggerEvents)
        {
            SignalEmpty();
        }
    }
    // End:0x84
    if(Remain > MaxEnergy)
    {
        MaxEnergy = Remain;
    }
    //return;    
}

function SetMaxEnergy()
{
    local /*0x97E50000-0x00000000*/ private float Max[8388609];

    MaxEnergy = Max;
    EnergyRemaining = Max;
    //return;    
}

simulated function GetEnergyRemaining()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x49
    if(!bVSExtractionOnly && int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return MaxEnergy - float(1);
    }
    return EnergyRemaining;
    //return ReturnValue;    
}

function DecrementEnergyRemaining()
{
    local /*0x97E50000-0x00000000*/ private float Dec[8388609], ReturnValue, prevEnergy;

    // End:0x15
    if(!bEnabled)
    {
        return 0.0000000;
    }
    // End:0x59
    if(!bVSExtractionOnly && int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return Dec;
    }
    prevEnergy = EnergyRemaining;
    EnergyRemaining -= Dec;
    // End:0xAF
    if(EnergyRemaining <= float(0))
    {
        Dec += EnergyRemaining;
        SignalEmpty();
    }
    CheckEventThresholds(prevEnergy);
    return Dec;
    //return ReturnValue;    
}

function CheckEventThresholds()
{
    local /*0x97E50000-0x00000000*/ private float prevEnergy[8388609], EnergyPre, EnergyPost, EnergyPercentPre, EnergyPercentPost, BroadcastThreshold;

    local /*0x97E50000-0x00000000*/ private int Index;

    EnergyPercentPre = (prevEnergy / MaxEnergy) * float(100);
    EnergyPercentPost = (EnergyRemaining / MaxEnergy) * float(100);
    EnergyPre = float(FCeil(EnergyPercentPre * 0.1000000));
    EnergyPost = float(FCeil(EnergyPercentPost * 0.1000000));
    // End:0x10F
    if(EnergyPre != EnergyPost)
    {
        Index = int(float(8) - (EnergyPost - float(1)));
        // End:0x10F
        if((Index > -1) && Index < 10)
        {
            TriggerEventClass(Class'LPSeqEvent_ExtractionPercent', self, Index);
        }
    }
    // End:0x1CD
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && int(Role) == int(ROLE_Authority))
    {
        BroadcastThreshold = float(Class'LPTuneDataMapInfoMP'.static.GetTEngMostlyDrainedThreshold());
        // End:0x1CD
        if((EnergyPercentPre > BroadcastThreshold) && EnergyPercentPost <= BroadcastThreshold)
        {
            Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(11);
        }
    }
    //return;    
}

function SignalEmpty()
{
    EnergyRemaining = 0.0000000;
    SetEnabled(false);
    TriggerEventClass(Class'LPSeqEvent_ThermalEnergyPocketEmpty', self);
    Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(12);
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x2E
    if(VarName == 'bEnabled')
    {
        SetVisible(bEnabled);        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
    //return;    
}

function PlayShutdownAudio()
{
    // End:0x62
    if((ThermalPocketTuneData != none) && ThermalPocketTuneData.PocketDisabledSoundCue != none)
    {
        PlaySound(ThermalPocketTuneData.PocketDisabledSoundCue);
    }
    //return;    
}

function PlayStartupAudio()
{
    // End:0x62
    if((ThermalPocketTuneData != none) && ThermalPocketTuneData.PocketEnabledSoundCue != none)
    {
        PlaySound(ThermalPocketTuneData.PocketEnabledSoundCue);
    }
    //return;    
}

function PostStateChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Post[8388609];
    local /*0x97E50000-0x00000000*/ private int iTeamPosts[8], A;

    // End:0x1AE
    if(bEnabled)
    {
        // End:0x1AE
        if(Post.IsExtracting())
        {
            A = 0;
            J0x3A:

            // End:0x107 [Loop If]
            if(A < NumThermalPosts)
            {
                // End:0xF9
                if(ThermalPosts[A].IsExtracting() && ThermalPosts[A].MyPlayerController != none)
                {
                    iTeamPosts[int(ThermalPosts[A].MyPlayerController.GetTeamNum())]++;
                }
                ++A;
                // [Loop Continue]
                goto J0x3A;
            }
            A = 0;
            J0x112:

            // End:0x1AE [Loop If]
            if(A < 8)
            {
                // End:0x1A0
                if(iTeamPosts[A] == NumThermalPosts)
                {
                    // End:0x179
                    if(A == 0)
                    {
                        Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(10,, 0);                        
                    }
                    else
                    {
                        Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(10,, 1);
                    }
                    // [Explicit Break]
                    goto J0x1AE;
                }
                ++A;
                // [Loop Continue]
                goto J0x112;
            }
        }
    }
    J0x1AE:

    //return;    
}

simulated function GetNearestPost()
{
    local /*0x97E50000-0x00000000*/ private @NULL Loc[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int A;
    local /*0x97E50000-0x00000000*/ private float NearestDistance, Distance;
    local /*0x97E50000-0x00000000*/ private @NULL NearestPost;

    NearestDistance = 100000000.0000000;
    A = 0;
    J0x1A:

    // End:0xE1 [Loop If]
    if(A < NumThermalPosts)
    {
        // End:0x4D
        if(ThermalPosts[A] == none)
        {            
        }
        else
        {
            Distance = VSize(ThermalPosts[A].Location - Loc);
            // End:0xD3
            if(Distance < NearestDistance)
            {
                NearestDistance = Distance;
                NearestPost = ThermalPosts[A];
            }
        }
        ++A;
        // [Loop Continue]
        goto J0x1A;
    }
    return NearestPost;
    //return ReturnValue;    
}

simulated function IsBeingExtractedFrom()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int A;

    // End:0x11
    if(!bEnabled)
    {
        return false;
    }
    A = 0;
    J0x1C:

    // End:0x8B [Loop If]
    if(A < NumThermalPosts)
    {
        // End:0x4F
        if(ThermalPosts[A] == none)
        {            
        }
        else
        {
            // End:0x7D
            if(ThermalPosts[A].IsExtracting())
            {
                return true;
            }
        }
        ++A;
        // [Loop Continue]
        goto J0x1C;
    }
    return false;
    //return ReturnValue;    
}

simulated event HasOperationalThermalPost()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int A;

    // End:0x11
    if(!bEnabled)
    {
        return false;
    }
    A = 0;
    J0x1C:

    // End:0x8B [Loop If]
    if(A < NumThermalPosts)
    {
        // End:0x4F
        if(ThermalPosts[A] == none)
        {            
        }
        else
        {
            // End:0x7D
            if(ThermalPosts[A].IsDeployed())
            {
                return true;
            }
        }
        ++A;
        // [Loop Continue]
        goto J0x1C;
    }
    return false;
    //return ReturnValue;    
}

function ShouldShowOnMap()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL Objective;
    local /*0x97E50000-0x00000000*/ private bool bPassesQuest;

    Idx = 0;
    J0x0B:

    // End:0x14A [Loop If]
    if(Idx < NumThermalPosts)
    {
        // End:0x13C
        if((ThermalPosts[Idx] != none) && ThermalPosts[Idx].IsDeployed())
        {
            // End:0x13C
            if(ThermalPosts[Idx].CurrentBatteryCapacity > float(0))
            {
                bPassesQuest = true;
                // End:0x12D
                if(ThermalEnergyAvailableQuestObjective != none)
                {
                    Objective = SPQO_Objective(ThermalEnergyAvailableQuestObjective.GetQuestObject());
                    // End:0x12D
                    if((Objective != none) && int(Objective.GetQuestStatus()) != int(3))
                    {
                        bPassesQuest = false;
                    }
                }
                // End:0x13C
                if(bPassesQuest)
                {
                    return true;
                }
            }
        }
        ++Idx;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function ThermalEnergyTransferComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL Objective;

    // End:0x75
    if(ThermalEnergyAvailableQuestObjective != none)
    {
        Objective = SPQO_Objective(ThermalEnergyAvailableQuestObjective.GetQuestObject());
        // End:0x75
        if(Objective != none)
        {
            Objective.AdjustQuestProgress(1.0000000);
        }
    }
    //return;    
}

defaultproperties
{
    bResetEnergyToMax=true
    Radius=300.0000000
    MaxEnergy=1000.0000000
    // Reference: SPDrawCylinderComponent'Default__LPThermalEnergyPocketActor.DrawCylinder0'
    begin object name=DrawCylinder0 class=Class'SPEngine.SPDrawCylinderComponent'
    end object
    DrawCylinder=DrawCylinder0
    Components[0]=DrawCylinder0
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bAlwaysRelevant=true
    bGameRelevant=true
    SupportedEvents=/* Array type was not detected. */
}