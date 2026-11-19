class LPDebugModeAI extends SPGFDebugMode;

var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL FactoryAI[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCrosshairWasHidden;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FreezeTotalOffset;

defaultproperties
{
    // Reference: LPActorFactoryAI'Default__LPDebugModeAI.DefaultActorFactory'
    begin object name=DefaultActorFactory class=Class'LPActorFactoryAI'
    end object
    FactoryAI=DefaultActorFactory
    DebugModeName="AI Debug Mode"
    MenuItems=/* Array type was not detected. */
    MenuCategories=/* Array type was not detected. */
}