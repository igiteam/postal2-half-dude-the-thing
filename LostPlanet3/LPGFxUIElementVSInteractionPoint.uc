class LPGFxUIElementVSInteractionPoint extends LPGFxUIActorAttachedElement
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InteractionPointMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasIntro;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasOutro;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayInteractable;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAimForActive;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScaleFactor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string InteractableFunctionName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AimWidthFunctionName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AimHeightFunctionName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AimHalfWidth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AimHalfHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MCWidth[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MCHeight[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string TutorialString;
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
    // End:0x88
    if(MoviePlayer != none)
    {
        InteractionPointMC = CreateInteractionPointMC("", 0.0000000, 0.0000000);
        AimHalfWidth = (GetInteractionPointAimWidth(InteractionPointMC)) / float(2);
        AimHalfHeight = (GetInteractionPointAimHeight(InteractionPointMC)) / float(2);
    }
    SetOnOutroComplete(OutroComplete);
    // End:0xBA
    if(bHasIntro)
    {
        GoToIntro();
    }
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    super(SPGFxUIActorAttachedElement).SetAttachedActor(TheActor, theIndex);
    SetInteractionPointText(InteractionPointMC, GetTutorialText());
    //return;    
}

function GetTutorialText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private editfixedsize string S;
    local /*0x97E50000-0x00000000*/ private @NULL InteractionPoint;

    LPPC = GetLPPC();
    S = "";
    InteractionPoint = LPVSInteractionPointHUD(AttachedActor);
    // End:0xDA
    if((LPPC != none) && InteractionPoint != none)
    {
        // End:0xDA
        if(LPPC.ShouldDisplayVSCombatTutorials())
        {
            S = MoviePlayer.GetLocalizedString(InteractionPoint.InputCallout.MarkUpTag);
        }
    }
    return S;
    //return ReturnValue;    
}

function SetOnOutroComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> F[8388609];

    InteractionPointMC.ActionScriptSetFunction("OutroCompleteEvent");
    //return;    
}

event PlayerHasRequiredEquipment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function CreateInteractionPointMC()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Mode[9437185];
    local /*0x97E50000-0x00000000*/ private float X[9437185], Y;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MoviePlayer.ActionScriptObject("createInteractionVolume");
    //return ReturnValue;    
}

function SetInteractionPointActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private bool bSetActive[8388609];

    SetInteractionPointActiveAndEnabled(MC, bSetActive, PlayerHasRequiredEquipment());
    //return;    
}

function SetInteractionPointActiveAndEnabled()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private bool bSetActive[8388609], bSetEnabled;

    // End:0x86
    if((bDisplayInteractable != bSetActive) || bDisplayEnabled != bSetEnabled)
    {
        bDisplayInteractable = bSetActive;
        bDisplayEnabled = bSetEnabled;
        MoviePlayer.ActionScriptVoid(InteractableFunctionName);
    }
    //return;    
}

function SetInteractionPointText()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Str[8388609];

    MoviePlayer.ActionScriptVoid("setInteractionPointText");
    //return;    
}

function GetInteractionPointAimWidth()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], ret;

    ret = MoviePlayer.ActionScriptFloat(AimWidthFunctionName);
    // End:0x6A
    if(Class'SPEngine.SPUtil'.static.AppIsNaN(ret))
    {
        return MCWidth;        
    }
    else
    {
        return ret;
    }
    //return ReturnValue;    
}

function GetInteractionPointAimHeight()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], ret;

    ret = MoviePlayer.ActionScriptFloat(AimHeightFunctionName);
    // End:0x6A
    if(Class'SPEngine.SPUtil'.static.AppIsNaN(ret))
    {
        return MCHeight;        
    }
    else
    {
        return ret;
    }
    //return ReturnValue;    
}

