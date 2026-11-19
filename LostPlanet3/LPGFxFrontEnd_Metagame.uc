class LPGFxFrontEnd_Metagame extends SPGFxUIView within GFxMoviePlayer
    config(UI);

struct WidgetInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name InputWidgetName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InputWidget;

    structdefaultproperties
    {
        InputWidgetName="None"
        InputWidget=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array WidgetInfoList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MetagameManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPGFxMovie_Metagame[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPGFxMovie_FrontEnd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InfoPanelImageLoader;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFrontInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSphereInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHelpInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHelpVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPurchasing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNavigating;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSaveToProfile;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSaveProfile;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMatchStartingTimerShown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUnloadedWeaponClasses;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PurchaseCandidate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DirectorCamParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DirectorTransitionParam;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name LookFromNoteTag;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name LookAtNoteTag;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UnlockLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TrackLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NoTrackLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ClassLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BackLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL KitSelectionLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MetagameLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TutorialLabel;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL dummyButton;

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    bPurchasing = false;
    ShowFrontOnSphere(false);
    SetScreenMode(true);
    InitCamera();
    InitMetagame();
    dummyButton = GetObject("dummyButton");
    MenuViewLoader.SetSelectionFocus(dummyButton);
    MoviePlayer.SetExternalInterface(self);
    RepositionButtonPrompts();
    CheckTutorial();
    //return;    
}

function OnViewLoaded()
{
    super.OnViewLoaded();
    InitCamera();
    //return;    
}

function NotifyUsingGamepad()
{
    local /*0x97E50000-0x00000000*/ private bool bGamepad[8388609];

    RefreshButtonPrompts();
    //return;    
}

function RefreshButtonPrompts()
{
    // End:0x63
    if(MoveLabel != none)
    {
        MoveLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonSelect>"));
    }
    // End:0xC8
    if(UnlockLabel != none)
    {
        UnlockLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.Unlock>"));
    }
    // End:0x12C
    if(TrackLabel != none)
    {
        TrackLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.Track>"));
    }
    // End:0x192
    if(NoTrackLabel != none)
    {
        NoTrackLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.NoTrack>"));
    }
    // End:0x1F6
    if(ClassLabel != none)
    {
        ClassLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.Class>"));
    }
    // End:0x257
    if(BackLabel != none)
    {
        BackLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
    }
    // End:0x2C2
    if(KitSelectionLabel != none)
    {
        KitSelectionLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.KitSelection>"));
    }
    // End:0x329
    if(MetagameLabel != none)
    {
        MetagameLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.Metagame>"));
    }
    // End:0x390
    if(TutorialLabel != none)
    {
        TutorialLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.Tutorial>"));
    }
    RepositionButtonPrompts();
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bWasHandled;

    bWasHandled = true;
    switch(WidgetName)
    {
        // End:0x4B
        case 'MoveLabel':
            MoveLabel = Widget;
            RefreshButtonPrompts();
            // End:0x1BD
            break;
        // End:0x77
        case 'UnlockLabel':
            UnlockLabel = Widget;
            RefreshButtonPrompts();
            // End:0x1BD
            break;
        // End:0xA3
        case 'TrackLabel':
            TrackLabel = Widget;
            RefreshButtonPrompts();
            // End:0x1BD
            break;
        // End:0xCF
        case 'NoTrackLabel':
            NoTrackLabel = Widget;
            RefreshButtonPrompts();
            // End:0x1BD
            break;
        // End:0xFB
        case 'ClassLabel':
            ClassLabel = Widget;
            RefreshButtonPrompts();
            // End:0x1BD
            break;
        // End:0x127
        case 'BackLabel':
            BackLabel = Widget;
            RefreshButtonPrompts();
            // End:0x1BD
            break;
        // End:0x153
        case 'KitSelectionLabel':
            KitSelectionLabel = Widget;
            RefreshButtonPrompts();
            // End:0x1BD
            break;
        // End:0x17F
        case 'MetagameLabel':
            MetagameLabel = Widget;
            RefreshButtonPrompts();
            // End:0x1BD
            break;
        // End:0x1AB
        case 'TutorialLabel':
            TutorialLabel = Widget;
            RefreshButtonPrompts();
            // End:0x1BD
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x1BD
            break;
            break;
    }
    // End:0x1FF
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);        
    }
    return bWasHandled;
    //return ReturnValue;    
}

function NotifyViewLoaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL View[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHandled;

    bHandled = super.NotifyViewLoaded(View);
    // End:0xE4
    if(bHandled == false)
    {
        // End:0xE4
        if((MenuViewLoader.PendingViewLoad.ViewName == 'InfoDialog') && View.ViewName == 'InfoDialog')
        {
            SetUpConfirm(LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false)));
            bHandled = true;
        }
    }
    return bHandled;
    //return ReturnValue;    
}

function MoveBackImpl()
{
    // End:0xF0
    if(CanExit())
    {
        Cleanup();
        // End:0xB2
        if(bUnloadedWeaponClasses)
        {
            MyLPGFxMovie_FrontEnd.SuspendRendering();
            Class'Engine.WorldInfo'.static.GetWorldInfo().ForceGarbageCollection(true);
            MyPC.SetTimer(0.0500000, false, 'LoadWeaponsAndExit', self);
            bUnloadedWeaponClasses = false;            
        }
        else
        {
            MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
        }
    }
    //return;    
}

function LoadWeaponsAndExit()
{
    MyPC.LoadWeaponClasses();
    MyPC.SetTimer(0.0500000, true, 'CheckWeaponsLoadedAndExit', self);
    //return;    
}

function CheckWeaponsLoadedAndExit()
{
    // End:0xB9
    if(MyPC.AreAllWeaponClassesLoaded())
    {
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
        MyPC.ClearTimer('CheckWeaponsLoadedAndExit', self);
        MyPC.SetTimer(0.4000000, false, 'ResumeRendering', MyLPGFxMovie_FrontEnd);
    }
    //return;    
}

function CanExit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((MenuViewLoader != none) && bFrontInit) && bSphereInit;
    //return ReturnValue;    
}

function OnEscapeKeyPress()
{
    MoveBackImpl();
    //return;    
}

function OnViewClosed()
{
    Cleanup();
    super.OnViewClosed();
    //return;    
}

function Cleanup()
{
    SetMainMenuVisible(true);
    PlayCloseAnimation();
    // End:0x9C
    if(bSaveToProfile || bSaveProfile)
    {
        // End:0x7D
        if(bSaveToProfile)
        {
            MetagameManager.SaveUnlockablesToProfile();
            MyPRI.UpdateMPPlayerInfo();
        }
        MyPC.SaveProfile();
    }
    bSaveToProfile = false;
    bSaveProfile = false;
    // End:0x130
    if(MyLPGFxMovie_Metagame != none)
    {
        CancelNavAll();
        ShowClassesAll(false, true);
        MyLPGFxMovie_Metagame.PlaySoundFromTheme('Exit');
        MyLPGFxMovie_Metagame.Close(true);
        MyLPGFxMovie_Metagame = none;        
    }
    else
    {
        CancelNav();
        ShowClasses(false, true);
    }
    bSphereInit = false;
    SetCenter(0, 0);
    DirectorCamParams.LookAtTarget = none;
    DirectorCamParams.PositionTarget = none;
    //return;    
}

function CheckForProgressAchievements()
{
    // End:0x13C
    if(MyPRI != none)
    {
        // End:0x72
        if(MetagameManager.GetMetagameRank() > 0)
        {
            MyPRI.AchievementManager.SetAchievementValue('Big_Bang', 1);
        }
        // End:0xD7
        if(MetagameManager.GetPlayerUnlockCount() >= 30)
        {
            MyPRI.AchievementManager.SetAchievementValue('Sphere_We_Go', 30);
        }
        // End:0x13C
        if(MetagameManager.GetPlayerUnlockCount() >= 101)
        {
            MyPRI.AchievementManager.SetAchievementValue('Sphere_Complete', 101);
        }
    }
    //return;    
}

