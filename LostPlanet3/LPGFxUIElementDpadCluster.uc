class LPGFxUIElementDpadCluster extends LPGFxUIElement;

struct CachedPerkInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class PerkClass;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HUDIconTexture;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CooldownPercent;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CooldownTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastUsedTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PerkStateNum;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PerkName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PerkDescription;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ImageLoader;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HackImageLoader;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsHacked;

    structdefaultproperties
    {
        PerkClass=none
        HUDIconTexture=none
        CooldownPercent=-1.0000000
        CooldownTime=-1.0000000
        LastUsedTime=-1.0000000
        PerkStateNum=0
        PerkName=""
        PerkDescription=""
        ImageLoader=none
        HackImageLoader=none
        bIsHacked=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DpadClusterMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL CachedPerks[4];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCachedShouldBeActive;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerkCostsInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMultiplayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPassivePerksVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CachedCooldownModifier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PerksManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PassivePerksShowDuration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PassivePerksLastShown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PassivePerkHeaderText;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OutroComplete__Delegate;

delegate OutroComplete()
{
    // End:0x19
    if(bPendingInactive)
    {
        SetActive(false, true);
    }
    //return;    
}

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    bMultiplayer = int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone);
    // End:0xC4
    if(MoviePlayer != none)
    {
        DpadClusterMC = MoviePlayer.GetVariableObject("_root.stagePanel.panel_DpadCluster.dPadCluster");
    }
    SetOnOutroComplete(OutroComplete);
    //return;    
}

function SetOnOutroComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> F[8388609];

    // End:0x42
    if(DpadClusterMC != none)
    {
        DpadClusterMC.ActionScriptSetFunction("OutroCompleteEvent");
    }
    //return;    
}

function ShowDPadCluster()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    SetActive((bShow && (GetPerksManager()) != none) && PerksManager.CheckAssignedPerks());
    //return;    
}

function GetPerksManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x39
    if(PerksManager == none)
    {
        PerksManager = GetLPPC().GetPerksManager();
    }
    return PerksManager;
    //return ReturnValue;    
}

function SetDPadClusterPerkState()
{
    local /*0x97E50000-0x00000000*/ private byte PerkStatus[8388609];
    local /*0x97E50000-0x00000000*/ private int PerkNum[8388609];

    // End:0x23
    if((PerkNum < 0) || PerkNum > 3)
    {
        return;
    }
    // End:0x10F
    if(((((GetPerksManager()) == none) || PerksManager.AssignedPerk[PerkNum].bLocked) || PerksManager.AssignedPerk[PerkNum].Perk == none) || PerksManager.AssignedPerk[PerkNum].Perk.IsPassive())
    {
        return;
    }
    SetDPadPerkState(PerkNum, int(PerkStatus));
    //return;    
}

function IsVisible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x56
    if(DpadClusterMC != none)
    {
        DI = DpadClusterMC.GetDisplayInfo();
        return DI.Visible;
    }
    return false;
    //return ReturnValue;    
}

function SetActive()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609], bImmediate;

    // End:0x6C
    if(bSet || bImmediate)
    {
        // End:0x3F
        if(bSet)
        {
            InitDPadPerks();
            UpdatePerkStatus();
        }
        bPendingInactive = false;
        super(SPGFxUIElement).SetActive(bSet, bImmediate);        
    }
    else
    {
        bPendingInactive = true;
        Show(bSet, bImmediate);
    }
    //return;    
}

function ForceUpdate()
{
    InitDPadPerks();
    UpdatePerkStatus();
    //return;    
}

