class KynapseModifierSelectPathNodeCandidate_NextPathNode extends KynapseModifierSelectPathNodeCandidate
    editinlinenew
    hidecategories(Object,Movement,Collision,Advanced,Attachment,Display,Object,Movement,Collision,Advanced,Attachment,Display,Object,Movement,Collision,Advanced,Attachment,Display,Object)
    autoexpandcategories(KynapseModifierSelectPathNodeCandidate_NextPathNode);

var(accidentRatio) /*0x01810000-0x00000000*/ private float maxDistancePathNode[65537];
var(accidentRatio) /*0x01810000-0x00000000*/ private int maxCandidatePerFrame[65537];
var(accidentRatio) /*0x01810000-0x00000000*/ private int nodesToSkip[65537];

defaultproperties
{
    maxDistancePathNode=50.0000000
    maxCandidatePerFrame=2
    nodesToSkip=4
    ClassName="Modifier::SelectPathNodeCandidate_NextPathNode"
}