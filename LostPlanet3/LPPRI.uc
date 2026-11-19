class LPPRI extends SPPRI
    abstract
    nativereplication
    hidecategories(AnimDependency,Navigation,Movement,Collision);

enum eVictimState
{
    VictimState_Default,            // 0
    VictimState_Incapacitated,      // 1
    VictimState_DeployingPerk,      // 2
    VictimState_CompletingObjective,// 3
    VictimState_GrapplingZiplining, // 4
    VictimState_MAX                 // 5
};

struct native ReplicatedPerkEntry
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PerkIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLocked;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DeployRate;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DeployTime;

    structdefaultproperties
    {
        PerkIndex=-1
        bLocked=false
        DeployRate=1.0000000
        DeployTime=0.0000000
    }
};

struct native ScoreDeathInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Killer;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class DamageType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte VictimState;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHeadshot;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIncapacitated;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFlagCarrier;

    structdefaultproperties
    {
        Killer=none
        DamageType=none
        VictimState=eVictimState.VictimState_Default
        bHeadshot=false
        bIncapacitated=false
        bFlagCarrier=false
    }
};

struct native PlayerKillInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PRI;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeKilled;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumTimesKilled;

    structdefaultproperties
    {
        PRI=none
        LastTimeKilled=0.0000000
        NumTimesKilled=0
    }
};

struct native PlayerReviveInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PRI;

    structdefaultproperties
    {
        PRI=none
    }
};

struct native PlayerDamageInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PRI;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageTotal;

    structdefaultproperties
    {
        PRI=none
        DamageTotal=0.0000000
    }
};

struct native ReplicatedPerkInfo
{
    var(0.25_Pct_2063400959) /*0x97E50000-0x00000000*/ private @NULL Entry[4];

