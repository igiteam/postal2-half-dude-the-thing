class LPFXAction_PlayerPawnFreezeMaterial extends LPFXActionBase;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPlayerPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array NewMaterialArray;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float fFreezeValue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float fFreezeDuration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float fFreezeStartTime;

// Export ULPFXAction_PlayerPawnFreezeMaterial::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPFXAction_PlayerPawnFreezeMaterial::execEnd(FFrame&, void* const)
native event End();

function @NULL Begin()
{
    local /*0x97E50000-0x00000400*/ private @NULL FXAManager, LPP, remap, MI;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL MIC;

    // End:0x37F
    if(!IsActive())
    {
        FXAManager = FXActionManager();
        // End:0x63
        if(FXAManager != none)
        {
            LPP = LPPlayerPawn(FXAManager.Owner);
        }
        fFreezeValue = 0.0000000;
        fFreezeDuration = 0.0000000;
        // End:0x37F
        if(LPP != none)
        {
            MyPlayerPawn = LPP;
            LPP.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('DeathFreeze', 'None', LPP, LPP.Mesh, none);
            fFreezeDuration = LPP.TuneDataPlayerPawn.DeathFreezeTransitionTime;
            fFreezeStartTime = LPP.WorldInfo.TimeSeconds;
            NewMaterialArray.Length = 0;
            // End:0x37F
            if(LPP.FreezeMaterialRemapList.Length > 0)
            {
                // End:0x37E
                foreach LPP.FreezeMaterialRemapList(remap)
                {
                    // End:0x37C
                    foreach LPP.Mesh.SkeletalMesh.Materials(MI, I)
                    {
                        MIC = MaterialInstanceConstant(MI);
                        // End:0x37B
                        if(MIC == remap.Original)
                        {
                            LPP.Mesh.SetMaterial(I, remap.Replacement);
                            MIC = LPP.Mesh.CreateAndSetMaterialInstanceConstant(I);
                            MIC.SetScalarParameterValue('L2_Opacity', 0.0000000);
                            NewMaterialArray.AddItem(MIC);                            
                            MI = none;
                        }                        
                    }                                        
                }                
            }
        }
    }
    super(SPFXActionBase).Begin();
    //return;    
}

defaultproperties
{
    fFreezeDuration=2.0000000
    bIsTickable=true
}