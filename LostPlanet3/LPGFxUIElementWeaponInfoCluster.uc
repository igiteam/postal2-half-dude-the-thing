class LPGFxUIElementWeaponInfoCluster extends LPGFxUIElement;

struct native StatusMessage
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LineContainerMC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TextLineMC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TextMC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Y;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVisible;

    structdefaultproperties
    {
        LineContainerMC=none
        TextLineMC=none
        TextMC=none
        Y=0
        bVisible=false
    }
};

struct native StatusMessageInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVisible;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxMessages;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LineHeight;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StatusContainerMC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MessageLines;

    structdefaultproperties
    {
        bVisible=false
        MaxMessages=0
        LineHeight=0
        StatusContainerMC=none
        MessageLines=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WeaponInfoCluster;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PendingWeapon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PrimaryWeaponContainer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SecondaryWeaponContainer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PrimaryWeaponLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SecondaryWeaponLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PrimaryAttachedWeaponMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SecondaryAttachedWeaponMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrenadeContainer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AltAmmoContainer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL StatusUpdateMessages;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastShow;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastTurretMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayWeaponsMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTextfieldOffsetsSet;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastAmmoLeftInMagazine;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastAmmoLeftForWeapon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastMaxGrenades;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastNumGrenades;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTEnergyLevel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WeaponClusterRoot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CurrentAltAmmoTexturePath;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609], Message;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    super(SPGFxUIElement).Init(MP);
    WeaponClusterRoot = "_root.stagePanel.panel_Weapons.weapon";
    WeaponInfoCluster = MoviePlayer.GetVariableObject(WeaponClusterRoot);
    StatusUpdateMessages.StatusContainerMC = MoviePlayer.GetVariableObject("_root.stagePanel.panel_statusContainer.statusContainer");
    StatusUpdateMessages.MaxMessages = 5;
    I = 0;
    J0x116:

    // End:0x388 [Loop If]
    if(I < StatusUpdateMessages.MaxMessages)
    {
        Message.LineContainerMC = StatusUpdateMessages.StatusContainerMC.GetObject("line" $ string(I));
        Message.TextLineMC = Message.LineContainerMC.GetObject("statusText");
        Message.TextMC = Message.TextLineMC.GetObject("textField");
        Message.bVisible = false;
        DI = Message.LineContainerMC.GetDisplayInfo();
        Message.Y = int(DI.Y);
        DI.Visible = false;
        Message.LineContainerMC.SetDisplayInfo(DI);
        StatusUpdateMessages.MessageLines[I] = Message;
        ++I;
        // [Loop Continue]
        goto J0x116;
    }
    DI = StatusUpdateMessages.StatusContainerMC.GetDisplayInfo();
    DI.Visible = true;
    StatusUpdateMessages.StatusContainerMC.SetDisplayInfo(DI);
    StatusUpdateMessages.bVisible = true;
    StatusUpdateMessages.LineHeight = int(Abs(float(StatusUpdateMessages.MessageLines[1].Y - StatusUpdateMessages.MessageLines[0].Y)));
    // End:0x4F5
    if(GetLPPC().DoesPlayerCSAAllowWeapons())
    {
        ActionScriptSetTEMeterOnlyMode(false);        
    }
    else
    {
        ActionScriptSetTEMeterOnlyMode(true);
    }
    Reset();
    //return;    
}

function ResetShowState()
{
    bLastShow = true;
    LastAmmoLeftInMagazine = -1;
    LastAmmoLeftForWeapon = -1;
    LastMaxGrenades = -1;
    LastNumGrenades = -1;
    LastTEnergyLevel = -1.0000000;
    //return;    
}

function Reset()
{
    ResetShowState();
    //return;    
}

function PlayerDied()
{
    super(SPGFxUIElement).PlayerDied();
    Reset();
    //return;    
}