    structdefaultproperties
    {
        Entry[0]=(PerkIndex=-1,bLocked=false,DeployRate=1.0000000,DeployTime=0.0000000)
        Entry[1]=(PerkIndex=-1,bLocked=false,DeployRate=1.0000000,DeployTime=0.0000000)
        Entry[2]=(PerkIndex=-1,bLocked=false,DeployRate=1.0000000,DeployTime=0.0000000)
        Entry[3]=(PerkIndex=-1,bLocked=false,DeployRate=1.0000000,DeployTime=0.0000000)
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUpdatedFromProfile;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPaidBackLastKiller;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTappedOut;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBledOut;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWinchRangeExtension;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastWeaponDischarge[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastInflictedDamage[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel class PawnClass[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPThermalEnergyPostMeshActor MyThermalPost[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int KillCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int HumanKillCount[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NonHumanKillCount[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DeathCount[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DeathNonHumanCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ReviveCount[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DistanceTraveled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel float HealthHarmonized[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int MP_CreditsEarned[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MP_CreditsEarned_Round[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MP_CreditsEarned_PostRound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private PlayerReplicationInfo LastKillerPRI[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LastKillerDamageType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private Pawn LastKillerPawn[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PlayerDamageList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DeathsToBeScored[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PlayersKilledList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PlayersKilledByList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PlayersRevivedList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PerksTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PerksManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel ReplicatedPerkInfo ReplicatedPerks[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class PerksManagerClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LoadoutKitManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MetagameManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StatManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AwardManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AchievementManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEnergyAtDeath;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEnergyAmount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ScrapAmountPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WhiteLeechDNAAmount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel UniqueNetId PartyOwnerUniqueId[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DesiredNevecPawnClassName[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DesiredPiratePawnClassName[2097153];

// Export ULPPRI::execGetEnabledPerk(FFrame&, void* const)
native final simulated function GetEnabledPerk()
{
    local /*0x97E50000-0x00000000*/ private byte Index[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPRI::execModifyStat(FFrame&, void* const)
native final simulated function ModifyStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private int Amount[9437185];
    local /*0x97E50000-0x00000000*/ private byte ModType[9437185];

    1
    0                    
}

// Export ULPPRI::execGetAdjustedCredits(FFrame&, void* const)
native final simulated function GetAdjustedCredits()
{
    local /*0x97E50000-0x00000000*/ private int BaseCredits[8388609], ReturnValue;


}

// Export ULPPRI::execAddMPCreditsEarned(FFrame&, void* const)
native final simulated function AddMPCreditsEarned()
{
    local /*0x97E50000-0x00000000*/ private int InCreditsToAdd[8388609];
    local /*0x97E50000-0x00000000*/ private bool bReplicate[9437185], bShowUI;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    true
    false                    
}

// Export ULPPRI::execInternalAddMPCreditsEarned(FFrame&, void* const)
private native final simulated function InternalAddMPCreditsEarned()
{
    local /*0x97E50000-0x00000000*/ private int InCreditsToAdd[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShowUI[9437185];

    false                
}

// Export ULPPRI::execScoreHit(FFrame&, void* const)
native final function ScoreHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL InstigatorPRI[8388609];
    local /*0x97E50000-0x00000000*/ private int CurrentHealth[8388609], DamageInflicted;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];


}

// Export ULPPRI::execNoteDamageInflictionTime(FFrame&, void* const)
native final simulated function NoteDamageInflictionTime();

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x24
    if(VarName == 'PawnClass')
    {
        CheckForPrestreamingTextures();        
    }
    else
    {
        // End:0xAD
        if(VarName == 'ReplicatedPerks')
        {
            // End:0x91
            if((PerksManager == none) && Owner != none)
            {
                LPPC = LPPlayerController(Owner);
                // End:0x91
                if(LPPC != none)
                {
                    InitPerksManager();
                }
            }
            // End:0xAA
            if(PerksManager != none)
            {
                AssignReplicatedPerks();
            }            
        }
        else
        {
            // End:0xD1
            if(VarName == 'HealthHarmonized')
            {
                UpdateHarmonizedHealth();                
            }
            else
            {
                // End:0xF5
                if(VarName == 'PartyOwnerUniqueId')
                {
                    RegisterPlayerWithParty();                    
                }
                else
                {
                    super.ReplicatedEvent(VarName);
                }
            }
        }
    }
    //return;    
}

function Reset()
{
    super(PlayerReplicationInfo).Reset();
    KillCount = 0;
    HumanKillCount = 0;
    NonHumanKillCount = 0;
    DeathCount = 0;
    DeathNonHumanCount = 0;
    LastKillerPRI = none;
    LastKillerPawn = none;
    MP_CreditsEarned = 0;
    MP_CreditsEarned_Round = 0;
    MP_CreditsEarned_PostRound = 0;
    TimeOfLastWeaponDischarge = 0.0000000;
    TimeOfLastInflictedDamage = 0.0000000;
    HealthHarmonized = 0.0000000;
    MyThermalPost = none;
    bTappedOut = false;
    bBledOut = false;
    ResetDamageList();
    PlayersKilledList.Length = 0;
    PlayersKilledByList.Length = 0;
    PlayersRevivedList.Length = 0;
    PerksManager.Reset();
    StatManager.ResetStatsForPeriod(0);
    //return;    
}

function CopyProperties()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI[8388609], P;

    P = LPPRI(PRI);
    // End:0x650
    if(P != none)
    {
        P.KillCount = KillCount;
        P.HumanKillCount = HumanKillCount;
        P.NonHumanKillCount = NonHumanKillCount;
        P.DeathCount = DeathCount;
        P.DeathNonHumanCount = DeathNonHumanCount;
        P.LastKillerPRI = LastKillerPRI;
        P.LastKillerPawn = LastKillerPawn;
        P.MP_CreditsEarned = MP_CreditsEarned;
        P.MP_CreditsEarned_Round = MP_CreditsEarned_Round;
        P.MP_CreditsEarned_PostRound = MP_CreditsEarned_PostRound;
        P.TimeOfLastWeaponDischarge = TimeOfLastWeaponDischarge;
        P.TimeOfLastInflictedDamage = TimeOfLastInflictedDamage;
        P.HealthHarmonized = HealthHarmonized;
        P.MyThermalPost = MyThermalPost;
        P.bTappedOut = bTappedOut;
        P.DesiredNevecPawnClassName = DesiredNevecPawnClassName;
        P.DesiredPiratePawnClassName = DesiredPiratePawnClassName;
        P.PlayerDamageList = PlayerDamageList;
        P.PlayersKilledList = PlayersKilledList;
        P.PlayersKilledByList = PlayersKilledByList;
        P.PlayersRevivedList = PlayersRevivedList;
        P.AwardManager = AwardManager;
        P.AwardManager.MyPRI = P;
        P.AchievementManager = AchievementManager;
        P.AchievementManager.MyPRI = P;
        P.LoadoutKitManager = LoadoutKitManager;
        P.LoadoutKitManager.MyPRI = P;
        P.MetagameManager = MetagameManager;
        P.MetagameManager.MyPRI = P;
        P.StatManager = StatManager;
        P.StatManager.MyPRI = P;
        // End:0x5B2
        if(P.PerksManager == none)
        {
            P.InitPerksManager(false);
        }
        // End:0x650
        if(P.PerksManager != none)
        {
            P.PerksManager.CopyProperties(PerksManager);
            P.PerksManager.MyPRI = P;
        }
    }
    super.CopyProperties(PRI);
    //return;    
}

simulated function SetThermalPost()
{
    local /*0x97E50000-0x00000000*/ private @NULL Post[8388609];

    MyThermalPost = Post;
    //return;    
}

simulated function ClientInitialize()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609], LPPC;

    super(PlayerReplicationInfo).ClientInitialize(C);
    // End:0x72
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        Class'LPMultiplayerManager'.static.GetInstance().ConnectionErrorCount = 0;
    }
    LPPC = LPPlayerController(C);
    // End:0xF2
    if(LPPC != none)
    {
        InitPerksManager();
        // End:0xE8
        if(PerksManager != none)
        {
            PerksManager.SetController(LPPlayerController(C));
        }
        UpdateFromProfile();
    }
    //return;    
}

simulated function UpdateFromProfile()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPS, LPPC;

    // End:0x31
    if((bUpdatedFromProfile && AchievementManager != none) && PerksManager != none)
    {
        return;
    }
    LPPC = LPPlayerController(Owner);
    // End:0xFB
    if(LPPC != none)
    {
        LPPS = LPProfileSettings(LPPC.ProfileSettings);
        // End:0xF8
        if((LPPS != none) && LPPC.bProfileHasBeenLoaded)
        {
            SetMPCreditsEarned(LPPS.GetCredits());
            bUpdatedFromProfile = true;            
        }        
    }
    //return;    
}

final simulated function SetPawnClass()
{
    local /*0x97E50000-0x00000000*/ private class NewPawnClass[8388609];

    // End:0x34
    if(PawnClass != NewPawnClass)
    {
        PawnClass = NewPawnClass;
        CheckForPrestreamingTextures();
    }
    //return;    
}

final simulated function ClearPawnClass()
{
    PawnClass = none;
    //return;    
}

final simulated function CheckForPrestreamingTextures()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    // End:0x9B
    if(PawnClass != none)
    {
        PRI = FindLocalPRI();
        // End:0x9B
        if((PRI == none) || PRI.Team == Team)
        {
            PawnClass.default.Mesh.PrestreamTextures(25.0000000, true);
        }
    }
    //return;    
}

final simulated function FindLocalPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], GRI, PRI;

    GRI = WorldInfo.GRI;
    // End:0xB7
    if(GRI != none)
    {
        // End:0xB6
        foreach GRI.PRIArray(PRI)
        {
            // End:0xB5
            if((LPPRI(PRI) != none) && PRI.Owner != none)
            {                
                return LPPRI(PRI);
            }            
        }        
    }
    return none;
    //return ReturnValue;    
}

simulated function IsLocalPRI()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Owner);
    // End:0x51
    if((LPPC != none) && LPPC.IsLocalPlayerController())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function LogAll()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string logString[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAddPrefix[9437185];

    true
    //return;    
}

reliable server function ServerLog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string logString[8388609];

    LogAll(logString, false);
    //return;    
}

reliable client simulated function MultiCastLog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string logString[8388609];

    //return;    
}

simulated function InitPerksManager()
{
    local /*0x97E50000-0x00000000*/ private bool bUpdateReplicatedPerks[9437185];

    true
    // End:0x2C
    if(PerksManager == none)
    {
        PerksManager = new (self) PerksManagerClass;
    }
    // End:0x98
    if((PerksManager != none) && !PerksManager.bInitialized)
    {
        PerksManager.InitPerksManager();
        // End:0x98
        if(bUpdateReplicatedPerks)
        {
            UpdateReplicatedPerks(false);
        }
    }
    //return;    
}

simulated function UpdateReplicatedPerks()
{
    local /*0x97E50000-0x00000000*/ private bool bServerRep[9437185];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL PerkInfo;

    true
    // End:0x2C1
    if(PerksManager != none)
    {
        I = 0;
        J0x1F:

        // End:0x2C1 [Loop If]
        if(I < 4)
        {
            // End:0x1FD
            if(PerksManager.AssignedPerk[I].Perk != none)
            {
                PerkInfo.Entry[I].PerkIndex = int(PerksManager.AssignedPerk[I].Perk.PerkIndex);
                PerkInfo.Entry[I].DeployRate = GetPerkDeployRate(byte(PerkInfo.Entry[I].PerkIndex));
                PerkInfo.Entry[I].DeployTime = GetPerkDeployTime(byte(PerkInfo.Entry[I].PerkIndex));                
            }
            else
            {
                PerkInfo.Entry[I].PerkIndex = -1;
            }
            PerkInfo.Entry[I].bLocked = PerksManager.AssignedPerk[I].bLocked;
            I++;
            // [Loop Continue]
            goto J0x1F;
        }
    }
    // End:0x2EB
    if(int(Role) == int(ROLE_Authority))
    {
        ReplicatedPerks = PerkInfo;        
    }
    else
    {
        // End:0x30B
        if(bServerRep)
        {
            ServerUpdateReplicatedPerks(PerkInfo);
        }
    }
    //return;    
}

reliable server function ServerUpdateReplicatedPerks()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewReplicatedPerks[8388609];

    ReplicatedPerks = NewReplicatedPerks;
    AssignReplicatedPerks();
    //return;    
}

simulated function AssignReplicatedPerks()
{
    local /*0x97E50000-0x00000000*/ private int I, PerkIndex;
    local /*0x97E50000-0x00000000*/ private name PerkName;

    // End:0x173
    if(PerksManager != none)
    {
        I = 0;
        J0x1A:

        // End:0x173 [Loop If]
        if(I < 4)
        {
            PerkIndex = ReplicatedPerks.Entry[I].PerkIndex;
            PerkName = ((PerkIndex >= 0) ? PerksManager.PerkList[PerkIndex].PerkName : 'None');
            PerksManager.AssignPerk(I, PerkName, true, false);
            PerksManager.SetPerkSlotStatus(I, ReplicatedPerks.Entry[I].bLocked, true, false);
            I++;
            // [Loop Continue]
            goto J0x1A;
        }
    }
    //return;    
}

simulated function GetPerkDeployRate()
{
    local /*0x97E50000-0x00000000*/ private byte PerkIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Pt, PD, LPPC;
    local /*0x97E50000-0x00000000*/ private float DeployRate;

    DeployRate = 1.0000000;
    PD = LPPerkDeployable(PerksManager.QueryPerkInstance(PerkIndex));
    LPPC = LPPlayerController(Owner);
    // End:0x19B
    if(PD != none)
    {
        DeployRate *= (1.0000000 + (LPTuneDataPerkBeaconBase(PD.GetTuneData()).DeploymentRateIncrease.GetValue(LPPC) / float(100)));
        Pt = LPPerkTechnician(PerksManager.QueryPerkClass(18));
        // End:0x198
        if(Pt != none)
        {
            DeployRate *= (1.0000000 + (Pt.TechnicianTuneData.DeploymentTimeDecrease.GetValue(LPPC) / float(100)));
        }        
    }
    else
    {
        Pt = LPPerkTechnician(PerksManager.QueryPerkClass(PerkIndex));
        // End:0x250
        if(Pt != none)
        {
            DeployRate *= (1.0000000 + (Pt.TechnicianTuneData.DeploymentTimeDecrease.GetValue(LPPC) / float(100)));
        }
    }
    return DeployRate;
    //return ReturnValue;    
}

simulated function GetReplicatedPerkDeployRate()
{
    local /*0x97E50000-0x00000000*/ private byte PerkIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xAC [Loop If]
    if(I < 4)
    {
        // End:0x9E
        if(ReplicatedPerks.Entry[I].PerkIndex == int(PerkIndex))
        {
            return ReplicatedPerks.Entry[I].DeployRate;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return 1.0000000;
    //return ReturnValue;    
}

simulated function GetPerkDeployTime()
{
    local /*0x97E50000-0x00000000*/ private byte PerkIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Pt, PD;
    local /*0x97E50000-0x00000000*/ private float DeployTime;

    DeployTime = 0.0000000;
    PD = LPPerkDeployable(PerksManager.QueryPerkInstance(PerkIndex));
    // End:0x139
    if(PD != none)
    {
        DeployTime = PD.GetDeploymentTime();
        Pt = LPPerkTechnician(PerksManager.QueryPerkClass(18));
        // End:0x139
        if(Pt != none)
        {
            DeployTime *= (1.0000000 - (Pt.TechnicianTuneData.DeploymentTimeDecrease.GetValue(LPPlayerController(Owner)) / float(100)));
        }
    }
    return DeployTime;
    //return ReturnValue;    
}

simulated function GetReplicatedPerkDeployTime()
{
    local /*0x97E50000-0x00000000*/ private byte PerkIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xAC [Loop If]
    if(I < 4)
    {
        // End:0x9E
        if(ReplicatedPerks.Entry[I].PerkIndex == int(PerkIndex))
        {
            return ReplicatedPerks.Entry[I].DeployTime;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return 1.0000000;
    //return ReturnValue;    
}

simulated function LogReplicatedPerkInfo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string logString, PerkName;
    local /*0x97E50000-0x00000000*/ private int PerkIndex, I;

    I = 0;
    J0x0B:

    // End:0x1C8 [Loop If]
    if(I < 4)
    {
        PerkIndex = ReplicatedPerks.Entry[I].PerkIndex;
        PerkName = ((PerkIndex >= 0) ? string(PerksManager.PerkList[PerkIndex].PerkName) : "None");
        logString = (((((((("PlayerID: " $ string(PlayerID)) $ " Perk: [") $ string(PerkIndex)) $ "]") $ PerkName) $ " DeployRate: ") $ string(ReplicatedPerks.Entry[I].DeployRate)) $ " DeployTime: ") $ string(ReplicatedPerks.Entry[I].DeployTime);
        LogAll(logString);
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function IncrementStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];

    ModifyStat(StatName);
    //return;    
}

function ServerIncrementStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Owner);
    // End:0x53
    if(LPPC != none)
    {
        LPPC.ServerIncrementStat(StatName);
    }
    //return;    
}

function ServerModifyStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private int Amount[9437185];
    local /*0x97E50000-0x00000000*/ private byte ModType[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    1
    0
    LPPC = LPPlayerController(Owner);
    // End:0x70
    if(LPPC != none)
    {
        LPPC.ServerModifyStat(StatName, Amount, ModType);
    }
    //return;    
}

simulated function EvalStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private byte PeriodToEval[9437185];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    2
    LPPC = LPPlayerController(Owner);
    // End:0x63
    if(LPPC != none)
    {
        return LPPC.EvalStat(StatName, PeriodToEval);
    }
    return -1;
    //return ReturnValue;    
}

reliable client simulated event ClientAddMPCreditsEarned()
{
    local /*0x97E50000-0x00000000*/ private int InCreditsToAdd[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShowUI[9437185];

    false
    InternalAddMPCreditsEarned(InCreditsToAdd, bShowUI);
    //return;    
}

reliable server event ServerAddMPCreditsEarned()
{
    local /*0x97E50000-0x00000000*/ private int InCreditsToAdd[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShowUI[9437185];

    false
    InternalAddMPCreditsEarned(InCreditsToAdd, bShowUI);
    //return;    
}

simulated function GetMPCreditsEarned()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return MP_CreditsEarned;
    //return ReturnValue;    
}

simulated function GetMPCreditsEarnedInRound()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return MP_CreditsEarned_Round;
    //return ReturnValue;    
}

simulated function GetMPCreditsEarnedInRoundTotal()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return MP_CreditsEarned_Round + MP_CreditsEarned_PostRound;
    //return ReturnValue;    
}

simulated function SetMPCreditsEarned()
{
    local /*0x97E50000-0x00000000*/ private int InCreditsEarned[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    InternalSetMPCreditsEarned(InCreditsEarned);
    // End:0xCE
    if((int(WorldInfo.NetMode) == int(NM_ListenServer)) || int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        LPPC = LPPlayerController(Owner);
        // End:0xCB
        if((LPPC != none) && !LPPC.IsLocalPlayerController())
        {
            ClientSetMPCreditsEarned(InCreditsEarned);
        }        
    }
    else
    {
        // End:0x10A
        if(int(WorldInfo.NetMode) == int(NM_Client))
        {
            ServerSetMPCreditsEarned(InCreditsEarned);
        }
    }
    //return;    
}

reliable client simulated function ClientSetMPCreditsEarned()
{
    local /*0x97E50000-0x00000000*/ private int InCreditsEarned[8388609];

    InternalSetMPCreditsEarned(InCreditsEarned);
    //return;    
}

reliable server function ServerSetMPCreditsEarned()
{
    local /*0x97E50000-0x00000000*/ private int InCreditsEarned[8388609];

    InternalSetMPCreditsEarned(InCreditsEarned);
    //return;    
}

private final simulated function InternalSetMPCreditsEarned()
{
    local /*0x97E50000-0x00000000*/ private int InCreditsEarned[8388609];

    MP_CreditsEarned = InCreditsEarned;
    ModifyStat('Stat_CreditsCurrent', InCreditsEarned, 1);
    //return;    
}

simulated function GiveAward()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];

    AwardManager.GiveAward(AwardName);
    //return;    
}

function ServerGiveAward()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];

    AwardManager.ServerGiveAward(AwardName);
    //return;    
}

simulated function GetAwardRequiredCount()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return AwardManager.GetAwardRequiredCount(AwardName);
    //return ReturnValue;    
}

simulated function GetAwardParam()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return AwardManager.GetAwardParam(AwardName);
    //return ReturnValue;    
}

