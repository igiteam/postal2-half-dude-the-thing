class LPCSAO_Spitter extends LPContextSensitiveAnimObject
    dontsortcategories(TemplateAnims,SingleAnims);

var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL WalkForwardTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL WalkBackwardTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL WalkLeftTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL WalkRightTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL IdleTemplate[65537];

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
    TemplateAnims.AddItem(IdleTemplate);    
    TemplateAnims.AddItem(WalkForwardTemplate);    
    TemplateAnims.AddItem(WalkBackwardTemplate);    
    TemplateAnims.AddItem(WalkLeftTemplate);    
    TemplateAnims.AddItem(WalkRightTemplate);    
    //return;    
}

event OnBecomeActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.OnBecomeActive(inPawn);
    //return;    
}

defaultproperties
{
    WalkForwardTemplate=(AnimSlotName="WalkForwardSlotNode",AnimNodeTemplateName="None")
    WalkBackwardTemplate=(AnimSlotName="WalkBackwardSlotNode",AnimNodeTemplateName="None")
    WalkLeftTemplate=(AnimSlotName="WalkLeftSlotNode",AnimNodeTemplateName="None")
    WalkRightTemplate=(AnimSlotName="WalkRightSlotNode",AnimNodeTemplateName="None")
    IdleTemplate=(AnimSlotName="IdleSlotNode",AnimNodeTemplateName="None")
    PawnClass=Class'LPAIPawnSpitter'
}