class LPSM_VSFutureBoostRight extends LPSM_VSFutureBoostBase
    config(Game);

function BeginRollState()
{
    LPPlayerController(MyLPPlayerPawn.Controller).StartVSDash('VSDashRight');
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}