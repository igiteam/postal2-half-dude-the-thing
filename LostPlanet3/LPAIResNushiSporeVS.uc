class LPAIResNushiSporeVS extends LPAIResVsPhysAttackLocMgr within LPBaseVSPlayerPawn
    editinlinenew
    hidecategories(Object);

function Init()
{
    BuildAttackSocketData(Outer.TuneDataVSPlayerPawn.NushiSporeAttackSlotSockets);
    //return;    
}
