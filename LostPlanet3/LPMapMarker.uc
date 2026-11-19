class LPMapMarker extends LPNote
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x80AE0000-0x00000000*/ private byte Icon[65537];
var(0.25_Pct) /*0x80AE0000-0x00000000*/ private bool bEnabled[65537];

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    super.PostBeginPlay();
    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    iIndex = LPMI.MapMarkerList.Find(self);    
    // End:0xA0
    if(iIndex == -1)
    {
        LPMI.MapMarkerList.AddItem(self);        
    }
    //return;    
}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    super(Actor).Destroyed();
    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    iIndex = LPMI.MapMarkerList.Find(self);    
    // End:0xA3
    if(iIndex >= 0)
    {
        LPMI.MapMarkerList.Remove(iIndex, 1);        
    }
    //return;    
}

simulated function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    //return;    
}

defaultproperties
{
    bEnabled=true
    bStatic=false
}