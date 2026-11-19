class LPSeqCond_GetAtmosphereState extends SequenceCondition
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x83880000-0x00000000*/ private @NULL AtmosphereState[65537];

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameInterface, GameSettings;

    super(SequenceOp).Activated();
    // End:0x190
    if((Class'Engine.WorldInfo'.static.GetWorldInfo() != none) && Class'Engine.WorldInfo'.static.GetWorldInfo().Game != none)
    {
        GameInterface = Class'Engine.WorldInfo'.static.GetWorldInfo().Game.GameInterface;
        // End:0x190
        if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
        {
            GameSettings = LPOnlineGameSettings(GameInterface.GetGameSettings('Game'));
            // End:0x190
            if((GameSettings != none) && GameSettings.bIsLanMatch)
            {
                AtmosphereState.CurrentState = name(GameSettings.GetAtmosphereState());
            }
        }
    }
    ActivateNamedOutputLink(string(AtmosphereState.CurrentState));
    //return;    
}

defaultproperties
{
    ObjName="Get Atmosphere State (LP)"
}