function RoundEnded()
{
    super(SPGFxUIElement).RoundEnded();
    Reset();
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD;
    local /*0x97E50000-0x00000000*/ private bool bShouldBeActive, bShouldShow;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0x109
    if(bShouldBeActive)
    {
        LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
        // End:0x109
        if(LPMPHUD != none)
        {
            bShouldShow = LPMPHUD.WeaponClusterShouldDisplay();
            // End:0xC3
            if(bShouldShow != bLastShow)
            {
                Show(bShouldShow);
                bLastShow = bShouldShow;
            }
            UpdateTurretMode();
            UpdateWithWeapon(LPMPHUD.GetCurrentWeapon());
            UpdateTENGMeter(DeltaTime);
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function UpdateTurretMode()
{
    local /*0x97E50000-0x00000000*/ private bool bTurretMode;

    // End:0x3A
    if(LPPlayerTurretPawn(GetLPPC().Pawn) != none)
    {
        bTurretMode = true;
    }
    // End:0x88
    if(bTurretMode != bLastTurretMode)
    {
        ActionScriptSetTurretMode(!bTurretMode);
        Refresh();
        bLastTurretMode = bTurretMode;
    }
    //return;    
}

function ActionScriptSetTurretMode()
{
    local /*0x97E50000-0x00000000*/ private bool bTurretMode[8388609];

    MoviePlayer.ActionScriptVoid("bSetMountedWeaponMode");
    //return;    
}

function ActionScriptSetTEMeterOnlyMode()
{
    local /*0x97E50000-0x00000000*/ private bool bTEMeterOnly[8388609];

    bDisplayWeaponsMode = !bTEMeterOnly;
    MoviePlayer.ActionScriptVoid("bSetTEMeterOnlyMode");
    //return;    
}

function UpdateWithWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL W[8388609], LPMPHUD, HUD;

    // End:0x2D
    if(StatusUpdateMessages.bVisible == true)
    {
        UpdateStatusMessages();
    }
    LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x5A
    if(LPMPHUD == none)
    {
        return;
    }
    HUD = LPHUD(LPMPHUD.myHUD);
    // End:0xF4
    if(((HUD == none) || int(HUD.GetDisplayState()) == int(4)) || int(HUD.GetDisplayState()) == int(3))
    {
        return;
    }
    UpdateAmmoLabelForWeapon(W);
    UpdateGrenadeLabel();
    //return;    
}

function UpdateGrenadeLabel()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string GrenadeString;
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn, GrenadeWeapon;
    local /*0x97E50000-0x00000000*/ private int MaxGrenades, NumGrenades;

    MaxGrenades = -1;
    NumGrenades = -1;
    PlayerPawn = LPPlayerPawn(GetLPPC().Pawn);
    // End:0xEA
    if(PlayerPawn != none)
    {
        GrenadeWeapon = PlayerPawn.GetGrenade();
        // End:0xEA
        if(GrenadeWeapon != none)
        {
            MaxGrenades = GrenadeWeapon.GetMaxAmmoForWeapon();
            NumGrenades = GrenadeWeapon.AmmoLeftForWeapon;
        }
    }
    // End:0x1B1
    if((NumGrenades != LastNumGrenades) || MaxGrenades != LastMaxGrenades)
    {
        // End:0x151
        if((NumGrenades == -1) || MaxGrenades == -1)
        {
            GrenadeString = "";            
        }
        else
        {
            GrenadeString = (string(NumGrenades) $ "/") $ string(MaxGrenades);
        }
        ActionScriptUpdateGrenadeLabel(GrenadeString);
        LastMaxGrenades = MaxGrenades;
        LastNumGrenades = NumGrenades;
    }
    //return;    
}

function ActionScriptUpdateGrenadeLabel()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string GrenadeString[8388609];

    // End:0x11
    if(!bDisplayWeaponsMode)
    {
        return;
    }
    MoviePlayer.ActionScriptVoid("setGrenadeAmmoCount");
    //return;    
}

function UpdateAmmoLabelForWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL W[8388609];
    local /*0x97E50000-0x00000000*/ private int AmmoLeftInMagazine, AmmoLeftForWeapon;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ammoString, ammoLeftInMagazineString, ammoLeftForWeaponString;

    AmmoLeftInMagazine = -99;
    AmmoLeftForWeapon = -99;
    // End:0x102
    if((W != none) && LPInventoryWeaponNone(W) == none)
    {
        // End:0x80
        if(LPWeaponParticleThrower(W) != none)
        {
            AmmoLeftInMagazine = -1;
            AmmoLeftForWeapon = -1;            
        }
        else
        {
            AmmoLeftInMagazine = W.AmmoLeftInMagazine;
            AmmoLeftForWeapon = ((W.GetMaxAmmoForWeapon() > -1) ? W.AmmoLeftForWeapon : -1);
        }
    }
    // End:0x221
    if((AmmoLeftForWeapon != LastAmmoLeftForWeapon) || AmmoLeftInMagazine != LastAmmoLeftInMagazine)
    {
        // End:0x169
        if((AmmoLeftForWeapon == -99) || AmmoLeftInMagazine == -99)
        {
            ammoString = "";            
        }
        else
        {
            ammoLeftInMagazineString = ((AmmoLeftInMagazine > -1) ? string(AmmoLeftInMagazine) : "--");
            ammoLeftForWeaponString = ((AmmoLeftForWeapon > -1) ? string(AmmoLeftForWeapon) : "--");
            ammoString = (ammoLeftInMagazineString $ "/") $ ammoLeftForWeaponString;
        }
        ActionScriptUpdateAmmoLabel(ammoString);
        LastAmmoLeftForWeapon = AmmoLeftForWeapon;
        LastAmmoLeftInMagazine = AmmoLeftInMagazine;
    }
    //return;    
}

function ActionScriptUpdateAmmoLabel()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ammoString[8388609];

    SetTextfieldOffsets();
    MoviePlayer.ActionScriptVoid("setCurrentWeaponAmmoCount");
    //return;    
}

function SetTextfieldOffsets()
{
    local /*0x97E50000-0x00000000*/ private @NULL textObj;
    local /*0x97E50000-0x00000000*/ private float textY, Offset;

    Offset = MoviePlayer.GetClusterTextYOffset();
    // End:0x254
    if(!bTextfieldOffsetsSet)
    {
        // End:0x248
        if(WeaponInfoCluster != none)
        {
            textObj = WeaponInfoCluster.GetObject("weaponText");
            // End:0xF0
            if(textObj != none)
            {
                textY = textObj.GetFloat("_y");
                textObj.SetFloat("_y", textY + Offset);
            }
            textObj = WeaponInfoCluster.GetObject("grenadeText");
            // End:0x19A
            if(textObj != none)
            {
                textY = textObj.GetFloat("_y");
                textObj.SetFloat("_y", textY + Offset);
            }
            textObj = WeaponInfoCluster.GetObject("tengDynamicText");
            // End:0x248
            if(textObj != none)
            {
                textY = textObj.GetFloat("_y");
                textObj.SetFloat("_y", textY + Offset);
            }
        }
        bTextfieldOffsetsSet = true;
    }
    //return;    
}

function GetStringForWeaponPickup()
{
    local /*0x97E50000-0x00000000*/ private class Inv[8388609];
    local /*0x97E50000-0x00000000*/ private int iCount[8388609], iIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], Str, countStr, itemStr;
    local /*0x97E50000-0x00000000*/ private @NULL WeaponTD;

    0
    Str = MoviePlayer.GetLocalizedString("<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_Pickup>");
    countStr = countStr $ string(iCount);
    // End:0x1FC
    if(ClassIsChildOf(Inv, Class'LPWeapon'))
    {
        // End:0x117
        if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) == int(NM_Standalone))
        {
            WeaponTD = class<LPWeapon>(Inv).default.TuneDataBaseWeapon;            
        }
        else
        {
            WeaponTD = class<LPWeapon>(Inv).default.TuneDataBaseWeapon_MP;
        }
        // End:0x1D1
        if((WeaponTD != none) && WeaponTD.SupportedAmmoTypes[iIndex] != none)
        {
            itemStr = WeaponTD.SupportedAmmoTypes[iIndex].FriendlyName;            
        }
        else
        {
            itemStr = Inv.default.PickupMessage;
        }        
    }
    else
    {
        itemStr = Inv.default.PickupMessage;
    }
    Str = Repl(Str, "<count>", countStr);
    Str = Repl(Str, "<item>", itemStr);
    return Str;
    //return ReturnValue;    
}

