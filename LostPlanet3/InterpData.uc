class InterpData extends SequenceVariable
    hidecategories(Object);

struct native AnimSetBakeAndPruneStatus
{
    var(*) /*0x03060000-0x00000000*/ private const editfixedsize string AnimSetName[65537];
    var(*) /*0x03060000-0x00000000*/ private const bool bReferencedButUnused[65537];
    var(*) /*0x03060000-0x00000000*/ private bool bSkipBakeAndPrune[65537];
    var(*) /*0x03060000-0x00000000*/ private bool bSkipCooking[65537];

    structdefaultproperties
    {
        AnimSetName=""
        bReferencedButUnused=false
        bSkipBakeAndPrune=false
        bSkipCooking=false
    }
};

var(*) /*0x35EA0000-0x00000000*/ private float InterpLength;
var(*) /*0x35EA0000-0x00000000*/ private float PathBuildTime;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array InterpGroups[524289];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CurveEdSetup[524289];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array InterpFilters;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SelectedFilter;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DefaultFilters[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float EdSectionStart;
var(*) /*0x35EA0000-0x00000000*/ private float EdSectionEnd;
var(*) /*0x2BC00000-0x00000000*/ private bool bShouldBakeAndPrune[65537];
var(*) /*0x2BC00000-0x00000000*/ private editfixedsize array BakeAndPruneStatus[4259841];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedDirectorGroup[536870913];

defaultproperties
{
    InterpLength=5.0000000
    EdSectionEnd=1.0000000
    ObjName="Matinee Data"
}