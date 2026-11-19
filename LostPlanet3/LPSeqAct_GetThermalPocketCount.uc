class LPSeqAct_GetThermalPocketCount extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

enum EThermalPocketCountType
{
    ThermalPocketCount_Enabled,     // 0
    ThermalPocketCount_Disabled,    // 1
    ThermalPocketCount_Total,       // 2
    ThermalPocketCount_Empty,       // 3
    ThermalPocketCount_NonEmpty,    // 4
    ThermalPocketCount_MAX          // 5
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ThermalPockets;
var(0.25_Pct) /*0x82BC0000-0x00000000*/ private byte CountType[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Count;

event Activated()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array ValidPockets;
    local /*0x97E50000-0x00000000*/ private @NULL P;

    // End:0x53
    if(VariableLinks[0].LinkedVariables.Length < 1)
    {
        Count = 0;
        OutputLinks[0].bHasImpulse = true;
        return;
    }
    switch(CountType)
    {
        // End:0xEB
        case 0:
            // End:0xE7
            foreach ThermalPockets(P)
            {
                // End:0xE6
                if((P.bEnabled == true) && P.GetEnergyRemaining() > float(0))
                {
                    ValidPockets.AddItem(P);                    
                }                
            }            
            // End:0x23D
            break;
        // End:0x147
        case 1:
            // End:0x143
            foreach ThermalPockets(P)
            {
                // End:0x142
                if(P.bEnabled == false)
                {
                    ValidPockets.AddItem(P);                    
                }                
            }            
            // End:0x23D
            break;
        // End:0x1A5
        case 4:
            // End:0x1A1
            foreach ThermalPockets(P)
            {
                // End:0x1A0
                if(P.GetEnergyRemaining() > float(0))
                {
                    ValidPockets.AddItem(P);                    
                }                
            }            
            // End:0x23D
            break;
        // End:0x1DC
        case 2:
            // End:0x1D8
            foreach ThermalPockets(P)
            {
                ValidPockets.AddItem(P);                                
            }            
            // End:0x23D
            break;
        // End:0x23A
        case 3:
            // End:0x236
            foreach ThermalPockets(P)
            {
                // End:0x235
                if(P.GetEnergyRemaining() <= float(0))
                {
                    ValidPockets.AddItem(P);                    
                }                
            }            
            // End:0x23D
            break;
        // End:0xFFFF
        default:
            break;
    }
    Count = ValidPockets.Length;
    OutputLinks[0].bHasImpulse = true;
    //return;    
}

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target Pockets",LinkVar="None",PropertyName="ThermalPockets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Int',LinkedVariables=none,LinkDesc="Count",LinkVar="None",PropertyName="Count",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Thermal Pocket Count (LP)"
}