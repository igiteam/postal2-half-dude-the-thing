class LPCSAO_HumanNPC extends LPContextSensitiveAnimObject
    dontsortcategories(TemplateAnims,SingleAnims);

struct native LPCSAForwardMovementInfo
{
    var(0.25_Pct) /*0x7CE20000-0x00000000*/ private float AnimSpeed[65537];
    var(0.25_Pct) /*0x7CE20000-0x00000000*/ private float TransitionSpeed[65537];

    structdefaultproperties
    {
        AnimSpeed=0.0000000
        TransitionSpeed=0.0000000
    }
};

var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL WalkForwardAnim[65537];
var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL JogForwardAnim[65537];
var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL RunForwardAnim[65537];
var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL StrafeRightAnim[65537];
var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL StrafeLeftAnim[65537];
var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL StrafeBackAnim[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL IdleTemplate[65537];
var(0.25_Pct) /*0xCF6D0000-0x00000000*/ private bool bDisableTurnAnims[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float GroundSpeed[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private editfixedsize array MovementInfo[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float StrafeRightAnimSpeed[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float StrafeLeftAnimSpeed[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float StrafeBackAnimSpeed[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name ForwardBlendBySpeed[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name WalkForwardScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name JogForwardScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name RunForwardScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name StrafeRightScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name StrafeLeftScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name StrafeBackScaleRateBySpeedName[65537];

event GetAllSingleAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SingleAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    SingleAnims.AddItem(WalkForwardAnim);    
    SingleAnims.AddItem(JogForwardAnim);    
    SingleAnims.AddItem(RunForwardAnim);    
    SingleAnims.AddItem(StrafeRightAnim);    
    SingleAnims.AddItem(StrafeLeftAnim);    
    SingleAnims.AddItem(StrafeBackAnim);    
    super(SPContextSensitiveAnimObject).GetAllSingleAnims(SingleAnims, inPawn);
    //return;    
}

event GetAllTemplateAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array TemplateAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    TemplateAnims.AddItem(IdleTemplate);    
    super(SPContextSensitiveAnimObject).GetAllTemplateAnims(TemplateAnims, inPawn);
    //return;    
}

event OnBecomeActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.OnBecomeActive(inPawn);
    SetMovementOnPawn(inPawn);
    inPawn.TransitionComponent.bComponentEnabled = !bDisableTurnAnims;
    //return;    
}

function SetMovementOnPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], BlendBySpeedNode, ScaleBySpeedNode;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ScaleBySpeedNodeNames, ScaleBySpeedNodes;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private float NextSpeed;

    BlendBySpeedNode = SPAnimNodeBlendBySpeed(inPawn.Mesh.FindAnimNode(ForwardBlendBySpeed));
    // End:0x61
    if(BlendBySpeedNode == none)
    {
        return;
    }
    Idx = 0;
    J0x6C:

    // End:0x212 [Loop If]
    if((Idx < MovementInfo.Length) && Idx < BlendBySpeedNode.Constraints.Length)
    {
        // End:0x204
        if(Idx < BlendBySpeedNode.Constraints.Length)
        {
            // End:0x143
            if(MovementInfo[Idx].TransitionSpeed > 0.0000000)
            {
                NextSpeed = MovementInfo[Idx].TransitionSpeed;                
            }
            else
            {
                // End:0x1C3
                if((Idx + 1) < MovementInfo.Length)
                {
                    NextSpeed = (MovementInfo[Idx + 1].AnimSpeed + MovementInfo[Idx].AnimSpeed) * 0.5000000;                    
                }
                else
                {
                    NextSpeed = 100000.0000000;
                }
            }
            BlendBySpeedNode.Constraints[Idx] = NextSpeed;
        }
        Idx++;
        // [Loop Continue]
        goto J0x6C;
    }
    ScaleBySpeedNodeNames.AddItem(WalkForwardScaleRateBySpeedName);    
    ScaleBySpeedNodeNames.AddItem(JogForwardScaleRateBySpeedName);    
    ScaleBySpeedNodeNames.AddItem(RunForwardScaleRateBySpeedName);    
    ScaleBySpeedNodeNames.AddItem(StrafeRightScaleRateBySpeedName);    
    ScaleBySpeedNodeNames.AddItem(StrafeLeftScaleRateBySpeedName);    
    ScaleBySpeedNodeNames.AddItem(StrafeBackScaleRateBySpeedName);    
    inPawn.Mesh.Animations.FindAnimNodes(ScaleBySpeedNodeNames, ScaleBySpeedNodes, Class'LPAnimNodeScaleRateBySpeed');
    Idx = 0;
    J0x305:

    // End:0x405 [Loop If]
    if((Idx < MovementInfo.Length) && Idx < ScaleBySpeedNodes.Length)
    {
        ScaleBySpeedNode = LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[Idx]);
        // End:0x3F7
        if(ScaleBySpeedNode != none)
        {
            ScaleBySpeedNode.BaseSpeed = MovementInfo[Idx].AnimSpeed;
            ScaleBySpeedNode.MaximumRate = ((Idx == (MovementInfo.Length - 1)) ? 1.0000000 : 0.0000000);
        }
        Idx++;
        // [Loop Continue]
        goto J0x305;
    }
    ScaleBySpeedNode = LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[3]);
    // End:0x45B
    if(ScaleBySpeedNode != none)
    {
        ScaleBySpeedNode.BaseSpeed = StrafeRightAnimSpeed;
    }
    ScaleBySpeedNode = LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[4]);
    // End:0x4B1
    if(ScaleBySpeedNode != none)
    {
        ScaleBySpeedNode.BaseSpeed = StrafeLeftAnimSpeed;
    }
    ScaleBySpeedNode = LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[5]);
    // End:0x507
    if(ScaleBySpeedNode != none)
    {
        ScaleBySpeedNode.BaseSpeed = StrafeBackAnimSpeed;
    }
    // End:0x543
    if(GroundSpeed > float(0))
    {
        inPawn.GroundSpeed = GroundSpeed;        
    }
    else
    {
        // End:0x5CF
        if(inPawn.TuneDataBasePawn != none)
        {
            inPawn.GroundSpeed = inPawn.TuneDataBasePawn.GroundSpeed_Tunable.GetValue();
        }
    }
    //return;    
}

