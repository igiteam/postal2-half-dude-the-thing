class LPPerks extends Object
    abstract
    editinlinenew;

enum EPerks
{
    EPERK_QUICKFINGERS,             // 0
    EPERK_REPAIR,                   // 1
    EPERK_THERMALPADDING,           // 2
    EPERK_PROXIMITYMINE,            // 3
    EPERK_REVIVAL,                  // 4
    EPERK_CHAINGUNTURRET,           // 5
    EPERK_AMMOPACK,                 // 6
    EPERK_SHIELD,                   // 7
    EPERK_HARMONIZER,               // 8
    EPERK_ROCKETTURRET,             // 9
    EPERK_GRUDGE,                   // 10
    EPERK_SIXTHSENSE,               // 11
    EPERK_SQUADSPAWN,               // 12
    EPERK_NOXIOUSDEMISE,            // 13
    EPERK_NANOTHIEF,                // 14
    EPERK_GRENADIER,                // 15
    EPERK_CREDITBOOSTER,            // 16
    EPERK_LUCKSHOT,                 // 17
    EPERK_TECHNICIAN,               // 18
    EPERK_MOREHEALTH,               // 19
    EPERK_BIOTOXMINE,               // 20
    EPERK_CODEBREAKER,              // 21
    EPERK_MAX                       // 22
};

enum EPerkStatus
{
    EPERKSTATUS_Unavailable,        // 0
    EPERKSTATUS_UnavailableByCost,  // 1
    EPERKSTATUS_UnavailableByCooldown,// 2
    EPERKSTATUS_UnavailableByCount, // 3
    EPERKSTATUS_ActiveAndValid,     // 4
    EPERKSTATUS_ActiveAndInvalid,   // 5
    EPERKSTATUS_ActiveAndDeploying, // 6
    EPERKSTATUS_ActiveAndPriming,   // 7
    EPERKSTATUS_AvailableForUse,    // 8
    EPERKSTATUS_MAX                 // 9
};

enum EAssignedPerkSlots
{
    EAP_Slot0,                      // 0
    EAP_Slot1,                      // 1
    EAP_Slot2,                      // 2
    EAP_Slot3,                      // 3
    EAP_MAX                         // 4
};

struct native AssignedPerkInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Perk;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLocked;

    structdefaultproperties
    {
        Perk=none
        bLocked=false
    }
};

var(0.25_Pct_2072772607) /*0x97E50000-0x00000400*/ private editfixedsize @NULL PerkList[524310];
var(0.25_Pct_2063400959) /*0x97E50000-0x00000000*/ private @NULL AssignedPerk[4];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PerksTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEnergyCapacityAdjustment;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentDeploymentPerk;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentDeploymentDPadIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCurrentDeploymentPerkIsCloned;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bValidationRuleResult;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerkDeployedOK;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DeploymentLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DeploymentRotation;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL LastClosestHackableComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EmptyDeployableTexture;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EmptyPassiveTexture;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HackTexture;