function SetUmbilicalState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    switch(NewState)
    {
        // End:0x31
        case 2:
            ResetShowState();
            SetActive(true);
            // End:0xA2
            break;
        // End:0x68
        case 3:
            SetActive(true);
            ResetShowState();
            // End:0x65
            if(WeaponInfoCluster != none)
            {
                GoToUmbilicalOn();
            }
            // End:0xA2
            break;
        // End:0x9F
        case 4:
            ResetShowState();
            // End:0x9C
            if(WeaponInfoCluster != none)
            {
                GoToUmbilicalOutro();
                bPendingInactive = true;
            }
            // End:0xA2
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function WeaponInfoClusterOutroComplete()
{
    // End:0x19
    if(bPendingInactive)
    {
        SetActive(false, true);
    }
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x89
    if(WeaponInfoCluster != none)
    {
        DI = WeaponInfoCluster.GetDisplayInfo();
        DI.Visible = bShow;
        WeaponInfoCluster.SetDisplayInfo(DI);
    }
    //return;    
}

function IsVisible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x11
    if(WeaponInfoCluster == none)
    {
        return false;
    }
    DI = WeaponInfoCluster.GetDisplayInfo();
    return DI.Visible;
    //return ReturnValue;    
}

function ChangedWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewWeapon[8388609], AmmoTuneData;
    local /*0x97E50000-0x00000000*/ private bool bIsNoneWeapon;

    PendingWeapon = NewWeapon;
    // End:0x44
    if(GetLPPC().DoesPlayerCSAAllowWeapons())
    {
        ActionScriptSetTEMeterOnlyMode(false);        
    }
    else
    {
        ActionScriptSetTEMeterOnlyMode(true);
    }
    WeaponInfoCluster.ActionScriptVoid("clearSecondaryAmmo");
    // End:0x12D
    if(PendingWeapon != none)
    {
        AmmoTuneData = PendingWeapon.TuneDataBaseWeapon.SupportedAmmoTypes[1];
        // End:0xF2
        if(AmmoTuneData != none)
        {
            setSecondaryAmmoType(AmmoTuneData);
        }
        setAmmoMode(PendingWeapon.AmmoTypeInfo.CurrentAmmoMode);
    }
    bIsNoneWeapon = NewWeapon == none;
    // End:0x15D
    if(!bIsNoneWeapon)
    {
        GoToWeaponSwitch();
    }
    //return;    
}

function HandlePickup()
{
    local /*0x97E50000-0x00000000*/ private class Inv[8388609];
    local /*0x97E50000-0x00000000*/ private int iCount[8388609], iIndex;

    0
    // End:0x2A
    if(ClassIsChildOf(Inv, Class'LPWeaponGrenade'))
    {
        GoToGrenadePickup();        
    }
    else
    {
        GoToWeaponPickup();
    }
    Refresh();
    // End:0x7C
    if(iCount > 0)
    {
        PostStatusMessage(GetStringForWeaponPickup(Inv, iCount, iIndex));
    }
    //return;    
}

function OnGiveInventory()
{
    Refresh();
    //return;    
}

function Refresh()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, LPIM;

    LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    LPIM = LPInventoryManager(GetLPPC().Pawn.InvManager);
    AttachWeaponClips(LPMPHUD.GetCurrentWeapon(), SPInventoryWeapon(LPIM.GetNextWeaponToDisplayForCluster()));
    //return;    
}