function InitMetagame()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cell, Unlockable;
    local /*0x97E50000-0x00000000*/ private bool bIsUnlocked, bIsTracked, bIsHighlighted, bIsConsoleBuild;
    local /*0x97E50000-0x00000000*/ private float UnlockProgress;
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedTitle, LocalizedSubHeading, LocalizedDescription, LocalizedUnlockTypeText, LocalizedUnlockText, Prereq1,
	    Prereq2, Prereq3;

    local /*0x97E50000-0x00000000*/ private int I;

    MyLPGFxMovie_FrontEnd = LPGFxMoviePlayerFrontEndManager(MoviePlayer);
    MyPC = LPPlayerController(MoviePlayer.GetPC());
    // End:0x5F
    if(MyPC == none)
    {
        return;
    }
    MyPRI = LPMenuGamePRI(MyPC.PlayerReplicationInfo);
    MetagameManager = MyPC.GetMetagameManager();
    // End:0xF0
    if((MetagameManager == none) || !MetagameManager.bUpdatedFromProfile)
    {
        return;
    }
    CheckForProgressAchievements();
    // End:0x118
    if(bFrontInit && bSphereInit)
    {
        return;
    }
    bIsConsoleBuild = Class'Engine.WorldInfo'.static.IsConsoleBuild(0);
    // End:0x242
    if(bIsConsoleBuild && bIsTopView)
    {
        MyLPGFxMovie_FrontEnd.SuspendRendering();
        // End:0x242
        if(!bUnloadedWeaponClasses && Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
        {
            MyPC.UnloadWeaponClasses();
            Class'Engine.WorldInfo'.static.GetWorldInfo().ForceGarbageCollection(true);
            MyPC.SetTimer(0.0500000, false, 'InitMetagame', self);
            bUnloadedWeaponClasses = true;
            return;
        }
    }
    // End:0x4CB
    if(!bFrontInit)
    {
        InitFrontPlate();
        SetEDNText(GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.EdenIII>"));
        SetClassNameText(GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.ClassA>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.ClassB>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.ClassC>"));
        SetCompletionText(GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.Completion>"));
        SetCostText(GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.CurrentCredits>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.CellCost>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.Progress>"));
        SetSecretCellText(GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.SecretCellTitle>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameUI.SecretCellDesc>"));
    }
    // End:0x4F3
    if(!bSphereInit && bIsTopView)
    {
        InitSphere();
    }
    I = 0;
    J0x4FE:

    // End:0xECC [Loop If]
    if(I < Class'LPMetagameDefinitions'.default.Cells.Length)
    {
        Cell = Class'LPMetagameDefinitions'.default.Cells[I];
        // End:0x580
        if(Cell.bNoDisplayCell)
        {            
        }
        else
        {
            Unlockable = MetagameManager.GetMetagameData(Cell.CellName);
            UnlockProgress = FClamp(MetagameManager.GetUnlockProgress(Cell.CellName), 0.0000000, Cell.StatAmount);
            bIsUnlocked = Unlockable.IsUnlocked();
            bIsTracked = Unlockable.IsTracked();
            bIsHighlighted = (Cell.RewardType == 'Weapon') || Cell.RewardType == 'None';
            Prereq1 = ((Cell.Prerequisite1 == 'None') ? "" : string(Cell.Prerequisite1));
            Prereq2 = ((Cell.Prerequisite2 == 'None') ? "" : string(Cell.Prerequisite2));
            Prereq3 = ((Cell.Prerequisite3 == 'None') ? "" : string(Cell.Prerequisite3));
            // End:0xD1C
            if(!bFrontInit)
            {
                LocalizedTitle = GetLocalizedString(("<Strings:LostPlanetGame.Metagame." $ string(Cell.CellName)) $ "_Title>");
                LocalizedTitle = ((InStr(LocalizedTitle, "?") == 0) ? "" : LocalizedTitle);
                LocalizedSubHeading = GetLocalizedString(("<Strings:LostPlanetGame.Metagame." $ string(Cell.CellName)) $ "_Sub>");
                LocalizedSubHeading = ((InStr(LocalizedSubHeading, "?") == 0) ? "" : LocalizedSubHeading);
                LocalizedUnlockTypeText = ((Cell.UnlockType != 'None') ? GetLocalizedString(("<Strings:LostPlanetGame.MetagameUI." $ string(Cell.UnlockType)) $ ">") : "");
                LocalizedUnlockTypeText = ((InStr(LocalizedUnlockTypeText, "?") == 0) ? "" : LocalizedUnlockTypeText);
                LocalizedDescription = GetLocalizedString(("<Strings:LostPlanetGame.Metagame." $ string(Cell.CellName)) $ "_Desc>");
                LocalizedDescription = GetLocalizedString(LocalizedDescription);
                LocalizedDescription = ((InStr(LocalizedDescription, "?") == 0) ? "" : LocalizedDescription);
                LocalizedUnlockText = GetLocalizedString(("<Strings:LostPlanetGame.Metagame." $ string(Cell.CellName)) $ "_Unlock>");
                LocalizedUnlockText = ((InStr(LocalizedUnlockText, "?") == 0) ? "" : LocalizedUnlockText);
                AddCell(I, string(Cell.CellName), Cell.CellX, Cell.CellY, LocalizedTitle, LocalizedSubHeading, LocalizedDescription, string(Cell.Image), string(Cell.RewardType), bIsUnlocked, string(Cell.UnlockType), LocalizedUnlockTypeText, string(Cell.UnlockStat), Cell.StatAmount, UnlockProgress, LocalizedUnlockText, Cell.IssuedTime, Cell.ActiveTime, Cell.CreditCost, Cell.CreditReward, Cell.bSecretCell, Prereq1, Prereq2, Prereq3, bIsTracked, bIsHighlighted, string(Cell.RewardClass));
            }
            // End:0xEBE
            if(!bSphereInit && bIsTopView)
            {
                MyLPGFxMovie_Metagame.AddBGCell(string(Cell.CellName), Cell.CellX, Cell.CellY, string(Cell.Image), string(Cell.RewardType), bIsUnlocked, string(Cell.UnlockType), Cell.StatAmount, UnlockProgress, Cell.CreditCost, Cell.bSecretCell, Prereq1, Prereq2, Prereq3, bIsTracked, bIsHighlighted, string(Cell.RewardClass));
            }
        }
        I++;
        // [Loop Continue]
        goto J0x4FE;
    }
    bFrontInit = true;
    bSphereInit = bIsTopView;
    EnableCheats(false);
    // End:0xF4B
    if(bIsTopView)
    {
        UpdateDisplay();
        // End:0xF3C
        if(bIsConsoleBuild)
        {
            MyLPGFxMovie_FrontEnd.ResumeRendering();
        }
        SetMainMenuVisible(false);        
    }
    MyLPGFxMovie_FrontEnd.QueryBackgroundVisibility();
    //return;    
}

function InitCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPN;

    MyPC = LPPlayerController(MoviePlayer.GetPC());
    // End:0x43
    if(MyPC == none)
    {
        return;
    }
    // End:0x143
    foreach MyPC.AllActors(Class'LPNote', LPN)
    {
        // End:0xC5
        if(LPN.Tag == LookFromNoteTag)
        {
            DirectorCamParams.PositionTarget = LPN;
        }
        // End:0x142
        if(LPN.Tag == LookAtNoteTag)
        {
            DirectorCamParams.LookAtTarget = LPN;
            MyPC.SetViewTarget(LPN);
        }        
    }    
    MyPC.SetCinematicMode(true, true, true, true, true, true);
    MyPC.ChangeCameraMode(DirectorCamParams, DirectorTransitionParam);
    DirectorCamParams.PositionTarget = none;
    DirectorCamParams.LookAtTarget = none;
    //return;    
}

function InitFrontPlate()
{
    ActionScriptVoid("InitFrontPlate");
    //return;    
}

function InitSphere()
{
    local /*0x97E50000-0x00000000*/ private class MetagameSphereClass;
    local /*0x97E50000-0x00000000*/ private @NULL MetagameRenderTexture, GFxFlashMovieInstance_Metagame;

    // End:0x159
    if(MyLPGFxMovie_Metagame == none)
    {
        MetagameSphereClass = class<LPGFxMoviePlayerMetagame>(DynamicLoadObject("LostPlanetGameContent.LPGFxMoviePlayerMetagameContent", Class'Core.Class'));
        MetagameRenderTexture = MetagameSphereClass.default.MetagameRenderTexture;
        Class'SPGfx.SPGFxMoviePlayer'.static.StartSPGFxMoviePlayer(self, MetagameSphereClass.default.MetagameSphereSWF, MetagameSphereClass, MoviePlayer.LocalPlayerOwnerIndex, GFxFlashMovieInstance_Metagame, 1,, MetagameRenderTexture, 1);
        MyLPGFxMovie_Metagame = LPGFxMoviePlayerMetagame(GFxFlashMovieInstance_Metagame);
        MyLPGFxMovie_Metagame.Parent = MoviePlayer;        
    }
    else
    {
        MyLPGFxMovie_Metagame.Start(false);
    }
    // End:0x20A
    if(MetagameRenderTexture != none)
    {
        MyLPGFxMovie_Metagame.SetViewScaleMode(1);
        MyLPGFxMovie_Metagame.SetAspectRatio(float(MetagameRenderTexture.SizeY) / float(MetagameRenderTexture.SizeX));
    }
    MyLPGFxMovie_Metagame.PlaySoundFromTheme('Enter');
    MyLPGFxMovie_Metagame.InitSphere();
    //return;    
}

function CheckTutorial()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPS;

    // End:0xAC
    if(MyPC != none)
    {
        LPPS = LPProfileSettings(MyPC.ProfileSettings);
        // End:0xAC
        if((LPPS != none) && !LPPS.HasSeenMetagameTutorial())
        {
            LPPS.SetViewedMetagameTutorial(true);
            bSaveProfile = true;
            ShowHelp(true);
        }
    }
    //return;    
}

function UpdateDisplay()
{
    UpdateCompletionPercent();
    UpdateCreditsAll();
    UpdateAdjacentsAll();
    UpdateTrackedUnlockableAll();
    UpdateCellsAll();
    RepositionButtonPrompts();
    //return;    
}

function UpdateCellsAll()
{
    UpdateCells();
    MyLPGFxMovie_Metagame.UpdateCells();
    //return;    
}

function UpdateCreditsAll()
{
    local /*0x97E50000-0x00000000*/ private int Credits;

    Credits = MyPRI.GetMPCreditsEarned();
    SetCredits(Credits);
    MyLPGFxMovie_Metagame.SetCredits(Credits);
    //return;    
}

function UpdateAdjacentsAll()
{
    UpdateAdjacents();
    MyLPGFxMovie_Metagame.UpdateAdjacents();
    //return;    
}

function UpdateTrackedUnlockableAll()
{
    UpdateTrackedUnlockable();
    MyLPGFxMovie_Metagame.UpdateTrackedUnlockable();
    //return;    
}

function UpdateCompletionPercent()
{
    SetCompletionPercent(MetagameManager.GetMetagameRank());
    //return;    
}

function ShowFrontOnSphere()
{
    local /*0x97E50000-0x00000000*/ private bool bShowOnSphere[8388609], bUpdate;

    true
    ShowFront(!bShowOnSphere, bUpdate);
    //return;    
}

function SetMainMenuVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609], bBlackBackgroundVisible;

    MyLPGFxMovie_FrontEnd.ShowBackground(bVisible);
    MyLPGFxMovie_FrontEnd.ShowBlackBackground(bBlackBackgroundVisible);
    //return;    
}

function TryPurchase()
{
    local /*0x97E50000-0x00000000*/ private int CellIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Cell;

    Cell = Class'LPMetagameDefinitions'.default.Cells[CellIndex];
    // End:0x143
    if(!bPurchasing)
    {
        // End:0x143
        if(!MetagameManager.IsUnlocked(Cell.CellName))
        {
            // End:0x143
            if((Cell.UnlockType == 'Credits') || MetagameManager.UnlockStatRequirementsMetForCell(Cell))
            {
                // End:0x143
                if(MyPRI.GetMPCreditsEarned() >= Cell.CreditCost)
                {
                    // End:0x143
                    if(PrerequisitesUnlocked(CellIndex))
                    {
                        ShowPurchaseConfirm(CellIndex);
                        return;
                    }
                }
            }
        }
    }
    //return;    
}

function ForcePurchase()
{
    local /*0x97E50000-0x00000000*/ private int CellIndex[8388609];

    Purchase(Class'LPMetagameDefinitions'.default.Cells[CellIndex], false);
    //return;    
}

function ToggleTracking()
{
    local /*0x97E50000-0x00000000*/ private int CellIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL UnlockableToToggle;

    UnlockableToToggle = MetagameManager.GetMetagameData(Class'LPMetagameDefinitions'.default.Cells[CellIndex].CellName);
    // End:0x151
    if((UnlockableToToggle != none) && !UnlockableToToggle.IsUnlocked())
    {
        MyLPGFxMovie_Metagame.ToggleTracking();
        MyLPGFxMovie_Metagame.PlaySoundFromTheme('ToggleTracking');
        UnlockableToToggle.SetTrackingStatus(!UnlockableToToggle.IsTracked());
        MetagameManager.bIsDirty = true;
        bSaveToProfile = true;        
    }
    //return;    
}

function ShowPurchaseConfirm()
{
    local /*0x97E50000-0x00000000*/ private int CellIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;

    // End:0xB3
    if(!bPurchasing)
    {
        PurchaseCandidate = CellIndex;
        bPurchasing = true;
        ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('MenuDialog', self, false));
        SetUpConfirm(ConfirmMC);
        ShowFrontOnSphere(true);
        MyLPGFxMovie_Metagame.PlaySoundFromTheme('TryPurchase');
    }
    //return;    
}