// Export ULPPerks::execGetEnabledPerk(FFrame&, void* const)
native final function GetEnabledPerk()
{
    local /*0x97E50000-0x00000000*/ private byte Index[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPerks::execQueryPerkIndex(FFrame&, void* const)
native final simulated function QueryPerkIndex()
{
    local /*0x97E50000-0x00000000*/ private byte PerkIndex[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPPerks::execQueryPerkClass(FFrame&, void* const)
native final simulated function QueryPerkClass()
{
    local /*0x97E50000-0x00000000*/ private byte PerkIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPerks::execQueryPerkInstance(FFrame&, void* const)
native final simulated function QueryPerkInstance()
{
    local /*0x97E50000-0x00000000*/ private byte PerkIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPerks::execQueryPerkName(FFrame&, void* const)
native final simulated function QueryPerkName()
{
    local /*0x97E50000-0x00000000*/ private name PerkName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated function InitPerksManager()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL PB;

    // End:0x0F
    if(bInitialized)
    {
        return;
    }
    I = 0;
    J0x1A:

    // End:0xCD [Loop If]
    if(I < 22)
    {
        PB = PerkList[I];
        // End:0xBF
        if(PB != none)
        {
            PB.PerkIndex = byte(I);
            PB.PerkManager = self;
            PB.Init();
        }
        ++I;
        // [Loop Continue]
        goto J0x1A;
    }
    // End:0x218
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
    {
        AssignedPerk[0].bLocked = false;
        AssignedPerk[0].Perk = none;
        AssignedPerk[1].bLocked = false;
        AssignedPerk[1].Perk = none;
        AssignedPerk[2].bLocked = false;
        AssignedPerk[2].Perk = none;
        AssignedPerk[3].bLocked = false;
        AssignedPerk[3].Perk = none;        
    }
    else
    {
        AssignedPerk[0].bLocked = false;
        AssignedPerk[1].bLocked = false;
        AssignedPerk[2].bLocked = false;
        AssignedPerk[3].bLocked = false;
    }
    UpdateTEnergyCapacityAdjustment();
    bInitialized = true;
    //return;    
}

simulated function UpdateFromProfile()
{
    local /*0x97E50000-0x00000000*/ private int X;
    local /*0x97E50000-0x00000000*/ private @NULL CurrentProfileSettings;

    // End:0x42
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) == int(NM_Standalone))
    {
        return;
    }
    // End:0x11B
    if((MyPC != none) && MyPC.IsLocalController())
    {
        CurrentProfileSettings = LPProfileSettings(MyPC.ProfileSettings);
        // End:0x11B
        if(CurrentProfileSettings != none)
        {
            X = 0;
            J0xC0:

            // End:0x11B [Loop If]
            if(X < 4)
            {
                SetPerkSlotStatus(X, CurrentProfileSettings.IsDPadSlotLocked(X), true);
                X++;
                // [Loop Continue]
                goto J0xC0;
            }
        }
    }
    //return;    
}

simulated function Reset()
{
    local /*0x97E50000-0x00000000*/ private @NULL PB;
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x76 [Loop If]
    if(I < int(22))
    {
        PB = PerkList[I];
        // End:0x68
        if(PB != none)
        {
            PB.Reset();
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    bValidationRuleResult = false;
    bPerkDeployedOK = false;
    UpdateTEnergyCapacityAdjustment();
    //return;    
}

simulated function CopyProperties()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    TEnergyCapacityAdjustment = P.TEnergyCapacityAdjustment;
    MyPC = P.MyPC;
    I = 0;
    J0x5B:

    // End:0xE3 [Loop If]
    if(I < 22)
    {
        // End:0xD5
        if(PerkList[I] != none)
        {
            PerkList[I].CopyProperties(P.PerkList[I]);
        }
        ++I;
        // [Loop Continue]
        goto J0x5B;
    }
    //return;    
}

simulated function SetController()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL PB;

    MyPC = C;
    MyPRI = LPPRI(C.PlayerReplicationInfo);
    I = 0;
    J0x4F:

    // End:0xC1 [Loop If]
    if(I < 22)
    {
        PB = PerkList[I];
        // End:0xB3
        if(PB != none)
        {
            PB.SetController(C);
        }
        ++I;
        // [Loop Continue]
        goto J0x4F;
    }
    //return;    
}

simulated function UpdateTEnergyCapacityAdjustment()
{
    TEnergyCapacityAdjustment = 0.0000000;
    //return;    
}

simulated function AssignPerk()
{
    local /*0x97E50000-0x00000000*/ private int DPadSlotIdx[8388609];
    local /*0x97E50000-0x00000000*/ private name PerkName[9437185];
    local /*0x97E50000-0x00000000*/ private bool bNoProfileUpdate[9437185], bReplicate;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private bool bAssigned;
    local /*0x97E50000-0x00000000*/ private @NULL TE, LPP;

    'None'
    false
    true
    // End:0x65
    if(PerkName == 'None')
    {
        AssignedPerk[DPadSlotIdx].Perk = none;
        bAssigned = true;        
    }
    else
    {
        // End:0x92
        if(AssignedPerk[DPadSlotIdx].bLocked)
        {            
        }
        else
        {
            Idx = 0;
            J0x9D:

            // End:0x155 [Loop If]
            if(Idx < 22)
            {
                // End:0x147
                if((PerkList[Idx] != none) && PerkList[Idx].PerkName == PerkName)
                {
                    AssignedPerk[DPadSlotIdx].Perk = PerkList[Idx];
                    bAssigned = true;
                    // [Explicit Break]
                    goto J0x155;
                }
                Idx++;
                // [Loop Continue]
                goto J0x9D;
            }
            J0x155:

            // End:0x164
            if(!bAssigned)
            {
            }
        }
    }
    // End:0x1A2
    if(bReplicate && MyPRI != none)
    {
        MyPRI.UpdateReplicatedPerks();
    }
    UpdateTEnergyCapacityAdjustment();
    // End:0x2E7
    if(((GetMyPlayerController()) != none) && MyPC.Pawn != none)
    {
        TE = LPThermalEnergy(MyPC.Pawn.InvManager.FindInventoryType(Class'LPThermalEnergy', true));
        LPP = LPPlayerPawn(MyPC.Pawn);
        // End:0x2E7
        if(TE != none)
        {
            LPP.TEnergyLevel = TE.GetEnergyCount() / LPP.GetMaxTEnergyCapacity();
        }
    }
    //return;    
}

function CheckAssignedPerks()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !(((AssignedPerk[0].Perk == none) && AssignedPerk[1].Perk == none) && AssignedPerk[2].Perk == none) && AssignedPerk[3].Perk == none;
    //return ReturnValue;    
}

function ActivatePerk()
{
    local /*0x97E50000-0x00000000*/ private int PerkNumber[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PD;
    local /*0x97E50000-0x00000000*/ private bool bTimeoutHUD, bActivated, bCanDeployPerk;
    local /*0x97E50000-0x00000000*/ private byte Status;

    // End:0x12
    if((GetMyPlayerController()) == none)
    {
        return false;
    }
    // End:0x35
    if((PerkNumber == 0) || PerkNumber == 2)
    {
        return false;
    }
    PD = GetDeployablePerkFromAssignmentIndex(PerkNumber);
    bCurrentDeploymentPerkIsCloned = ((PerkNumber >= 0) && PerkNumber < 4) && LPPerkNanoThief(AssignedPerk[PerkNumber].Perk) != none;
    bPerkDeployedOK = false;
    // End:0xF3
    if(IsDeploymentModeActive())
    {
        DeactivateDeploymentMode();
        PerkNumber = -1;
        bActivated = false;        
    }
    else
    {
        bCanDeployPerk = MyPC.CanDeployPerk();
        Status = (((PD == none) || !bCanDeployPerk) ? 0 : PD.CanPerkBeActivated(bCurrentDeploymentPerkIsCloned, bCurrentDeploymentPerkIsCloned, bCurrentDeploymentPerkIsCloned));
        // End:0x292
        if(AssignedPerk[PerkNumber].bLocked || int(Status) != int(8))
        {
            bTimeoutHUD = true;
            bActivated = true;
            MyPC.MyPlayerPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('CannotDeployPerk', 'None', MyPC.MyPlayerPawn, MyPC.MyPlayerPawn.Mesh, none, true);            
        }
        else
        {
            ActivateDeploymentMode(PD.PerkIndex, PerkNumber);
            bTimeoutHUD = int(PD.PerkType) == int(0);
            bActivated = true;
            // End:0x35E
            if(int(PD.PerkType) == int(0))
            {
                ValidateDeploymentRules();
                MyPC.UseActivePerk();
                Status = 0;
            }
        }
    }
    // End:0x4E8
    if((((bCanDeployPerk || !bActivated) && MyPC.IsLocalController()) && MyPC.Pawn != none) && MyPC.Pawn.IsAliveAndWell())
    {
        // End:0x45A
        if(MyPC.bAlwaysDisplayDPAD)
        {
            MyPC.myLPHUD.ShowDPadCluster(true, false);            
        }
        else
        {
            MyPC.myLPHUD.ShowDPadCluster(bActivated, bTimeoutHUD);
        }
        MyPC.myLPHUD.SetDPadClusterPerkState(Status, PerkNumber);
    }
    return bActivated;
    //return ReturnValue;    
}

simulated function SetPerkSlotStatus()
{
    local /*0x97E50000-0x00000000*/ private int PerkSlotNumber[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLocked[8388609], bNoProfileUpdate, bReplicate;
    local /*0x97E50000-0x00000000*/ private @NULL LPS, PRI;

    AssignedPerk[PerkSlotNumber].bLocked = bLocked;
    // End:0xEC
    if((bReplicate && (GetMyPlayerController()) != none) && MyPC.IsLocalController())
    {
        PRI = LPPRI(MyPC.Pawn.PlayerReplicationInfo);
        // End:0xEC
        if(PRI != none)
        {
            PRI.UpdateReplicatedPerks();
        }
    }
    // End:0x1A2
    if((!bNoProfileUpdate && MyPC != none) && MyPC.IsLocalController())
    {
        LPS = LPProfileSettings(MyPC.ProfileSettings);
        // End:0x1A2
        if(LPS != none)
        {
            LPS.SetDPadSlotStatus(PerkSlotNumber, bLocked);
        }
    }
    //return;    
}

simulated function GetActivationStatus()
{
    local /*0x97E50000-0x00000000*/ private byte PerkEnumeration[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL PD;
    local /*0x97E50000-0x00000000*/ private byte Status;

    // End:0x10
    if(IsDeploymentModeActive())
    {
        return 0;
    }
    PD = LPPerkDeployable(QueryPerkClass(PerkEnumeration));
    // End:0x48
    if(PD == none)
    {
        return 0;
    }
    Status = PD.CanPerkBeActivated(bCurrentDeploymentPerkIsCloned, bCurrentDeploymentPerkIsCloned, bCurrentDeploymentPerkIsCloned);
    return Status;
    //return ReturnValue;    
}

simulated function IsDeploymentModeActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CurrentDeploymentPerk != none;
    //return ReturnValue;    
}

simulated function GetValidationResults()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bValidationRuleResult;
    //return ReturnValue;    
}

simulated function GetActiveDeploymentModePerk()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CurrentDeploymentPerk;
    //return ReturnValue;    
}

simulated function GetActiveDeploymentModeDPadIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return CurrentDeploymentDPadIndex;
    //return ReturnValue;    
}

function SetActiveDeploymentModePerk()
{
    local /*0x97E50000-0x00000000*/ private byte PerkType[8388609];
    local /*0x97E50000-0x00000000*/ private int iDPADIndex[8388609];

    CurrentDeploymentPerk = LPPerkDeployable(PerkList[int(PerkType)]);
    CurrentDeploymentDPadIndex = iDPADIndex;
    //return;    
}

simulated function DeactivateDeploymentMode()
{
    // End:0x2E
    if(CurrentDeploymentPerk != none)
    {
        CurrentDeploymentPerk.DeactivateDeploymentMode();
    }
    // End:0x129
    if(((GetMyPlayerController()) != none) && MyPC.myLPHUD != none)
    {
        MyPC.myLPHUD.RemoveMessageLayer(7);
        // End:0xF4
        if(!MyPC.bAlwaysDisplayDPAD)
        {
            MyPC.myLPHUD.ShowDPadCluster(false);
        }
        MyPC.myLPHUD.NotifyDeploymentModeChanged(false);
    }
    CurrentDeploymentPerk = none;
    CurrentDeploymentDPadIndex = -1;
    //return;    
}

function ActivateDeploymentMode()
{
    local /*0x97E50000-0x00000000*/ private byte PerkType[8388609];
    local /*0x97E50000-0x00000000*/ private int iDPADIndex[8388609];

    SetActiveDeploymentModePerk(PerkType, iDPADIndex);
    // End:0xC8
    if(CurrentDeploymentPerk != none)
    {
        CurrentDeploymentPerk.ActivateDeploymentMode();
        CurrentDeploymentDPadIndex = iDPADIndex;
        // End:0xC8
        if(((GetMyPlayerController()) != none) && MyPC.myLPHUD != none)
        {
            MyPC.myLPHUD.NotifyDeploymentModeChanged(true);
        }
    }
    bValidationRuleResult = false;
    //return;    
}

function SpawnPerkTarget()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bSpawned;
    local /*0x97E50000-0x00000000*/ private @NULL TE, DeployedPerk;

    DeployedPerk = CurrentDeploymentPerk.OnUse();
    bSpawned = DeployedPerk != none;
    // End:0x12C
    if(bSpawned)
    {
        // End:0x12C
        if(!bCurrentDeploymentPerkIsCloned)
        {
            CurrentDeploymentPerk.AddDeployedPerk(DeployedPerk);
            TE = LPThermalEnergy(MyPC.Pawn.FindInventoryType(Class'LPThermalEnergy', true));
            // End:0x12C
            if(TE != none)
            {
                TE.AddEnergy(-1.0000000 * CurrentDeploymentPerk.GetDeploymentCost(true), false);
            }
        }
    }
    return bSpawned;
    //return ReturnValue;    
}

function NotifyPerkDestroyed()
{
    local /*0x97E50000-0x00000000*/ private byte PerkEnum[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIgnoreCount[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPPD;

    false
    // End:0x8A
    if(!bIgnoreCount)
    {
        LPPD = LPPerkDeployable(PerkList[int(PerkEnum)]);
        // End:0x6A
        if(LPPD != none)
        {
            LPPD.DecrementActiveCount();
        }
        GetMyPlayerController().ForceDPadClusterUpdate();
    }
    //return;    
}

function SpawnPerkProxy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bSpawned;
    local /*0x97E50000-0x00000000*/ private @NULL Loc, Rot, LPP, Totem, TD;

    // End:0x11
    if(!IsDeploymentModeActive())
    {
        return false;
    }
    TD = LPTuneDataPerkBeaconBase(CurrentDeploymentPerk.GetTuneData());
    // End:0x7A
    if((TD == none) || TD.ProxyTotem == none)
    {
        return false;
    }
    LPP = LPPlayerPawn(MyPC.Pawn);
    LPP.Mesh.GetSocketWorldLocationAndRotation(TD.DeploymentSocket, Loc, Rot);
    Totem = LPP.Spawn(TD.ProxyTotem,,, Loc, DeploymentRotation);
    // End:0x1D9
    if(Totem != none)
    {
        bSpawned = true;
        Totem.InstigatorPerk = CurrentDeploymentPerk;
        Totem.DeploymentInstigator = MyPC;
    }
    return bSpawned;
    //return ReturnValue;    
}

function UseActivePerk()
{
    local /*0x97E50000-0x00000000*/ private @NULL NT;

    // End:0x11
    if(!IsDeploymentModeActive())
    {
        return;
    }
    bPerkDeployedOK = false;
    // End:0xB3
    if(bCurrentDeploymentPerkIsCloned)
    {
        NT = LPPerkNanoThief(AssignedPerk[CurrentDeploymentDPadIndex].Perk);
        NT.WipeIdentity();
        // End:0xB0
        if(MyPC != none)
        {
            MyPC.ForceDPadClusterUpdate();
        }        
    }
    else
    {
        CurrentDeploymentPerk.SetLastUsedTime(Class'Engine.WorldInfo'.static.GetWorldInfo().TimeSeconds);
    }
    //return;    
}

simulated function UseActivePerkEnum()
{
    local /*0x97E50000-0x00000000*/ private byte PerkEnum[8388609];
    local /*0x97E50000-0x00000000*/ private int iDPADIndex[8388609];

    ActivateDeploymentMode(PerkEnum, iDPADIndex);
    UseActivePerk();
    //return;    
}

simulated function OperateActivePerk()
{
    //return;    
}

simulated function ValidateDeploymentRules()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!IsDeploymentModeActive())
    {
        return false;
    }
    bValidationRuleResult = CurrentDeploymentPerk.ValidateDeploymentRules();
    return bValidationRuleResult;
    //return ReturnValue;    
}

