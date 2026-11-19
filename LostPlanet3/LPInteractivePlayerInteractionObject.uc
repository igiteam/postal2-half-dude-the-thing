class LPInteractivePlayerInteractionObject extends LPGeneralPlayerInteractionObject
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x6C7B0000-0x00000000*/ private @NULL RenderTexture[65537];
var(0.25_Pct) /*0x6C7B0000-0x00000000*/ private byte RenderMode[65537];
var(0.25_Pct) /*0x6C7B0000-0x00000000*/ private @NULL ShaderMaterial[65537];
var(0.25_Pct) /*0x6C7B0000-0x00000400*/ private export @NULL ProjectionPlate[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MinigameMovie;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class MinigameMoviePlayerClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ShaderMaterialInstance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoviePlayer[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SoundTheme;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ProjectionPlateMesh[524289];
var(0.25_Pct) /*0x6C7B0000-0x00000400*/ private editfixedsize @NULL PrerequisiteQuest[589825];
var(0.25_Pct) /*0x5B160000-0x00000000*/ private float ChevronSpeedAndDirection[65540];
var(0.25_Pct) /*0x5B160000-0x00000000*/ private float ChevronSpeedMultipliers[65540];
var(0.25_Pct) /*0x5B160000-0x00000000*/ private float ChevronSpawnDelayInSeconds[65540];
var(0.25_Pct) /*0x5B160000-0x00000000*/ private float ChevronLockCountByLevel[65540];
var(0.25_Pct) /*0x5B160000-0x00000000*/ private int ChevronMisses[65537];

function FindRenderShader()
{
    local /*0x97E50000-0x00000000*/ private @NULL MI;
    local /*0x97E50000-0x00000000*/ private int I;

    ShaderMaterialInstance = none;
    // End:0x2D
    if((ProjectionPlate == none) || ShaderMaterial == none)
    {
        return;
    }
    // End:0x19E
    if(ClassIsChildOf(ProjectionPlate.Class, Class'Engine.StaticMeshComponent'))
    {
        I = 0;
        J0x65:

        // End:0x19B [Loop If]
        if(I < StaticMeshComponent(ProjectionPlate).GetNumElements())
        {
            MI = StaticMeshComponent(ProjectionPlate).GetMaterial(I);
            // End:0xE8
            if(MI == none)
            {                
            }
            else
            {
                // End:0x18D
                if(MI.GetPhysicalMaterial() == ShaderMaterial)
                {
                    ShaderMaterialInstance = MaterialInstanceConstant(MI);
                    // End:0x17B
                    if(ShaderMaterialInstance == none)
                    {
                        ShaderMaterialInstance = StaticMeshComponent(ProjectionPlate).CreateAndSetMaterialInstanceConstant(I);
                    }
                    // End:0x18D
                    if(ShaderMaterialInstance != none)
                    {
                        // [Explicit Break]
                        goto J0x19B;
                    }
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x65;
        }
        J0x19B:
        
    }
    else
    {
        // End:0x2E0
        if(ClassIsChildOf(ProjectionPlate.Class, Class'Engine.SkeletalMeshComponent'))
        {
            // End:0x2DC
            foreach SkeletalMeshComponent(ProjectionPlate).SkeletalMesh.Materials(MI, I)
            {
                // End:0x2DB
                if(MI.GetPhysicalMaterial() == ShaderMaterial)
                {
                    ShaderMaterialInstance = MaterialInstanceConstant(SkeletalMeshComponent(ProjectionPlate).GetMaterial(I));
                    // End:0x2DB
                    if(ShaderMaterialInstance == none)
                    {
                        ShaderMaterialInstance = SkeletalMeshComponent(ProjectionPlate).CreateAndSetMaterialInstanceConstant(I);
                        // [Explicit Continue]
                        goto J0x2DC;
                    }
                }                
            }
            J0x2DC:
                        
        }
    }
    //return;    
}

function SetProjectionVisibility()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    // End:0x3A
    if(ProjectionPlateMesh != none)
    {
        ProjectionPlateMesh.SetHidden(!bVisible);
    }
    //return;    
}

function SetMaterialEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];

    // End:0x50
    if(ShaderMaterialInstance != none)
    {
        ShaderMaterialInstance.SetScalarParameterValue('bEnabled', ((bEnabled) ? 1.0000000 : 0.0000000));
    }
    //return;    
}

simulated event PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    SetProjectionVisibility(false);
    //return;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    FindRenderShader();
    SetMaterialEnabled(false);
    SetProjectionVisibility(false);
    //return;    
}

simulated event Reset()
{
    super.Reset();
    SetProjectionVisibility(false);
    // End:0x9B
    if((CurrentOperator != none) && CurrentOperator.IsLocallyControlled())
    {
        LPPlayerController(CurrentOperator.Controller).myLPHUD.CloseInteractiveMovie(false);
    }
    // End:0xCA
    if(MoviePlayer != none)
    {
        MoviePlayer.Close();
    }
    MoviePlayer = none;
    //return;    
}

