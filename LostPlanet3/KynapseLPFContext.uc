class KynapseLPFContext extends KynapseObject
    editinlinenew
    hidecategories(Object,Movement,Collision,Advanced,Attachment,Display,Object);

enum EPreMergerType
{
    KYPMT_Grid,                     // 0
    KYPMT_Polygon,                  // 1
    KYPMT_MAX                       // 2
};

var(accidentRatio) /*0x01550000-0x00000000*/ private float minDeltaHeight[196609];
var(accidentRatio) /*0x01550000-0x00000000*/ private float inhibitionPeriod[196609];
var(accidentRatio) /*0x01550000-0x00000000*/ private editfixedsize array ObstacleTypeToProject[196609];
var(accidentRatio) /*0x01550000-0x00000000*/ private editfixedsize array ObstacleTypeToNotProject[196609];
var(accidentRatio) /*0x01550000-0x00000000*/ private byte preMergerType[196609];

defaultproperties
{
    minDeltaHeight=1.8000000
    inhibitionPeriod=0.5000000
}