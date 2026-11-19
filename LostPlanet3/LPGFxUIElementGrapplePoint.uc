class LPGFxUIElementGrapplePoint extends LPGFxUIActorAttachedElement;

struct native CachedGrappleDisplayInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMagnetic;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDown;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBonus;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bValid;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBounded;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInit;

    structdefaultproperties
    {
        bMagnetic=false
        bDown=false
        bBonus=false
        bValid=false
        bBounded=false
        bInit=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrapplePointMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrappleHookActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CachedDisplayInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsGrapplePointMagnetic;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayerHasMagneticGrapple;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrappleBonusActive;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IconAngle;
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
    // End:0x37
    if(MoviePlayer != none)
    {
        GrapplePointMC = CreateGrapplePointMC(true);
    }
    GrappleHookActor = LPGrapplePointActorBase(AttachedActor);
    UpdateMagneticGrapple();
    SetOnOutroComplete(OutroComplete);
    GoToIntro();
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    GrappleHookActor = LPGrapplePointActorBase(TheActor);
    UpdateMagneticGrapple();
    super(SPGFxUIActorAttachedElement).SetAttachedActor(TheActor, theIndex);
    //return;    
}

function SetOnOutroComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> F[8388609];

    GrapplePointMC.ActionScriptSetFunction("OutroCompleteEvent");
    //return;    
}

function CreateGrapplePointMC()
{
    local /*0x97E50000-0x00000000*/ private bool bLeft[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MoviePlayer.ActionScriptObject("createGrapplePoint");
    //return ReturnValue;    
}

function GoToIntro()
{
    //return;    
}

function GoToOutro()
{
    //return;    
}

function SetValid()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609];

    //return;    
}

function SetGrappleMode()
{
    local /*0x97E50000-0x00000000*/ private bool bMagneticGrapple[8388609], bGrappleDownMode, bBonus, bValid, bBounded;

    // End:0x21E
    if(((((!CachedDisplayInfo.bInit || CachedDisplayInfo.bMagnetic != bMagneticGrapple) || CachedDisplayInfo.bDown != bGrappleDownMode) || CachedDisplayInfo.bBonus != bBonus) || CachedDisplayInfo.bValid != bValid) || CachedDisplayInfo.bBounded != bBounded)
    {
        CachedDisplayInfo.bInit = true;
        CachedDisplayInfo.bMagnetic = bMagneticGrapple;
        CachedDisplayInfo.bDown = bGrappleDownMode;
        CachedDisplayInfo.bBonus = bBonus;
        CachedDisplayInfo.bValid = bValid;
        CachedDisplayInfo.bBounded = bBounded;
        GrapplePointMC.ActionScriptVoid("SetGrappleMode");
    }
    //return;    
}

function UpdateMagneticGrapple()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = GetLPPC();
    bIsGrapplePointMagnetic = (GrappleHookActor != none) && GrappleHookActor.bMagnetic;
    bPlayerHasMagneticGrapple = LPPC.HasMagneticGrapple();
    //return;    
}

function UpdateGrappleBonus()
{
    local /*0x97E50000-0x00000000*/ private bool bNewGrappleBonusActive;
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    bNewGrappleBonusActive = false;
    LPC = GetLPPC();
    // End:0xD0
    if((LPC != none) && LPC.Pawn != none)
    {
        bNewGrappleBonusActive = LPPlayerPawn(LPC.Pawn).GrappleSpeedBonusModifier == LPC.GetGrappleParams().PlayerGrappleSpeedBonusModifier;
    }
    // End:0xFE
    if(bNewGrappleBonusActive != bGrappleBonusActive)
    {
        bGrappleBonusActive = bNewGrappleBonusActive;
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive, bValid, bBounded;
    local /*0x97E50000-0x00000000*/ private float Scale;
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D, DI;

    bShouldBeActive = super(SPGFxUIActorAttachedElement).Update(DeltaTime);
    // End:0x25B
    if(bShouldBeActive)
    {
        Scale = 0.0000000;
        bBounded = UpdateScreenPosition(Pos2D, Scale);
        // End:0x81
        if(Scale <= float(0))
        {
            Show(false, true);            
        }
        else
        {
            bValid = GrappleHookActor.bValid && !bIsGrapplePointMagnetic || bPlayerHasMagneticGrapple;
            SetGrappleMode(bIsGrapplePointMagnetic, GrappleHookActor.bGrappleDownMode, bGrappleBonusActive, bValid, bBounded);
            UpdateGrappleBonus();
            DI = GrapplePointMC.GetDisplayInfo();
            DI.X = Pos2D.X;
            DI.Y = Pos2D.Y;
            DI.Rotation = IconAngle;
            DI.XScale = Scale;
            DI.YScale = Scale;
            GrapplePointMC.SetDisplayInfo(DI);
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

// Export ULPGFxUIElementGrapplePoint::execUpdateScreenPosition(FFrame&, void* const)
native function UpdateScreenPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D[25165825];
    local /*0x97E50000-0x00000000*/ private float Scale[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x17B
    if(GrapplePointMC != none)
    {
        // End:0xB2
        if(bShow)
        {
            DI = GrapplePointMC.GetDisplayInfo();
            DI.Visible = bShow;
            GrapplePointMC.SetDisplayInfo(DI);
            // End:0xAF
            if(!bImmediate)
            {
                GoToIntro();
            }            
        }
        else
        {
            // End:0xDD
            if(!bImmediate && ShouldDisplayOutro)
            {
                GoToOutro();                
            }
            else
            {
                DI = GrapplePointMC.GetDisplayInfo();
                DI.Visible = bShow;
                GrapplePointMC.SetDisplayInfo(DI);
                // End:0x16F
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

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    LPGFxMoviePlayerHUD(MoviePlayer).RemoveMovieClip(GrapplePointMC);
    GrapplePointMC = none;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}
