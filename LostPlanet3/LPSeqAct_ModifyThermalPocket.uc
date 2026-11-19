class LPSeqAct_ModifyThermalPocket extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

enum EThermalPocketProperty
{
    ThermalPocketProperty_RemainingEnergy,// 0
    ThermalPocketProperty_EnableDisable,// 1
    ThermalPocketProperty_Shutdown, // 2
    ThermalPocketProperty_SetMaximumEnergy,// 3
    ThermalPocketProperty_MAX       // 4
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ThermalPockets;
var(0.25_Pct) /*0x82E30000-0x00000000*/ private byte PropertyType[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NewValue;

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL P;

    // End:0x48
    if(VariableLinks[0].LinkedVariables.Length < 1)
    {
        OutputLinks[0].bHasImpulse = true;
        return;
    }
    // End:0x139
    foreach ThermalPockets(P)
    {
        switch(PropertyType)
        {
            // End:0xA3
            case 0:
                P.SetRemainingEnergy(NewValue);
                // End:0x138
                break;
            // End:0xD8
            case 1:
                P.SetEnabled(NewValue != float(0));
                // End:0x138
                break;
            // End:0x105
            case 2:
                P.SetRemainingEnergy(0.0000000, true);
                // End:0x138
                break;
            // End:0x135
            case 3:
                P.SetMaxEnergy(NewValue);
                // End:0x138
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }    
    OutputLinks[0].bHasImpulse = true;
    //return;    
}

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target Pockets",LinkVar="None",PropertyName="ThermalPockets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=none,LinkDesc="Value",LinkVar="None",PropertyName="NewValue",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Thermal Pocket Modify Property (LP)"
}