class LPTuneDataStruggleVsPlayerDisableToRipOpenTheCockpit extends LPTuneDataStruggleVsPlayerBase
    hidecategories(Object,Object);

defaultproperties
{
    GrabPointIndexThatThisStruggleModeEndsOnWhenSuccessful=13
    SM_GrabAfterSuccessfulStruggleModeEnd=Class'LPSM_ForkArmGrab_HoldVsLarocheCockpitFinal'
    StrugglePhases=/* Array type was not detected. */
    WinPhaseName="DestroyShoulderCockpitWin"
    NumPointsToWin=1
    failPhaseName="DestroyShoulderCockpitFail"
    bKillFollowerOnWin=false
    bUseStruggleCamera=false
    MinPercentageHealthAfterStruggle=0.0000000
}