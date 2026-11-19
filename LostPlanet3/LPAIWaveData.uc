class LPAIWaveData extends SPAIWaveData
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x7B650000-0x00000000*/ private byte TeamLP[65537];

event GetTeam()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return int(TeamLP);
    //return ReturnValue;    
}

defaultproperties
{
    TeamLP=ELPTeams.LPTeam_Akrid
    // Reference: SPAssetDropDownList'Default__LPAIWaveData.DefaultPawnTemplate'
    begin object name=DefaultPawnTemplate
        AssetClass=Class'LPTuneDataPawnTemplate'
    end object
    PawnTemplate=DefaultPawnTemplate
    PawnTemplateQueryClass=Class'LPTuneDataPawnTemplate'
}