class LPFXAction_FreezeClaw extends LPFXAction_FreezePart;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL CrabPawn;

    super.Init();
    CrabPawn = LPAIPawnBaseSnowCrab(FXActionManager().Owner);
    FadeInTime = CrabPawn.TuneDataIceCrab.TimeClawFreeze_Tunable.GetValue();
    //return;    
}
