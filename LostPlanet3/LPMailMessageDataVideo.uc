class LPMailMessageDataVideo extends LPMailMessageData
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x80A60000-0x00000000*/ private editfixedsize string MovieStreamFilename[65537];

function Play()
{
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPPC;

    // End:0x12B
    if(MovieStreamFilename != "")
    {
        LP = Class'Engine.UIInteraction'.static.GetLocalPlayer(0);
        // End:0x12B
        if(LP != none)
        {
            LPPC = LPPlayerController(LP.Actor);
            // End:0x12B
            if(LPPC != none)
            {
                // End:0x12B
                if(LPPC.bIsInVitalSuit)
                {
                    LPPC.AbortMailMessagePlayback();
                    LPPC.CurrentMailMessage = self;
                    LPPC.myLPHUD.ShowVideoMessage(true, MovieStreamFilename);                    
                }
            }
        }
    }
    //return;    
}

function CanPlayMessage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPPC;

    LP = Class'Engine.UIInteraction'.static.GetLocalPlayer(0);
    // End:0x3B
    if(LP == none)
    {
        return false;
    }
    LPPC = LPPlayerController(LP.Actor);
    // End:0x7D
    if(LPPC == none)
    {
        return false;
    }
    return LPPC.CanPlayVideoMessage();
    //return ReturnValue;    
}
