class LPGFxUIElementNametag extends LPGFxUIActorAttachedElement
    config(UI);

enum MovieClipIconState
{
    eMCIconState_Uninitialized,     // 0
    eMCIconState_Normal,            // 1
    eMCIconState_TakingDamage,      // 2
    eMCIconState_Incapacitated,     // 3
    eMCIconState_Dead,              // 4
    eMCIconState_Tagged,            // 5
    eMCIconState_Grudge,            // 6
    eMCIconState_Invulnerable,      // 7
    eMCIconState_MAX                // 8
};

enum MovieClipNameState
{
    eMCNameState_Uninitialized,     // 0
    eMCNameState_Show,              // 1
    eMCNameState_Hide,              // 2
    eMCNameState_MAX                // 3
};

struct native NametagFade
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BeginTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Duration;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Alpha;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFading;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFadeIn;

    structdefaultproperties
    {
        BeginTime=0.0000000
        Duration=0.0000000
        Alpha=0.0000000
        bFading=false
        bFadeIn=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Fade;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttachedPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Text;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Position;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TeamIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LocalHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HeightBlendParam;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfDeath;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastPainted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastKnownHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastKnownDamageTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTextVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDead;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIncapacitated;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInvulnerable;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnemy;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNemesis;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSixthSenseTagged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCachedTraceResult;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDistanceIcon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableEnemyLineChecks[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IconAngle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IconDist;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL mcNameTag;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL mcPlayerIcon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL mcPlayerName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL mcPlayerNameTxt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL mcPointerIcon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL mcIncapBracketL;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL mcIncapBracketR;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte eIconMCState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte eNameMCState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NametagManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ParentHUDPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TextColor[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TagColor;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    NametagManager = LPGFxUIElementNametagManager(OwningManager);
    ParentHUDPlayer = LPGFxMoviePlayerHUD(MoviePlayer);
    AttachedPawn = Pawn(AttachedActor);
    // End:0x96
    if(MoviePlayer != none)
    {
        mcNameTag = createMPNameTag();
        Show(false, true);
    }
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    AttachedPawn = Pawn(TheActor);
    ResetClips();
    super(SPGFxUIActorAttachedElement).SetAttachedActor(TheActor, theIndex);
    //return;    
}

function ResetClips()
{
    bVisible = true;
    //return;    
}

event createMPNameTag()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], nameTagObj, cxCol;

    // End:0x42C
    if((ParentHUDPlayer != none) && ParentHUDPlayer.MPHUD_Container != none)
    {
        nameTagObj = ParentHUDPlayer.MPHUD_Container.ActionScriptObject("createMPNameTag");
        // End:0x42C
        if(nameTagObj != none)
        {
            eIconMCState = 0;
            eNameMCState = 0;
            Text = "";
            mcPlayerIcon = nameTagObj.GetObject("playerIcon");
            mcPlayerIcon.GotoAndStopI(1);
            mcPlayerName = nameTagObj.GetObject("playerNameContainer");
            mcPlayerName.GotoAndStopI(1);
            mcPlayerNameTxt = mcPlayerName.GetObject("playerName").GetObject("txtPlayerName");
            mcPointerIcon = nameTagObj.GetObject("pointer");
            mcIncapBracketL = mcPlayerIcon.GetObject("incapacitation").GetObject("bracketL");
            mcIncapBracketR = mcPlayerIcon.GetObject("incapacitation").GetObject("bracketR");
            cxCol.Multiply.R = float(TextColor.R) / float(255);
            cxCol.Multiply.G = float(TextColor.G) / float(255);
            cxCol.Multiply.B = float(TextColor.B) / float(255);
            cxCol.Multiply.A = 1.0000000;
            mcPlayerNameTxt.SetColorTransform(cxCol);
            mcPlayerNameTxt.SetText("");
        }
    }
    return nameTagObj;
    //return ReturnValue;    
}

