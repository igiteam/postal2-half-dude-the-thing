class LPAIResCarrierLoiterFormationHumanNpc extends LPAIResCarrierSurroundFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn;

    ThePawn = LPBasePlayerPawn(OuterActor);
    super(SPAIResourceGroup).SetFromTuneData();
    // End:0x271
    if((ThePawn != none) && ThePawn.TuneDataBasePlayerPawn != none)
    {
        MaxInFormation = int(ThePawn.TuneDataBasePlayerPawn.Carrier_MaxInFormation.GetValue());
        Attribute.FormationRadius = ThePawn.TuneDataBasePlayerPawn.Carrier_LoiterFormation_IdealRadius.GetValue() + OuterActorRadius;
        Attribute.MaxFormationRadius = ThePawn.TuneDataBasePlayerPawn.Carrier_LoiterFormation_MaxRadius.GetValue() + OuterActorRadius;
        Attribute.MinFormationRadius = ThePawn.TuneDataBasePlayerPawn.Carrier_LoiterFormation_MinRadius.GetValue() + OuterActorRadius;
        // End:0x21D
        if(MaxInFormation < 0)
        {
            MaxInFormation = 0;
        }
        // End:0x271
        if(Attribute.FormationRadius < float(290 * 3))
        {
            Attribute.FormationRadius = 290.0000000 * float(3);
        }
    }
    //return;    
}

function CheckCanGo()
{
    local /*0x97E50000-0x00000000*/ private @NULL Origin[25296897], Position, Bot;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

protected function SetFormationExplorerCallBacks()
{
    local /*0x97E50000-0x00000000*/ private @NULL Explorer[8388609];

    super(LPAIResSurroundFormation).SetFormationExplorerCallBacks(FormationExplorer);
    //return;    
}

defaultproperties
{
    UniqueName="CarrierLoiterFormation"
}