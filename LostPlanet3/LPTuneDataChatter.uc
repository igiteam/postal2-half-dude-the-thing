class LPTuneDataChatter extends SPEngineTuneDataBase
    hidecategories(Object,Object,Object);

struct native ChatterAkEventStruct
{
    var(0.25_Pct) /*0x203C0000-0x00000000*/ private @NULL ChatterAkEvent[65537];

    structdefaultproperties
    {
        ChatterAkEvent=none
    }
};

var(0.25_Pct) /*0x89AC0000-0x00000000*/ private @NULL ChatterEventData[65537];
var(0.25_Pct_6946815) /*0x89AC0000-0x00000400*/ private @NULL ChatterAkEvents[589847];

function BroadcastChatter()
{
    local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ChatterInstigator[8388609], ChatterTarget, WI, LPPC, ChatterPawn;

    local /*0x97E50000-0x00000000*/ private byte CRT;
    local /*0x97E50000-0x00000000*/ private int TeamNum;

    ChatterPawn = ChatterInstigator.GetChatterPawn();
    // End:0x3B
    if(ChatterPawn == none)
    {
        return;
    }
    // End:0x5E
    if(!HandleSpamBlocking(ChatterEvent, ChatterPawn))
    {
        return;
    }
    // End:0xA4
    if(FRand() > ChatterEventData.ChatterEvents[int(ChatterEvent)].ChatterProbability)
    {
        return;
    }
    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    CRT = ChatterEventData.ChatterEvents[int(ChatterEvent)].ChatterReplication;
    switch(CRT)
    {
        // End:0x170
        case 1:
            // End:0x13F
            if(ChatterTarget == none)
            {                
            }
            else
            {
                ChatterTarget.ReceiveChatter(ChatterEvent, ChatterPawn);
            }
        // End:0x1A9
        case 0:
            ChatterInstigator.ReceiveChatter(ChatterEvent, ChatterPawn);
            // End:0x2D2
            break;
        // End:0x1AE
        case 2:
        // End:0x277
        case 3:
            TeamNum = int(ChatterInstigator.GetTeamNum());
            // End:0x273
            foreach WI.AllControllers(Class'LPPlayerController', LPPC)
            {
                // End:0x272
                if(TeamNum == int(LPPC.GetTeamNum()))
                {
                    LPPC.ReceiveChatter(ChatterEvent, ChatterPawn);
                }                
            }            
            // End:0x2D2
            break;
        // End:0x2CF
        case 4:
            ChatterPawn.ReceiveChatter(ChatterEvent);
            ChatterPawn.MultiCastReceiveChatter(ChatterEvent);
            // End:0x2D2
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function LocalChatter()
{
    local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ChatterInstigator[8388609], ChatterPawn;

    ChatterPawn = ChatterInstigator.GetChatterPawn();
    // End:0x3A
    if(ChatterPawn == none)
    {
        return;
    }
    // End:0x5D
    if(!HandleSpamBlocking(ChatterEvent, ChatterPawn))
    {
        return;
    }
    // End:0xA3
    if(FRand() > ChatterEventData.ChatterEvents[int(ChatterEvent)].ChatterProbability)
    {
        return;
    }
    ChatterPawn.ReceiveChatter(ChatterEvent);
    //return;    
}

function HandleSpamBlocking()
{
    local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ChatterPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bCanPlayChatter;
    local /*0x97E50000-0x00000000*/ private float SpamBlockTime;
    local /*0x97E50000-0x00000000*/ private @NULL PCS;
    local /*0x97E50000-0x00000000*/ private int PlayedIndex;
    local /*0x97E50000-0x00000000*/ private float TimeSeconds;

    bCanPlayChatter = true;
    TimeSeconds = Class'Engine.WorldInfo'.static.GetWorldInfo().TimeSeconds;
    SpamBlockTime = ChatterEventData.ChatterEvents[int(ChatterEvent)].SpamBlockTime;
    // End:0x212
    if(SpamBlockTime > float(0))
    {
        PlayedIndex = ChatterPawn.PlayedChatterInfo.Find('ChatterEvent', ChatterEvent);        
        // End:0x19B
        if(PlayedIndex >= 0)
        {
            // End:0x18C
            if((ChatterPawn.PlayedChatterInfo[PlayedIndex].LastPlayAttemptTime + SpamBlockTime) < TimeSeconds)
            {
                ChatterPawn.PlayedChatterInfo[PlayedIndex].LastPlayAttemptTime = TimeSeconds;                
            }
            else
            {
                bCanPlayChatter = false;
            }            
        }
        else
        {
            PCS.ChatterEvent = ChatterEvent;
            PCS.LastPlayAttemptTime = TimeSeconds;
            ChatterPawn.PlayedChatterInfo.AddItem(PCS);            
        }
    }
    return bCanPlayChatter;
    //return ReturnValue;    
}

function GetAkEvent()
{
    local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609], bShouldOverride, bShouldQueue;
    local /*0x97E50000-0x00000000*/ private int ChatterPriority[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x12C
    if((int(ChatterEvent) >= int(0)) && int(ChatterEvent) < 23)
    {
        bShouldOverride = byte(ChatterEventData.ChatterEvents[int(ChatterEvent)].bShouldOverride);
        bShouldQueue = byte(ChatterEventData.ChatterEvents[int(ChatterEvent)].bShouldQueue);
        ChatterPriority = ChatterEventData.ChatterEvents[int(ChatterEvent)].ChatterPriority;
        return ChatterAkEvents[int(ChatterEvent)].ChatterAkEvent;
    }
    return none;
    //return ReturnValue;    
}
