class SeqAct_RangeSwitch extends SequenceAction
    hidecategories(Object);

struct native SwitchRange
{
    var(*) /*0x4B270000-0x00000000*/ private int Min[65537];
    var(*) /*0x4B270000-0x00000000*/ private int Max[65537];

    structdefaultproperties
    {
        Min=0
        Max=0
    }
};

var(*) /*0x44210000-0x00000400*/ private editfixedsize array Ranges[65537];

defaultproperties
{
    OutputLinks=none
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Int',LinkedVariables=none,LinkDesc="Index",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Ranged"
}