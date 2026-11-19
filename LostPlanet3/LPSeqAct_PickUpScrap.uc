class LPSeqAct_PickUpScrap extends LPSeqAct_PickUpBase
    hidecategories(Object);

var(0.25_Pct) /*0x82F70000-0x00000000*/ private int ScrapAmount[65537];
var(0.25_Pct) /*0x82F70000-0x00000000*/ private bool bDisplayHudMessage[65537];

function PickedUpItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    super.PickedUpItem(P);
    // End:0xBA
    if(P.Controller != none)
    {
        LPPlayerController(P.Controller).AddScrap(ScrapAmount, bDisplayHudMessage, P.TuneDataPlayerPawn.ScrapPickupMessageDisplayTime);
    }
    //return;    
}

defaultproperties
{
    // Reference: LPQuestObjectSelector'Default__LPSeqAct_PickUpScrap.QuestEntryA'
    begin object name=QuestEntryA
    end object
    QuestEntry=QuestEntryA
    SoundEventName="PickedUpScrap"
    FXEventName="PickedUpScrap"
    ObjName="Pick Up Scrap"
}