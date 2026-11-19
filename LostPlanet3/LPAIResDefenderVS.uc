class LPAIResDefenderVS extends LPAIResVsPhysAttackLocMgr within LPBaseVSPlayerPawn
    editinlinenew
    hidecategories(Object);

function Init()
{
    BuildAttackSocketData(Outer.TuneDataVSPlayerPawn.DefenderAttackSlotSockets);
    //return;    
}
