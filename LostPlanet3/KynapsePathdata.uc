class KynapsePathdata extends Actor
    collapsecategories
    placeable
    hidecategories(AnimDependency,Navigation,Movement,Collision,Advanced,Attachment,Display,Object,Actor,Physics,Debug,Mobile);

struct native LocalPathdata
{
    var(accidentRatio) /*0x01D00000-0x00000000*/ private @NULL Family[65537];
    var(accidentRatio) /*0x01D00000-0x00000000*/ private bool bDontBuild[65537];
    var(accidentRatio) /*0x01D00000-0x00000000*/ private bool bOnlyMySubLevel[65537];
    var(accidentRatio) /*0x02000000-0x00000000*/ private bool bVisited;
    var(accidentRatio) /*0x02000000-0x00000000*/ private bool bForSecondPass;
    var(accidentRatio) /*0x02000000-0x00000010*/ private editfixedsize array PathDataAggregate;

    structdefaultproperties
    {
        Family=none
        bDontBuild=false
        bOnlyMySubLevel=false
        bVisited=false
        bForSecondPass=false
        PathDataAggregate=none
    }
};

var(accidentRatio) /*0x02180000-0x00000000*/ private editfixedsize array LocalData[65537];
var(accidentRatio) /*0x02000000-0x00000400*/ private editfixedsize transient @NULL FlyGraphParamters[524289];
var(accidentRatio) /*0x02180000-0x00000400*/ private editfixedsize array KynapseLevelSpecificParams[65537];
var(accidentRatio) /*0x02180000-0x00000400*/ private editfixedsize array FlyGraphLevelSpecificParams[65537];
var(accidentRatio) /*0x02180000-0x00000000*/ private bool bHiddenEditor[65537];

defaultproperties
{
    Components[0]=none
    bMovable=false
    bNoEncroachCheck=true
}