function WeaponIconSwitch()
{
    local /*0x97E50000-0x00000000*/ private int stage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, LPIM;

    LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    LPIM = LPInventoryManager(GetLPPC().Pawn.InvManager);
    // End:0xA7
    if(stage == 1)
    {
        AttachWeaponClips(PendingWeapon, LPMPHUD.GetCurrentWeapon());        
    }
    else
    {
        // End:0xF2
        if(stage == 2)
        {
            AttachWeaponClips(PendingWeapon, SPInventoryWeapon(LPIM.GetNextWeaponToDisplayForCluster()));
        }
    }
    //return;    
}

function NotifyDead()
{
    local /*0x97E50000-0x00000000*/ private int n1[8388609];

    setSecondaryAmmoType(none);
    setAmmoMode(0);
    //return;    
}

function setAmmoMode()
{
    local /*0x97E50000-0x00000000*/ private int I[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL container;

    ActionScriptSetAmmoMode(I > 0);
    ActionScriptSetAltAmmoTrayOpen(I > 0);
    container = GetAltAmmoContainer();
    // End:0xCB
    if(container != none)
    {
        // End:0xA4
        if((I > 0) && CurrentAltAmmoTexturePath != "")
        {
            container.SetString("source", CurrentAltAmmoTexturePath);            
        }
        else
        {
            container.ActionScriptVoid("unload");
        }
    }
    //return;    
}

function ActionScriptSetAltAmmoTrayOpen()
{
    local /*0x97E50000-0x00000000*/ private bool bOpenTray[8388609];

    MoviePlayer.ActionScriptVoid("bSetAltAmmoTrayOpen");
    //return;    
}

function ActionScriptSetStoredAmmoMode()
{
    local /*0x97E50000-0x00000000*/ private bool bAltAmmoIsActive[8388609];

    MoviePlayer.ActionScriptVoid("bSetStoredAltAmmoActive");
    //return;    
}

function ActionScriptSetAmmoMode()
{
    local /*0x97E50000-0x00000000*/ private bool bAltAmmoIsActive[8388609];

    MoviePlayer.ActionScriptVoid("bSetCurrentAltAmmoActive");
    //return;    
}

function setSecondaryAmmoType()
{
    local /*0x97E50000-0x00000000*/ private @NULL AmmoTuneData[8388609];

    // End:0x74
    if((AmmoTuneData != none) && AmmoTuneData.AmmoTypeIcon != none)
    {
        CurrentAltAmmoTexturePath = "img://" $ PathName(AmmoTuneData.AmmoTypeIcon);        
    }
    else
    {
        CurrentAltAmmoTexturePath = "";
    }
    //return;    
}

function ShowAmmoSwitchProgress()
{
    local /*0x97E50000-0x00000000*/ private float progressPercent[8388609];
    local /*0x97E50000-0x00000000*/ private int CurrentAmmoMode[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string switchTo;

    progressPercent = FClamp(progressPercent, 0.0000000, 1.0000000);
    // End:0xA7
    if(PendingWeapon != none)
    {
        // End:0x77
        if(PendingWeapon.AmmoTypeInfo.CurrentAmmoMode == 0)
        {
            switchTo = "alt";            
        }
        else
        {
            switchTo = "standard";
        }
        ActionScriptShowAmmoSwitchProgress(progressPercent, switchTo);
    }
    //return;    
}

function ActionScriptShowAmmoSwitchProgress()
{
    local /*0x97E50000-0x00000000*/ private float progressPercent[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string switchTo[8388609];

    MoviePlayer.ActionScriptVoid("setAltAmmoProgress");
    //return;    
}

function AttachWeaponClips()
{
    local /*0x97E50000-0x00000000*/ private @NULL SecondaryWeap[8388609], PrimaryWeap;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PrimaryWeaponClipName, SecondaryWeaponClipName, GrenadeClipName;
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon, PlayerPawn, container, DI, TDUnloadedPrimary, TDUnloadedSecondary,
	    TDUnloadedGrenade;

    PlayerPawn = LPPlayerPawn(GetLPPC().Pawn);
    GrenadeWeapon = PlayerPawn.GetGrenade();
    // End:0x7D
    if(SecondaryWeap == PrimaryWeap)
    {
        PrimaryWeap = none;
    }
    // End:0xBD
    if(PrimaryWeap != none)
    {
        TDUnloadedPrimary = LPWeapon(PrimaryWeap).TuneDataUnloadedWeaponInfo;
    }
    // End:0xFD
    if(SecondaryWeap != none)
    {
        TDUnloadedSecondary = LPWeapon(SecondaryWeap).TuneDataUnloadedWeaponInfo;
    }
    // End:0x134
    if(GrenadeWeapon != none)
    {
        TDUnloadedGrenade = GrenadeWeapon.TuneDataUnloadedWeaponInfo;
    }
    container = GetPrimaryWeaponContainer();
    // End:0x3B4
    if(container != none)
    {
        PrimaryWeaponClipName = GetIconTexturePathForWeapon(PrimaryWeap);
        // End:0x37A
        if(PrimaryWeaponClipName != "")
        {
            container.SetString("source", PrimaryWeaponClipName);
            // End:0x377
            if(TDUnloadedPrimary != none)
            {
                DI = container.GetDisplayInfo();
                DI.X = TDUnloadedPrimary.WeaponClusterOffset.Offset.X;
                DI.Y = TDUnloadedPrimary.WeaponClusterOffset.Offset.Y;
                DI.XScale = float(TDUnloadedPrimary.WeaponClusterOffset.Scale);
                DI.YScale = float(TDUnloadedPrimary.WeaponClusterOffset.Scale);
                container.SetDisplayInfo(DI);
            }            
        }
        else
        {
            container.ActionScriptVoid("unload");
        }
        UpdateAmmoLabelForWeapon(PrimaryWeap);
    }
    container = GetSecondaryWeaponContainer();
    // End:0x621
    if(container != none)
    {
        SecondaryWeaponClipName = GetIconTexturePathForWeapon(SecondaryWeap);
        // End:0x5FA
        if(SecondaryWeaponClipName != "")
        {
            container.SetString("source", SecondaryWeaponClipName);
            // End:0x5F7
            if(TDUnloadedSecondary != none)
            {
                DI = container.GetDisplayInfo();
                DI.X = TDUnloadedSecondary.WeaponClusterOffset.Offset.X;
                DI.Y = TDUnloadedSecondary.WeaponClusterOffset.Offset.Y;
                DI.XScale = float(TDUnloadedSecondary.WeaponClusterOffset.Scale);
                DI.YScale = float(TDUnloadedSecondary.WeaponClusterOffset.Scale);
                container.SetDisplayInfo(DI);
            }            
        }
        else
        {
            container.ActionScriptVoid("unload");
        }
    }
    container = GetGrenadeContainer();
    // End:0x88E
    if(container != none)
    {
        GrenadeClipName = GetIconTexturePathForWeapon(GrenadeWeapon);
        // End:0x867
        if(GrenadeClipName != "")
        {
            container.SetString("source", GrenadeClipName);
            // End:0x864
            if(TDUnloadedGrenade != none)
            {
                DI = container.GetDisplayInfo();
                DI.X = TDUnloadedGrenade.WeaponClusterOffset.Offset.X;
                DI.Y = TDUnloadedGrenade.WeaponClusterOffset.Offset.Y;
                DI.XScale = float(TDUnloadedGrenade.WeaponClusterOffset.Scale);
                DI.YScale = float(TDUnloadedGrenade.WeaponClusterOffset.Scale);
                container.SetDisplayInfo(DI);
            }            
        }
        else
        {
            container.ActionScriptVoid("unload");
        }
    }
    //return;    
}

function GetPrimaryWeaponContainer()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x52
    if(PrimaryWeaponContainer == none)
    {
        PrimaryWeaponContainer = MoviePlayer.ActionScriptObject("getCurrentWeaponUILoader");
    }
    return PrimaryWeaponContainer;
    //return ReturnValue;    
}

function GetGrenadeContainer()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x4C
    if(GrenadeContainer == none)
    {
        GrenadeContainer = MoviePlayer.ActionScriptObject("getGrenadeUILoader");
    }
    return GrenadeContainer;
    //return ReturnValue;    
}

function GetSecondaryWeaponContainer()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x51
    if(SecondaryWeaponContainer == none)
    {
        SecondaryWeaponContainer = MoviePlayer.ActionScriptObject("getStoredWeaponUILoader");
    }
    return SecondaryWeaponContainer;
    //return ReturnValue;    
}

