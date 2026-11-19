class LPSM_PackHunterTailWhip180Right extends LPSM_PackHunterStaticStrikeBase
    config(Game);

function OverrideChoreographyParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL InParams[25165825];

    super.OverrideChoreographyParams(InParams);
    InParams.AlignmentType = 1;
    // End:0x9E
    if(Class'SPEngine.SPUtil'.static.IsInFront(MySPPawn, InParams.OtherTarget))
    {
        InParams.ManualYawDeltaFromCenterline = -32768;        
    }
    else
    {
        InParams.ManualYawDeltaFromCenterline = 0;
    }
    InParams.OverridenDesiredTranslationOffset = 0.0000000;
    InParams.TooCloseTranslationTolerance = 100000.0000000;
    InParams.TooFarTranslationTolerance = 100000.0000000;
    InParams.RotationMode = 1;
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowRotationInterpolation=false
}