function InitDPadPerks()
{
    local /*0x97E50000-0x00000000*/ private @NULL Perk, PerkNanoThief;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x394
    if((GetPerksManager()) != none)
    {
        // End:0x41
        if(!PerksManager.CheckAssignedPerks())
        {
            ShowDPadCluster(false);
            return;
        }
        I = 0;
        J0x4C:

        // End:0x316 [Loop If]
        if(I < 4)
        {
            Perk = PerksManager.AssignedPerk[I].Perk;
            // End:0x28E
            if(Perk != none)
            {
                CachedPerks[I].PerkClass = Perk.Class;
                PerkNanoThief = LPPerkNanoThief(Perk);
                // End:0x1C4
                if((PerkNanoThief != none) && PerkNanoThief.HasIdentity())
                {
                    SetDPadIcon(I, PerksManager.PerkList[int(PerkNanoThief.GetIdentity())].PerkBaseTuneData.HUDIconTexture);                    
                }
                else
                {
                    SetDPadIcon(I, Perk.PerkBaseTuneData.HUDIconTexture);
                }
                SetDPadPerkHacked(I, PerkNanoThief != none);
                // End:0x28B
                if((I % 2) == 0)
                {
                    SetPassiveSlotText(I, Perk.FriendlyName, Perk.ShortDescription);
                }                
            }
            else
            {
                CachedPerks[I].PerkClass = none;
                SetDPadIcon(I, none);
                SetDPadPerkHacked(I, false);
                // End:0x308
                if((I % 2) == 0)
                {
                    SetPassiveSlotText(I, "", "");
                }
            }
            I++;
            // [Loop Continue]
            goto J0x4C;
        }
        // End:0x394
        if(ShouldShowPassivePerks())
        {
            PassivePerksShowDuration = GetLPPC().MyPlayerPawn.TuneDataPlayerPawn.PostSpawnInvulnerablilityTime;
            SetPassiveHeaderText(PassivePerkHeaderText);
            ShowPassivePerks(true);
        }
    }
    //return;    
}

function InitPerkCosts()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x10A
    if(!bPerkCostsInit)
    {
        LPPC = GetLPPC();
        // End:0x10A
        if(LPPC != none)
        {
            // End:0x10A
            if((int(LPPC.WorldInfo.NetMode) == int(NM_Standalone)) || (LPPC.bPersistentDataInit && LPPC.MyPlayerPawn != none) && LPPC.MyPlayerPawn.bProfileLoadOutInitialized)
            {
                bPerkCostsInit = true;
                UpdatePerkStatus(true);
            }
        }
    }
    //return;    
}

