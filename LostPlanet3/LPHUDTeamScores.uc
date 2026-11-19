class LPHUDTeamScores extends Object
    config(UI);

struct CachedTeamScoreInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PrimaryScoreValue;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PrimaryScoreSegments;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PrimaryScoreNumerator;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PrimaryScoreDenominator;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPrimaryScoreFlashing;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SecondaryScoreValue;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SecondaryScoreSegments;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SecondaryScoreLeftValue;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SecondaryScoreRightValue;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSecondaryScoreFlashing;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Minutes;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Seconds;

    structdefaultproperties
    {
        PrimaryScoreValue=-1.0000000
        PrimaryScoreSegments=-1
        PrimaryScoreNumerator=-1
        PrimaryScoreDenominator=-1
        bPrimaryScoreFlashing=false
        SecondaryScoreValue=-1.0000000
        SecondaryScoreSegments=-1
        SecondaryScoreLeftValue=-1
        SecondaryScoreRightValue=-1
        bSecondaryScoreFlashing=false
        Minutes=-1
        Seconds=-1
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ParentHUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MPHUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRoundInfoInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowWhileIncapacitated[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowWhileDead[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowDuringWinLossSplash[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowDuringEndRound[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLogDebugInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyGRI[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MyTeamNum;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte GameType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LowRespawnThreshold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CachedScoreInfo;

function Update()
{
    local /*0x97E50000-0x00000000*/ private bool bShouldBeVisible;

    // End:0x22
    if(!bInitialized)
    {
        Init(ParentHUD);
    }
    // End:0x40
    if(!bEnabled)
    {
        // End:0x3E
        if(bLogDebugInfo)
        {
        }
        return;
    }
    bShouldBeVisible = ShouldBeVisible();
    Show(bShouldBeVisible);
    // End:0x7A
    if(!bShouldBeVisible)
    {
        return;
    }
    UpdateGameInfo();
    switch(GameType)
    {
        // End:0xA9
        case 2:
            UpdateScenario();
            // End:0xE2
            break;
        // End:0xBB
        case 1:
            UpdateExtraction();
            // End:0xE2
            break;
        // End:0xCD
        case 3:
            UpdateTDM();
            // End:0xE2
            break;
        // End:0xDF
        case 4:
            UpdateSurvival();
            // End:0xE2
            break;
        // End:0xFFFF
        default:
            break;
    }
    UpdateRoundInfo();
    UpdateClock();
    //return;    
}

function UpdateScenario()
{
    local /*0x97E50000-0x00000000*/ private int MyTeamScore, OtherTeamScore;
    local /*0x97E50000-0x00000000*/ private @NULL Team;

    // End:0x5F
    if((MyTeamNum >= MyGRI.Teams.Length) || MyGRI.Teams[MyTeamNum] == none)
    {
        return;
    }
    Team = LPTeamInfo_MP(MyGRI.Teams[MyTeamNum]);
    // End:0x15E
    if(Team.bDualAttackers)
    {
        MyTeamScore = LPGRI_Scenario_MP(MyGRI).ObjectivesCompleted[MyTeamNum];
        OtherTeamScore = LPGRI_Scenario_MP(MyGRI).ObjectivesCompleted[1 - MyTeamNum];
        SetPrimaryScoreFilledSegments(MyTeamScore);
        SetSecondaryScoreFilledSegments(OtherTeamScore);        
    }
    else
    {
        // End:0x1D1
        if(Team.bAttackingTeam)
        {
            MyTeamScore = LPGRI_Scenario_MP(MyGRI).ObjectivesCompleted[MyTeamNum];
            SetPrimaryScoreFilledSegments(MyTeamScore);            
        }
        else
        {
            Team = LPTeamInfo_MP(MyGRI.Teams[1 - MyTeamNum]);
            OtherTeamScore = LPGRI_Scenario_MP(MyGRI).ObjectivesCompleted[1 - MyTeamNum];
            SetSecondaryScoreFilledSegments(OtherTeamScore);
        }
    }
    //return;    
}

function UpdateExtraction()
{
    UpdateScores();
    //return;    
}

function UpdateTDM()
{
    UpdateScores();
    //return;    
}

function UpdateSurvival()
{
    local /*0x97E50000-0x00000000*/ private int MyTeamScore, OtherTeamScore, GoalScore;
    local /*0x97E50000-0x00000000*/ private float MyTeamScorePct, OtherTeamScorePct;
    local /*0x97E50000-0x00000000*/ private @NULL MyTeam, OtherTeam;

    // End:0x5F
    if((MyTeamNum >= MyGRI.Teams.Length) || MyGRI.Teams[MyTeamNum] == none)
    {
        return;
    }
    MyTeam = LPTeamInfo_MP(MyGRI.Teams[MyTeamNum]);
    MyTeamScore = MyTeam.TeamCredits;
    OtherTeam = LPTeamInfo_MP(MyGRI.Teams[1 - MyTeamNum]);
    OtherTeamScore = OtherTeam.TeamCredits;
    GoalScore = int(FMax(float(MyTeamScore), float(OtherTeamScore)));
    GoalScore = int(FMax(float(GoalScore), 1.0000000));
    MyTeamScorePct = FMin(float(MyTeamScore) / float(GoalScore), 1.0000000);
    OtherTeamScorePct = FMin(float(OtherTeamScore) / float(GoalScore), 1.0000000);
    SetPrimaryScoreBar(MyTeamScorePct);
    SetPrimaryScoreText(string(MyTeamScore));
    SetSecondaryScoreBar(OtherTeamScorePct);
    SetSecondaryScoreTextLeftValue(OtherTeamScore);
    //return;    
}

function UpdateScores()
{
    local /*0x97E50000-0x00000000*/ private int MyTeamScore, OtherTeamScore, GoalScore;
    local /*0x97E50000-0x00000000*/ private float MyTeamScorePct, OtherTeamScorePct;

    // End:0x5F
    if((MyTeamNum >= MyGRI.Teams.Length) || MyGRI.Teams[MyTeamNum] == none)
    {
        return;
    }
    MyTeamScore = int(MyGRI.Teams[MyTeamNum].Score);
    OtherTeamScore = int(MyGRI.Teams[1 - MyTeamNum].Score);
    GoalScore = MyGRI.GoalScore;
    MyTeamScorePct = float(MyTeamScore) / float(GoalScore);
    OtherTeamScorePct = float(OtherTeamScore) / float(GoalScore);
    SetPrimaryScoreBar(MyTeamScorePct);
    SetPrimaryScoreTextValues(MyTeamScore, GoalScore);
    SetSecondaryScoreBar(OtherTeamScorePct);
    SetSecondaryScoreTextLeftValue(OtherTeamScore);
    // End:0x1C2
    if(bLogDebugInfo)
    {
    }
    //return;    
}

function UpdateClock()
{
    local /*0x97E50000-0x00000000*/ private int Min, Sec;
    local /*0x97E50000-0x00000000*/ private editfixedsize string Str;

    Min = MyGRI.RemainingTime / 60;
    Sec = MyGRI.RemainingTime % 60;
    // End:0x18B
    if((CachedScoreInfo.Minutes != Min) || CachedScoreInfo.Seconds != Sec)
    {
        Str = ((Min < 10) ? "0" $ string(Min) : string(Min));
        Str = (Str $ ":") $ ((Sec < 10) ? "0" $ string(Sec) : string(Sec));
        CachedScoreInfo.Minutes = Min;
        CachedScoreInfo.Seconds = Sec;
        SetRoundTimer(Str);
    }
    //return;    
}

function UpdateRoundInfo()
{
    local /*0x97E50000-0x00000000*/ private int WinningTeam, WinningTeamNum, Idx;

    // End:0x1DA
    if(!bRoundInfoInit && MyGRI.CurrentRound > 0)
    {
        SetMaxRounds((MyGRI.RoundsToWin * 2) - 1);
        SetCurrentRound(MyGRI.CurrentRound);
        Idx = 0;
        J0x97:

        // End:0x1CE [Loop If]
        if(Idx < (MyGRI.CurrentRound - 1))
        {
            WinningTeam = MyGRI.WinningTeamByRound[Idx];
            // End:0x120
            if(WinningTeam == 0)
            {
                SetRoundDraw(Idx + 1);                
            }
            else
            {
                WinningTeamNum = ((WinningTeam == 1) ? MyGRI.Team1Index : 1 - MyGRI.Team1Index);
                // End:0x1AA
                if(WinningTeamNum == MyTeamNum)
                {
                    SetRoundWin(Idx + 1);                    
                }
                else
                {
                    SetRoundLoss(Idx + 1);
                }
            }
            Idx++;
            // [Loop Continue]
            goto J0x97;
        }
        bRoundInfoInit = true;
    }
    //return;    
}

function UpdateGameInfo()
{
    // End:0x62
    if(int(ParentHUD.GetPC().GetTeamNum()) != MyTeamNum)
    {
        ClearCachedScoreInfo();
        Init(ParentHUD);
    }
    //return;    
}

function ClearCachedScoreInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL BlankScoreInfo;

    CachedScoreInfo = BlankScoreInfo;
    //return;    
}

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL Parent[8388609], W;

    ParentHUD = Parent;
    MPHUD = Parent.MPHUD_Container;
    W = Class'Engine.WorldInfo'.static.GetWorldInfo();
    MyGRI = LPGRI_Base_MP(W.GRI);
    // End:0xD0
    if((W == none) || MyGRI == none)
    {
        bInitialized = false;
        bEnabled = false;
        return;
    }
    bEnabled = int(W.NetMode) != int(NM_Standalone);
    // End:0x112
    if(!bEnabled)
    {
        return;
    }
    MyTeamNum = int(ParentHUD.GetPC().GetTeamNum());
    SetTeamDisplayName(TranslateString(((MyTeamNum == 0) ? "NEVEC" : "Pirates")));
    GameType = MyGRI.GameType;
    switch(GameType)
    {
        // End:0x1D5
        case 2:
            InitScenario();
            // End:0x222
            break;
        // End:0x1E8
        case 1:
            InitExtraction();
            // End:0x222
            break;
        // End:0x1FB
        case 4:
            InitSurvival();
            // End:0x222
            break;
        // End:0x20E
        case 3:
            InitTDM();
            // End:0x222
            break;
        // End:0xFFFF
        default:
            bEnabled = false;
            return;
            break;
    }    
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Switch Position:0x222
    bInitialized = true;
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Switch Position:0x222
    //return;
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Switch Position:0x222    
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Switch Position:0x222
    // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Switch Position:0x222
}

function InitScenario()
{
    local /*0x97E50000-0x00000000*/ private bool bNevec, bAttacker, bDualAttack;

    // End:0x55
    if(int(MyGRI.GameEndCondition.WinCondition) == int(7))
    {
        GameType = 4;
        InitSurvival(true);
        return;
    }
    bNevec = MyTeamNum == 0;
    bAttacker = LPTeamInfo_MP(MyGRI.Teams[MyTeamNum]).bAttackingTeam;
    bDualAttack = LPTeamInfo_MP(MyGRI.Teams[MyTeamNum]).bDualAttackers;
    LowRespawnThreshold = Class'LPTuneDataMapInfoMP'.static.GetLowRespawnThreshold();
    SetTeam(((bNevec) ? "nevec" : "snowPirates"), bAttacker && !bDualAttack);
    SetPrimaryScoreSegmented(bAttacker || bDualAttack);
    SetSecondaryScoreSegmented(!bAttacker || bDualAttack);
    // End:0x206
    if(!bDualAttack)
    {
        // End:0x1F7
        if(bAttacker)
        {
            SetSecondaryScoreBar(1.0000000);            
        }
        else
        {
            SetPrimaryScoreBar(1.0000000);
        }
    }
    ParentHUD.DisplayActiveMPObjective();
    //return;    
}

function InitExtraction()
{
    local /*0x97E50000-0x00000000*/ private bool bSuppressObjectiveMessage[9437185], bNevec;

    false
    bNevec = MyTeamNum == 0;
    SetTeam(((bNevec) ? "nevec" : "snowPirates"), false);
    // End:0xD8
    if(!bSuppressObjectiveMessage && int(MyGRI.Role) == int(ROLE_Authority))
    {
        MyGRI.ActiveMPObjective.ObjectiveType = 1;
        MyGRI.bObjectiveActive = true;
    }
    ParentHUD.DisplayActiveMPObjective();
    //return;    
}

function InitTDM()
{
    local /*0x97E50000-0x00000000*/ private bool bSuppressObjectiveMessage[9437185], bNevec;

    false
    bNevec = MyTeamNum == 0;
    SetTeam(((bNevec) ? "nevec" : "snowPirates"), false);
    // End:0xD9
    if(!bSuppressObjectiveMessage && int(MyGRI.Role) == int(ROLE_Authority))
    {
        MyGRI.ActiveMPObjective.ObjectiveType = 2;
        MyGRI.bObjectiveActive = true;
    }
    ParentHUD.DisplayActiveMPObjective();
    //return;    
}

function InitSurvival()
{
    local /*0x97E50000-0x00000000*/ private bool bSuppressObjectiveMessage[9437185], bNevec;

    false
    bNevec = MyTeamNum == 0;
    SetTeam(((bNevec) ? "nevec" : "snowPirates"), false);
    // End:0xFF
    if((!bSuppressObjectiveMessage && !MyGRI.bObjectiveActive) && int(MyGRI.Role) == int(ROLE_Authority))
    {
        MyGRI.ActiveMPObjective.ObjectiveType = 9;
        MyGRI.bObjectiveActive = true;
    }
    ParentHUD.DisplayActiveMPObjective();
    //return;    
}

function ShouldBeVisible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL P, PC;

    PC = LPPlayerController(ParentHUD.GetPC());
    // End:0xAF
    if(PC.IsInState('RoundEnded'))
    {
        // End:0xA4
        if(!LPHUD(ParentHUD.myHUD).bWinLossSplashShown)
        {
            return bShowDuringWinLossSplash;
        }
        return bShowDuringEndRound;
    }
    // End:0xDC
    if(PC.IsDead())
    {
        return bShowWhileDead;
    }
    P = PC.MyBasePlayerPawn;
    // End:0x142
    if((P != none) && P.bIncapacitated)
    {
        return bShowWhileIncapacitated;
    }
    // End:0x1BB
    if(((P != none) && P.Weapon != none) && SPInventoryWeapon(P.Weapon).IsScopeActive())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x42
    if(bShow != bVisible)
    {
        ShowTeamScoreHUD(bShow);
        bVisible = bShow;
    }
    //return;    
}

function EnableHUDTeamScores()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[9437185];

    true
    bEnabled = bEnable;
    Show(((bEnabled) ? ShouldBeVisible() : false));
    //return;    
}

static function TranslateString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string TeamScoreString[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL TransContext, TransTag;
    local /*0x97E50000-0x00000000*/ private editfixedsize string StringToTranslate;

    TransContext = Class'Engine.UIInteraction'.static.GetLocalPlayer(0).GetTranslationContext();
    TransTag = TransContext.GetTranslatorTagFromName('Strings');
    StringToTranslate = "LostPlanetGame.MPTeamScoreHUD." $ TeamScoreString;
    return TransTag.Translate(StringToTranslate);
    //return ReturnValue;    
}

function SetTeam()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string TeamName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bSingleTeamUI[8388609];

    MPHUD.ActionScriptVoid("setUserTeam");
    //return;    
}

function SetTeamDisplayName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedTeamName[8388609];

    MPHUD.ActionScriptVoid("setUserTeamName");
    //return;    
}

