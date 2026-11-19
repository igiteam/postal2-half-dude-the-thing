class LPDebugComponentPawn extends SPGFDebugComponentPawn;

function GetPlayerPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PC;

    // End:0x5E
    foreach Owner.LocalPlayerControllers(Class'LPPlayerController', PC)
    {        
        return LPPlayerPawn(PC.Pawn);        
    }    
    return none;
    //return ReturnValue;    
}

function MoveTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL InLocation[8388609], AICtrl, AICtrlFlyer;
    local /*0x97E50000-0x00000000*/ private bool bAllowShooting, bAvoidPlayer;
    local /*0x97E50000-0x00000000*/ private @NULL MoveCmd;

    // End:0x17C
    if(IsAIDisabled())
    {
        AICtrl = LPAIController(GetAI());
        // End:0x17C
        if(AICtrl != none)
        {
            AICtrlFlyer = LPAIControllerMedFlyer(GetAI());
            // End:0x96
            if(AICtrlFlyer != none)
            {
                AICtrlFlyer.CmdMoveToPositionFly(InLocation);                
            }
            else
            {
                bAllowShooting = Class'SPEngine.SPDebugUtil'.static.IsFlagEnabled('ShootWhileMoving');
                MoveCmd = AICtrl.CmdMoveToPosition(InLocation,,,,,, bAllowShooting);
                bAvoidPlayer = Class'SPEngine.SPDebugUtil'.static.IsFlagEnabled('AvoidPlayerMoving');
                // End:0x17C
                if(bAvoidPlayer)
                {
                    MoveCmd.AddActorConstraint(GetPlayerPawn(), 500.0000000);
                }
            }
        }
    }
    //return;    
}

function MoveToCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCoverInfo[8388609], AICtrl;
    local /*0x97E50000-0x00000000*/ private bool bAllowShooting, bAvoidPlayer;
    local /*0x97E50000-0x00000000*/ private @NULL MoveCmd;

    // End:0x148
    if(IsAIDisabled())
    {
        AICtrl = LPAIController(GetAI());
        // End:0x148
        if(AICtrl != none)
        {
            bAllowShooting = Class'SPEngine.SPDebugUtil'.static.GetSPDebugUtil().GetDebugMode().IsFlagEnabled('ShootWhileMoving');
            MoveCmd = AICtrl.CmdMoveToCover(InCoverInfo,, 0, bAllowShooting);
            bAvoidPlayer = Class'SPEngine.SPDebugUtil'.static.IsFlagEnabled('AvoidPlayerMoving');
            // End:0x148
            if(bAvoidPlayer)
            {
                MoveCmd.AddActorConstraint(GetPlayerPawn(), 500.0000000);
            }
        }
    }
    //return;    
}

function FleeEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InLocation[8388609], myAIPawn, MyController, ClosestEnemy;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Enemies;

    // End:0x11
    if(!IsAIDisabled())
    {
        return;
    }
    myAIPawn = LPAIPawn(Owner);
    MyController = LPAIController(myAIPawn.Controller);
    // End:0x6F
    if(MyController == none)
    {
        return;
    }
    ClosestEnemy = FindClosestEnemy(InLocation);
    // End:0x9D
    if(ClosestEnemy == none)
    {
        return;
    }
    // End:0xE0
    if(int(myAIPawn.Physics) == int(7))
    {
        myAIPawn.SetPhysics(1);
    }
    Enemies.AddItem(ClosestEnemy);    
    MyController.CmdFlee(-1.0000000, 2000.0000000, 1500.0000000, Enemies, 0, false);
    //return;    
}

function Wander()
{
    local /*0x97E50000-0x00000000*/ private @NULL AICtrl;

    // End:0xFD
    if(IsAIDisabled())
    {
        AICtrl = LPAIController(GetAI());
        // End:0xFD
        if((AICtrl != none) && AICtrl.Pawn != none)
        {
            // End:0xCC
            if(int(AICtrl.Pawn.Physics) == int(7))
            {
                AICtrl.Pawn.SetPhysics(1);
            }
            AICtrl.CmdWander(-1.0000000, false, 0.1000000, 0.1000000);
        }
    }
    //return;    
}

function AlmostKill()
{
    local /*0x97E50000-0x00000000*/ private @NULL myAIPawn;
    local /*0x97E50000-0x00000000*/ private int I, J;

    super(SPDebugComponentPawn).AlmostKill();
    myAIPawn = LPAIPawn(Owner);
    // End:0x22A
    if(myAIPawn != none)
    {
        I = 0;
        J0x40:

        // End:0x22A [Loop If]
        if(I < myAIPawn.MyCoreData.Length)
        {
            myAIPawn.MyCoreData[I].Health = 1.0000000;
            J = 0;
            J0xB9:

            // End:0x165 [Loop If]
            if(J < myAIPawn.MyCoreData[I].CoreShields.Length)
            {
                myAIPawn.MyCoreData[I].CoreShields[J].Destroy();
                J++;
                // [Loop Continue]
                goto J0xB9;
            }
            J = 0;
            J0x170:

            // End:0x21C [Loop If]
            if(J < myAIPawn.MyCoreData[I].CoreShieldsSkeletal.Length)
            {
                myAIPawn.MyCoreData[I].CoreShieldsSkeletal[J].Destroy();
                J++;
                // [Loop Continue]
                goto J0x170;
            }
            I++;
            // [Loop Continue]
            goto J0x40;
        }
    }
    //return;    
}

function FindClosestEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InLocation[8388609], ReturnValue, myAIPawn, MyController;
    local /*0x97E50000-0x00000000*/ private int ClosestEnemy, Idx;
    local /*0x97E50000-0x00000000*/ private float ClosestDistance, Distance;

    myAIPawn = LPAIPawn(Owner);
    MyController = SPAIController(myAIPawn.Controller);
    // End:0x5E
    if(MyController == none)
    {
        return none;
    }
    ClosestEnemy = -1;
    ClosestDistance = 10000.0000000;
    Idx = 0;
    J0x87:

    // End:0x1C8 [Loop If]
    if(Idx < MyController.LocalEnemyList.Length)
    {
        // End:0x116
        if(!MyController.CanBeMyEnemy(MyController.LocalEnemyList[Idx].Pawn))
        {            
        }
        else
        {
            Distance = VSize(MyController.LocalEnemyList[Idx].Pawn.Location - InLocation);
            // End:0x1BA
            if(Distance < ClosestDistance)
            {
                ClosestDistance = Distance;
                ClosestEnemy = Idx;
            }
        }
        ++Idx;
        // [Loop Continue]
        goto J0x87;
    }
    // End:0x1DD
    if(ClosestEnemy == -1)
    {
        return none;
    }
    return LPPawn(MyController.LocalEnemyList[ClosestEnemy].Pawn);
    //return ReturnValue;    
}

function ShootEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InLocation[8388609], MyController, myHumanController, myStalkerController, MyISSController, myAIPawn,
	    FireTarget;

    local /*0x97E50000-0x00000000*/ private bool bNoShooting;

    // End:0x11
    if(!IsAIDisabled())
    {
        return;
    }
    myAIPawn = LPAIPawn(Owner);
    MyController = SPAIController(myAIPawn.Controller);
    // End:0x6F
    if(MyController == none)
    {
        return;
    }
    FireTarget = FindClosestEnemy(InLocation);
    // End:0x9D
    if(FireTarget == none)
    {
        return;
    }
    myHumanController = LPAIControllerHumanSoldier(MyController);
    // End:0x1D4
    if(myHumanController != none)
    {
        myHumanController.AISetMainEnemy(FireTarget);
        // End:0x1A9
        if(myHumanController.CoverIsIn())
        {
            bNoShooting = Class'SPEngine.SPDebugUtil'.static.GetSPDebugUtil().GetDebugMode().IsFlagEnabled('OnlyPeeking');
            myHumanController.CmdStaticAttackFromCover(FireTarget,, 0, bNoShooting);            
        }
        else
        {
            myHumanController.CmdStaticAttackFromOpen(FireTarget,, 0);
        }
    }
    myStalkerController = LPAIControllerStalker(MyController);
    // End:0x30B
    if(myStalkerController != none)
    {
        myStalkerController.AISetMainEnemy(FireTarget);
        // End:0x2E0
        if(myStalkerController.CoverIsIn())
        {
            bNoShooting = Class'SPEngine.SPDebugUtil'.static.GetSPDebugUtil().GetDebugMode().IsFlagEnabled('OnlyPeeking');
            myStalkerController.CmdStaticAttackFromCover(FireTarget,, 0, bNoShooting);            
        }
        else
        {
            myStalkerController.CmdStaticAttackFromOpen(FireTarget,, 0);
        }
    }
    MyISSController = LPAIControllerVSISS(MyController);
    // End:0x389
    if(MyISSController != none)
    {
        MyISSController.AISetMainEnemy(FireTarget);
        MyISSController.CmdStaticAttackFromOpen(FireTarget,, 0);
    }
    //return;    
}

function MeleeEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InLocation[8388609], MyController, myAIPawn, MeleeTarget;

    // End:0x11
    if(!IsAIDisabled())
    {
        return;
    }
    myAIPawn = LPAIPawn(Owner);
    MyController = LPAIController(myAIPawn.Controller);
    // End:0x6F
    if(MyController == none)
    {
        return;
    }
    MeleeTarget = FindClosestEnemy(InLocation);
    // End:0x9D
    if(MeleeTarget == none)
    {
        return;
    }
    // End:0xD8
    if(!myAIPawn.TuneDataAIPawn.bCanUseCover)
    {
        return;
    }
    MyController.CmdStaticCoverAIMelee(MeleeTarget,, 0);
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609], MyPawn, MyController, Command, DebugModeAI;

    local /*0x97E50000-0x00000000*/ private editfixedsize string CommandString;
    local /*0x97E50000-0x00000000*/ private @NULL SelectedActor, CoverExplorer, DeathFX;

    super.DrawDebug(InHUD);
    MyPawn = LPPawn(Owner);
    MyController = LPAIController(MyPawn.Controller);
    GetTooltip(InHUD);
    DebugModeAI = LPDebugModeAI(InHUD.GetDebugModeManager().GetDebugMode());
    // End:0x45C
    if((((MyController != none) && DebugModeAI != none) && DebugModeAI.IsFlagEnabled('AITooltip')) && MyTooltip != none)
    {
        // End:0x1B7
        if(MyController.CurrentObjective != none)
        {
            MyTooltip.Draw2DTextLn(MyController.CurrentObjective.GetHumanReadableName(), 0, MyTooltip.WhiteColor);            
        }
        else
        {
            MyTooltip.Draw2DTextLn("No Objective", 0, MyTooltip.RedColor);
        }
        Command = LPAICommand(MyController.CommandList);
        J0x239:

        // End:0x374 [Loop If]
        if(Command != none)
        {
            CommandString = Mid(string(Command.Class.Name), 8);
            // End:0x2F4
            if(DebugModeAI.IsFlagEnabled('CmdState'))
            {
                CommandString = ((CommandString $ " ( ") $ string(Command.GetStateName())) $ " ) ";
            }
            MyTooltip.Draw2DTextLn(CommandString, 0, MyTooltip.YellowColor);
            Command = LPAICommand(Command.ChildCommand);
            // [Loop Continue]
            goto J0x239;
        }
        // End:0x45C
        if(DebugModeAI.IsFlagEnabled('ShowAmmo'))
        {
            // End:0x45C
            if(SPInventoryWeapon(MyPawn.Weapon) != none)
            {
                MyTooltip.Draw2DTextLn("AmmoLeft : " $ string(SPInventoryWeapon(MyPawn.Weapon).AmmoLeftForWeapon), 0, MyTooltip.WhiteColor);
            }
        }
    }
    // End:0x5D6
    if(DebugModeAI.IsFlagEnabled('ShowAmmo'))
    {
        DeathFX = LPFXAction_FreezePawn(MyPawn.GetFXActionManager().GetFXAction(Class'LPFXAction_FreezePawn'));
        // End:0x5D6
        if((DeathFX != none) && DeathFX.IsActive())
        {
            MyTooltip.Draw2DTextLn((("Fading: " $ string(MyPawn.WorldInfo.TimeSeconds - DeathFX.TimeFreezeEffectStarted)) $ "/") $ string(DeathFX.FadeInTime), 0, MyTooltip.WhiteColor);
        }
    }
    // End:0x648
    if((MyController != none) && MyController.CurrentObjective != none)
    {
        MyController.CurrentObjective.DrawDebug(InHUD);
    }
    // End:0x691
    if(LPAIPawn(MyPawn) != none)
    {
        LPAIPawn(MyPawn).DrawDebug(InHUD);
    }
    // End:0x8E4
    if(MyController != none)
    {
        Command = LPAICommand(MyController.CommandList);
        J0x6D1:

        // End:0x73C [Loop If]
        if(Command != none)
        {
            Command.DrawDebug(InHUD);
            Command = LPAICommand(Command.ChildCommand);
            // [Loop Continue]
            goto J0x6D1;
        }
        CoverExplorer = MyController.GetCoverExplorer();
        // End:0x8E4
        if(CoverExplorer != none)
        {
            SelectedActor = DebugModeAI.GetSelectedActor();
            // End:0x8E4
            if((SelectedActor == none) || SelectedActor == MyPawn)
            {
                // End:0x83E
                if((DebugModeAI != none) && DebugModeAI.IsFlagEnabled('ShowCoverFlags'))
                {
                    CoverExplorer.CoverTraversal.DrawFlagMeaning(InHUD);
                }
                // End:0x8E4
                if((DebugModeAI != none) && DebugModeAI.IsFlagEnabled('ShowCoverRatings') || DebugModeAI.IsFlagEnabled('ShowInvalidReason'))
                {
                    CoverExplorer.CoverTraversal.DrawCoverRatings(InHUD);
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    KillDamageType=Class'LPDamageType'
    bCanMoveToCover=true
    // Reference: SPDebugCanvasArea'Default__LPDebugComponentPawn.SPCanvasAreaDebugComponent'
    begin object name=SPCanvasAreaDebugComponent
    end object
    DefaultCanvasArea=SPCanvasAreaDebugComponent
}