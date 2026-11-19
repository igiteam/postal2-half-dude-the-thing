class LPSM_SmartObjectInteraction extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InteractionTemplateAnimTree[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name InteractionTemplateAnimName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToAlignTo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL User[536870913];

function InitAnimations()
{
    //return;    
}

function PickAnimTemplateToReplicate()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ReplicatedAnimSeqs[25165826], FoundNode;

    out_ReplicatedAnimSeqs[0] = none;
    FoundNode = SPAnimNodeTemplateLogicNamedRoot(InteractionTemplateAnimTree.FindAnimNode(InteractionTemplateAnimName));
    // End:0x8B
    if(FoundNode != none)
    {
        out_ReplicatedAnimSeqs[0] = FoundNode.GetBestSequenceTemplate(User);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}