function SetUpConfirm()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmMC[8388609];

    // End:0x204
    if(ConfirmMC != none)
    {
        ConfirmMC.SetDefaultFocusedButton(0);
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(2);
        ConfirmMC.SetTitle("<Strings:LostPlanetGame.MetagameUI.PurchaseTitle>");
        ConfirmMC.SetInfo(GetConfirmLabel());
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
        ConfirmMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
        ConfirmMC.SetButtonOnPress(0, PurchaseReject);
        ConfirmMC.SetButtonOnPress(1, PurchaseConfirm);
        ConfirmMC.ListItemPressSoundEventName = 'None';
    }
    //return;    
}

function GetConfirmLabel()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private name RewardType;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ConfirmLabel;

    ConfirmLabel = "<Strings:LostPlanetGame.MetagameUI.PurchaseConfirm";
    RewardType = Class'LPMetagameDefinitions'.default.Cells[PurchaseCandidate].RewardType;
    switch(RewardType)
    {
        // End:0xA2
        case 'TotemUpgrade':
        // End:0xAE
        case 'AbilityUpgrade':
        // End:0xE2
        case 'WeaponUpgrade':
            ConfirmLabel = (ConfirmLabel $ "_") $ string(RewardType);
            // End:0xE5
            break;
        // End:0xFFFF
        default:
            break;
    }
    ConfirmLabel = ConfirmLabel $ ">";
    return ConfirmLabel;
    //return ReturnValue;    
}

