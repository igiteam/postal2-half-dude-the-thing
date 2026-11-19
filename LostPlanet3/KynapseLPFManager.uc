class KynapseLPFManager extends KynapseWorldService
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Movement,Collision,Advanced,Attachment,Display,Object);

var(accidentRatio) /*0x01560000-0x00000000*/ private editfixedsize array LpfContexts[196609];
var(accidentRatio) /*0x01560000-0x00000000*/ private bool AsynchronousLPF[65537];

defaultproperties
{
    AsynchronousLPF=true
}