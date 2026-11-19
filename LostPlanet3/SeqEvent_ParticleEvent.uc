class SeqEvent_ParticleEvent extends SequenceEvent
    hidecategories(Object);

enum EParticleEventOutputType
{
    ePARTICLEOUT_Spawn,             // 0
    ePARTICLEOUT_Death,             // 1
    ePARTICLEOUT_Collision,         // 2
    ePARTICLEOUT_AttractorCollision,// 3
    ePARTICLEOUT_Kismet,            // 4
    ePARTICLEOUT_MAX                // 5
};

var(*) /*0x35EA0000-0x00000000*/ private byte EventType;
var(*) /*0x35EA0000-0x00000000*/ private @NULL EventPosition;
var(*) /*0x35EA0000-0x00000000*/ private float EventEmitterTime;
var(*) /*0x35EA0000-0x00000000*/ private @NULL EventVelocity;
var(*) /*0x35EA0000-0x00000000*/ private float EventParticleTime;
var(*) /*0x35EA0000-0x00000000*/ private @NULL EventNormal;
var(*) /*0x44740000-0x00000000*/ private bool UseRelfectedImpactVector[65537];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 0;
    //return ReturnValue;    
}

defaultproperties
{
    MaxTriggerCount=0
    bPlayerOnly=false
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Instigator",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Int',LinkedVariables=none,LinkDesc="Type",LinkVar="None",PropertyName="EventType",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[2]=(ExpectedType=Class'SeqVar_Vector',LinkedVariables=none,LinkDesc="Pos",LinkVar="None",PropertyName="EventPosition",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[3]=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="ETime",LinkVar="None",PropertyName="EventEmitterTime",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[4]=(ExpectedType=Class'SeqVar_Vector',LinkedVariables=none,LinkDesc="Vel",LinkVar="None",PropertyName="EventVelocity",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[5]=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="PTime",LinkVar="None",PropertyName="EventParticleTime",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[6]=(ExpectedType=Class'SeqVar_Vector',LinkedVariables=none,LinkDesc="Normal",LinkVar="None",PropertyName="EventNormal",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="ParticleEvent"
}