function CheckDeploymentHUDMessages()
{
    local /*0x97E50000-0x00000000*/ private bool bPreviousOK;
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private byte Status;

    // End:0x312
    if(GetMyPlayerController().IsLocalController())
    {
        bPreviousOK = bValidationRuleResult;
        ValidateDeploymentRules();
        // End:0x16B
        if(CurrentDeploymentPerk.bDeploymentGuidesActive)
        {
            // End:0x132
            if(bValidationRuleResult)
            {
                // End:0x12F
                if(!MyPC.myLPHUD.IsMessageLayerActive(7))
                {
                    // End:0x12F
                    if(CurrentDeploymentPerk.DeploymentPromptString != "")
                    {
                        MyPC.myLPHUD.DisplayHUDMessageLayer(7, CurrentDeploymentPerk.DeploymentPromptString);
                    }
                }                
            }
            else
            {
                MyPC.myLPHUD.RemoveMessageLayer(7);
            }            
        }
        else
        {
            MyPC.myLPHUD.RemoveMessageLayer(7);
        }
        // End:0x2F3
        if(bPreviousOK != bValidationRuleResult)
        {
            // End:0x2F3
            if(MyPC.myLPHUD != none)
            {
                Status = CurrentDeploymentPerk.CanPerkBeActivated(false, false, false, true);
                // End:0x26A
                if(int(Status) == int(8))
                {
                    // End:0x26A
                    if(int(CurrentDeploymentPerk.CanPerkBeActivated(true, true, true)) == int(8))
                    {
                        Status = ((bValidationRuleResult) ? 4 : 5);
                    }
                }
                Index = QueryPerkIndex(((bCurrentDeploymentPerkIsCloned) ? 14 : CurrentDeploymentPerk.PerkIndex));
                MyPC.myLPHUD.SetDPadClusterPerkState(Status, Index);
            }
        }
        CurrentDeploymentPerk.Tick();
    }
    //return;    
}

