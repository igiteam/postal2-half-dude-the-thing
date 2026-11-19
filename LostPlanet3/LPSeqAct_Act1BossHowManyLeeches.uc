class LPSeqAct_Act1BossHowManyLeeches extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumLeft;

static event GetObjClassVersion()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 0;
    //return ReturnValue;    
}

function Activated()
{
    NumLeft = Class'LPAIControllerAct1Boss'.static.GetLeechCount();
    //return;    
}

defaultproperties
{
    bCallHandler=false
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Int',LinkedVariables=none,LinkDesc="NumLeft",LinkVar="None",PropertyName="NumLeft",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=true,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Act 1 Boss How Many Leeches Query (LP)"
}