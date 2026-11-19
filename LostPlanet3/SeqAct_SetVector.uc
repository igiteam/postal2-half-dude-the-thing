class SeqAct_SetVector extends SeqAct_SetSequenceVariable
    hidecategories(Object);

var(*) /*0x443A0000-0x00000000*/ private @NULL DefaultValue[65537];

event Activated()
{
    local /*0x35EA0000-0x00000000*/ private bool bIgnoreDefault;
    local /*0x35EA0000-0x00000000*/ private @NULL VectVar, Value;

    // End:0x5C
    foreach LinkedVariables(Class'SeqVar_Vector', VectVar, "Value")
    {
        bIgnoreDefault = true;
        Value += VectVar.VectValue;        
    }    
    // End:0x7F
    if(!bIgnoreDefault)
    {
        Value = DefaultValue;
    }
    // End:0xCF
    foreach LinkedVariables(Class'SeqVar_Vector', VectVar, "Target")
    {
        VectVar.VectValue = Value;        
    }    
    //return;    
}

defaultproperties
{
    bCallHandler=false
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Vector',LinkedVariables=none,LinkDesc="Value",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Vector',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Vector"
}