function Purchase()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cell[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDeductCost[9437185];

    true
    // End:0x51
    if(bDeductCost)
    {
        MyPRI.AddMPCreditsEarned(-Cell.CreditCost);
    }
    MyPC.SetUnlockStatus(Cell.CellName, true, false);
    MetagameManager.SetTrackingStatus(Cell.CellName, false);
    bSaveToProfile = true;
    UpdateCompletionPercent();
    UpdateCreditsAll();
    PurchaseSucceeded();
    MyLPGFxMovie_Metagame.PurchaseSucceeded();
    //return;    
}

function PurchaseConfirm()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    Purchase(Class'LPMetagameDefinitions'.default.Cells[PurchaseCandidate]);
    MyLPGFxMovie_Metagame.PlaySoundFromTheme('PurchaseConfirm');
    //return;    
}

function PurchaseReject()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    Outer.PlaySoundFromTheme(NavBackSoundEventName);
    //return;    
}

function PrerequisitesUnlocked()
{
    local /*0x97E50000-0x00000000*/ private int CellIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Cell;

    Cell = Class'LPMetagameDefinitions'.default.Cells[CellIndex];
    return (MetagameManager.IsUnlocked(Cell.Prerequisite1) && MetagameManager.IsUnlocked(Cell.Prerequisite2)) && MetagameManager.IsUnlocked(Cell.Prerequisite3);
    //return ReturnValue;    
}

