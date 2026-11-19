class LPSpawnVolume extends LPTriggerVolume
    abstract
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(0.25_Pct) /*0x88FE0000-0x00000000*/ private bool bIncludeSpawnsWithinMe[65537];
var(0.25_Pct) /*0x88FE0000-0x00000000*/ private editfixedsize array AdditionalSpawnPoints[65537];

simulated event PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    LocatePlayerStartPoints();
    //return;    
}

simulated function LocatePlayerStartPoints()
{
    local /*0x97E50000-0x00000000*/ private @NULL PS, LPS;

    // End:0xA8
    if(bIncludeSpawnsWithinMe)
    {
        // End:0xA7
        foreach WorldInfo.AllNavigationPoints(Class'Engine.PlayerStart', PS)
        {
            LPS = LPPlayerStart(PS);
            // End:0x70
            if(LPS == none)
            {
                continue;                
            }
            // End:0xA6
            if(Encompasses(LPS))
            {
                LPS.AddSpawnVolume(self);
            }            
        }        
    }
    // End:0xE0
    foreach AdditionalSpawnPoints(LPS)
    {
        LPS.AddSpawnVolume(self);        
    }    
    //return;    
}

simulated function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609], LPS;

    // End:0x81
    if(bIncludeSpawnsWithinMe)
    {
        // End:0x80
        foreach WorldInfo.AllNavigationPoints(Class'LPPlayerStart', LPS)
        {
            // End:0x7F
            if(Encompasses(LPS))
            {
                LPS.OnToggle(Action);
            }            
        }        
    }
    // End:0xC1
    foreach AdditionalSpawnPoints(LPS)
    {
        LPS.OnToggle(Action);        
    }    
    //return;    
}

defaultproperties
{
    bIncludeSpawnsWithinMe=true
    // Reference: BrushComponent'Default__LPSpawnVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    CollisionComponent=BrushComponent0
}