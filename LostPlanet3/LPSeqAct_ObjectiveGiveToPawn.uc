class LPSeqAct_ObjectiveGiveToPawn extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Carrier;
var(0.25_Pct) /*0x82E90000-0x00000000*/ private @NULL CourierItem[65537];
var(0.25_Pct) /*0x82E90000-0x00000000*/ private bool bIsArchetype[65537];
var(0.25_Pct) /*0x82E90000-0x00000000*/ private bool bSetEnabled[65537];
var(0.25_Pct) /*0x82E90000-0x00000000*/ private bool bEnabled[65537];
var(0.25_Pct) /*0x82E90000-0x00000000*/ private @NULL DestinationA[65537];
var(0.25_Pct) /*0x82E90000-0x00000000*/ private @NULL DestinationB[65537];

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL CarriedItem;

    // End:0x151
    if(Carrier != none)
    {
        // End:0x151
        if(CourierItem != none)
        {
            // End:0x6F
            if(bIsArchetype)
            {
                CarriedItem = Carrier.Spawn(Class'LPCourierItem',,,,, CourierItem, true);                
            }
            else
            {
                CarriedItem = CourierItem;
            }
            // End:0xB9
            if(DestinationA != none)
            {
                CarriedItem.DestinationA = DestinationA;
            }
            // End:0xF0
            if(DestinationB != none)
            {
                CarriedItem.DestinationB = DestinationB;
            }
            // End:0x127
            if(bSetEnabled)
            {
                CarriedItem.bEnabled = bEnabled;
            }
            CarriedItem.SetCarrier(Carrier, true, false);
        }
    }
    //return;    
}

defaultproperties
{
    bEnabled=true
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Pawn",LinkVar="None",PropertyName="Carrier",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Objective Give To Pawn (LP)"
}