simulated function FinalizeRoundStats()
{
    ProcessDeathScores();
    ClearTimer('ProcessDeathScores');
    UpdateLongestLifespan();
    UpdatePopularityContest();
    //return;    
}

simulated function GetTotalPlayTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

function ResetDamageList()
{
    PlayerDamageList.Length = 0;
    //return;    
}

function HandleAkridKillStats()
{
    local /*0x97E50000-0x00000000*/ private @NULL Victim[8388609], TurretController, TurretPlayerPRI;

    TurretController = LPAIControllerTurret(Owner);
    // End:0x96
    if(TurretController != none)
    {
        TurretPlayerPRI = LPPRI(TurretController.GetAssociatedPlayerPRI());
        // End:0x94
        if(TurretPlayerPRI != none)
        {
            TurretPlayerPRI.HandleAkridKillStats(Victim);
        }
        return;
    }
    NonHumanKillCount++;
    ServerIncrementStat('Stat_KillsAkrid');
    // End:0x10F
    if(int(StatManager.GetGameType()) == int(4))
    {
        ServerIncrementStat(StatManager.GetCurrentGameTypeStatName("Kills"));
    }
    // End:0x13A
    if(LPAIControllerStalker(Victim) != none)
    {
        IncrementStat('Stat_StopStalkingMe');
    }
    //return;    
}