simulated function @NULL CheckHackHUDMessages()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP, C;

    // End:0x12
    if((GetMyPlayerController()) == none)
    {
        return;
    }
    LPP = LPPlayerPawn(MyPC.Pawn);
    // End:0x54
    if(LPP == none)
    {
        return;
    }
    // End:0x84
    if(LPSM_PlayerHackDeployable(LPP.GetCurrentSpecialMoveInstance()) != none)
    {
        return;
    }
    C = LPP.FindNearestValidHackableComponent();
    // End:0xDE
    if(C == none)
    {
        MyPC.ClearHackDeployablePrompt();        
    }
    else
    {
        MyPC.LastTouchedHackableDeployableComponentOwner = C.Owner;
        MyPC.DisplayHackDeployablePrompt(C.HUDHackPromptString);
    }
    LastClosestHackableComponent = C;
    //return;    
}

simulated function Tick()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL NT;

    // End:0x43
    if((IsDeploymentModeActive()) && !MyPC.IsInState('DeployManualPerk'))
    {
        CheckDeploymentHUDMessages();        
    }
    else
    {
        NT = LPPerkNanoThief(QueryPerkClass(Class'LPPerkNanoThief'.default.PerkIndex));
        // End:0xBB
        if((NT != none) && NT.CanPerkBeActivated())
        {
            CheckHackHUDMessages();
        }
    }
    return true;
    //return ReturnValue;    
}