defaultproperties
{
    WalkForwardAnim=(AnimSlotName="WalkForwardSlotNode",AnimSeqName="None")
    JogForwardAnim=(AnimSlotName="JogForwardSlotNode",AnimSeqName="None")
    RunForwardAnim=(AnimSlotName="RunForwardSlotNode",AnimSeqName="None")
    StrafeRightAnim=(AnimSlotName="StrafeRightSlotNode",AnimSeqName="None")
    StrafeLeftAnim=(AnimSlotName="StrafeLeftSlotNode",AnimSeqName="None")
    StrafeBackAnim=(AnimSlotName="StrafeBackSlotNode",AnimSeqName="None")
    IdleTemplate=(AnimSlotName="IdleSlotNode",AnimNodeTemplateName="None")
    ForwardBlendBySpeed="ForwardBlendBySpeed"
    WalkForwardScaleRateBySpeedName="WalkForwardScaleRateBySpeed"
    JogForwardScaleRateBySpeedName="JogForwardScaleRateBySpeed"
    RunForwardScaleRateBySpeedName="RunForwardScaleRateBySpeed"
    StrafeRightScaleRateBySpeedName="StrafeRightScaleRateBySpeed"
    StrafeLeftScaleRateBySpeedName="StrafeLeftScaleRateBySpeed"
    StrafeBackScaleRateBySpeedName="StrafeBackScaleRateBySpeed"
    bCanLowHealthCSAOverride=true
    bAllowSwitchToBestWeaponCheck=true
    PawnClass=Class'LPAIPawnHumanNPC'
}