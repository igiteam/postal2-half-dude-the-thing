class LPMailMessageDataAudio extends LPMailMessageData
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x80A40000-0x00000000*/ private @NULL AudioMessageEvent[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlaying[536870913];

function @NULL Play()
{
    local /*0x97E50000-0x00000400*/ private @NULL AkC;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> EventFinishedDelegate;
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPPC, LPP;

    // End:0x238
    if(AudioMessageEvent != none)
    {
        LP = Class'Engine.UIInteraction'.static.GetLocalPlayer(0);
        // End:0x238
        if(LP != none)
        {
            LPPC = LPPlayerController(LP.Actor);
            // End:0x238
            if(LPPC != none)
            {
                LPPC.AbortMailMessagePlayback();
                LPPC.CurrentMailMessage = self;
                LPPC.ShowWristPDA(true, "playback", "medium");
                LPP = LPPlayerPawn(LPPC.Pawn);
                // End:0x16A
                if(LPP == none)
                {
                    LPP = LPPlayerPawn(LPPC.HumanPlayerPawn);
                }
                // End:0x22C
                if(LPP != none)
                {
                    AkC = Class'AkAudio.AkComponent'.static.CreateAkComponent(AudioMessageEvent, LPP,, true, true);
                    AkC.bAutoDestroy = true;
                    EventFinishedDelegate = PlayEventFinished;
                    AkC.__OnPlayEventFinished__Delegate = EventFinishedDelegate;
                    bPlaying = true;                    
                }
                else
                {
                    bPlaying = false;
                }
            }
        }
    }
    //return;    
}

function @NULL PlayEventFinished()
{
    local /*0x97E50000-0x00000400*/ private @NULL InAkComp[8388609], LP, LPPC;

    // End:0x10A
    if(InAkComp != none)
    {
        bPlaying = false;
        LP = Class'Engine.UIInteraction'.static.GetLocalPlayer(0);
        // End:0x10A
        if(LP != none)
        {
            LPPC = LPPlayerController(LP.Actor);
            // End:0x10A
            if(LPPC != none)
            {
                // End:0xD8
                if(LPPC.CurrentMailMessage == self)
                {
                    LPPC.CurrentMailMessage = none;
                }
                LPPC.ShowWristPDA(false, "playback", "medium");
            }
        }
    }
    //return;    
}

event ShowStatusChangedUI()
{
    local /*0x97E50000-0x00000000*/ private byte NewStatus[8388609];

    //return;    
}

function @NULL FindAkComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689], LP, LPPC, AkC, LPP;

    // End:0x173
    if(bPlaying)
    {
        LP = Class'Engine.UIInteraction'.static.GetLocalPlayer(0);
        // End:0x173
        if(LP != none)
        {
            LPPC = LPPlayerController(LP.Actor);
            // End:0x173
            if(LPPC != none)
            {
                LPP = LPPlayerPawn(LPPC.Pawn);
                // End:0xF7
                if(LPP == none)
                {
                    LPP = LPPlayerPawn(LPPC.HumanPlayerPawn);
                }
                // End:0x173
                if(LPP != none)
                {
                    // End:0x172
                    foreach LPP.AllOwnedComponents(Class'AkAudio.AkComponent', AkC)
                    {
                        // End:0x171
                        if(AkC.PlayEvent == AudioMessageEvent)
                        {                            
                            return AkC;
                        }                        
                    }                    
                }
            }
        }
    }
    return none;
    //return ReturnValue;    
}

function @NULL Stop()
{
    local /*0x97E50000-0x00000400*/ private @NULL AkC;

    AkC = FindAkComponent();
    // End:0x55
    if(AkC != none)
    {
        AkC.Stop();
        PlayEventFinished(AkC);
    }
    //return;    
}

function @NULL Pause()
{
    local /*0x97E50000-0x00000400*/ private @NULL AkC;

    AkC = FindAkComponent();
    // End:0x42
    if(AkC != none)
    {
        AkC.Pause();
    }
    //return;    
}

function @NULL Resume()
{
    local /*0x97E50000-0x00000400*/ private @NULL AkC;

    AkC = FindAkComponent();
    // End:0x42
    if(AkC != none)
    {
        AkC.Resume();
    }
    //return;    
}

function CanPlayMessage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPPC;

    // End:0x11
    if(AudioMessageEvent == none)
    {
        return false;
    }
    LP = Class'Engine.UIInteraction'.static.GetLocalPlayer(0);
    // End:0x4C
    if(LP == none)
    {
        return false;
    }
    LPPC = LPPlayerController(LP.Actor);
    // End:0x8E
    if(LPPC == none)
    {
        return false;
    }
    return LPPC.CanPlayAudioMessage();
    //return ReturnValue;    
}
