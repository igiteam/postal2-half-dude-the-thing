class LPSM_SpitterAttackTailStingVSQuickIn extends LPSM_SpitterAttackTailStingQuickIn
    config(Game);

function OverrideChoreographyParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChoreographyParams[25165825];

    ChoreographyParams.TooCloseTranslationTolerance = 10000.0000000;
    ChoreographyParams.TooFarTranslationTolerance = 0.0000000;
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}