class LPSeqAct_MPShowCountdownUI extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x277B0000-0x00000000*/ private int CountdownTime[65537];
var(0.25_Pct) /*0x277B0000-0x00000400*/ private editfixedsize @NULL CountdownText[589825];

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x12
    if(CountdownTime <= 0)
    {        
    }
    else
    {
        LPPC = LPPlayerController(Class'Engine.Engine'.static.GetEngine().GamePlayers[0].Actor);
        // End:0x82
        if(LPPC == none)
        {            
        }
        else
        {
            LPPC.myLPHUD.StartCountdown(CountdownText.LocalizedTextMarkUp, CountdownTime);
        }
    }
    super(SequenceOp).Activated();
    //return;    
}

defaultproperties
{
    CountdownTime=5
    // Reference: LPLocTextSelector'Default__LPSeqAct_MPShowCountdownUI.TxtSelector0'
    begin object name=TxtSelector0 class=Class'LPLocTextSelector'
        LocalizedTextMarkUp="<Strings:LostPlanetGame.HUDHintMessages.HUDHint_NextWave>"
    end object
    CountdownText=TxtSelector0
    ObjName="Show Countdown UI (LP)"
}