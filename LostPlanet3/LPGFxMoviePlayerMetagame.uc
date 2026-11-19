class LPGFxMoviePlayerMetagame extends SPGFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MetagameSphereSWF;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MetagameRenderTexture;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array HeroImageTextures;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNavigating;

function InitSphere()
{
    ActionScriptVoid("InitSphere");
    //return;    
}

function ShowFront()
{
    local /*0x97E50000-0x00000000*/ private bool bShowFront[8388609], bUpdate;

    ActionScriptVoid("ShowFront");
    //return;    
}

function SetSphereVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    ActionScriptVoid("SetVisible");
    //return;    
}

function AddBGCell()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CellName[8388609];
    local /*0x97E50000-0x00000000*/ private int CellX[8388609], CellY;
    local /*0x97E50000-0x00000000*/ private editfixedsize string Image[8388609], RewardType;
    local /*0x97E50000-0x00000000*/ private bool bIsUnlocked[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string UnlockType[8388609];
    local /*0x97E50000-0x00000000*/ private float StatAmount[8388609], UnlockProgress;
    local /*0x97E50000-0x00000000*/ private int CreditCost[8388609];
    local /*0x97E50000-0x00000000*/ private bool bSecretCell[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Prerequisite1[8388609], Prerequisite2, Prerequisite3;
    local /*0x97E50000-0x00000000*/ private bool bIsTracked[8388609], bIsHighlighted;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ClassName[8388609];

    ActionScriptVoid("AddBGCell");
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

function Nav()
{
    local /*0x97E50000-0x00000000*/ private int Dir[8388609];

    bNavigating = true;
    ActionScriptVoid("Nav");
    //return;    
}

function SetCenter()
{
    local /*0x97E50000-0x00000000*/ private int CellX[8388609], CellY;

    ActionScriptVoid("SetCenter");
    //return;    
}

function ScriptLog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string logString[8388609];

    //return;    
}

function ShowClasses()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;

    ActionScriptVoid("ShowClasses");
    //return;    
}

function ToggleTracking()
{
    ActionScriptVoid("ToggleTracking");
    //return;    
}

function PurchaseSucceeded()
{
    ActionScriptVoid("PurchaseSucceeded");
    //return;    
}

function UnlockAll()
{
    ActionScriptVoid("UnlockAll");
    //return;    
}

function SetCredits()
{
    local /*0x97E50000-0x00000000*/ private int Credits[8388609];

    ActionScriptVoid("SetCredits");
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

defaultproperties
{
    SoundThemes=/* Array type was not detected. */
}