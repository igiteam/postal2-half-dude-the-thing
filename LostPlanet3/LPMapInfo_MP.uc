class LPMapInfo_MP extends LPMapInfo
    abstract
    config(Game)
    editinlinenew
    hidecategories(Object,Object,Object,Object);

var(0.25_Pct) /*0x80A90000-0x00000000*/ private bool bDelayPawnSpawningUntilMPGameReady[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataMapInfo;
var(0.25_Pct) /*0x80A90000-0x00000400*/ private editfixedsize @NULL TimerEvents[589825];

function PostBeginPlay()
{
    super(MapInfo).PostBeginPlay();
    // End:0x99
    if(TimerEvents != none)
    {
        TimerEvents.Init(float(Class'Engine.WorldInfo'.static.GetWorldInfo().Game.GameReplicationInfo.ElapsedTime));
    }
    //return;    
}

function StartMatch()
{
    // End:0x2E
    if(TimerEvents != none)
    {
        TimerEvents.StartMatch();
    }
    //return;    
}

function EndMatch()
{
    // End:0x2E
    if(TimerEvents != none)
    {
        TimerEvents.EndMatch();
    }
    //return;    
}

function RestartMatch()
{
    // End:0x2E
    if(TimerEvents != none)
    {
        TimerEvents.RestartMatch();
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float GameTime[8388609];

    // End:0x37
    if(TimerEvents != none)
    {
        TimerEvents.Update(GameTime);
    }
    //return;    
}
