class RB_ConstraintActor extends RigidBodyBase
    abstract
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x3FDE0000-0x00000000*/ private @NULL ConstraintActor1[65537];
var(*) /*0x3FDE0000-0x00000000*/ private @NULL ConstraintActor2[65537];
var(*) /*0x3FDE0000-0x00000600*/ private editfixedsize @NULL ConstraintSetup[589825];
var(*) /*0x3FDE0000-0x00000600*/ private editfixedsize @NULL ConstraintInstance[589825];
var(*) /*0x3FDE0000-0x00000000*/ private bool bDisableCollision[196609];
var(*) /*0x3FDE0000-0x00000000*/ private bool bUpdateActor1RefFrame[65537];
var(*) /*0x3FDE0000-0x00000000*/ private bool bUpdateActor2RefFrame[65537];
var(*) /*0x3F360000-0x00000000*/ private @NULL PulleyPivotActor1[65537];
var(*) /*0x3F360000-0x00000000*/ private @NULL PulleyPivotActor2[65537];

// Export URB_ConstraintActor::execSetDisableCollision(FFrame&, void* const)
native final function SetDisableCollision()
{
    local /*0x35EA0000-0x00000000*/ private bool NewDisableCollision[8388609];


}

// Export URB_ConstraintActor::execInitConstraint(FFrame&, void* const)
native final function InitConstraint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Actor1[8388609], Actor2;
    local /*0x35EA0000-0x00000000*/ private name Actor1Bone[9437185], Actor2Bone;
    local /*0x35EA0000-0x00000000*/ private float BreakThreshold[9437185];


}

// Export URB_ConstraintActor::execTermConstraint(FFrame&, void* const)
native final function TermConstraint();

simulated function OnDestroy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    TermConstraint();
    //return;    
}

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0xAC
    if(Action.InputLinks[0].bHasImpulse)
    {
        // End:0xA9
        if(int(Physics) != int(10))
        {
            SetPhysics(10);
            InitConstraint(ConstraintActor1, ConstraintActor2, ConstraintSetup.ConstraintBone1, ConstraintSetup.ConstraintBone2);
        }        
    }
    else
    {
        // End:0x109
        if(Action.InputLinks[1].bHasImpulse)
        {
            // End:0x106
            if(int(Physics) != int(0))
            {
                SetPhysics(0);
                TermConstraint();
            }            
        }
        else
        {
            // End:0x1C5
            if(Action.InputLinks[2].bHasImpulse)
            {
                // End:0x167
                if(int(Physics) != int(0))
                {
                    SetPhysics(0);
                    TermConstraint();                    
                }
                else
                {
                    SetPhysics(10);
                    InitConstraint(ConstraintActor1, ConstraintActor2, ConstraintSetup.ConstraintBone1, ConstraintSetup.ConstraintBone2);
                }
            }
        }
    }
    //return;    
}

simulated function OnToggleConstraintDrive()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x148
    if(Action.InputLinks[0].bHasImpulse)
    {
        // End:0x7B
        if(Action.bEnableLinearPositionDrive)
        {
            ConstraintInstance.SetLinearPositionDrive(true, true, true);
        }
        // End:0xBF
        if(Action.bEnableLinearvelocityDrive)
        {
            ConstraintInstance.SetLinearVelocityDrive(true, true, true);
        }
        // End:0x102
        if(Action.bEnableAngularPositionDrive)
        {
            ConstraintInstance.SetAngularPositionDrive(true, true);
        }
        // End:0x145
        if(Action.bEnableAngularVelocityDrive)
        {
            ConstraintInstance.SetAngularVelocityDrive(true, true);
        }        
    }
    else
    {
        // End:0x205
        if(Action.InputLinks[1].bHasImpulse)
        {
            ConstraintInstance.SetLinearPositionDrive(false, false, false);
            ConstraintInstance.SetLinearVelocityDrive(false, false, false);
            ConstraintInstance.SetAngularPositionDrive(false, false);
            ConstraintInstance.SetAngularVelocityDrive(false, false);
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: RB_ConstraintInstance'Default__RB_ConstraintActor.MyConstraintInstance'
    begin object name=MyConstraintInstance class=Class'RB_ConstraintInstance'
    end object
    ConstraintInstance=MyConstraintInstance
    bUpdateActor1RefFrame=true
    bUpdateActor2RefFrame=true
    Components[0]=none
    // Reference: RB_ConstraintDrawComponent'Default__RB_ConstraintActor.MyConDrawComponent'
    begin object name=MyConDrawComponent class=Class'RB_ConstraintDrawComponent'
    end object
    Components[1]=MyConDrawComponent
    DrawScale=0.5000000
    Physics=EPhysics.PHYS_RigidBody
    TickGroup=ETickingGroup.TG_PostAsyncWork
    bHidden=true
    bNoDelete=true
    bEdShouldSnap=true
    SupportedEvents=/* Array type was not detected. */
}