function GetAltAmmoContainer()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x4C
    if(AltAmmoContainer == none)
    {
        AltAmmoContainer = MoviePlayer.ActionScriptObject("getAltAmmoUILoader");
    }
    return AltAmmoContainer;
    //return ReturnValue;    
}

function GetMovieClipNameForWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL W[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return W.HUDIconName;
    //return ReturnValue;    
}

function GetIconTexturePathForWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL W[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int UpgradeIdx;
    local /*0x97E50000-0x00000000*/ private editfixedsize string imgString;

    imgString = "";
    // End:0x151
    if((W != none) && W.HUDIconTexture != none)
    {
        UpgradeIdx = 0;
        J0x4C:

        // End:0x105 [Loop If]
        if(UpgradeIdx < W.Upgrades.Length)
        {
            // End:0xF7
            if(W.Upgrades[UpgradeIdx].bEnabled)
            {
                imgString = "img://" $ PathName(W.HUDIconUpgradeTexture);
                // [Explicit Break]
                goto J0x105;
            }
            UpgradeIdx++;
            // [Loop Continue]
            goto J0x4C;
        }
        J0x105:

        // End:0x151
        if(imgString == "")
        {
            imgString = "img://" $ PathName(W.HUDIconTexture);
        }
    }
    return imgString;
    //return ReturnValue;    
}

