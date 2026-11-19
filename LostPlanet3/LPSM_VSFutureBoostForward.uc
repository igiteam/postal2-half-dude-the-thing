class LPSM_VSFutureBoostForward extends LPSM_VSFutureBoostBase
    config(Game);

function BeginRollState()
{
    LPPlayerController(MyLPPlayerPawn.Controller).StartVSDash('VSDash');
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}