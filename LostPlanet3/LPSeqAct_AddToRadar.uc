class LPSeqAct_AddToRadar extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x825C0000-0x00000000*/ private @NULL RadarParams[65537];

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerObj, LPPC;

    // End:0x27
    if(VariableLinks[1].LinkedVariables.Length == 0)
    {
        return;
    }
    PlayerObj = SeqVar_Player(VariableLinks[1].LinkedVariables[0]).GetObjectValue();
    // End:0x130
    if((((PlayerObj == none) || !ClassIsChildOf(PlayerObj.Class, Class'Engine.Pawn')) || Pawn(PlayerObj).Controller == none) || !ClassIsChildOf(Pawn(PlayerObj).Controller.Class, Class'LPPlayerController'))
    {
        return;
    }
    LPPC = LPPlayerController(Pawn(PlayerObj).Controller);
    // End:0x1C0
    if(InputLinks[0].bHasImpulse)
    {
        LPPC.RadarAddObjects(Targets, RadarParams);        
    }
    else
    {
        // End:0x20A
        if(InputLinks[1].bHasImpulse)
        {
            LPPC.RadarRemoveObjects(Targets);
        }
    }
    //return;    
}

defaultproperties
{
    RadarParams=(IconType=EMapIconTypes.EMapIcon_GenericRed,bIconStaysOnEdge=false,bRotatesWithActor=true)
    bCallHandler=false
    InputLinks[0]=(LinkDesc="Add",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Remove",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Player',LinkedVariables=none,LinkDesc="Player",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=0,MaxVars=1,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Add To Radar (LP)"
}