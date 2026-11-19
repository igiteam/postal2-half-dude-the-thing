class LPSeqAct_PickUpThermalEnergy extends LPSeqAct_PickUpBase
    abstract
    hidecategories(Object);

var(0.25_Pct) /*0x82F90000-0x00000000*/ private float MinEnergyToGive[65537];
var(0.25_Pct) /*0x82F90000-0x00000000*/ private float MaxEnergyToGive[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGiveToPlayerIfDoesNotHave;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class InventoryType;

function GiveEnergyTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL IM;
    local /*0x97E50000-0x00000000*/ private class InvClassToAddTo;
    local /*0x97E50000-0x00000000*/ private float EnergyToGive;
    local /*0x97E50000-0x00000000*/ private @NULL Inv, TE;

    IM = SPEngineInventoryManager(P.InvManager);
    // End:0x53
    if((IM == none) || InventoryType == none)
    {
        return false;
    }
    EnergyToGive = MinEnergyToGive + float(Rand(int(MaxEnergyToGive - MinEnergyToGive)));
    InvClassToAddTo = self.InventoryType;
    Inv = IM.FindInventoryType(InvClassToAddTo, true);
    // End:0x173
    if(Inv == none)
    {
        Inv = P.InvManager.Spawn(InvClassToAddTo);
        // End:0x173
        if((Inv == none) || !IM.AddInventory(Inv, true))
        {
            return false;
        }
    }
    TE = LPThermalEnergy(Inv);
    // End:0x1FB
    if(TE != none)
    {
        Inv.AnnouncePickup(P);
        LPThermalEnergy(Inv).AddEnergy(EnergyToGive);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function PickedUpItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    // End:0x29
    if(GiveEnergyTo(P))
    {
        super.PickedUpItem(P);
    }
    //return;    
}

defaultproperties
{
    // Reference: LPQuestObjectSelector'Default__LPSeqAct_PickUpThermalEnergy.QuestEntryA'
    begin object name=QuestEntryA
    end object
    QuestEntry=QuestEntryA
    SoundEventName="TEnergyPickup"
    FXEventName="TEnergyPickup"
    ObjName="Pick Up Thermal Energy"
}