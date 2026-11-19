class SeqAct_ProjectileFactory extends SeqAct_ActorFactory
    hidecategories(Object);

var(*) /*0x34170000-0x00000000*/ private @NULL PSTemplate[65537];
var(*) /*0x34170000-0x00000000*/ private name SocketName[65537];
var(*) /*0x34170000-0x00000000*/ private name BoneName[65537];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super.GetObjClassVersion() + 0;
    //return ReturnValue;    
}

defaultproperties
{
    SpawnDelay=0.0000000
    InputLinks[0]=(LinkDesc="Spawn Projectile",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Enable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[2]=(LinkDesc="Disable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[3]=(LinkDesc="Toggle",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Projectile Factory"
}