function HandleAkridDeathStats()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillerPRI[8388609];

    ResetDamageList();
    //return;    
}

simulated function HandleKillStats()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private int VictimState[8388609];
    local /*0x97E50000-0x00000000*/ private bool bKilledWithHeadshot[8388609], bKilledFlagCarrier, bKilledTeammate, bAvengedTeammate;
    local /*0x97E50000-0x00000000*/ private @NULL KillerLPPC, KillerPawn;
    local /*0x97E50000-0x00000000*/ private float ChatterProbability;
    local /*0x97E50000-0x00000000*/ private int KillStreak, DeathStreak;

    // End:0x22
    if(bKilledTeammate)
    {
        IncrementStat('Stat_KillsTeam');
        return;
    }
    switch(VictimState)
    {
        // End:0x4E
        case 1:
            IncrementStat('Stat_KillsIncapped');
            return;
        // End:0x69
        case 2:
            IncrementStat('Stat_KillsDeployingPerk');
            // End:0xA2
            break;
        // End:0x84
        case 4:
            IncrementStat('Stat_KillsOnAWire');
            // End:0xA2
            break;
        // End:0x9F
        case 3:
            GiveAward('Emblem_Buzzkiller');
            // End:0xA2
            break;
        // End:0xFFFF
        default:
            break;
    }
    KillCount++;
    HumanKillCount++;
    IncrementStat('Stat_Kills');
    IncrementStat('Stat_KillsHuman');
    IncrementStat('Stat_KillStreak');
    IncrementStat(StatManager.GetCurrentGameTypeStatName("Kills"));
    KillerLPPC = LPPlayerController(Owner);
    // End:0x24B
    if(int(Role) == int(ROLE_Authority))
    {
        KillStreak = EvalStat('Stat_KillStreak', 0);
        // End:0x24B
        if(KillStreak > 1)
        {
            ChatterProbability = LPPlayerPawn(KillerLPPC.Pawn).TuneDataChatter.ChatterEventData.KillStreakBaseProbability;
            ChatterProbability = FMin(float(KillStreak - 1) * ChatterProbability, 1.0000000);
            // End:0x24B
            if(FRand() <= ChatterProbability)
            {
                KillerLPPC.BroadcastChatter(22);
            }
        }
    }
    // End:0x2A2
    if(bKilledWithHeadshot)
    {
        IncrementStat('Stat_KillsHeadshot');
        // End:0x2A2
        if(!KillerLPPC.IsAimingDownSight())
        {
            IncrementStat('Stat_KillsHeadshotFromHip');
        }
    }
    // End:0x2C2
    if(bKilledFlagCarrier)
    {
        IncrementStat('Stat_KillsFlagCarrier');
    }
    // End:0x2E2
    if(bAvengedTeammate)
    {
        GiveAward('Emblem_Avenger');
    }
    // End:0x30D
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeTurretChaingun'))
    {
        IncrementStat('Stat_KillsTurret');
    }
    // End:0x338
    if(ClassIsChildOf(DamageType, Class'LPDamageTypePlayerTurret'))
    {
        IncrementStat('Stat_KillsPlayerTurret');
    }
    // End:0x37D
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeRocket') || ClassIsChildOf(DamageType, Class'LPDamageTypeBombExplosion'))
    {
        IncrementStat('Stat_KillsSplash');
    }
    // End:0x3BE
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeProximityMine'))
    {
        IncrementStat('Stat_KillsMine');
        IncrementStat('Stat_KillsSplash');        
    }
    else
    {
        // End:0x47E
        if(((((ClassIsChildOf(DamageType, Class'LPDamageTypeFragGrenade') || ClassIsChildOf(DamageType, Class'LPDamageTypeEMPGrenade')) || ClassIsChildOf(DamageType, Class'LPDamageTypeGrenadeDisc')) || ClassIsChildOf(DamageType, Class'LPDamageTypeGrenadeDiscExplosion')) || ClassIsChildOf(DamageType, Class'LPDamageTypeAAGrenade')) || ClassIsChildOf(DamageType, Class'LPDamageTypeGrenadeActual'))
        {
            IncrementStat('Stat_KillsGrenade');
            IncrementStat('Stat_KillsSplash');
        }
    }
    // End:0x4C3
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeEMPGrenade') || ClassIsChildOf(DamageType, Class'LPDamageTypeHalberdEMP'))
    {
        IncrementStat('Stat_KillsEMP');
    }
    // End:0x4EE
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeGrenadeSticky'))
    {
        IncrementStat('Stat_KillsSticky');
    }
    // End:0x519
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeToxicCloud'))
    {
        IncrementStat('Stat_KillsToxicCloud');
    }
    // End:0x55E
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeARIncendiary') || ClassIsChildOf(DamageType, Class'LPDamageTypeARIncendiaryDOT'))
    {
        IncrementStat('Stat_KillsIncendiary');
    }
    // End:0x589
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeVSBump'))
    {
        IncrementStat('Stat_KillsRoadkill');
    }
    // End:0x5B4
    if(ClassIsChildOf(DamageType, Class'LPDamageTypePlayerMeleeVisceralTakedown'))
    {
        IncrementStat('Stat_KillsTakedown');
    }
    // End:0x5DF
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeMelee'))
    {
        IncrementStat('Stat_KillsMelee');
    }
    KillerPawn = LPPlayerPawn(KillerLPPC.Pawn);
    // End:0x6E6
    if(KillerPawn != none)
    {
        // End:0x6AE
        if(int(KillerPawn.CoverType) != int(0))
        {
            IncrementStat('Stat_KillsFromCover');
            // End:0x6AE
            if(KillerPawn.IsBlindFiring(KillerPawn.CoverAction))
            {
                IncrementStat('Stat_KillsBlindfire');
            }
        }
        // End:0x6E6
        if(KillerPawn.CourierItems.Length > 0)
        {
            GiveAward('Emblem_Daredevil');
        }
    }
    // End:0x79C
    if((KillerLPPC.Pawn == none) || !KillerLPPC.Pawn.IsAliveAndWell())
    {
        // End:0x79C
        if((WorldInfo.TimeSeconds - (GetLastTimeKilled())) <= (GetAwardParam('Emblem_BeyondTheGrave')))
        {
            GiveAward('Emblem_BeyondTheGrave');
        }
    }
    DeathStreak = EvalStat('Stat_DeathStreak', 0);
    // End:0x7F6
    if(float(DeathStreak) == ((GetAwardRequiredCount('Emblem_Shameful')) - float(1)))
    {
        GiveAward('Emblem_AvertedShame');
    }
    // End:0x82C
    if(float(DeathStreak) >= (GetAwardRequiredCount('Emblem_Rebound')))
    {
        GiveAward('Emblem_Rebound');
    }
    ModifyStat('Stat_DeathStreak', 0, 1);
    //return;    
}