function ShowTeamScoreHUD()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    MPHUD.ActionScriptVoid("showMPGametypeUI");
    //return;    
}

function SetRoundTimer()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string RoundTime[8388609];

    MPHUD.ActionScriptVoid("setRoundTimer");
    //return;    
}

function SetMaxRounds()
{
    local /*0x97E50000-0x00000000*/ private int MaxRounds[8388609];

    MPHUD.ActionScriptVoid("setMaxNumRounds");
    //return;    
}

function SetCurrentRound()
{
    local /*0x97E50000-0x00000000*/ private int RoundNum[8388609];

    MPHUD.ActionScriptVoid("setCurrentRoundIndex");
    //return;    
}

function SetRoundWinner()
{
    local /*0x97E50000-0x00000000*/ private int RoundNum[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string WinningTeam[8388609];

    MPHUD.ActionScriptVoid("setRoundOwner");
    //return;    
}

function SetRoundWin()
{
    local /*0x97E50000-0x00000000*/ private int RoundNum[8388609];

    MPHUD.ActionScriptVoid("setRoundWin");
    //return;    
}

function SetRoundLoss()
{
    local /*0x97E50000-0x00000000*/ private int RoundNum[8388609];

    MPHUD.ActionScriptVoid("setRoundLoss");
    //return;    
}

function SetRoundDraw()
{
    local /*0x97E50000-0x00000000*/ private int RoundNum[8388609];

    MPHUD.ActionScriptVoid("setRoundDraw");
    //return;    
}

function SetPrimaryScoreBar()
{
    local /*0x97E50000-0x00000000*/ private float ScorePercent[8388609];

    // End:0x83
    if(ScorePercent != CachedScoreInfo.PrimaryScoreValue)
    {
        MPHUD.ActionScriptVoid("setPrimaryScoreBar");
        CachedScoreInfo.PrimaryScoreValue = ScorePercent;
    }
    //return;    
}

function SetSecondaryScoreBar()
{
    local /*0x97E50000-0x00000000*/ private float ScorePercent[8388609];

    // End:0x85
    if(ScorePercent != CachedScoreInfo.SecondaryScoreValue)
    {
        MPHUD.ActionScriptVoid("setSecondaryScoreBar");
        CachedScoreInfo.SecondaryScoreValue = ScorePercent;
    }
    //return;    
}

function SetPrimaryScoreTextValues()
{
    local /*0x97E50000-0x00000000*/ private int ScoreNumerator[8388609], ScoreDenominator;

    // End:0xC9
    if((ScoreNumerator != CachedScoreInfo.PrimaryScoreNumerator) || ScoreDenominator != CachedScoreInfo.PrimaryScoreDenominator)
    {
        CachedScoreInfo.PrimaryScoreNumerator = ScoreNumerator;
        CachedScoreInfo.PrimaryScoreDenominator = ScoreDenominator;
        SetPrimaryScoreText((string(ScoreNumerator) $ "/") $ string(ScoreDenominator));
    }
    //return;    
}

function SetPrimaryScoreText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ScoreText[8388609];

    MPHUD.ActionScriptVoid("setPrimaryScoreField");
    //return;    
}

