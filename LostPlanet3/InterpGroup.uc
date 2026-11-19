class InterpGroup extends Object
    collapsecategories
    hidecategories(Object);

struct InterpEdSelKey
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Group;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Track;
    var(*) /*0x35EA0000-0x00000000*/ private int KeyIndex;
    var(*) /*0x35EA0000-0x00000000*/ private float UnsnappedPosition;

    structdefaultproperties
    {
        Group=none
        Track=none
        KeyIndex=0
        UnsnappedPosition=0.0000000
    }
};

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_FInterpEdInputInterface[268566529];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array InterpTracks[524289];
var(*) /*0x35EA0000-0x00000000*/ private name GroupName;
var(*) /*0x2BC70000-0x00000000*/ private @NULL GroupColor[65537];
var(*) /*0x2BC70000-0x00000000*/ private editfixedsize array GroupAnimSets[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bCollapsed;
var(*) /*0x35EA0000-0x00000000*/ private bool bVisible[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsFolder;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsParented;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsSelected[536870913];
var(*) /*0x2BC70000-0x00000000*/ private bool bOnlyEndGroupOnDeath[65537];

defaultproperties
{
    GroupName="InterpGroup"
    GroupColor=(R=100,G=80,B=200,A=255)
    bVisible=true
}