simulated function HandleDeathStats()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bKilledSelf[8388609], bKilledByHuman, bKilledByTeammate;

    Deaths++;
    DeathCount++;
    IncrementStat('Stat_Deaths');
    IncrementStat('Stat_DeathStreak');
    IncrementStat(StatManager.GetCurrentGameTypeStatName("Deaths"));
    ModifyStat('Stat_KillStreak', 0, 1);
    // End:0xA6
    if(bKilledSelf)
    {
        IncrementStat('Stat_DeathsSuicide');        
    }
    else
    {
        // End:0xC9
        if(bKilledByHuman)
        {
            IncrementStat('Stat_DeathsHuman');            
        }
        else
        {
            IncrementStat('Stat_DeathsAkrid');
            DeathNonHumanCount++;
        }
        // End:0x107
        if(bKilledByTeammate)
        {
            IncrementStat('Stat_DeathsTeam');
        }
    }
    // End:0x132
    if(ClassIsChildOf(DamageType, Class'Engine.DmgType_Fell'))
    {
        IncrementStat('Stat_DeathsFell');
    }
    //return;    
}

function ScoreDeath()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SDI, VictimLPP, VictimLPPC;

    // End:0x41
    if(bTappedOut)
    {
        // End:0x41
        if(CheckForNearbyPlayers(GetAwardParam('Emblem_Faithless'), true))
        {
            ServerIncrementStat('Stat_Faithless');
        }
    }
    // End:0x5F
    if(bBledOut || bTappedOut)
    {
        return;
    }
    // End:0x2BB
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && int(Role) == int(ROLE_Authority))
    {
        SDI.Killer = Killer;
        SDI.DamageType = DamageType;
        VictimLPPC = LPPlayerController(Owner);
        VictimLPP = LPPlayerPawn(VictimLPPC.Pawn);
        VictimLPP = ((VictimLPP == none) ? LPPlayerPawn(VictimLPPC.HumanPlayerPawn) : VictimLPP);
        // End:0x292
        if(VictimLPP != none)
        {
            SDI.bIncapacitated = VictimLPP.bIncapacitated;
            SDI.bHeadshot = float(VictimLPP.HeadshotDeathDamage) >= (GetAwardParam('Emblem_Headshot'));
            SDI.bFlagCarrier = VictimLPP.CourierItems.Length > 0;
            SDI.VictimState = GetVictimState();
            UpdateLongestLifespan();
        }
        DeathsToBeScored.AddItem(SDI);        
        SetTimer(0.0300000, false, 'ProcessDeathScores');
    }
    //return;    
}

function ProcessDeathScores()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillerPRI, TaggerPRI, TurretController, KillerLPPC, VictimLPPC, AssistLPPC;

    local /*0x97E50000-0x00000000*/ private byte VictimState;
    local /*0x97E50000-0x00000000*/ private @NULL SS, SDI;
    local /*0x97E50000-0x00000000*/ private class DamageType;
    local /*0x97E50000-0x00000000*/ private @NULL Killer;
    local /*0x97E50000-0x00000000*/ private bool bKilledIncapacitated, bKilledWithHeadshot, bKilledTeammate, bKilledFlagCarrier, bAvengedTeammate, bKilledSelf,
	    bKilledByHuman, bKilledByTeammate;

    local /*0x97E50000-0x00000000*/ private float LastKillTime;
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0xA92
    foreach DeathsToBeScored(SDI)
    {
        DamageType = SDI.DamageType;
        Killer = SDI.Killer;
        KillerLPPC = LPPlayerController(Killer);
        VictimLPPC = LPPlayerController(Owner);
        // End:0xDE
        if(KillerLPPC != none)
        {
            KillerPRI = LPPRI(Killer.PlayerReplicationInfo);            
        }
        else
        {
            TurretController = LPAIControllerTurret(Killer);
            // End:0x16C
            if(TurretController != none)
            {
                KillerPRI = LPPRI(TurretController.GetAssociatedPlayerPRI());
                KillerLPPC = LPPlayerController(KillerPRI.Owner);
            }
        }
        bKilledIncapacitated = SDI.bIncapacitated;
        bKilledWithHeadshot = SDI.bHeadshot;
        bKilledFlagCarrier = SDI.bFlagCarrier;
        LastKillTime = GetLastKillTime(none, true);
        bAvengedTeammate = (LastKillTime > float(0)) && (WorldInfo.TimeSeconds - LastKillTime) <= (GetAwardParam('Emblem_Avenger'));
        // End:0x4DC
        if(Killer != Owner)
        {
            bKilledTeammate = int(Killer.GetTeamNum()) == int(VictimLPPC.GetTeamNum());
            // End:0x4DC
            if(KillerLPPC != none)
            {
                // End:0x313
                if(bKilledWithHeadshot && !bKilledIncapacitated)
                {
                    KillerLPPC.BroadcastChatter(9, VictimLPPC);
                }
                // End:0x422
                if(KillerPRI != none)
                {
                    VictimState = SDI.VictimState;
                    KillerPRI.HandleKillStats(DamageType, int(VictimState), bKilledWithHeadshot, bKilledFlagCarrier, bKilledTeammate, bAvengedTeammate);
                    // End:0x422
                    if(!KillerLPPC.IsLocalPlayerController())
                    {
                        KillerLPPC.ClientHandleKillStats(DamageType, int(VictimState), bKilledWithHeadshot, bKilledFlagCarrier, bKilledTeammate, bAvengedTeammate);
                    }
                }
                // End:0x4DC
                if(!bKilledTeammate && !LPGameMP_Base(WorldInfo.Game).bFirstBloodDrawn)
                {
                    LPGameMP_Base(WorldInfo.Game).bFirstBloodDrawn = true;
                    KillerLPPC.ServerGiveAward('Emblem_FirstBlood');
                }
            }
        }
        // End:0x4ED
        if(bKilledIncapacitated)
        {
            continue;            
        }
        else
        {
            // End:0x6AE
            if(KillerPRI != none)
            {
                // End:0x541
                if(ClassIsChildOf(DamageType, Class'LPDamageTypeProximityMine'))
                {
                    KillerLPPC.BroadcastChatter(16, VictimLPPC);                    
                }
                else
                {
                    // End:0x5A0
                    if(ClassIsChildOf(DamageType, Class'LPDamageTypeFragGrenade') || ClassIsChildOf(DamageType, Class'LPDamageTypeGrenadeActual'))
                    {
                        KillerLPPC.BroadcastChatter(6, VictimLPPC);                        
                    }
                    else
                    {
                        // End:0x5E2
                        if(ClassIsChildOf(DamageType, Class'LPDamageTypeMelee'))
                        {
                            KillerLPPC.BroadcastChatter(14, VictimLPPC);
                        }
                    }
                }
                SS = LPPerkSixthSense(KillerPRI.PerksManager.QueryPerkInstance(11));
                TaggerPRI = LPPRI(SS.GetTagger(self));
                // End:0x6AE
                if((TaggerPRI != none) && TaggerPRI != KillerPRI)
                {
                    TaggerPRI.ServerIncrementStat('Stat_6thSenseSpotted');
                }
            }
            bKilledSelf = false;
            bKilledByHuman = false;
            bKilledByTeammate = false;
            // End:0x709
            if((Killer == none) || Killer == Owner)
            {
                bKilledSelf = true;                
            }
            else
            {
                bKilledByHuman = KillerLPPC != none;
                // End:0x77C
                if(bKilledByHuman)
                {
                    bKilledByTeammate = int(Killer.GetTeamNum()) == int(Owner.GetTeamNum());
                }
            }
            HandleDeathStats(DamageType, bKilledSelf, bKilledByHuman, bKilledByTeammate);
            // End:0x828
            if((VictimLPPC != none) && !VictimLPPC.IsLocalPlayerController())
            {
                VictimLPPC.ClientHandleDeathStats(DamageType, bKilledSelf, bKilledByHuman, bKilledByTeammate);
            }
            Idx = 0;
            J0x833:

            // End:0xA26 [Loop If]
            if(Idx < PlayerDamageList.Length)
            {
                // End:0xA18
                if((PlayerDamageList[Idx].PRI != none) && PlayerDamageList[Idx].PRI != KillerPRI)
                {
                    // End:0xA18
                    if(!WorldInfo.GRI.OnSameTeam(PlayerDamageList[Idx].PRI, self))
                    {
                        AssistLPPC = LPPlayerController(PlayerDamageList[Idx].PRI.Owner);
                        // End:0xA18
                        if((AssistLPPC != none) && PlayerDamageList[Idx].DamageTotal > float(0))
                        {
                            // End:0xA18
                            if(PlayerDamageList[Idx].PRI != KillerPRI)
                            {
                                AssistLPPC.BroadcastChatter(2);
                                AssistLPPC.ServerIncrementStat('Stat_Assists');
                            }
                        }
                    }
                }
                Idx++;
                // [Loop Continue]
                goto J0x833;
            }
            ResetDamageList();
            LPGameMP_Base(WorldInfo.Game).BroadcastKillMessage(Killer, Controller(Owner), DamageType);            
        }
    }    
    DeathsToBeScored.Length = 0;
    //return;    
}