event GetHelpType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 8;
    //return ReturnValue;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, HUD;
    local /*0x97E50000-0x00000000*/ private bool bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private float Scale;
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D;
    local /*0x97E50000-0x00000000*/ private bool bVisible, bDisplayActive;
    local /*0x97E50000-0x00000000*/ private @NULL WorldPos, DI;

    bShouldBeActive = super(SPGFxUIActorAttachedElement).Update(DeltaTime);
    // End:0x348
    if(bShouldBeActive)
    {
        LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
        Scale = 0.0000000;
        // End:0x348
        if(LPMPHUD != none)
        {
            HUD = LPHUD(LPMPHUD.myHUD);
            // End:0x348
            if(HUD != none)
            {
                bVisible = UpdateVisibility();
                // End:0x16E
                if(bVisible)
                {
                    WorldPos = GetWorldPos();
                    HUD.GetProjectedPosAndScale(WorldPos, Pos2D, Scale);
                    HUD.TransformHUDPosToScaleformStagePos(Pos2D.X, Pos2D.Y);
                }
                // End:0x1A0
                if((Scale <= float(0)) || bVisible == false)
                {
                    Show(false, true);                    
                }
                else
                {
                    Show(true, true);
                    // End:0x348
                    if(InteractionPointMC != none)
                    {
                        DI = InteractionPointMC.GetDisplayInfo();
                        DI.X = Pos2D.X;
                        DI.Y = Pos2D.Y;
                        bDisplayActive = UpdateDisplayActive(Pos2D);
                        SetInteractionPointActive(InteractionPointMC, bDisplayActive);
                        Scale = FMax(1.0000000 / Scale, 0.1000000);
                        DI.XScale = (Scale * float(100)) * ScaleFactor;
                        DI.YScale = (Scale * float(100)) * ScaleFactor;
                        InteractionPointMC.SetDisplayInfo(DI);
                    }
                }
            }
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function UpdateDisplayActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bDisplayActive;
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, InteractionPointHUD, LPPC;
    local /*0x97E50000-0x00000000*/ private bool bIntersectingReticle;

    LPPC = GetLPPC();
    bDisplayActive = bDisplayInteractable;
    LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    bIntersectingReticle = ReticleIsAimingAtMe(LPMPHUD, Pos2D);
    // End:0xB8
    if(bIntersectingReticle)
    {
        LPMPHUD.CurrentReticle.SetAimedInteractionPoint(self, GetWorldPos());
    }
    InteractionPointHUD = LPVSInteractionPointHUD(AttachedActor);
    // End:0x12B
    if(InteractionPointHUD != none)
    {
        // End:0x107
        if(InteractionPointHUD.bForceDisplayActive)
        {
            return true;
        }
        // End:0x12B
        if(InteractionPointHUD.bForceDisplayInactive)
        {
            return false;
        }
    }
    // End:0x205
    if((InteractionPointHUD != none) && InteractionPointHUD.VSIP != none)
    {
        // End:0x1F6
        if(LPBaseVSPlayerPawn(LPPC.Pawn) != none)
        {
            bDisplayActive = InteractionPointHUD.VSIP.CanInteractWith(LPBaseVSPlayerPawn(LPPC.Pawn));            
        }
        else
        {
            bDisplayActive = false;
        }        
    }
    else
    {
        // End:0x238
        if(bAimForActive && LPMPHUD != none)
        {
            bDisplayActive = bIntersectingReticle;
        }
    }
    return bDisplayActive;
    //return ReturnValue;    
}

function ReticleIsAimingAtMe()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD[8388609], Pos2D;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ReticlePos2D, Reticle_TopLeft, Reticle_BotRight, Point_TopLeft, Point_BotRight;

    local /*0x97E50000-0x00000000*/ private float pointw, pointh, Reticle_W, Reticle_H;
    local /*0x97E50000-0x00000000*/ private bool bIntersectingReticle;

    // End:0x37
    if((LPMPHUD == none) || LPMPHUD.CurrentReticle == none)
    {
        return false;
    }
    LPMPHUD.CurrentReticle.GetPosition(ReticlePos2D.X, ReticlePos2D.Y);
    LPMPHUD.CurrentReticle.GetAimHalfSize(Reticle_W, Reticle_H);
    pointw = AimHalfWidth;
    pointh = AimHalfHeight;
    Reticle_TopLeft.X = ReticlePos2D.X - Reticle_W;
    Reticle_TopLeft.Y = ReticlePos2D.Y - Reticle_H;
    Reticle_BotRight.X = ReticlePos2D.X + Reticle_W;
    Reticle_BotRight.Y = ReticlePos2D.Y + Reticle_H;
    Point_TopLeft.X = Pos2D.X - pointw;
    Point_TopLeft.Y = Pos2D.Y - pointh;
    Point_BotRight.X = Pos2D.X + pointw;
    Point_BotRight.Y = Pos2D.Y + pointh;
    bIntersectingReticle = Class'SPEngine.SPUtil'.static.RectIntersect(Reticle_TopLeft, Reticle_BotRight, Point_TopLeft, Point_BotRight);
    return bIntersectingReticle;
    //return ReturnValue;    
}

function GetWorldPos()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return AttachedActor.Location;
    //return ReturnValue;    
}

function UpdateVisibility()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bVisible;
    local /*0x97E50000-0x00000000*/ private @NULL InteractionPoint, LPPC;

    bVisible = true;
    InteractionPoint = LPVSInteractionPointHUD(AttachedActor);
    // End:0x106
    if(InteractionPoint != none)
    {
        LPPC = GetLPPC();
        // End:0x106
        if((InteractionPoint.VisibilityDistance > float(0)) && LPPC != none)
        {
            // End:0x106
            if(VSize(InteractionPoint.Location - LPPC.Pawn.Location) > InteractionPoint.VisibilityDistance)
            {
                bVisible = false;
            }
        }
    }
    return bVisible;
    //return ReturnValue;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x17E
    if(InteractionPointMC != none)
    {
        // End:0xC1
        if(bShow)
        {
            DI = InteractionPointMC.GetDisplayInfo();
            DI.Visible = bShow;
            InteractionPointMC.SetDisplayInfo(DI);
            // End:0xBE
            if(!bImmediate && bHasIntro)
            {
                GoToIntro();
            }            
        }
        else
        {
            // End:0xEC
            if(!bImmediate && bHasOutro)
            {
                GoToOutro();                
            }
            else
            {
                DI = InteractionPointMC.GetDisplayInfo();
                DI.Visible = bShow;
                InteractionPointMC.SetDisplayInfo(DI);
                // End:0x17E
                if(bPendingInactive)
                {
                    SetActive(false, true);
                }
            }
        }
    }
    //return;    
}

function GoToIntro()
{
    InteractionPointMC.ActionScriptVoid("InteractionPointGotoIntro");
    //return;    
}

function GoToOutro()
{
    InteractionPointMC.ActionScriptVoid("InteractionPointGotoOutro");
    //return;    
}

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    GetLPPC().SetVSReticleHelpButton(GetHelpType(), false);
    LPGFxMoviePlayerHUD(MoviePlayer).RemoveMovieClip(InteractionPointMC);
    InteractionPointMC = none;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}

defaultproperties
{
    bAimForActive=true
    ScaleFactor=6.0000000
    InteractableFunctionName="setInteractionPointActive"
    AimWidthFunctionName="getInteractionPointAimWidth"
    AimHeightFunctionName="getInteractionPointAimHeight"
    MCWidth=36.0000000
    MCHeight=36.0000000
}