function SetSecondaryScoreTextValues()
{
    local /*0x97E50000-0x00000000*/ private int LeftTextValue[8388609], RightTextValue;

    SetSecondaryScoreTextLeftValue(LeftTextValue);
    SetSecondaryScoreTextRightValue(RightTextValue);
    //return;    
}

function SetSecondaryScoreTextLeftValue()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    // End:0x65
    if(Value != CachedScoreInfo.SecondaryScoreLeftValue)
    {
        CachedScoreInfo.SecondaryScoreLeftValue = Value;
        SetSecondaryScoreTextLeft(string(Value));
    }
    //return;    
}

function SetSecondaryScoreTextLeft()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ScoreText[8388609];

    MPHUD.ActionScriptVoid("setSecondaryScoreFieldLeft");
    //return;    
}

function SetSecondaryScoreTextRightValue()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    // End:0x65
    if(Value != CachedScoreInfo.SecondaryScoreRightValue)
    {
        CachedScoreInfo.SecondaryScoreRightValue = Value;
        SetSecondaryScoreTextRight(string(Value));
    }
    //return;    
}

function SetSecondaryScoreTextRight()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ScoreText[8388609];

    MPHUD.ActionScriptVoid("setSecondaryScoreFieldRight");
    //return;    
}

function SetPrimaryScoreSegmented()
{
    local /*0x97E50000-0x00000000*/ private bool bSegmented[8388609];

    MPHUD.ActionScriptVoid("showPrimaryScoreBarSegments");
    //return;    
}

