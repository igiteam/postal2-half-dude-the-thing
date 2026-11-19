class LPFXAction_WristPDA extends LPFXActionBase;

enum EWristPDAMode
{
    EWristPDAMode_Off,              // 0
    EWristPDAMode_Incoming,         // 1
    EWristPDAMode_Playback,         // 2
    EWristPDAMode_MAX               // 3
};

enum EWristPDASpeed
{
    EWristPDASpeed_Slow,            // 0
    EWristPDASpeed_Medium,          // 1
    EWristPDASpeed_Fast,            // 2
    EWristPDASpeed_MAX              // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WristPDAPanelStaticInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovieInstance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPGFxMoviePlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array WristPDAAnimNames;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PDAOnSound;

// Export ULPFXAction_WristPDA::execEnd(FFrame&, void* const)
native event End();

function @NULL Begin()
{
    local /*0x97E50000-0x00000400*/ private @NULL FXAManager, LP, LPP;

    FXAManager = FXActionManager();
    // End:0xB2
    if(FXAManager != none)
    {
        LPP = LPPlayerPawn(FXAManager.Owner);
        // End:0xB2
        if(LPP != none)
        {
            LP = LocalPlayer(PlayerController(LPP.Controller).Player);
        }
    }
    // End:0x229
    if(GFxFlashMovieInstance == none)
    {
        Class'SPGfx.SPGFxMoviePlayer'.static.StartSPGFxMoviePlayer(self, WristPDAPanelStaticInfo.GFxFlashMovie, WristPDAPanelStaticInfo.GFxFlashMovieInstanceClass, LP.ControllerId, GFxFlashMovieInstance, 0, true, WristPDAPanelStaticInfo.RenderTexture, 2);
        GFxFlashMovieInstance.bAllowInput = false;
        GFxFlashMovieInstance.bAllowFocus = false;
        GFxFlashMovieInstance.bCaptureInput = false;
        GFxFlashMovieInstance.Init(LP);
        MyLPGFxMoviePlayer = LPGFxMoviePlayerWristPDA(GFxFlashMovieInstance);
        MyLPGFxMoviePlayer.SetVisible(false);
    }
    SetState(0);
    super(SPFXActionBase).Begin();
    //return;    
}

function ShowWristPDA()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string State[9437185], Speed;
    local /*0x97E50000-0x00000000*/ private byte NewMode, NewSpeed;

    "incoming"
    "medium"
    // End:0x39
    if(bShow == false)
    {
        NewMode = 0;        
    }
    else
    {
        // End:0x60
        if(State == "incoming")
        {
            NewMode = 1;            
        }
        else
        {
            // End:0x84
            if(State == "playback")
            {
                NewMode = 2;
            }
        }
    }
    // End:0xA7
    if(Speed == "slow")
    {
        NewSpeed = 0;        
    }
    else
    {
        // End:0xCC
        if(Speed == "medium")
        {
            NewSpeed = 1;            
        }
        else
        {
            NewSpeed = 2;
        }
    }
    SetState(NewMode, NewSpeed);
    //return;    
}

function @NULL AttachWristPDAComp()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609], Comp;

    // End:0xAA
    if(LPP != none)
    {
        // End:0xAA
        if((Comp != none) && !Comp.bAttached)
        {
            LPP.Mesh.AttachComponentToSocket(Comp, 'wristPDA');
            Comp.SetHidden(false);
        }
    }
    //return;    
}

function @NULL DetachWristPDAComp()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609], Comp;

    // End:0x61
    if(LPP != none)
    {
        // End:0x61
        if((Comp != none) && Comp.bAttached)
        {
            Comp.DetachFromAny();
        }
    }
    //return;    
}

function @NULL GetWristPDAAnimSlot()
{
    local /*0x97E50000-0x00000400*/ private @NULL Comp[8388609], ReturnValue, Slot;

    // End:0x4A
    if(Comp != none)
    {
        Slot = SPAnimNodeSlot(Comp.FindAnimNode('WristPDASlotNode'));
    }
    return Slot;
    //return ReturnValue;    
}

function @NULL SetState()
{
    local /*0x97E50000-0x00000000*/ private byte NewMode[8388609], NewSpeed;
    local /*0x97E50000-0x00000000*/ private @NULL LPP, FXAManager, WristPDAComponent, Slot;

    1
    // End:0x393
    if((int(CurrentMode) != int(NewMode)) || int(CurrentSpeed) != int(NewSpeed))
    {
        FXAManager = FXActionManager();
        // End:0xC9
        if(FXAManager != none)
        {
            LPP = LPPlayerPawn(FXAManager.Owner);
            // End:0xC9
            if(LPP != none)
            {
                WristPDAComponent = LPP.WristPDAComponent;
            }
        }
        switch(NewMode)
        {
            // End:0x150
            case 0:
                DetachWristPDAComp(LPP, WristPDAComponent);
                Slot = GetWristPDAAnimSlot(WristPDAComponent);
                // End:0x14D
                if(Slot != none)
                {
                    Slot.StopCustomAnim(0.2500000);
                }
                // End:0x36D
                break;
            // End:0x27B
            case 1:
                AttachWristPDAComp(LPP, WristPDAComponent);
                Slot = GetWristPDAAnimSlot(WristPDAComponent);
                // End:0x1E4
                if(Slot != none)
                {
                    Slot.PlayCustomAnim(WristPDAAnimNames[int(NewSpeed)], 1.0000000, 0.2500000, 0.2500000, true);
                }
                // End:0x23C
                if(MyLPGFxMoviePlayer != none)
                {
                    MyLPGFxMoviePlayer.SetVisible(true);
                    MyLPGFxMoviePlayer.SetAudioType("incoming");
                }
                // End:0x278
                if(LPP != none)
                {
                    LPP.PlaySound(PDAOnSound);
                }
                // End:0x36D
                break;
            // End:0x36A
            case 2:
                AttachWristPDAComp(LPP, WristPDAComponent);
                Slot = GetWristPDAAnimSlot(WristPDAComponent);
                // End:0x30F
                if(Slot != none)
                {
                    Slot.PlayCustomAnim(WristPDAAnimNames[int(NewSpeed)], 1.0000000, 0.2500000, 0.2500000, true);
                }
                // End:0x367
                if(MyLPGFxMoviePlayer != none)
                {
                    MyLPGFxMoviePlayer.SetVisible(true);
                    MyLPGFxMoviePlayer.SetAudioType("playback");
                }
                // End:0x36D
                break;
            // End:0xFFFF
            default:
                break;
        }
        CurrentMode = NewMode;
        CurrentSpeed = NewSpeed;
    }
    //return;    
}

defaultproperties
{
    WristPDAAnimNames=/* Array type was not detected. */
}