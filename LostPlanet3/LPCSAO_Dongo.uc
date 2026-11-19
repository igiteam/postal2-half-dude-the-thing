class LPCSAO_Dongo extends LPContextSensitiveAnimObject
    dontsortcategories(TemplateAnims,SingleAnims);

var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL RunTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL RunBackTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL IdleTemplate[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name WalkForwardScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name JogForwardScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name SprintForwardScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float AnimatedWalkSpeed[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float AnimatedJogSpeed[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float AnimatedSprintSpeed[65537];

event GetAllSingleAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SingleAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super(SPContextSensitiveAnimObject).GetAllSingleAnims(SingleAnims, inPawn);
    //return;    
}

event GetAllTemplateAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array TemplateAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super(SPContextSensitiveAnimObject).GetAllTemplateAnims(TemplateAnims, inPawn);
    TemplateAnims.AddItem(RunTemplate);    
    TemplateAnims.AddItem(RunBackTemplate);    
    TemplateAnims.AddItem(IdleTemplate);    
    //return;    
}

event OnBecomeActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array ScaleBySpeedNodeNames, ScaleBySpeedNodes;

    super.OnBecomeActive(inPawn);
    ScaleBySpeedNodeNames.AddItem(WalkForwardScaleRateBySpeedName);    
    ScaleBySpeedNodeNames.AddItem(JogForwardScaleRateBySpeedName);    
    ScaleBySpeedNodeNames.AddItem(SprintForwardScaleRateBySpeedName);    
    inPawn.Mesh.Animations.FindAnimNodes(ScaleBySpeedNodeNames, ScaleBySpeedNodes, Class'LPAnimNodeScaleRateBySpeed');
    LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[0]).BaseSpeed = AnimatedWalkSpeed;
    LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[1]).BaseSpeed = AnimatedJogSpeed;
    LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[2]).BaseSpeed = AnimatedSprintSpeed;
    //return;    
}

defaultproperties
{
    RunTemplate=(AnimSlotName="RunForwardSlotNode",AnimNodeTemplateName="None")
    RunBackTemplate=(AnimSlotName="RunBackwardSlotNode",AnimNodeTemplateName="None")
    IdleTemplate=(AnimSlotName="IdleSlotNode",AnimNodeTemplateName="None")
    WalkForwardScaleRateBySpeedName="WalkForwardScaleRateBySpeed"
    JogForwardScaleRateBySpeedName="RunForwardScaleRateBySpeed"
    SprintForwardScaleRateBySpeedName="SprintForwardScaleRateBySpeed"
    PawnClass=Class'LPAIPawnDongo'
}