// Export ULPGFxUIElementNametag::execNativeUpdate(FFrame&, void* const)
native function NativeUpdate();

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;

    bShouldBeActive = super(SPGFxUIActorAttachedElement).Update(DeltaTime);
    // End:0x35
    if(bShouldBeActive)
    {
        NativeUpdate();
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

// Export ULPGFxUIElementNametag::execUpdateNametag(FFrame&, void* const)
native function UpdateNametag()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

event SetTeam()
{
    local /*0x97E50000-0x00000000*/ private int NewTeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL cxCol;

    TeamIndex = NewTeamIndex;
    TagColor = Class'LPGameMP_Base'.static.GetTeamColor(TeamIndex);
    cxCol.Multiply.R = 0.0000000;
    cxCol.Multiply.G = 0.0000000;
    cxCol.Multiply.B = 0.0000000;
    cxCol.Add.R = float(TagColor.R);
    cxCol.Add.G = float(TagColor.G);
    cxCol.Add.B = float(TagColor.B);
    mcPlayerIcon.SetColorTransform(cxCol);
    mcPlayerNameTxt.SetColorTransform(cxCol);
    mcPointerIcon.SetColorTransform(cxCol);
    //return;    
}

// Export ULPGFxUIElementNametag::execUpdateNemesis(FFrame&, void* const)
native function UpdateNemesis()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGFxUIElementNametag::execUpdateSixthSense(FFrame&, void* const)
native function UpdateSixthSense()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGFxUIElementNametag::execFadeNametag(FFrame&, void* const)
native function FadeNametag()
{
    local /*0x97E50000-0x00000000*/ private bool bFadeIn[8388609];
    local /*0x97E50000-0x00000000*/ private float Duration[8388609];


}

// Export ULPGFxUIElementNametag::execGetNametagTextAlpha(FFrame&, void* const)
native function GetNametagTextAlpha()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPGFxUIElementNametag::execUpdateNametagFade(FFrame&, void* const)
native function UpdateNametagFade();

// Export ULPGFxUIElementNametag::execIsEnemyNametagVisible(FFrame&, void* const)
native function IsEnemyNametagVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bOffCamera[8388609], ReturnValue;


}

// Export ULPGFxUIElementNametag::execPerformNametagTrace(FFrame&, void* const)
native function PerformNametagTrace()
{
    local /*0x97E50000-0x00000000*/ private bool bForceRefreshCache[9437185], ReturnValue;


}

// Export ULPGFxUIElementNametag::execUpdateNametagTimeOfLastPainted(FFrame&, void* const)
native function UpdateNametagTimeOfLastPainted();

// Export ULPGFxUIElementNametag::execIsPawnRendered(FFrame&, void* const)
native function IsPawnRendered()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGFxUIElementNametag::execUpdateNametagWorldPosition(FFrame&, void* const)
native function UpdateNametagWorldPosition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGFxUIElementNametag::execCanAttachNametag(FFrame&, void* const)
native function CanAttachNametag()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGFxUIElementNametag::execDisplayNametagIcon(FFrame&, void* const)
native function DisplayNametagIcon()
{
    local /*0x97E50000-0x00000000*/ private @NULL Canvas[8388609], IconScreenPos;
    local /*0x97E50000-0x00000000*/ private float DistScaleFactor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bTagBounded[8388609];


}

// Export ULPGFxUIElementNametag::execGetNametagDamageIndicatorIntensity(FFrame&, void* const)
native function GetNametagDamageIndicatorIntensity()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPGFxUIElementNametag::execGetWorldTime(FFrame&, void* const)
native function GetWorldTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

function GetNametagColor()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Result;

    Result.R = 255;
    Result.G = 255;
    Result.B = 255;
    Result.A = 255;
    return Result;
    //return ReturnValue;    
}

// Export ULPGFxUIElementNametag::execGetNametagScreenPosition(FFrame&, void* const)
native function GetNametagScreenPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewTextPos[25165825], NewIconPos;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGFxUIElementNametag::execGetNametagDistanceScaleFactor(FFrame&, void* const)
native function GetNametagDistanceScaleFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x89
    if(mcNameTag != none)
    {
        DI = mcNameTag.GetDisplayInfo();
        DI.Visible = bShow;
        mcNameTag.SetDisplayInfo(DI);
    }
    //return;    
}

// Export ULPGFxUIElementNametag::execGetNametagShakeEffectDisplacement(FFrame&, void* const)
native function GetNametagShakeEffectDisplacement()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPGFxUIElementNametag::execGetPlayerOwner(FFrame&, void* const)
native function GetPlayerOwner()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    LPGFxMoviePlayerHUD(MoviePlayer).RemoveMovieClip(mcNameTag);
    mcNameTag = none;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}

defaultproperties
{
    TeamIndex=-1
    bEnableEnemyLineChecks=true
    TextColor=(R=255,G=255,B=255,A=255)
}