function GoToUmbilicalOn()
{
    MoviePlayer.ActionScriptVoid("GoToUmbilicalOn");
    //return;    
}

function GoToUmbilicalOutro()
{
    MoviePlayer.ActionScriptVoid("GoToUmbilicalOutro");
    //return;    
}

function GoToWeaponSwitch()
{
    MoviePlayer.ActionScriptVoid("swapWeapons");
    //return;    
}

function GoToGrenadePickup()
{
    MoviePlayer.ActionScriptVoid("playReloadGrenadeAnim");
    //return;    
}

function GoToWeaponPickup()
{
    MoviePlayer.ActionScriptVoid("playReloadWeaponAnim");
    //return;    
}

function GoToStatusMessageShow()
{
    local /*0x97E50000-0x00000000*/ private @NULL Message[8388609];

    Message.ActionScriptVoid("GoToStatusMessageShow");
    //return;    
}

function StatusMessageReset()
{
    local /*0x97E50000-0x00000000*/ private @NULL Message[8388609];

    Message.ActionScriptVoid("StatusMessageReset");
    //return;    
}

function setPlayerTENG()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string strEng[8388609];

    MoviePlayer.ActionScriptVoid("setPlayerTENG");
    //return;    
}

function UpdateStatusMessages()
{
    local /*0x97E50000-0x00000000*/ private @NULL DI;
    local /*0x97E50000-0x00000000*/ private int I, iFound;

    // End:0x24
    if(!StatusUpdateMessages.bVisible)
    {
        return;
    }
    // End:0x5E
    if(StatusUpdateMessages.MessageLines[0].bVisible == false)
    {
        return;
    }
    iFound = -1;
    I = StatusUpdateMessages.MaxMessages - 1;
    J0x96:

    // End:0x106 [Loop If]
    if(I >= 0)
    {
        // End:0xF8
        if(StatusUpdateMessages.MessageLines[I].bVisible)
        {
            iFound = I;
            // [Explicit Break]
            goto J0x106;
        }
        --I;
        // [Loop Continue]
        goto J0x96;
    }
    J0x106:

    // End:0x117
    if(iFound < 0)
    {
        return;
    }
    DI = StatusUpdateMessages.MessageLines[iFound].TextLineMC.GetDisplayInfo();
    // End:0x196
    if(DI.Alpha > float(0))
    {
        return;
    }
    StatusUpdateMessages.MessageLines[iFound].bVisible = false;
    DI = StatusUpdateMessages.MessageLines[iFound].LineContainerMC.GetDisplayInfo();
    DI.Visible = false;
    StatusUpdateMessages.MessageLines[iFound].LineContainerMC.SetDisplayInfo(DI);
    //return;    
}