simulated state Operating
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Objective, myHUD;
        local /*0x97E50000-0x00000000*/ private bool bLocked;
        local /*0x97E50000-0x00000000*/ private editfixedsize @NULL SndTheme;

        super.BeginState(PreviousStateName);
        bLocked = false;
        // End:0x1A8
        if(CurrentOperator.IsLocallyControlled() && RenderTexture != none)
        {
            myHUD = LPPlayerController(CurrentOperator.Controller).myLPHUD;
            myHUD.CreateInteractiveMovie(MinigameMovie, MinigameMoviePlayerClass, RenderTexture, RenderMode);
            MoviePlayer = LPGFxInteractiveMoviePlayer(myHUD.InteractiveUnlockMovieInstance);
            // End:0x192
            if(SoundTheme != none)
            {
                SndTheme.Theme = SoundTheme;
                SndTheme.ThemeName = 'Default';
                MoviePlayer.SoundThemes.AddItem(SndTheme);                
            }
            SetMaterialEnabled(true);
            SetProjectionVisibility(true);
        }
        // End:0x22E
        if(PrerequisiteQuest != none)
        {
            Objective = SPQO_ObjectiveBool(PrerequisiteQuest.GetQuestObject());
            // End:0x22E
            if(Objective != none)
            {
                // End:0x22E
                if(int(Objective.GetQuestStatus()) != int(4))
                {
                    bLocked = true;
                }
            }
        }
        // End:0x25D
        if(bLocked)
        {
            MoviePlayer.BeginLocked();            
        }
        else
        {
            MoviePlayer.SetLaneSpeeds(ChevronSpeedAndDirection[0], ChevronSpeedAndDirection[1], ChevronSpeedAndDirection[2], ChevronSpeedAndDirection[3]);
            MoviePlayer.SetLaneSpeedLevels(ChevronSpeedMultipliers[0], ChevronSpeedMultipliers[1], ChevronSpeedMultipliers[2], ChevronSpeedMultipliers[3]);
            MoviePlayer.SetSpawnRates(ChevronSpawnDelayInSeconds[0], ChevronSpawnDelayInSeconds[1], ChevronSpawnDelayInSeconds[2], ChevronSpawnDelayInSeconds[3]);
            MoviePlayer.SetLockLevels(ChevronLockCountByLevel[0], ChevronLockCountByLevel[1], ChevronLockCountByLevel[2], ChevronLockCountByLevel[3]);
            MoviePlayer.SetMaxMisses(ChevronMisses);
            MoviePlayer.BeginGame();
        }
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        // End:0x88
        if(CurrentOperator.IsLocallyControlled())
        {
            LPPlayerController(CurrentOperator.Controller).myLPHUD.CloseInteractiveMovie(false);
        }
        MoviePlayer = none;
        SetMaterialEnabled(false);
        SetProjectionVisibility(false);
        //return;        
    }

    simulated function InputDirection()
    {
        local /*0x97E50000-0x00000000*/ private int iDirection[8388609];

        // End:0x37
        if(MoviePlayer != none)
        {
            MoviePlayer.InputDirection(iDirection);
        }
        //return;        
    }

    simulated function GetCompletionRatio()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return 0.0000000;
        //return ReturnValue;        
    }
    stop;    
}

defaultproperties
{
    RenderMode=GFxRenderTextureMode.RTM_Alpha
    ChevronSpeedAndDirection[0]=-150.0000000
    ChevronSpeedAndDirection[1]=155.0000000
    ChevronSpeedAndDirection[2]=-160.0000000
    ChevronSpeedAndDirection[3]=165.0000000
    ChevronSpeedMultipliers[0]=1.0000000
    ChevronSpeedMultipliers[1]=1.1000000
    ChevronSpeedMultipliers[2]=1.2000000
    ChevronSpeedMultipliers[3]=1.3000000
    ChevronSpawnDelayInSeconds[0]=0.9000000
    ChevronSpawnDelayInSeconds[1]=0.8000000
    ChevronSpawnDelayInSeconds[2]=0.7000000
    ChevronSpawnDelayInSeconds[3]=0.6000000
    ChevronLockCountByLevel[0]=2.0000000
    ChevronLockCountByLevel[1]=6.0000000
    ChevronLockCountByLevel[2]=10.0000000
    ChevronLockCountByLevel[3]=15.0000000
    ChevronMisses=8
    bIsInteractive=true
    // Reference: CylinderComponent'Default__LPInteractivePlayerInteractionObject.TouchCylinder0'
    begin object name=TouchCylinder0
    end object
    TouchCylinder=TouchCylinder0
    Components[0]=TouchCylinder0
    Components[1]=none
    CollisionComponent=TouchCylinder0
}