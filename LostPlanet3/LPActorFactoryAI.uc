class LPActorFactoryAI extends SPKynapseActorFactoryAI
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object,Kynapse,Team);

var(0.25_Pct) /*0xC9B50000-0x00000000*/ private byte TeamLP[65537];

defaultproperties
{
    TeamLP=ELPTeams.LPTeam_Akrid
    PawnTemplateQueryClass=Class'LPTuneDataPawnTemplate'
    BaseAIPawnClass=Class'LPAIPawn'
    ControllerClass=Class'LPAIController'
    bGiveDefaultInventory=true
    TeamIndex=2
}