class SeqAct_ChangeCollision extends SequenceAction
    hidecategories(Object);

var(*) /*0x43F20000-0x00000000*/ private const bool bCollideActors[196609];
var(*) /*0x43F20000-0x00000000*/ private const bool bBlockActors[196609];
var(*) /*0x43F20000-0x00000000*/ private const bool bIgnoreEncroachers[196609];
var(*) /*0x43F20000-0x00000000*/ private byte CollisionType[65537];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 4;
    //return ReturnValue;    
}

defaultproperties
{
    ObjName="Change Collision"
}