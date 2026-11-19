class LPCSAO_Player extends LPContextSensitiveAnimObject
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
var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL SprintForwardAnim[65537];
var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL StrafeRightAnim[65537];
var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL StrafeLeftAnim[65537];
var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL StrafeBackAnim[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL IdleTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL WalkForwardTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL JogForwardTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL SprintForwardTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL StrafeRightTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL StrafeLeftTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL StrafeBackTemplate[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float GroundSpeed[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float SprintSpeedScale[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float AnimatedWalkSpeed[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float AnimatedJogSpeed[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float AnimatedSprintSpeed[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float WalkToJogTransitionSpeed[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float StrafeRightAnimSpeed[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float StrafeLeftAnimSpeed[65537];
var(0.25_Pct) /*0x94530000-0x00000000*/ private float StrafeBackAnimSpeed[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name ForwardBlendBySpeed[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name WalkForwardScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name JogForwardScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name SprintForwardScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name StrafeRightScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name StrafeLeftScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name StrafeBackScaleRateBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name AimOverLeftShoulderBlendBySpeedName[65537];
var(0.25_Pct) /*0x97D70000-0x00000000*/ private const name AimOverRightShoulderBlendBySpeedName[65537];
var(0.25_Pct) /*0x01AF0000-0x00000000*/ private bool bCanUseGrapplingHook[65537];
var(0.25_Pct) /*0x01AF0000-0x00000000*/ private bool bCanDodge[65537];
var(0.25_Pct) /*0x01AF0000-0x00000000*/ private bool bCanSprint[65537];
var(0.25_Pct) /*0x01AF0000-0x00000000*/ private bool bIsCrouchingCSA[65537];

event GetAllSingleAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SingleAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    // End:0x40
    if(WalkForwardTemplate.AnimNodeTemplateName == 'None')
    {
        SingleAnims.AddItem(WalkForwardAnim);        
    }
    // End:0x80
    if(JogForwardTemplate.AnimNodeTemplateName == 'None')
    {
        SingleAnims.AddItem(JogForwardAnim);        
    }
    // End:0xC0
    if(SprintForwardTemplate.AnimNodeTemplateName == 'None')
    {
        SingleAnims.AddItem(SprintForwardAnim);        
    }
    // End:0x100
    if(StrafeRightTemplate.AnimNodeTemplateName == 'None')
    {
        SingleAnims.AddItem(StrafeRightAnim);        
    }
    // End:0x140
    if(StrafeLeftTemplate.AnimNodeTemplateName == 'None')
    {
        SingleAnims.AddItem(StrafeLeftAnim);        
    }
    // End:0x180
    if(StrafeBackTemplate.AnimNodeTemplateName == 'None')
    {
        SingleAnims.AddItem(StrafeBackAnim);        
    }
    super(SPContextSensitiveAnimObject).GetAllSingleAnims(SingleAnims, inPawn);
    //return;    
}

event GetAllTemplateAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array TemplateAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    TemplateAnims.AddItem(IdleTemplate);    
    // End:0x56
    if(WalkForwardTemplate.AnimNodeTemplateName != 'None')
    {
        TemplateAnims.AddItem(WalkForwardTemplate);        
    }
    // End:0x96
    if(JogForwardTemplate.AnimNodeTemplateName != 'None')
    {
        TemplateAnims.AddItem(JogForwardTemplate);        
    }
    // End:0xD6
    if(SprintForwardTemplate.AnimNodeTemplateName != 'None')
    {
        TemplateAnims.AddItem(SprintForwardTemplate);        
    }
    // End:0x116
    if(StrafeRightTemplate.AnimNodeTemplateName != 'None')
    {
        TemplateAnims.AddItem(StrafeRightTemplate);        
    }
    // End:0x156
    if(StrafeLeftTemplate.AnimNodeTemplateName != 'None')
    {
        TemplateAnims.AddItem(StrafeLeftTemplate);        
    }
    // End:0x196
    if(StrafeBackTemplate.AnimNodeTemplateName != 'None')
    {
        TemplateAnims.AddItem(StrafeBackTemplate);        
    }
    super(SPContextSensitiveAnimObject).GetAllTemplateAnims(TemplateAnims, inPawn);
    //return;    
}

event OnBecomeActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.OnBecomeActive(inPawn);
    SetMovementOnPawn(inPawn);
    SetCameraModeOnPawn(inPawn);
    //return;    
}

function SetMovementOnPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], BlendBySpeedNode, AimOverLeftShoulderBlendBySpeedNode, AimOverRightShoulderBlendBySpeedNode, ScaleBySpeedNode;

    local /*0x97E50000-0x00000000*/ private editfixedsize array ScaleBySpeedNodeNames, ScaleBySpeedNodes;

    BlendBySpeedNode = SPAnimNodeBlendBySpeed(inPawn.Mesh.FindAnimNode(ForwardBlendBySpeed));
    // End:0x61
    if(BlendBySpeedNode == none)
    {
        return;
    }
    AimOverLeftShoulderBlendBySpeedNode = SPAnimNodeBlendBySpeed(inPawn.Mesh.FindAnimNode(AimOverLeftShoulderBlendBySpeedName));
    AimOverRightShoulderBlendBySpeedNode = SPAnimNodeBlendBySpeed(inPawn.Mesh.FindAnimNode(AimOverRightShoulderBlendBySpeedName));
    // End:0x13D
    if(GroundSpeed > float(0))
    {
        inPawn.GroundSpeed = GroundSpeed;        
    }
    else
    {
        // End:0x1C9
        if(inPawn.TuneDataBasePawn != none)
        {
            inPawn.GroundSpeed = inPawn.TuneDataBasePawn.GroundSpeed_Tunable.GetValue();
        }
    }
    // End:0x25B
    if(LPPlayerController(inPawn.Controller) != none)
    {
        // End:0x25B
        if(LPPlayerController(inPawn.Controller).bMobilityMode)
        {
            inPawn.GroundSpeed *= 2.0000000;
        }
    }
    // End:0x31D
    if(BlendBySpeedNode.Constraints.Length >= 2)
    {
        BlendBySpeedNode.Constraints[0] = WalkToJogTransitionSpeed;
        // End:0x2E4
        if(AimOverLeftShoulderBlendBySpeedNode != none)
        {
            AimOverLeftShoulderBlendBySpeedNode.Constraints[0] = WalkToJogTransitionSpeed;
        }
        // End:0x31D
        if(AimOverRightShoulderBlendBySpeedNode != none)
        {
            AimOverRightShoulderBlendBySpeedNode.Constraints[0] = WalkToJogTransitionSpeed;
        }
    }
    // End:0x431
    if(BlendBySpeedNode.Constraints.Length >= 3)
    {
        // End:0x398
        if(bCanSprint)
        {
            BlendBySpeedNode.Constraints[1] = inPawn.GroundSpeed + float(10);            
        }
        else
        {
            BlendBySpeedNode.Constraints[1] = 1000000.0000000;
        }
        BlendBySpeedNode.Constraints[2] = 1000000.0000000;
        AimOverLeftShoulderBlendBySpeedNode.Constraints[1] = 1000000.0000000;
        AimOverRightShoulderBlendBySpeedNode.Constraints[1] = 1000000.0000000;
    }
    ScaleBySpeedNodeNames.AddItem(WalkForwardScaleRateBySpeedName);    
    ScaleBySpeedNodeNames.AddItem(JogForwardScaleRateBySpeedName);    
    ScaleBySpeedNodeNames.AddItem(SprintForwardScaleRateBySpeedName);    
    ScaleBySpeedNodeNames.AddItem(StrafeRightScaleRateBySpeedName);    
    ScaleBySpeedNodeNames.AddItem(StrafeLeftScaleRateBySpeedName);    
    ScaleBySpeedNodeNames.AddItem(StrafeBackScaleRateBySpeedName);    
    inPawn.Mesh.Animations.FindAnimNodes(ScaleBySpeedNodeNames, ScaleBySpeedNodes, Class'LPAnimNodeScaleRateBySpeed');
    LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[0]).BaseSpeed = AnimatedWalkSpeed;
    LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[1]).BaseSpeed = AnimatedJogSpeed;
    LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[2]).BaseSpeed = AnimatedSprintSpeed;
    LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[0]).MaximumRate = 0.0000000;
    LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[1]).MaximumRate = ((bCanSprint) ? 0.0000000 : 1.0000000);
    LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[2]).MaximumRate = 1.0000000;
    ScaleBySpeedNode = LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[3]);
    // End:0x6BE
    if((ScaleBySpeedNode != none) && StrafeRightAnimSpeed > float(0))
    {
        ScaleBySpeedNode.BaseSpeed = StrafeRightAnimSpeed;
    }
    ScaleBySpeedNode = LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[4]);
    // End:0x727
    if((ScaleBySpeedNode != none) && StrafeLeftAnimSpeed > float(0))
    {
        ScaleBySpeedNode.BaseSpeed = StrafeLeftAnimSpeed;
    }
    ScaleBySpeedNode = LPAnimNodeScaleRateBySpeed(ScaleBySpeedNodes[5]);
    // End:0x790
    if((ScaleBySpeedNode != none) && StrafeBackAnimSpeed > float(0))
    {
        ScaleBySpeedNode.BaseSpeed = StrafeBackAnimSpeed;
    }
    //return;    
}

function SetCameraModeOnPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], LPC;

    // End:0xA5
    if(!DoesAllowWeapon(LPPawn(inPawn)))
    {
        LPC = LPPlayerController(inPawn.Controller);
        // End:0xA5
        if((LPC != none) && inPawn.IsLocallyControlled())
        {
            LPC.SetAimDownSightMode(false);
        }
    }
    //return;    
}

function DoesAllowGrapplingHook()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bCanUseGrapplingHook;
    //return ReturnValue;    
}

function DoesAllowDodge()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bCanDodge;
    //return ReturnValue;    
}

function DoesAllowSprint()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bCanSprint;
    //return ReturnValue;    
}

function GetGroundSpeed()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GroundSpeed;
    //return ReturnValue;    
}

function GetSprintSpeedScale()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return SprintSpeedScale;
    //return ReturnValue;    
}

function IsCrouchingCSA()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bIsCrouchingCSA;
    //return ReturnValue;    
}

defaultproperties
{
    WalkForwardAnim=(AnimSlotName="WalkForwardSlotNode",AnimSeqName="None")
    JogForwardAnim=(AnimSlotName="JogForwardSlotNode",AnimSeqName="None")
    SprintForwardAnim=(AnimSlotName="SprintForwardSlotNode",AnimSeqName="None")
    StrafeRightAnim=(AnimSlotName="StrafeRightSlotNode",AnimSeqName="None")
    StrafeLeftAnim=(AnimSlotName="StrafeLeftSlotNode",AnimSeqName="None")
    StrafeBackAnim=(AnimSlotName="StrafeBackSlotNode",AnimSeqName="None")
    IdleTemplate=(AnimSlotName="IdleSlotNode",AnimNodeTemplateName="None")
    WalkForwardTemplate=(AnimSlotName="WalkForwardSlotNode",AnimNodeTemplateName="None")
    JogForwardTemplate=(AnimSlotName="JogForwardSlotNode",AnimNodeTemplateName="None")
    SprintForwardTemplate=(AnimSlotName="SprintForwardSlotNode",AnimNodeTemplateName="None")
    StrafeRightTemplate=(AnimSlotName="StrafeRightSlotNode",AnimNodeTemplateName="None")
    StrafeLeftTemplate=(AnimSlotName="StrafeLeftSlotNode",AnimNodeTemplateName="None")
    StrafeBackTemplate=(AnimSlotName="StrafeBackSlotNode",AnimNodeTemplateName="None")
    AnimatedWalkSpeed=150.0000000
    AnimatedJogSpeed=285.0000000
    AnimatedSprintSpeed=420.0000000
    WalkToJogTransitionSpeed=230.0000000
    ForwardBlendBySpeed="ForwardBlendBySpeed"
    WalkForwardScaleRateBySpeedName="WalkForwardScaleRateBySpeed"
    JogForwardScaleRateBySpeedName="JogForwardScaleRateBySpeed"
    SprintForwardScaleRateBySpeedName="SprintForwardScaleRateBySpeed"
    StrafeRightScaleRateBySpeedName="StrafeRightScaleRateBySpeed"
    StrafeLeftScaleRateBySpeedName="StrafeLeftScaleRateBySpeed"
    StrafeBackScaleRateBySpeedName="StrafeBackScaleRateBySpeed"
    AimOverLeftShoulderBlendBySpeedName="AimOverLeftShoulderBlendBySpeed"
    AimOverRightShoulderBlendBySpeedName="AimOverRightShoulderBlendBySpeed"
    bCanUseGrapplingHook=true
    bCanDodge=true
    bCanSprint=true
    bAllowSwitchToBestWeaponCheck=true
    PawnClass=Class'LPPlayerPawn'
}