function GetDeployablePerkFromAssignmentIndex()
{
    local /*0x97E50000-0x00000000*/ private int iIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], NT;

    // End:0x51
    if(((iIndex < 0) || iIndex > 3) || AssignedPerk[iIndex].Perk == none)
    {
        return none;
    }
    NT = LPPerkNanoThief(AssignedPerk[iIndex].Perk);
    // End:0xF2
    if((NT != none) && NT.HasIdentity())
    {
        return LPPerkDeployable(PerkList[int(NT.GetIdentity())]);
    }
    return LPPerkDeployable(AssignedPerk[iIndex].Perk);
    //return ReturnValue;    
}

function AnyPerksAssigned()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x59 [Loop If]
    if(I < int(4))
    {
        // End:0x4B
        if(AssignedPerk[I].Perk != none)
        {
            return true;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function FindEmptyAssignmentSlot()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I;

    I = 0;
    J0x0B:

    // End:0x61 [Loop If]
    if(I < int(4))
    {
        // End:0x53
        if(AssignedPerk[I].Perk == none)
        {
            return I;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25165825], P;
    local /*0x97E50000-0x00000000*/ private int iIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Perk;

    Record.PerkInventoryInfo.Length = 0;
    iIndex = 0;
    J0x2A:

    // End:0x13E [Loop If]
    if(iIndex < int(22))
    {
        Perk = LPPerkDeployable(QueryPerkClass(byte(iIndex)));
        // End:0x130
        if(Perk != none)
        {
            P.PerkIndex = iIndex;
            P.DPADAssignment = QueryPerkIndex(byte(iIndex));
            P.iCount = Perk.GetInventoryCount();
            Record.PerkInventoryInfo.AddItem(P);            
        }
        ++iIndex;
        // [Loop Continue]
        goto J0x2A;
    }
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25296897], P, Perk;

    // End:0xF6
    foreach Record.PerkInventoryInfo(P)
    {
        Perk = LPPerkDeployable(QueryPerkInstance(byte(P.PerkIndex)));
        // End:0xF5
        if(Perk != none)
        {
            AssignPerk(P.DPADAssignment, Perk.PerkName);
            Perk.SetInventory(P.iCount);
        }        
    }    
    //return;    
}

function GetMyPlayerController()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x5E
    if(MyPC == none)
    {
        // End:0x4F
        if(MyPRI != none)
        {
            SetController(LPPlayerController(MyPRI.Owner));
        }
        // End:0x5E
        if(MyPC == none)
        {
        }
    }
    return MyPC;
    //return ReturnValue;    
}

static function @NULL FindHackableComponent()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], ReturnValue, C;

    // End:0x11
    if(A == none)
    {
        return none;
    }
    // End:0x51
    foreach A.ComponentList(Class'LPHackableTotemBaseComponent', C)
    {        
        return C;        
    }    
    return none;
    //return ReturnValue;    
}

static function GetMaxPerkCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return int(22);
    //return ReturnValue;    
}