function SetSecondaryScoreSegmented()
{
    local /*0x97E50000-0x00000000*/ private bool bSegmented[8388609];

    MPHUD.ActionScriptVoid("showSecondaryScoreBarSegments");
    //return;    
}

function SetPrimaryScoreFilledSegments()
{
    local /*0x97E50000-0x00000000*/ private int NumFilledSegments[8388609];

    // End:0x87
    if(NumFilledSegments != CachedScoreInfo.PrimaryScoreSegments)
    {
        MPHUD.ActionScriptVoid("fillPrimaryBarSegments");
        CachedScoreInfo.PrimaryScoreSegments = NumFilledSegments;
    }
    //return;    
}

function SetSecondaryScoreFilledSegments()
{
    local /*0x97E50000-0x00000000*/ private int NumFilledSegments[8388609];

    // End:0x89
    if(NumFilledSegments != CachedScoreInfo.SecondaryScoreSegments)
    {
        MPHUD.ActionScriptVoid("fillSecondaryBarSegments");
        CachedScoreInfo.SecondaryScoreSegments = NumFilledSegments;
    }
    //return;    
}

function SetPrimaryScoreFlashing()
{
    local /*0x97E50000-0x00000000*/ private bool bFlashing[8388609];

    // End:0x87
    if(CachedScoreInfo.bPrimaryScoreFlashing != bFlashing)
    {
        MPHUD.ActionScriptVoid("setBar1LossWarning");
        CachedScoreInfo.bPrimaryScoreFlashing = bFlashing;
    }
    //return;    
}

function SetSecondaryScoreFlashing()
{
    local /*0x97E50000-0x00000000*/ private bool bFlashing[8388609];

    // End:0x87
    if(CachedScoreInfo.bSecondaryScoreFlashing != bFlashing)
    {
        MPHUD.ActionScriptVoid("setBar2LossWarning");
        CachedScoreInfo.bSecondaryScoreFlashing = bFlashing;
    }
    //return;    
}

defaultproperties
{
    bShowWhileIncapacitated=true
    bShowWhileDead=true
    bShowDuringWinLossSplash=true
    bShowDuringEndRound=true
    CachedScoreInfo=(PrimaryScoreValue=-1.0000000,PrimaryScoreSegments=-1,PrimaryScoreNumerator=-1,PrimaryScoreDenominator=-1,bPrimaryScoreFlashing=false,SecondaryScoreValue=-1.0000000,SecondaryScoreSegments=-1,SecondaryScoreLeftValue=-1,SecondaryScoreRightValue=-1,bSecondaryScoreFlashing=false,Minutes=-1,Seconds=-1)
}