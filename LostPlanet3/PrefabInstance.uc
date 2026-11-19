class PrefabInstance extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000000*/ private @NULL TemplatePrefab[131073];
var(*) /*0x35EA0000-0x00000000*/ private int TemplateVersion[131073];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} ArchetypeToInstanceMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SequenceInstance[131073];
var(*) /*0x35EA0000-0x00000000*/ private int PI_PackageVersion[131073];
var(*) /*0x35EA0000-0x00000000*/ private int PI_LicenseePackageVersion[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PI_Bytes[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PI_CompleteObjects[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PI_ReferencedObjects[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PI_SavedNames[131073];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} PI_ObjectMap[268566529];

defaultproperties
{
    PI_PackageVersion=-1
    PI_LicenseePackageVersion=-1
    Components[0]=none
}