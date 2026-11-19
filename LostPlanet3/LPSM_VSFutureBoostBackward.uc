class LPSM_VSFutureBoostBackward extends LPSM_VSFutureBoostBase
    config(Game);

function BeginRollState()
{
    LPPlayerController(MyLPPlayerPawn.Controller).StartVSDash('VSDashBack');
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}