function InitHelp()
{
    // End:0x4AD
    if(!bHelpInit)
    {
        bHelpInit = true;
        SetTutorialText(GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.TutorialTitle>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.TutorialDesc>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.CellTypeHeader>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.CellUnlockedHeader>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.CellUnlockedDesc>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.CellCreditHeader>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.CellCreditDesc>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.CellUnknownHeader>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.CellUnknownDesc>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.CellSkillHeader>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.CellSkillDesc>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.CellSecretHeader>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.CellSecretDesc>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.ToggleClassHeader>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.ToggleClassDesc>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.TrackingHeader>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.TrackingDesc>"), GetLocalizedString("<Strings:LostPlanetGame.MetagameHelp.CloseHelp>"));
    }
    //return;    
}

function ShowHelp()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x17
    if(bShow)
    {
        InitHelp();
    }
    ShowTutorial(bShow);
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(MyLPGFxMovie_FrontEnd.bRenderingSuspended)
    {
        return true;
    }
    // End:0x51
    if(super.FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    // End:0xAD
    if((ButtonName == 'XboxTypeS_Back') || ButtonName == 'BackSpace')
    {
        // End:0xAB
        if(int(InputEvent) == int(0))
        {
            ShowHelp(!bHelpVisible);
        }
        return true;
    }
    // End:0x10B
    if(bHelpVisible)
    {
        // End:0x109
        if((ButtonName == 'XboxTypeS_B') || ButtonName == 'Escape')
        {
            // End:0x109
            if(int(InputEvent) == int(0))
            {
                ShowHelp(false);
            }
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function EnableCheats()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    ActionScriptVoid("EnableCheats");
    //return;    
}

function AddCell()
{
    local /*0x97E50000-0x00000000*/ private int CellIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string CellName[8388609];
    local /*0x97E50000-0x00000000*/ private int CellX[8388609], CellY;
    local /*0x97E50000-0x00000000*/ private editfixedsize string Title[8388609], SubHeading, Description, Image, RewardType;

    local /*0x97E50000-0x00000000*/ private bool bIsUnlocked[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string UnlockType[8388609], UnlockTypeText, UnlockStat;
    local /*0x97E50000-0x00000000*/ private float StatAmount[8388609], UnlockProgress;
    local /*0x97E50000-0x00000000*/ private editfixedsize string UnlockText[8388609];
    local /*0x97E50000-0x00000000*/ private float IssuedTime[8388609], ActiveTime;
    local /*0x97E50000-0x00000000*/ private int CreditCost[8388609], CreditReward;
    local /*0x97E50000-0x00000000*/ private bool bSecretCell[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Prerequisite1[8388609], Prerequisite2, Prerequisite3;
    local /*0x97E50000-0x00000000*/ private bool bIsTracked[8388609], bIsHighlighted;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ClassName[8388609];

    ActionScriptVoid("AddCell");
    //return;    
}

function Nav()
{
    local /*0x97E50000-0x00000000*/ private int Dir[8388609];

    bNavigating = true;
    ActionScriptVoid("Nav");
    //return;    
}

function NavAll()
{
    local /*0x97E50000-0x00000000*/ private int Dir[8388609];

    // End:0xAA
    if((!bPurchasing && !bNavigating) && !MyLPGFxMovie_Metagame.bNavigating)
    {
        Nav(Dir);
        MyLPGFxMovie_Metagame.Nav(Dir);
        MyLPGFxMovie_Metagame.PlaySoundFromTheme('Scroll');
    }
    //return;    
}

function CancelNavAll()
{
    CancelNav();
    MyLPGFxMovie_Metagame.CancelNav();
    //return;    
}

function GetInfoPanelImageLoader()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x3C
    if(InfoPanelImageLoader == none)
    {
        InfoPanelImageLoader = ActionScriptObject("getInfoPanelImageLoader");
    }
    return InfoPanelImageLoader;
    //return ReturnValue;    
}

function LoadInfoPanelImage()
{
    local /*0x97E50000-0x00000000*/ private int CellIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ImagePath;

    // End:0x75
    if(CellIndex >= 0)
    {
        ImagePath = ("img://Metagame." $ string(Class'LPMetagameDefinitions'.default.Cells[CellIndex].Image)) $ "_hero";        
    }
    else
    {
        ImagePath = "img://Metagame.prereqsRequired_hero";
    }
    GetInfoPanelImageLoader().SetString("source", ImagePath);
    //return;    
}

function SetCredits()
{
    local /*0x97E50000-0x00000000*/ private int Credits[8388609];

    ActionScriptVoid("SetCredits");
    //return;    
}

function UpdateCells()
{
    ActionScriptVoid("UpdateCells");
    //return;    
}

function UpdateAdjacents()
{
    ActionScriptVoid("UpdateAdjacents");
    //return;    
}

function UpdateTrackedUnlockable()
{
    ActionScriptVoid("UpdateTrackedUnlockable");
    //return;    
}

function SetCenter()
{
    local /*0x97E50000-0x00000000*/ private int CellX[8388609], CellY;

    ActionScriptVoid("SetCenter");
    //return;    
}

function SetFrontPlateVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    ActionScriptVoid("SetVisible");
    //return;    
}

function SetScreenMode()
{
    local /*0x97E50000-0x00000000*/ private bool bMetagame[8388609];

    ActionScriptVoid("setScreenMode");
    //return;    
}

function ShowFront()
{
    local /*0x97E50000-0x00000000*/ private bool bShowFront[8388609], bUpdate;

    ActionScriptVoid("ShowFront");
    //return;    
}

function PurchaseSucceeded()
{
    ActionScriptVoid("PurchaseSucceeded");
    //return;    
}

function SetEDNText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setEDNThreeText");
    //return;    
}

function SetCompletionText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setCompletionText");
    //return;    
}

function SetCompletionPercent()
{
    local /*0x97E50000-0x00000000*/ private int Percent[8388609];

    ActionScriptVoid("setCompletionPercent");
    //return;    
}

function SetCostText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CurrentCreditsText[8388609], CostText, ProgressText;

    ActionScriptVoid("setCostTextFields");
    //return;    
}

