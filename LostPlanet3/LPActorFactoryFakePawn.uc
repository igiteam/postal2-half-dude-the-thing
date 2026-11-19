class LPActorFactoryFakePawn extends SPGFActorFactoryFakePawn
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object);

defaultproperties
{
    FakePawnTemplateQueryClass=Class'LPTuneDataFakePawnTemplate'
    RealPawnTemplateQueryClass=Class'LPTuneDataPawnTemplate'
    ActorFactoryClass=Class'LPActorFactoryAI'
    MenuName="Add LPFakePawn"
    NewActorClass=Class'LPFakePawn_Generic'
}