class LPCSAO_PackHunter extends LPContextSensitiveAnimObject
    dontsortcategories(TemplateAnims,SingleAnims);

var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL RunForwardAnim[65537];

event GetAllSingleAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SingleAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    SingleAnims.AddItem(RunForwardAnim);    
    super(SPContextSensitiveAnimObject).GetAllSingleAnims(SingleAnims, inPawn);
    //return;    
}

event GetAllTemplateAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array TemplateAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super(SPContextSensitiveAnimObject).GetAllTemplateAnims(TemplateAnims, inPawn);
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
    RunForwardAnim=(AnimSlotName="RunForwardSlotNode",AnimSeqName="None")
    PawnClass=Class'LPAIPawnPackHunter'
}