function UpdatePerkStatus()
{
    local /*0x97E50000-0x00000000*/ private bool bRecalculateCost[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL PerkDeployable, PerkNanoThief;
    local /*0x97E50000-0x00000000*/ private byte PerkStatus;
    local /*0x97E50000-0x00000000*/ private int I;

    false
    // End:0x308
    if(bPerkCostsInit)
    {
        // End:0x308
        if((GetPerksManager()) != none)
        {
            I = 0;
            J0x2D:

            // End:0x308 [Loop If]
            if(I < 4)
            {
                PerkDeployable = LPPerkDeployable(PerksManager.AssignedPerk[I].Perk);
                // End:0x236
                if(PerkDeployable != none)
                {
                    // End:0xC7
                    if(bRecalculateCost)
                    {
                        PerkDeployable.GetDeploymentCost(true);
                    }
                    PerkStatus = PerkDeployable.CanPerkBeActivated(bMultiplayer, false, !bMultiplayer, true);
                    switch(PerkStatus)
                    {
                        // End:0x120
                        case 0:
                        // End:0x125
                        case 1:
                        // End:0x141
                        case 3:
                            SetDPadPerkState(I, 0);
                            // End:0x233
                            break;
                        // End:0x20A
                        case 2:
                            CachedPerks[I].CooldownPercent = 0.0000000;
                            CachedPerks[I].CooldownTime = PerkDeployable.GetCooldownTime() * (GetCooldownModifier());
                            CachedPerks[I].LastUsedTime = PerkDeployable.GetLastUsedTime();
                        // End:0x230
                        case 8:
                            SetDPadPerkState(I, int(PerkStatus));
                            // End:0x233
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }                    
                }
                else
                {
                    PerkNanoThief = LPPerkNanoThief(PerksManager.AssignedPerk[I].Perk);
                    // End:0x2FA
                    if(PerkNanoThief != none)
                    {
                        // End:0x2C0
                        if(bRecalculateCost)
                        {
                            PerkNanoThief.GetCost(true);
                        }
                        SetDPadPerkState(I, ((PerkNanoThief.HasIdentity()) ? 8 : 0));
                    }
                }
                I++;
                // [Loop Continue]
                goto J0x2D;
            }
        }
    }
    //return;    
}

function UpdateCooldown()
{
    local /*0x97E50000-0x00000000*/ private @NULL Perk, PerkDeployable;
    local /*0x97E50000-0x00000000*/ private float CooldownPercent, TimeSince;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x2CB
    if((GetPerksManager()) != none)
    {
        I = 0;
        J0x1B:

        // End:0x2CB [Loop If]
        if(I < 4)
        {
            // End:0x5C
            if(CachedPerks[I].CooldownPercent < float(0))
            {                
            }
            else
            {
                Perk = PerksManager.AssignedPerk[I].Perk;
                PerkDeployable = LPPerkDeployable(Perk);
                // End:0x2BD
                if(Perk != none)
                {
                    // End:0x2BD
                    if(PerkDeployable != none)
                    {
                        // End:0x2BD
                        if((CachedPerks[I].CooldownTime > float(0)) && CachedPerks[I].LastUsedTime > float(0))
                        {
                            TimeSince = Class'Engine.WorldInfo'.static.GetWorldInfo().TimeSeconds - CachedPerks[I].LastUsedTime;
                            // End:0x22E
                            if(TimeSince <= CachedPerks[I].CooldownTime)
                            {
                                CooldownPercent = TimeSince / CachedPerks[I].CooldownTime;
                                SetPerkCooldownPercent(I, CooldownPercent);                                
                            }
                            else
                            {
                                CachedPerks[I].CooldownPercent = -1.0000000;
                                CachedPerks[I].CooldownTime = -1.0000000;
                                CachedPerks[I].LastUsedTime = -1.0000000;
                                UpdatePerkStatus();
                            }
                        }
                    }
                }
            }
            I++;
            // [Loop Continue]
            goto J0x1B;
        }
    }
    //return;    
}

function GetCooldownModifier()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PerkTechnician;

    PerkTechnician = LPPerkTechnician(GetPerksManager().GetEnabledPerk(18));
    // End:0xD1
    if(PerkTechnician != none)
    {
        // End:0xC7
        if(CachedCooldownModifier < float(0))
        {
            CachedCooldownModifier = FMax(0.0000000, 1.0000000 - (PerkTechnician.TechnicianTuneData.CooldownTimeDecrease.GetValue(GetLPPC()) / float(100)));
        }
        return CachedCooldownModifier;
    }
    return 1.0000000;
    //return ReturnValue;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;

    bShouldBeActive = ShouldBeActive(DeltaTime);
    // End:0xBB
    if(!bShouldBeActive && PassivePerksLastShown >= float(0))
    {
        // End:0xBB
        if((GetLPPC().MyPlayerPawn == none) || !GetLPPC().MyPlayerPawn.IsAlive())
        {
            ShowPassivePerks(false);
            PassivePerksLastShown = -1.0000000;
        }
    }
    // End:0xD4
    if(!bPerkCostsInit)
    {
        InitPerkCosts();
    }
    // End:0x117
    if(bCachedShouldBeActive != bShouldBeActive)
    {
        Show(bShouldBeActive);
        bCachedShouldBeActive = bShouldBeActive;
    }
    // End:0x13F
    if(bShouldBeActive && !bMultiplayer)
    {
        UpdateCooldown();
    }
    // End:0x168
    if(bPassivePerksVisible && !ShouldShowPassivePerks())
    {
        ShowPassivePerks(false);
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function ShouldBeActive()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    bShouldBeActive = Update(DeltaTime);
    // End:0x38
    if(!bShouldBeActive)
    {
        return bShouldBeActive;
    }
    LPPC = GetLPPC();
    // End:0x72
    if(LPPC.MyPlayerPawn == none)
    {
        return false;
    }
    // End:0x104
    if((LPPC.MyPlayerPawn.Weapon != none) && SPInventoryWeapon(LPPC.MyPlayerPawn.Weapon).IsScopeActive())
    {
        return false;
    }
    // End:0x13F
    if(!LPPC.MyPlayerPawn.IsAliveAndWell())
    {
        return false;
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function NotifyThermalEnergyChanged()
{
    UpdatePerkStatus();
    //return;    
}

function NotifyDeploymentModeChanged()
{
    local /*0x97E50000-0x00000000*/ private bool bDeploymentModeActive[8388609];

    // End:0x41
    if(!bDeploymentModeActive && !GetPerksManager().bPerkDeployedOK)
    {
        UpdatePerkStatus();
    }
    //return;    
}

function NotifyPerkInventoryChanged()
{
    UpdatePerkStatus();
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x1A7
    if(DpadClusterMC != none)
    {
        // End:0xC7
        if(bShow)
        {
            DI = DpadClusterMC.GetDisplayInfo();
            DI.Visible = bShow;
            DpadClusterMC.SetDisplayInfo(DI);
            // End:0xAE
            if(ShouldShowPassivePerks())
            {
                ShowPassivePerks(true);
            }
            GoToIntro();
            ShouldDisplayOutro = true;            
        }
        else
        {
            bImmediate = true;
            // End:0xFE
            if(!bImmediate && ShouldDisplayOutro)
            {
                GoToOutro();                
            }
            else
            {
                DI = DpadClusterMC.GetDisplayInfo();
                DI.Visible = bShow;
                DpadClusterMC.SetDisplayInfo(DI);
                ShowPassivePerks(false);
                // End:0x19B
                if(bPendingInactive)
                {
                    SetActive(false, true);
                }
            }
            ShouldDisplayOutro = false;
        }
    }
    //return;    
}

function ShouldShowPassivePerks()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (bMultiplayer && (PassivePerksLastShown <= float(0)) || (PassivePerksLastShown + PassivePerksShowDuration) > GetLPPC().WorldInfo.TimeSeconds) && (CachedPerks[0].PerkClass != none) || CachedPerks[2].PerkClass != none;
    //return ReturnValue;    
}

function GoToIntro()
{
    // End:0x11
    if(DpadClusterMC == none)
    {
        return;
    }
    // End:0x4E
    if(ShouldDisplayOutro == false)
    {
        DpadClusterMC.ActionScriptVoid("GoToIntro");        
    }
    else
    {
        DpadClusterMC.ActionScriptVoid("ReInitialize");
    }
    //return;    
}

function GoToOutro()
{
    // End:0x11
    if(DpadClusterMC == none)
    {
        return;
    }
    DpadClusterMC.ActionScriptVoid("GoToOutro");
    //return;    
}

function SetDPadIcon()
{
    local /*0x97E50000-0x00000000*/ private int SlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL IconTexture[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ImagePath;

    // End:0x1C1
    if(CachedPerks[SlotIndex].HUDIconTexture != IconTexture)
    {
        // End:0x9A
        if(CachedPerks[SlotIndex].ImageLoader == none)
        {
            CachedPerks[SlotIndex].ImageLoader = GetPerkUILoader(SlotIndex);
        }
        // End:0x1C1
        if(CachedPerks[SlotIndex].ImageLoader != none)
        {
            // End:0x14D
            if(IconTexture != none)
            {
                ImagePath = "img://" $ PathName(IconTexture);
                CachedPerks[SlotIndex].ImageLoader.SetString("source", ImagePath);                
            }
            else
            {
                CachedPerks[SlotIndex].ImageLoader.ActionScriptVoid("unload");
            }
            CachedPerks[SlotIndex].HUDIconTexture = IconTexture;
        }
    }
    //return;    
}

function GetPerkUILoader()
{
    local /*0x97E50000-0x00000000*/ private int SlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MoviePlayer.ActionScriptObject("getPerkUILoader");
    //return ReturnValue;    
}

function SetDPadPerkHacked()
{
    local /*0x97E50000-0x00000000*/ private int SlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsHacked[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ImagePath;

    // End:0x1D8
    if(CachedPerks[SlotIndex].bIsHacked != bIsHacked)
    {
        CachedPerks[SlotIndex].bIsHacked = bIsHacked;
        // End:0xCE
        if(CachedPerks[SlotIndex].HackImageLoader == none)
        {
            CachedPerks[SlotIndex].HackImageLoader = GetHackUILoader(SlotIndex);
        }
        // End:0x1D8
        if(CachedPerks[SlotIndex].HackImageLoader != none)
        {
            // End:0x194
            if(bIsHacked)
            {
                ImagePath = "img://" $ PathName(PerksManager.HackTexture);
                CachedPerks[SlotIndex].HackImageLoader.SetString("source", ImagePath);                
            }
            else
            {
                CachedPerks[SlotIndex].HackImageLoader.ActionScriptVoid("unload");
            }
        }
    }
    //return;    
}

function GetHackUILoader()
{
    local /*0x97E50000-0x00000000*/ private int SlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MoviePlayer.ActionScriptObject("getHackUILoader");
    //return ReturnValue;    
}

function SetDPadPerkState()
{
    local /*0x97E50000-0x00000000*/ private int SlotIndex[8388609], PerkStateNum;

    // End:0xAA
    if((PerkStateNum == 1) || CachedPerks[SlotIndex].PerkStateNum != PerkStateNum)
    {
        MoviePlayer.ActionScriptVoid("setDpadPerkStateEnum");
        CachedPerks[SlotIndex].PerkStateNum = PerkStateNum;
    }
    //return;    
}

function SetPerkTENGCosts()
{
    local /*0x97E50000-0x00000000*/ private int CostActiveSlot1[8388609], CostActiveSlot3;

    MoviePlayer.ActionScriptVoid("SetPerkTENGCosts");
    //return;    
}

function SetPerkCooldownPercent()
{
    local /*0x97E50000-0x00000000*/ private int SlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float CooldownPercent[8388609];

    // End:0x9B
    if(CachedPerks[SlotIndex].CooldownPercent != CooldownPercent)
    {
        MoviePlayer.ActionScriptVoid("SetPerkCooldownPercent");
        CachedPerks[SlotIndex].CooldownPercent = CooldownPercent;
    }
    //return;    
}

function ShowPassivePerks()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0xAA
    if(bPassivePerksVisible != bShow)
    {
        bPassivePerksVisible = bShow;
        MoviePlayer.ActionScriptObject("showPassivePerks");
        // End:0xAA
        if(bShow)
        {
            PassivePerksLastShown = GetLPPC().WorldInfo.TimeSeconds;
        }
    }
    //return;    
}

function SetPassiveHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string HeaderText[8388609];

    MoviePlayer.ActionScriptVoid("setPassiveHeaderText");
    //return;    
}

function SetPassiveSlotText()
{
    local /*0x97E50000-0x00000000*/ private int SlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string PerkName[8388609], PerkDescription;

    // End:0xFD
    if((CachedPerks[SlotIndex].PerkName != PerkName) || CachedPerks[SlotIndex].PerkDescription != PerkDescription)
    {
        CachedPerks[SlotIndex].PerkName = PerkName;
        CachedPerks[SlotIndex].PerkDescription = PerkDescription;
        MoviePlayer.ActionScriptVoid("setPassiveSlotText");
    }
    //return;    
}

defaultproperties
{
    CachedPerks[0]=(PerkClass=none,HUDIconTexture=none,CooldownPercent=-1.0000000,CooldownTime=-1.0000000,LastUsedTime=-1.0000000,PerkStateNum=0,PerkName="",PerkDescription="",ImageLoader=none,HackImageLoader=none,bIsHacked=false)
    CachedPerks[1]=(PerkClass=none,HUDIconTexture=none,CooldownPercent=-1.0000000,CooldownTime=-1.0000000,LastUsedTime=-1.0000000,PerkStateNum=0,PerkName="",PerkDescription="",ImageLoader=none,HackImageLoader=none,bIsHacked=false)
    CachedPerks[2]=(PerkClass=none,HUDIconTexture=none,CooldownPercent=-1.0000000,CooldownTime=-1.0000000,LastUsedTime=-1.0000000,PerkStateNum=0,PerkName="",PerkDescription="",ImageLoader=none,HackImageLoader=none,bIsHacked=false)
    CachedPerks[3]=(PerkClass=none,HUDIconTexture=none,CooldownPercent=-1.0000000,CooldownTime=-1.0000000,LastUsedTime=-1.0000000,PerkStateNum=0,PerkName="",PerkDescription="",ImageLoader=none,HackImageLoader=none,bIsHacked=false)
    CachedCooldownModifier=-1.0000000
    PassivePerkHeaderText="ABILITIES"
}