class LPAICmd_CarrierReactAndSwellWhenAllCellsDestroyedFvs extends LPAICmd_CarrierReactAndSwellWhenAllCellsDestroyed within LPAIControllerCarrier
    config(AI);

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function GetReactionToAllCellsDestroyedSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierReactionToAllCellsDestroyedAndSwellFvs';
    //return ReturnValue;    
}