function PostStatusMessage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageString[8388609];
    local /*0x97E50000-0x00000000*/ private int iFreeMessage, I;
    local /*0x97E50000-0x00000000*/ private @NULL DI, Message;

    // End:0x12
    if(MessageString == "")
    {
        return;
    }
    // End:0x36
    if(!StatusUpdateMessages.bVisible)
    {
        return;
    }
    iFreeMessage = StatusUpdateMessages.MaxMessages - 1;
    // End:0x9E
    if(StatusUpdateMessages.MessageLines[iFreeMessage].bVisible)
    {
        return;
    }
    Message = StatusUpdateMessages.MessageLines[iFreeMessage];
    StatusUpdateMessages.MessageLines.Remove(iFreeMessage, 1);    
    Message.bVisible = true;
    Message.Y = 0;
    DI = Message.LineContainerMC.GetDisplayInfo();
    DI.Visible = true;
    DI.Y = float(Message.Y);
    Message.LineContainerMC.SetDisplayInfo(DI);
    Message.TextMC.SetText(MessageString);
    GoToStatusMessageShow(Message.LineContainerMC);
    StatusUpdateMessages.MessageLines.InsertItem(0, Message);    
    I = 1;
    J0x29B:

    // End:0x417 [Loop If]
    if(I < StatusUpdateMessages.MaxMessages)
    {
        StatusUpdateMessages.MessageLines[I].Y -= StatusUpdateMessages.LineHeight;
        DI = StatusUpdateMessages.MessageLines[I].LineContainerMC.GetDisplayInfo();
        DI.Y -= float(StatusUpdateMessages.LineHeight);
        StatusUpdateMessages.MessageLines[I].LineContainerMC.SetDisplayInfo(DI);
        ++I;
        // [Loop Continue]
        goto J0x29B;
    }
    //return;    
}

function ResetStatusMessages()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    I = 0;
    J0x0B:

    // End:0x1E4 [Loop If]
    if(I < StatusUpdateMessages.MaxMessages)
    {
        StatusUpdateMessages.MessageLines[I].bVisible = false;
        DI = StatusUpdateMessages.MessageLines[I].LineContainerMC.GetDisplayInfo();
        DI.Visible = false;
        StatusUpdateMessages.MessageLines[I].LineContainerMC.SetDisplayInfo(DI);
        StatusMessageReset(StatusUpdateMessages.MessageLines[I].LineContainerMC);
        StatusUpdateMessages.MessageLines[I].TextMC.SetText("");
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function PickedUpThermalEnergy()
{
    //return;    
}

function UpdateTENGMeter()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private int playerEnergyMax;
    local /*0x97E50000-0x00000000*/ private float DisplayedTENG;

    LPP = LPPlayerPawn(GetLPPC().Pawn);
    // End:0xE2
    if(LPP != none)
    {
        playerEnergyMax = int(LPP.GetMaxTEnergyCapacity());
        DisplayedTENG = LPP.TEnergyLevel * float(playerEnergyMax);
        // End:0xE2
        if(DisplayedTENG != LastTEnergyLevel)
        {
            setPlayerTENG(string(int(DisplayedTENG)));
            LastTEnergyLevel = DisplayedTENG;
        }
    }
    //return;    
}
