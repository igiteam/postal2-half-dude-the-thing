class KynapseAIController extends GameAIController
    config(Game)
    hidecategories(AnimDependency,Navigation);

var(accidentRatio) /*0x02000000-0x00000000*/ private @NULL KynapseBotPointer;
var(accidentRatio) /*0x02000000-0x00000000*/ private bool bPathComputed;

// Export UKynapseAIController::execKynapse_PathFinderArrivedAtDest(FFrame&, void* const)
native function Kynapse_PathFinderArrivedAtDest()
{
    local /*0x02000000-0x00000000*/ private @NULL Dest[8388609];
    local /*0x02000000-0x00000000*/ private bool ReturnValue[92274689];


}

function OnAIWander()
{
    local /*0x02000000-0x00000000*/ private @NULL Action[8388609];

    ClearLatentAction(Class'KynapseSeqAct_AIWander', true, Action);
    //return;    
}

function OnAIFlee()
{
    local /*0x02000000-0x00000000*/ private @NULL Action[8388609];

    ClearLatentAction(Class'KynapseSeqAct_AIFlee', true, Action);
    //return;    
}

function OnAIFollow()
{
    local /*0x02000000-0x00000000*/ private @NULL Action[8388609];

    ClearLatentAction(Class'KynapseSeqAct_AIFollow', true, Action);
    //return;    
}

function OnAIHide()
{
    local /*0x02000000-0x00000000*/ private @NULL Action[8388609];

    ClearLatentAction(Class'KynapseSeqAct_AIHide', true, Action);
    //return;    
}

function OnAIGoTo()
{
    local /*0x02000000-0x00000000*/ private @NULL Action[8388609];

    ClearLatentAction(Class'KynapseSeqAct_AIGoTo', true, Action);
    //return;    
}

function OnAIShoot()
{
    local /*0x02000000-0x00000000*/ private @NULL Action[8388609];

    ClearLatentAction(Class'KynapseSeqAct_AIShoot', true, Action);
    //return;    
}