function SetSecretCellText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string SecretCellTitle[8388609], SecretCellDescription;

    ActionScriptVoid("setSecretCellText");
    //return;    
}

function SetSkillProgress()
{
    local /*0x97E50000-0x00000000*/ private int CurrentValue[8388609], targetvalue;

    ActionScriptVoid("setSkillProgressAmount");
    //return;    
}

function ShowMatchStartingTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x50
    if(bMatchStartingTimerShown != bShow)
    {
        ActionScriptVoid("showMatchStartingTimer");
        bMatchStartingTimerShown = bShow;
    }
    //return;    
}

function SetMatchStartingText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MatchStartingText[8388609];

    ActionScriptVoid("setMatchStartingText");
    //return;    
}

function SetMatchStartingTimer()
{
    local /*0x97E50000-0x00000000*/ private int MatchStartTime[8388609];

    ActionScriptVoid("setMatchStartingTimer");
    //return;    
}

function SetClassNameText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ClassA[8388609], ClassB, ClassC;

    ActionScriptVoid("setClassNameText");
    //return;    
}

function ShowClasses()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;

    ActionScriptVoid("ShowClasses");
    //return;    
}

function ShowClassesAll()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;

    ShowClasses(bShow, bImmediate);
    MyLPGFxMovie_Metagame.ShowClasses(bShow, bImmediate);
    MyLPGFxMovie_Metagame.PlaySoundFromTheme(((bShow) ? 'ToggleClassView' : 'ToggleClassViewOff'));
    //return;    
}

