class LPSM_VSFutureBoostLeft extends LPSM_VSFutureBoostBase
    config(Game);

function BeginRollState()
{
    LPPlayerController(MyLPPlayerPawn.Controller).StartVSDash('VSDashLeft');
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}