simulated function UpdateLongestLifespan()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    LPP = LPPlayerPawn(Controller(Owner).Pawn);
    // End:0xB7
    if(LPP != none)
    {
        ModifyStat('Stat_LongestLifespan', int(FMax(float(EvalStat('Stat_LongestLifespan', 1)), WorldInfo.TimeSeconds - LPP.SpawnTime)), 1);
    }
    //return;    
}

simulated function UpdatePopularityContest()
{
    local /*0x97E50000-0x00000000*/ private int NemesisCount, NemesisReq, Idx;

    NemesisReq = int(GetAwardRequiredCount('Emblem_Nemesis'));
    NemesisCount = 0;
    Idx = 0;
    J0x35:

    // End:0x9A [Loop If]
    if(Idx < PlayersKilledByList.Length)
    {
        // End:0x8C
        if(PlayersKilledByList[Idx].NumTimesKilled >= NemesisReq)
        {
            NemesisCount++;
        }
        Idx++;
        // [Loop Continue]
        goto J0x35;
    }
    ModifyStat('Stat_PopularityContest', NemesisCount);
    //return;    
}

simulated function NotifyKill()
{
    local /*0x97E50000-0x00000000*/ private @NULL VictimPRI[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, PKI;
    local /*0x97E50000-0x00000000*/ private int NumTimesKilled, Idx;

    Idx = PlayersKilledList.Find('PRI', VictimPRI);    
    // End:0xD8
    if(Idx >= 0)
    {
        PlayersKilledList[Idx].LastTimeKilled = WorldInfo.TimeSeconds;
        PlayersKilledList[Idx].NumTimesKilled++;
        NumTimesKilled = PlayersKilledList[Idx].NumTimesKilled;        
    }
    else
    {
        PKI.PRI = VictimPRI;
        PKI.LastTimeKilled = WorldInfo.TimeSeconds;
        PKI.NumTimesKilled = 1;
        NumTimesKilled = 1;
        PlayersKilledList.AddItem(PKI);        
    }
    // End:0x1AC
    if(int(GetTeamNum()) == int(VictimPRI.GetTeamNum()))
    {
        return;
    }
    // End:0x1E2
    if(float(NumTimesKilled) == (GetAwardRequiredCount('Emblem_Nemesis')))
    {
        GiveAward('Emblem_Nemesis');
    }
    Idx = PlayersKilledByList.Find('PRI', VictimPRI);    
    // End:0x26D
    if(Idx >= 0)
    {
        // End:0x26D
        if(float(PlayersKilledByList[Idx].NumTimesKilled) >= (GetAwardRequiredCount('Emblem_Nemesis')))
        {
            GiveAward('Emblem_ViolentCycle');
        }
    }
    LPPC = LPPlayerController(Owner);
    // End:0x33F
    if((LPPC != none) && LPPC.Pawn != none)
    {
        // End:0x33F
        if(LPSnowcatInterpTransport(LPPC.Pawn.Base) != none)
        {
            LPPC.GetAchievementManager().SetAchievementValue('Riding_Shotgun', 1);
        }
    }
    CheckForEntireTeamKill(NumTimesKilled);
    // End:0x38C
    if(!IsTimerActive('CheckForMultiKill'))
    {
        SetTimer(GetAwardParam('Emblem_MiseryLovesCompany'), false, 'CheckForMultiKill');
    }
    // End:0x45A
    if(((!bPaidBackLastKiller && LastKillerPRI != none) && LastKillerPRI != self) && LastKillerPRI == VictimPRI)
    {
        IncrementStat('Stat_KillsPayback');
        bPaidBackLastKiller = true;
        // End:0x45A
        if(int(Role) == int(ROLE_Authority))
        {
            LPPlayerController(Owner).BroadcastChatter(19, LPPlayerController(VictimPRI.Owner));
        }
    }
    //return;    
}

simulated function NotifyKilledBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillerPRI[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PKI;
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = PlayersKilledByList.Find('PRI', KillerPRI);    
    // End:0xA8
    if(Idx >= 0)
    {
        PlayersKilledByList[Idx].LastTimeKilled = WorldInfo.TimeSeconds;
        PlayersKilledByList[Idx].NumTimesKilled++;        
    }
    else
    {
        PKI.PRI = KillerPRI;
        PKI.LastTimeKilled = WorldInfo.TimeSeconds;
        PKI.NumTimesKilled = 1;
        PlayersKilledByList.AddItem(PKI);        
    }
    //return;    
}

simulated function NotifyRevive()
{
    local /*0x97E50000-0x00000000*/ private @NULL RevivedPRI[8388609], LPC, PerkRevive, RevInfo, PRI;

    local /*0x97E50000-0x00000000*/ private int ReviveHealthRestored, Idx;

    ServerIncrementStat('Stat_Revives');
    PerkRevive = LPPerkRevival(PerksManager.QueryPerkInstance(Class'LPPerkRevival'.default.PerkIndex));
    // End:0x140
    if(PerkRevive != none)
    {
        LPC = LPPlayerController(Owner);
        ReviveHealthRestored = int(PerkRevive.GetRecoveryParams().HealthRestoredValueOnCompletion.GetValue(LPC) * float(LPC.Pawn.HealthMax));
        ModifyStat('Stat_HealthRestored', ReviveHealthRestored);
    }
    Idx = PlayersRevivedList.Find('PRI', RevivedPRI);    
    // End:0x2A9
    if(Idx < 0)
    {
        RevInfo.PRI = RevivedPRI;
        PlayersRevivedList.AddItem(RevInfo);        
        // End:0x292
        foreach WorldInfo.Game.GameReplicationInfo.PRIArray(PRI)
        {
            // End:0x291
            if((int(PRI.GetTeamNum()) == int(GetTeamNum())) && PRI != self)
            {
                Idx = PlayersRevivedList.Find('PRI', LPPRI(PRI));                
                // End:0x291
                if(Idx < 0)
                {                    
                    return;
                }
            }            
        }        
        ServerGiveAward('Emblem_Messiah');        
    }
    //return;    
}

simulated function GetVictimState()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Victim, VictimPawn;
    local /*0x97E50000-0x00000000*/ private name VictimStateName;
    local /*0x97E50000-0x00000000*/ private @NULL SCO;

    Victim = LPPlayerController(Owner);
    // End:0x1F3
    if(Victim != none)
    {
        VictimStateName = Victim.GetStateName();
        switch(VictimStateName)
        {
            // End:0x6F
            case 'Incapacitated':
                return 1;
            // End:0x7E
            case 'DeployManualPerk':
                return 2;
            // End:0x8A
            case 'PlayerGrappling':
            // End:0x96
            case 'PlayerGrapplingDown':
            // End:0xA2
            case 'PlayerFallGrappelRecovery':
            // End:0xAE
            case 'PlayerFallRappelRecovery':
            // End:0xBD
            case 'PlayerZipline':
                return 4;
            // End:0xC9
            case 'PlantThermalPost':
            // End:0xD5
            case 'InflateThermalPost':
            // End:0xE1
            case 'PlantBombState':
            // End:0xF0
            case 'DisarmBombState':
                return 3;
            // End:0xFFFF
            default:
                VictimPawn = LPPlayerPawn(Victim.Pawn);
                // End:0x194
                if(VictimPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerRepairBase'))
                {
                    // End:0x194
                    if(LPDisableRepairObjective(VictimPawn.CurrentRepairComponent.Owner) != none)
                    {
                        return 3;
                    }
                }
                // End:0x1F2
                foreach WorldInfo.DynamicActors(Class'LPSeizeControlObjective', SCO)
                {
                    // End:0x1F1
                    if(SCO.IsPlayerGainingControl(VictimPawn))
                    {                        
                        return 3;
                    }                    
                }                
                break;
            }
    }
    return 0;
    //return ReturnValue;    
}

function CheckForNearbyPlayers()
{
    local /*0x97E50000-0x00000000*/ private float Range[8388609];
    local /*0x97E50000-0x00000000*/ private bool bTeammatesOnly[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    false
    // End:0xFC
    foreach WorldInfo.AllPawns(Class'LPBasePlayerPawn', LPP, LPPlayerController(Owner).LastKnownPawnLocation, Range)
    {
        // End:0xFB
        if(((LPP.PlayerReplicationInfo != self) && LPP.Controller != none) && !bTeammatesOnly || int(LPP.GetTeamNum()) == int(GetTeamNum()))
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

function CheckForEntireTeamKill()
{
    local /*0x97E50000-0x00000000*/ private int NumTimesKilled[8388609], BlindJusticeReq, ExtremeJusticeReq, Idx;
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    BlindJusticeReq = int(GetAwardRequiredCount('Emblem_BlindJustice'));
    ExtremeJusticeReq = int(GetAwardRequiredCount('Emblem_ExtremeJustice'));
    // End:0x1D0
    if((NumTimesKilled == BlindJusticeReq) || NumTimesKilled == ExtremeJusticeReq)
    {
        // End:0x178
        foreach WorldInfo.Game.GameReplicationInfo.PRIArray(PRI)
        {
            // End:0x177
            if(int(PRI.GetTeamNum()) == (1 - int(GetTeamNum())))
            {
                Idx = PlayersKilledList.Find('PRI', LPPRI(PRI));                
                // End:0x140
                if(Idx < 0)
                {                    
                    return;                    
                }
                else
                {
                    // End:0x177
                    if(PlayersKilledList[Idx].NumTimesKilled < NumTimesKilled)
                    {                        
                        return;
                    }
                }
            }            
        }        
        // End:0x1A6
        if(NumTimesKilled == BlindJusticeReq)
        {
            ServerGiveAward('Emblem_BlindJustice');            
        }
        else
        {
            // End:0x1D0
            if(NumTimesKilled == ExtremeJusticeReq)
            {
                ServerGiveAward('Emblem_ExtremeJustice');
            }
        }
    }
    //return;    
}

simulated function CheckForMultiKill()
{
    local /*0x97E50000-0x00000000*/ private float CheckTime;
    local /*0x97E50000-0x00000000*/ private int Idx, MultiKillCount, MyTeamNum;

    MultiKillCount = 0;
    MyTeamNum = int(GetTeamNum());
    CheckTime = (WorldInfo.TimeSeconds - (GetAwardParam('Emblem_MiseryLovesCompany'))) - 0.0300000;
    Idx = 0;
    J0x70:

    // End:0x123 [Loop If]
    if(Idx < PlayersKilledList.Length)
    {
        // End:0x115
        if((PlayersKilledList[Idx].LastTimeKilled >= CheckTime) && int(PlayersKilledList[Idx].PRI.GetTeamNum()) != MyTeamNum)
        {
            MultiKillCount++;
        }
        Idx++;
        // [Loop Continue]
        goto J0x70;
    }
    // End:0x15C
    if(float(MultiKillCount) >= (GetAwardRequiredCount('Emblem_MiseryLovesCompany')))
    {
        GiveAward('Emblem_MiseryLovesCompany');        
    }
    else
    {
        // End:0x195
        if(float(MultiKillCount) == (GetAwardRequiredCount('Emblem_Quartet')))
        {
            GiveAward('Emblem_Quartet');            
        }
        else
        {
            // End:0x1CE
            if(float(MultiKillCount) == (GetAwardRequiredCount('Emblem_Trio')))
            {
                GiveAward('Emblem_Trio');                
            }
            else
            {
                // End:0x204
                if(float(MultiKillCount) == (GetAwardRequiredCount('Emblem_Duo')))
                {
                    GiveAward('Emblem_Duo');
                }
            }
        }
    }
    //return;    
}

simulated function GetLastKillTime()
{
    local /*0x97E50000-0x00000000*/ private @NULL VictimPRI[9437185];
    local /*0x97E50000-0x00000000*/ private bool bEnemyTeamOnly[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Result;
    local /*0x97E50000-0x00000000*/ private int Idx;

    false
    Result = -1.0000000;
    // End:0x8F
    if(VictimPRI != none)
    {
        Idx = PlayersKilledList.Find('PRI', VictimPRI);        
        // End:0x8C
        if(Idx >= 0)
        {
            Result = PlayersKilledList[Idx].LastTimeKilled;
        }        
    }
    else
    {
        Idx = 0;
        J0x9A:

        // End:0x161 [Loop If]
        if(Idx < PlayersKilledList.Length)
        {
            // End:0x153
            if(!bEnemyTeamOnly || int(PlayersKilledList[Idx].PRI.GetTeamNum()) != int(GetTeamNum()))
            {
                Result = float(Max(int(Result), int(PlayersKilledList[Idx].LastTimeKilled)));
            }
            Idx++;
            // [Loop Continue]
            goto J0x9A;
        }
    }
    return Result;
    //return ReturnValue;    
}

simulated function GetLastTimeKilled()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillerPRI[9437185];
    local /*0x97E50000-0x00000000*/ private bool bEnemyTeamOnly[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Result;
    local /*0x97E50000-0x00000000*/ private int Idx;

    false
    Result = -1.0000000;
    // End:0x8F
    if(KillerPRI != none)
    {
        Idx = PlayersKilledByList.Find('PRI', KillerPRI);        
        // End:0x8C
        if(Idx >= 0)
        {
            Result = PlayersKilledByList[Idx].LastTimeKilled;
        }        
    }
    else
    {
        Idx = 0;
        J0x9A:

        // End:0x161 [Loop If]
        if(Idx < PlayersKilledByList.Length)
        {
            // End:0x153
            if(!bEnemyTeamOnly || int(PlayersKilledByList[Idx].PRI.GetTeamNum()) != int(GetTeamNum()))
            {
                Result = float(Max(int(Result), int(PlayersKilledByList[Idx].LastTimeKilled)));
            }
            Idx++;
            // [Loop Continue]
            goto J0x9A;
        }
    }
    return Result;
    //return ReturnValue;    
}

event ModifyHarmonizedHealth()
{
    local /*0x97E50000-0x00000000*/ private float Amount[8388609];

    ModifyStat('Stat_HealthRestored', int(Amount));
    HealthHarmonized += Amount;
    UpdateHarmonizedHealth();
    //return;    
}

simulated function UpdateHarmonizedHealth()
{
    local /*0x97E50000-0x00000000*/ private int PrevValue, Delta;

    // End:0x85
    if(LPPlayerController(Owner) != none)
    {
        PrevValue = EvalStat('Stat_HealthHarmonized', 0);
        Delta = int(HealthHarmonized - float(PrevValue));
        // End:0x85
        if(Delta > 0)
        {
            ModifyStat('Stat_HealthHarmonized', Delta);
        }
    }
    //return;    
}

simulated function NoteWeaponDischargeTime()
{
    TimeOfLastWeaponDischarge = WorldInfo.TimeSeconds;
    //return;    
}

function UpdateNemesis()
{
    local /*0x97E50000-0x00000000*/ private @NULL NemesisPRI[8388609];
    local /*0x97E50000-0x00000000*/ private bool bKilledBy[8388609];

    InternalUpdateNemesis(NemesisPRI, bKilledBy);
    // End:0x63
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        ClientUpdateNemesis(NemesisPRI, bKilledBy);
    }
    //return;    
}

reliable client simulated function ClientUpdateNemesis()
{
    local /*0x97E50000-0x00000000*/ private @NULL NemesisPRI[8388609];
    local /*0x97E50000-0x00000000*/ private bool bKilledBy[8388609];

    InternalUpdateNemesis(NemesisPRI, bKilledBy);
    //return;    
}

simulated function InternalUpdateNemesis()
{
    local /*0x97E50000-0x00000000*/ private @NULL NemesisPRI[8388609];
    local /*0x97E50000-0x00000000*/ private bool bKilledBy[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EG;

    // End:0x11
    if(!IsPlayerOwned())
    {
        return;
    }
    EG = LPPerkEverlongGrudge(PerksManager.QueryPerkClass(10));
    // End:0xD8
    if(EG != none)
    {
        // End:0x8C
        if(bKilledBy)
        {
            EG.NemesisPRI = NemesisPRI;            
        }
        else
        {
            // End:0xD8
            if(EG.NemesisPRI == NemesisPRI)
            {
                EG.NemesisPRI = none;
            }
        }
    }
    //return;    
}

reliable client simulated function NotifyPlayerSelectionNotPossible()
{
    //return;    
}

function GetDesiredPawnClass()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    // End:0x19
    if(TeamIndex == 1)
    {
        return DesiredPiratePawnClassName;
    }
    return DesiredNevecPawnClassName;
    //return ReturnValue;    
}

simulated function UnregisterPlayerFromSession()
{
    // End:0x19
    if(!bFromPreviousLevel)
    {
        super(PlayerReplicationInfo).UnregisterPlayerFromSession();
    }
    UnregisterPlayerFromParty();
    //return;    
}

simulated function RegisterPlayerWithParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, PartySettings, MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x1DC
    if(OnlineSub != none)
    {
        // End:0x1D9
        if(NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
        {
            // End:0x1D6
            if(OnlineSub.HasValue(PartyOwnerUniqueId))
            {
                // End:0x1D3
                if(OnlineSub.HasValue(UniqueId))
                {
                    PartySettings = MPMgr.GetPartySettings();
                    // End:0x1D0
                    if(PartySettings != none)
                    {
                        // End:0x1CD
                        if(OnlineSub.AreUniqueNetIdsEqual(PartySettings.OwningPlayerId, PartyOwnerUniqueId))
                        {
                            OnlineSub.GameInterface.RegisterPlayer(MPMgr.SessionNameParty, UniqueId, true);                            
                        }                        
                    }                    
                }                
            }            
        }        
    }
    //return;    
}

simulated function UnregisterPlayerFromParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, PartySettings, ZeroId, MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x150
    if(((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none))) && NotEqual_UniqueNetIdUniqueNetId(UniqueId, ZeroId))
    {
        PartySettings = MPMgr.GetPartySettings();
        // End:0x14D
        if(PartySettings != none)
        {
            OnlineSub.GameInterface.UnregisterPlayer(MPMgr.SessionNameParty, UniqueId);
        }        
    }
    //return;    
}

event SetPlayerName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    // End:0x12
    if(S == "")
    {
        return;
    }
    super.SetPlayerName(S);
    //return;    
}

defaultproperties
{
    ReplicatedPerks=(Entry=(PerkIndex=-1,bLocked=false,DeployRate=1.0000000,DeployTime=0.0000000),Entry[1]=(PerkIndex=-1,bLocked=false,DeployRate=1.0000000,DeployTime=0.0000000),Entry[2]=(PerkIndex=-1,bLocked=false,DeployRate=1.0000000,DeployTime=0.0000000),Entry[3]=(PerkIndex=-1,bLocked=false,DeployRate=1.0000000,DeployTime=0.0000000))
    TEnergyAtDeath=-1.0000000
    DesiredNevecPawnClassName="LostPlanetGameContent.LPPawnNevec_MP"
    DesiredPiratePawnClassName="LostPlanetGameContent.LPPawnSnowPirate_MP"
    GameMessageClass=Class'LPGameMessage'
}