function NotifyNavFinished()
{
    bNavigating = false;
    //return;    
}

function CancelNav()
{
    ActionScriptVoid("NotifyNavFinished");
    //return;    
}

function RepositionButtonPrompts()
{
    ActionScriptVoid("repositionButtonPrompts");
    //return;    
}

function ShowTutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x47
    if(bHelpVisible != bShow)
    {
        bHelpVisible = bShow;
        ActionScriptVoid("bShowTutorial");
    }
    //return;    
}

function SetTutorialText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Title[8388609], Description, CellTypes, Unlocked, UnlockedDesc, CreditUnlock,
	    CreditUnlockDesc, Unknown, UnknowmDesc, SkillUnlock, SkillUnlockDesc,
	    Secret, SecretDesc, ToggleClass, ClassDesc, Tracking,
	    TrackingDesc, CloseHelp;

    ActionScriptVoid("setMetagameTutorialText");
    //return;    
}

function NotifyShowBackground()
{
    local /*0x97E50000-0x00000000*/ private bool bShown[8388609];

    MyLPGFxMovie_FrontEnd.NotifyShowBackground(bShown);
    //return;    
}

function NotifyShowBlackBackground()
{
    local /*0x97E50000-0x00000000*/ private bool bShown[8388609];

    MyLPGFxMovie_FrontEnd.NotifyShowBlackBackground(bShown);
    //return;    
}

function NotifyBackgroundVisibility()
{
    local /*0x97E50000-0x00000000*/ private bool bIsVisible[8388609], bPrimaryVisible, bSecondaryVisible, bProxyVisible, bBlackVisible;

    MyLPGFxMovie_FrontEnd.NotifyBackgroundVisibility(bIsVisible, bPrimaryVisible, bSecondaryVisible, bProxyVisible, bBlackVisible);
    // End:0xC5
    if((((bIsVisible || bPrimaryVisible) || bSecondaryVisible) || bProxyVisible) || bBlackVisible)
    {
        SetMainMenuVisible(false);
        MyLPGFxMovie_FrontEnd.QueryBackgroundVisibility();
    }
    //return;    
}

function ScriptLog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string logString[8388609];

    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeDirectorParam'Default__LPGFxFrontEnd_Metagame.DirectorCamParamObj'
    begin object name=DirectorCamParamObj class=Class'LPCameraModeDirectorParam'
    end object
    DirectorCamParams=DirectorCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPGFxFrontEnd_Metagame.DirectorTransitionParamObj'
    begin object name=DirectorTransitionParamObj class=Class'LPCameraTransitionCutParam'
    end object
    DirectorTransitionParam=DirectorTransitionParamObj
    LookFromNoteTag="MetagameLookFrom"
    LookAtNoteTag="MetagameLookAt"
    NavBackSoundEventName="NetLobbyMenuBack"
}