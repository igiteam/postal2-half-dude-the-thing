class PBRuleNodeEdgeAngle extends PBRuleNodeBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

enum EProcBuildingEdge
{
    EPBE_Top,                       // 0
    EPBE_Bottom,                    // 1
    EPBE_Left,                      // 2
    EPBE_Right,                     // 3
    EPBE_MAX                        // 4
};

struct native RBEdgeAngleInfo
{
    var(*) /*0x40190000-0x00000000*/ private float Angle[65537];

    structdefaultproperties
    {
        Angle=0.0000000
    }
};

var(*) /*0x3B750000-0x00000000*/ private byte Edge[65537];
var(*) /*0x3B750000-0x00000000*/ private editfixedsize array Angles[65537];

defaultproperties
{
    Edge=EProcBuildingEdge.EPBE_Left
    NextRules=none
}