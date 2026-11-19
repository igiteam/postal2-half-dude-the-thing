	// ===================================================== //
	// Leg state machine for the MOHPA Player character		 //
	// ===================================================== //

// The leg state machine takes care of states for the legs only.  The
// torso state machine can override the leg state machine with states
// which require animations of the whole body, such as climbing and
// sprinting.  The animations in this state file control the whole body,
// but most of the time the torso state machine overrides the animation
// for the upper body.

////////////////////////////////////////////////////////////////
//
// Standing
//
////////////////////////////////////////////////////////////////

state STAND
{
	entrycommands
	{
		modheight "stand"
		movementstealth "1.0"
		moveposflags "standing"
	}
	legs
	{
		mxsai_MW_SneakWalk_Idle			: !RUN IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxsai_MW_SneakWalk_Idle			: !RUN IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxsai_MW_SneakWalk_Idle			: !RUN IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxsai_MW_SneakWalk_Idle			: !RUN IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxsxi_Carry_Idle				: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxsxi_Carry_Idle				: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxsxi_Carry_Idle				: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxsxi_Carry_Idle				: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxsai_CS_SneakWalk_Idle			: !RUN IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxsai_CS_SneakWalk_Idle			: !RUN IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxsai_CS_SneakWalk_Idle			: !RUN IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxsai_CS_SneakWalk_Idle			: !RUN IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxsai_CS_SneakWalk_Idle			: !RUN IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxsai_CS_SneakWalk_Idle			: !RUN IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mxsxi_CS_idle					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxsxi_CS_idle					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxsxi_CS_idle					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxsxi_CS_idle					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxsxi_CS_idle					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxsxi_CS_idle					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmsai_SneakWalk_Idle			: !RUN IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mpsai_SneakWalk_Idle			: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mgsai_SneakWalk_Idle			: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mmsai_SneakWalk_Idle			: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsai_SneakWalk_Idle			: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mrsai_SneakWalk_Idle			: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		musai_SneakWalk_Idle			: !RUN

		mmsai_Aim_Idle					: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrsai_Aim_Idle					: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpsai_Aim_Idle					: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmsai_Aim_Idle					: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsai_Aim_Idle					: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgsxi_Idle						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		musxi_Stand_Idle				: default		//unarmed
	}

	states
	{
		JUMP_STANDING		: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND
		FALL_RUNNING		: FALLING RUN FORWARD HAS_VELOCITY !BLOCKED "2"
		FALL				: FALLING

		VEHICLE_TURRET_START	: IS_USING_VEHICLE IS_USING_TURRET !HAS_WEAPON
		VEHICLE_START		: IS_USING_VEHICLE
		TURRET_START		: IS_USING_TURRET !HAS_WEAPON
		
//		PRONE_IDLE			: ONGROUND +PRONE !PRONE_VIEW_IN_WATER !FORCED_STAND
//		PRONE_IDLE			: FORCED_PRONE
		PRONE_DENIED			: ONGROUND +PRONE PRONE_VIEW_IN_WATER
		STAND_TO_PRONE			: +PRONE ONGROUND CHECK_HEIGHT "prone" !FORCED_STAND !PRONE_VIEW_IN_WATER !LADEN

		CROUCH_IDLE			: ONGROUND +CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: ONGROUND +INSTANT_CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: FORCED_CROUCH
		CROUCH_IDLE			: FORCED_PRONE
		CROUCH_DENIED		: ONGROUND +CROUCH DUCKED_VIEW_IN_WATER
		CROUCH_DENIED		: ONGROUND +INSTANT_CROUCH DUCKED_VIEW_IN_WATER

		RUN_FORWARD			: RUN FORWARD HAS_VELOCITY !BLOCKED "2"
		RUN_BACKWARD		: RUN BACKWARD HAS_VELOCITY !BLOCKED "2"
		RUN_LEFT			: RUN STRAFE_LEFT HAS_VELOCITY !BLOCKED "2"
		RUN_RIGHT			: RUN STRAFE_RIGHT HAS_VELOCITY !BLOCKED "2"

		WALK_FORWARD		: FORWARD HAS_VELOCITY !BLOCKED "2"
		WALK_BACKWARD		: BACKWARD HAS_VELOCITY !BLOCKED "2"
		WALK_LEFT			: STRAFE_LEFT HAS_VELOCITY !BLOCKED "2"
		WALK_RIGHT			: STRAFE_RIGHT HAS_VELOCITY !BLOCKED "2"

		// restart if our weapon has changed
		STAND				: +HAS_WEAPON
		STAND				: -HAS_WEAPON

		// restart if running/walking state has changed
		STAND				: +RUN
		STAND				: -RUN

		// pitch a new idle anim if the anim finished
		STAND				: ANIMDONE_LEGS
	}
}

state STAND_TO_PRONE
{
	entrycommands
	{
		modheight "prone"
		moveposflags "prone"
	}
	exitcommands
	{
	}
	legs
	{
		xxrsxx_stand_to_prone			: default
	}
	states
	{
		PRONE_IDLE				: default
	}
}


////////////////////////////////////////////////////////////////
//
// Running
//
////////////////////////////////////////////////////////////////

state RUN_FORWARD
{
	entrycommands
	{
		movementstealth "0.25"
		moveposflags "standing" "running"
	}
	legs
	{
		mxsxf_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxsxf_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxsxf_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxsxf_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxsxf_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxsxf_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxsxf_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxsxf_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxsxf_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxsxf_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmsaf_AimRun					: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrsaf_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpsaf_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmsaf_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsaf_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgsxf_run						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		musxf_Stand_Run_Forward			: default		//unarmed
	}

	states
	{
		JUMP_FORWARD_RUN	: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND
		FALL_RUNNING		: FALLING

		CROUCH_IDLE			: ONGROUND +CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: ONGROUND +INSTANT_CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: FORCED_CROUCH
		CROUCH_IDLE			: FORCED_PRONE
		CROUCH_DENIED		: ONGROUND +CROUCH DUCKED_VIEW_IN_WATER
		CROUCH_DENIED		: ONGROUND +INSTANT_CROUCH DUCKED_VIEW_IN_WATER

//		PRONE_IDLE			: ONGROUND +PRONE !PRONE_VIEW_IN_WATER
		PRONE_DENIED			: ONGROUND +PRONE PRONE_VIEW_IN_WATER
		
		PRONE_DIVE			: +PRONE ONGROUND CHECK_HEIGHT "prone" !FORCED_STAND !PRONE_VIEW_IN_WATER !LADEN
		
		STAND				: !HAS_VELOCITY
		STAND				: BLOCKED "2"
		
		WALK_LEFT			: !RUN STRAFE_LEFT		// !FORWARD !BACKWARD
		WALK_RIGHT			: !RUN STRAFE_RIGHT		// !FORWARD !BACKWARD
		WALK_FORWARD		: !RUN FORWARD
		WALK_BACKWARD		: !RUN BACKWARD

		RUN_LEFT			: STRAFE_LEFT		// !FORWARD !BACKWARD
		RUN_RIGHT			: STRAFE_RIGHT		// !FORWARD !BACKWARD
		RUN_BACKWARD		: BACKWARD

		// restart if our weapon has changed
		RUN_FORWARD			: +HAS_WEAPON
		RUN_FORWARD			: -HAS_WEAPON
	}
}

state RUN_BACKWARD
{
	entrycommands
	{
		movementstealth "0.25"
		moveposflags "standing" "running"
	}
	legs
	{
		mxsxb_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxsxb_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxsxb_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxsxb_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxsxb_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxsxb_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxsxb_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxsxb_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxsxb_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxsxb_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmsab_AimRun					: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrsab_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpsab_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmsab_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsab_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgsxb_run						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		musxb_Stand_Run_Backward		: default		//unarmed
	}

	states
	{
		JUMP_STANDING		: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND
		FALL				: FALLING

		CROUCH_IDLE			: ONGROUND +CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: ONGROUND +INSTANT_CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: FORCED_CROUCH
		CROUCH_IDLE			: FORCED_PRONE
		CROUCH_DENIED		: ONGROUND +CROUCH DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_DENIED		: ONGROUND +INSTANT_CROUCH DUCKED_VIEW_IN_WATER !FORCED_STAND

//		PRONE_IDLE			: ONGROUND +PRONE !PRONE_VIEW_IN_WATER !FORCED_STAND
		PRONE_DENIED		: ONGROUND +PRONE PRONE_VIEW_IN_WATER
		PRONE_DIVE			: +PRONE ONGROUND CHECK_HEIGHT "prone" !FORCED_STAND !PRONE_VIEW_IN_WATER !LADEN

		STAND				: !HAS_VELOCITY
		STAND				: BLOCKED "2"

		WALK_LEFT			: !RUN STRAFE_LEFT			//!FORWARD !BACKWARD
		WALK_RIGHT			: !RUN STRAFE_RIGHT			//!FORWARD !BACKWARD
		WALK_FORWARD		: !RUN FORWARD
		WALK_BACKWARD		: !RUN BACKWARD

		RUN_LEFT			: STRAFE_LEFT				//!FORWARD !BACKWARD
		RUN_RIGHT			: STRAFE_RIGHT				//!FORWARD !BACKWARD
		RUN_FORWARD			: FORWARD
		
		// restart if our weapon has changed
		RUN_BACKWARD		: +HAS_WEAPON
		RUN_BACKWARD		: -HAS_WEAPON
	}
}

state RUN_LEFT
{
	entrycommands
	{
		movementstealth "0.25"
		moveposflags "standing" "running"
	}
	legs
	{
		mxsxl_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxsxl_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxsxl_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxsxl_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxsxl_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxsxl_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxsxl_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxsxl_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxsxl_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxsxl_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmsal_AimRun					: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrsal_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpsal_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmsal_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsal_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgsxl_run						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		musxl_Stand_Run_Left			: default		//unarmed
	}

	states
	{
		JUMP_STANDING		: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND
		FALL				: FALLING

		CROUCH_IDLE			: ONGROUND +CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: ONGROUND +INSTANT_CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: FORCED_CROUCH
		CROUCH_IDLE			: FORCED_PRONE
		CROUCH_DENIED		: ONGROUND +CROUCH DUCKED_VIEW_IN_WATER
		CROUCH_DENIED		: ONGROUND +INSTANT_CROUCH DUCKED_VIEW_IN_WATER

//		PRONE_IDLE			: ONGROUND +PRONE !PRONE_VIEW_IN_WATER !FORCED_STAND
		PRONE_DENIED			: ONGROUND +PRONE PRONE_VIEW_IN_WATER
		PRONE_DIVE_ROLL_LEFT		: +PRONE ONGROUND CHECK_HEIGHT "prone" !FORCED_STAND !PRONE_VIEW_IN_WATER !LADEN

		STAND				: !HAS_VELOCITY
		STAND				: BLOCKED "2"

		WALK_LEFT			: !RUN STRAFE_LEFT
		WALK_RIGHT			: !RUN STRAFE_RIGHT
		WALK_FORWARD		: !RUN FORWARD			//!STRAFE_LEFT !STRAFE_RIGHT
		WALK_BACKWARD		: !RUN BACKWARD			//!STRAFE_LEFT !STRAFE_RIGHT

		RUN_RIGHT			: STRAFE_RIGHT
		RUN_FORWARD			: FORWARD !STRAFE_LEFT !STRAFE_RIGHT
		RUN_BACKWARD		: BACKWARD !STRAFE_LEFT !STRAFE_RIGHT
		
		// restart if our weapon has changed
		RUN_LEFT			: +HAS_WEAPON
		RUN_LEFT			: -HAS_WEAPON
	}
}

state RUN_RIGHT
{
	entrycommands
	{
		movementstealth "0.25"
		moveposflags "standing" "running"
	}
	legs
	{
		mxsxr_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxsxr_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxsxr_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxsxr_Carry_Run					: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxsxr_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxsxr_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxsxr_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxsxr_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxsxr_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxsxr_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmsar_AimRun					: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrsar_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpsar_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmsar_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsar_AimRun					: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgsxr_run						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		musxr_Stand_Run_Right			: default		//unarmed
	}

	states
	{
		JUMP_STANDING		: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND
		FALL				: FALLING

		CROUCH_IDLE			: ONGROUND +CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: ONGROUND +INSTANT_CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: FORCED_CROUCH
		CROUCH_IDLE			: FORCED_PRONE
		CROUCH_DENIED		: ONGROUND +CROUCH DUCKED_VIEW_IN_WATER
		CROUCH_DENIED		: ONGROUND +INSTANT_CROUCH DUCKED_VIEW_IN_WATER

//		PRONE_IDLE			: ONGROUND +PRONE !PRONE_VIEW_IN_WATER
		PRONE_DENIED		: ONGROUND +PRONE PRONE_VIEW_IN_WATER
		PRONE_DIVE_ROLL_RIGHT	: +PRONE ONGROUND CHECK_HEIGHT "prone" !FORCED_STAND !PRONE_VIEW_IN_WATER !LADEN

		STAND				: !HAS_VELOCITY
		STAND				: BLOCKED "2"
		
		WALK_LEFT			: !RUN STRAFE_LEFT
		WALK_RIGHT			: !RUN STRAFE_RIGHT
		WALK_FORWARD		: !RUN FORWARD			//!STRAFE_LEFT !STRAFE_RIGHT
		WALK_BACKWARD		: !RUN BACKWARD			//!STRAFE_LEFT !STRAFE_RIGHT

		RUN_LEFT			: STRAFE_LEFT
		RUN_FORWARD			: FORWARD !STRAFE_LEFT !STRAFE_RIGHT
		RUN_BACKWARD		: BACKWARD !STRAFE_LEFT !STRAFE_RIGHT

		// restart if our weapon has changed
		RUN_RIGHT			: +HAS_WEAPON
		RUN_RIGHT			: -HAS_WEAPON
	}
}

////////////////////////////////////////////////////////////////
//
// Walking
//
////////////////////////////////////////////////////////////////

state WALK_FORWARD
{
	entrycommands
	{
		movementstealth "0.75"
		moveposflags "standing" "walking"
	}
	legs
	{
		mxsxf_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxsxf_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxsxf_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxsxf_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxsxf_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxsxf_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxsxf_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxsxf_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxsxf_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxsxf_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmsaf_Walk						: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrsaf_AimWalk					: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpsaf_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmsaf_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsaf_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgsxf_walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		musxf_Stand_Walk_Forward		: default		//unarmed
	}

	states
	{
		JUMP_FORWARD_RUN	: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND
		FALL				: FALLING

		CROUCH_IDLE			: ONGROUND +CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: ONGROUND +INSTANT_CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: FORCED_CROUCH
		CROUCH_IDLE			: FORCED_PRONE
		CROUCH_DENIED		: ONGROUND +CROUCH DUCKED_VIEW_IN_WATER
		CROUCH_DENIED		: ONGROUND +INSTANT_CROUCH DUCKED_VIEW_IN_WATER

//		PRONE_IDLE			: ONGROUND +PRONE !PRONE_VIEW_IN_WATER
		PRONE_DENIED		: ONGROUND +PRONE PRONE_VIEW_IN_WATER
		STAND_TO_PRONE			: +PRONE ONGROUND CHECK_HEIGHT "prone" !FORCED_STAND !PRONE_VIEW_IN_WATER !LADEN

		STAND				: BLOCKED "2"
		STAND				: !HAS_VELOCITY
		
		RUN_LEFT			: RUN STRAFE_LEFT		//!FORWARD !BACKWARD
		RUN_RIGHT			: RUN STRAFE_RIGHT		//!FORWARD !BACKWARD
		RUN_FORWARD			: RUN FORWARD
		RUN_BACKWARD		: RUN BACKWARD
		
		WALK_LEFT			: STRAFE_LEFT			//!FORWARD !BACKWARD
		WALK_RIGHT			: STRAFE_RIGHT			//!FORWARD !BACKWARD
		WALK_BACKWARD		: BACKWARD
		
		// restart if our weapon has changed
		WALK_FORWARD		: +HAS_WEAPON
		WALK_FORWARD		: -HAS_WEAPON
	}
}

state WALK_BACKWARD
{
	entrycommands
	{
		movementstealth "0.75"
		moveposflags "standing" "walking"
	}
	legs
	{
		mxsxb_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxsxb_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxsxb_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxsxb_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxsxb_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxsxb_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxsxb_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxsxb_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxsxb_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxsxb_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmsab_Walk						: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrsab_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpsab_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmsab_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsab_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgsxb_walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		musxb_Stand_Walk_Backward		: default		//unarmed
	}

	states
	{
		JUMP_STANDING		: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND
		FALL				: FALLING

		CROUCH_IDLE			: ONGROUND +CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: ONGROUND +INSTANT_CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: FORCED_CROUCH
		CROUCH_IDLE			: FORCED_PRONE
		CROUCH_DENIED		: ONGROUND +CROUCH DUCKED_VIEW_IN_WATER
		CROUCH_DENIED		: ONGROUND +INSTANT_CROUCH DUCKED_VIEW_IN_WATER

//		PRONE_IDLE			: ONGROUND +PRONE !PRONE_VIEW_IN_WATER
		PRONE_DENIED		: ONGROUND +PRONE PRONE_VIEW_IN_WATER
		STAND_TO_PRONE			: +PRONE ONGROUND CHECK_HEIGHT "prone" !FORCED_STAND !PRONE_VIEW_IN_WATER !LADEN

		STAND				: BLOCKED "2"
		STAND				: !HAS_VELOCITY
		
		RUN_LEFT			: RUN STRAFE_LEFT			//!FORWARD !BACKWARD
		RUN_RIGHT			: RUN STRAFE_RIGHT			//!FORWARD !BACKWARD
		RUN_FORWARD			: RUN FORWARD
		RUN_BACKWARD		: RUN BACKWARD
		
		WALK_LEFT			: STRAFE_LEFT			//!FORWARD !BACKWARD
		WALK_RIGHT			: STRAFE_RIGHT			//!FORWARD !BACKWARD
		WALK_FORWARD		: FORWARD
		
		// restart if our weapon has changed
		WALK_BACKWARD		: +HAS_WEAPON
		WALK_BACKWARD		: -HAS_WEAPON
	}
}

state WALK_LEFT
{
	entrycommands
	{
		movementstealth "0.75"
		moveposflags "standing" "walking"
	}
	legs
	{
		mxsxl_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxsxl_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxsxl_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxsxl_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxsxl_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxsxl_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxsxl_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxsxl_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxsxl_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxsxl_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmsal_Walk						: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrsal_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpsal_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmsal_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsal_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgsxl_walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		musxl_Stand_Walk_Left			: default		//unarmed
	}

	states
	{
		JUMP_STANDING		: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND
		FALL				: FALLING

		CROUCH_IDLE			: ONGROUND +CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: ONGROUND +INSTANT_CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: FORCED_CROUCH
		CROUCH_IDLE			: FORCED_PRONE
		CROUCH_DENIED		: ONGROUND +CROUCH DUCKED_VIEW_IN_WATER
		CROUCH_DENIED		: ONGROUND +INSTANT_CROUCH DUCKED_VIEW_IN_WATER

//		PRONE_IDLE			: ONGROUND +PRONE !PRONE_VIEW_IN_WATER
		PRONE_DENIED		: ONGROUND +PRONE PRONE_VIEW_IN_WATER
		STAND_TO_PRONE			: +PRONE ONGROUND CHECK_HEIGHT "prone" !FORCED_STAND !PRONE_VIEW_IN_WATER !LADEN

		STAND				: BLOCKED "2"
		STAND				: !HAS_VELOCITY
		
		RUN_LEFT			: RUN STRAFE_LEFT
		RUN_RIGHT			: RUN STRAFE_RIGHT
		RUN_FORWARD			: RUN FORWARD			//!STRAFE_LEFT !STRAFE_RIGHT
		RUN_BACKWARD		: RUN BACKWARD			//!STRAFE_LEFT !STRAFE_RIGHT
		
		WALK_RIGHT			: STRAFE_RIGHT
		WALK_FORWARD		: FORWARD !STRAFE_LEFT !STRAFE_RIGHT
		WALK_BACKWARD		: BACKWARD !STRAFE_LEFT !STRAFE_RIGHT
		
		// restart if our weapon has changed
		WALK_LEFT			: +HAS_WEAPON
		WALK_LEFT			: -HAS_WEAPON
	}
}

state WALK_RIGHT
{
	entrycommands
	{
		movementstealth "0.75"
		moveposflags "standing" "walking"
	}
	legs
	{
		mxsxr_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxsxr_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxsxr_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxsxr_Carry_Walk				: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxsxr_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxsxr_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxsxr_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxsxr_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxsxr_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxsxr_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmsar_Walk						: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrsar_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpsar_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmsar_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsar_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgsxr_walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		musxr_Stand_Walk_Right			: default		//unarmed
	}

	states
	{
		JUMP_STANDING		: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND
		FALL				: FALLING

		CROUCH_IDLE			: ONGROUND +CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: ONGROUND +INSTANT_CROUCH !DUCKED_VIEW_IN_WATER !FORCED_STAND
		CROUCH_IDLE			: FORCED_CROUCH
		CROUCH_IDLE			: FORCED_PRONE
		CROUCH_DENIED		: ONGROUND +CROUCH DUCKED_VIEW_IN_WATER
		CROUCH_DENIED		: ONGROUND +INSTANT_CROUCH DUCKED_VIEW_IN_WATER

//		PRONE_IDLE			: ONGROUND +PRONE !PRONE_VIEW_IN_WATER
		PRONE_DENIED		: ONGROUND +PRONE PRONE_VIEW_IN_WATER
		STAND_TO_PRONE			: +PRONE ONGROUND CHECK_HEIGHT "prone" !FORCED_STAND !PRONE_VIEW_IN_WATER !LADEN

		STAND				: BLOCKED "2"
		STAND				: !HAS_VELOCITY
		
		RUN_LEFT			: RUN STRAFE_LEFT
		RUN_RIGHT			: RUN STRAFE_RIGHT
		RUN_FORWARD			: RUN FORWARD			//!STRAFE_LEFT !STRAFE_RIGHT
		RUN_BACKWARD		: RUN BACKWARD			//!STRAFE_LEFT !STRAFE_RIGHT
		
		WALK_LEFT			: STRAFE_LEFT
		WALK_FORWARD		: FORWARD !STRAFE_LEFT !STRAFE_RIGHT
		WALK_BACKWARD		: BACKWARD !STRAFE_LEFT !STRAFE_RIGHT
		
		// restart if our weapon has changed
		WALK_RIGHT			: +HAS_WEAPON
		WALK_RIGHT			: -HAS_WEAPON
	}
}


////////////////////////////////////////////////////////////////
//
// Crouching
//
////////////////////////////////////////////////////////////////

// this state is called to notify the player that he can't duck
state CROUCH_DENIED
{
	entrycommands
	{
		msguser "Slugline:CantDuckUnderWater"
	}
	
	states
	{
		STAND	: default
	}
}

state CROUCH_IDLE
{
	entrycommands
	{
		modheight "duck"
		movementstealth "1.25"
		moveposflags "crouching"
	}
	legs
	{
		mxcxi_Carry_Crouch				: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxcxi_Carry_Crouch				: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxcxi_Carry_Crouch				: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxcxi_Carry_Crouch				: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxcxi_CS_Idle					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxcxi_CS_Idle					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxcxi_CS_Idle					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxcxi_CS_Idle					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxcxi_CS_Idle					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxcxi_CS_Idle					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmcai_Aim_Idle					: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrcai_Aim_Idle					: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpcai_Aim_Idle					: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmcai_Aim_Idle					: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmcai_Aim_Idle					: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgcxi_Idle						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mucxi_Crouch_Idle				: default		//unarmed
	}

	states
	{
		FALL_DUCKED				: FALLING

		TURRET_START			: IS_USING_TURRET !HAS_WEAPON

		STAND					: +JUMP CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: DUCKED_VIEW_IN_WATER CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: !PRONE +JUMP CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: +PRONE +JUMP CHECK_HEIGHT "stand"	!FORCED_CROUCH
		STAND					: +STAND CHECK_HEIGHT "stand"	!FORCED_CROUCH
		STAND					: FORCED_STAND

		PRONE_IDLE				: +CROUCH !LADEN CHECK_HEIGHT "prone" !PRONE_VIEW_IN_WATER !FORCED_CROUCH
		PRONE_IDLE				: +PRONE !LADEN CHECK_HEIGHT "prone" !PRONE_VIEW_IN_WATER !FORCED_CROUCH
		PRONE_IDLE				: FORCED_PRONE

		PRONE_DENIED			: ONGROUND +CROUCH PRONE_VIEW_IN_WATER

		CROUCH_RUN_LEFT			: RUN STRAFE_LEFT HAS_VELOCITY !BLOCKED "2"
		CROUCH_RUN_RIGHT		: RUN STRAFE_RIGHT HAS_VELOCITY !BLOCKED "2"
		CROUCH_RUN_FORWARD		: RUN FORWARD HAS_VELOCITY !BLOCKED "2"
		CROUCH_RUN_BACKWARD		: RUN BACKWARD HAS_VELOCITY !BLOCKED "2"

		CROUCH_WALK_LEFT		: STRAFE_LEFT HAS_VELOCITY !BLOCKED "2"
		CROUCH_WALK_RIGHT		: STRAFE_RIGHT HAS_VELOCITY !BLOCKED "2"
		CROUCH_WALK_FORWARD		: FORWARD HAS_VELOCITY !BLOCKED "2"
		CROUCH_WALK_BACKWARD	: BACKWARD HAS_VELOCITY !BLOCKED "2"

		// restart if our weapon has changed
		CROUCH_IDLE				: +HAS_WEAPON
		CROUCH_IDLE				: -HAS_WEAPON
	}
}

////////////////////////////////////////////////////////////////
//
// Crouch Walking
//
////////////////////////////////////////////////////////////////

state CROUCH_WALK_FORWARD
{
	entrycommands
	{
		modheight "duck"
		movementstealth "1.0"
		moveposflags "crouching" "walking"
	}
	legs
	{
		mxcxf_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxcxf_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxcxf_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxcxf_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxcxf_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxcxf_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxcxf_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxcxf_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxcxf_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxcxf_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmcaf_Crouch_Walk_Aim			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrcaf_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpcaf_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmcaf_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmcaf_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgcxf_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mucxf_Crouch_Walk_Forward		: default		//unarmed
	}

	states
	{
		FALL_DUCKED				: FALLING

		STAND					: JUMP CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: DUCKED_VIEW_IN_WATER CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: FORCED_STAND
		STAND					: +STAND CHECK_HEIGHT "stand"	!FORCED_CROUCH
	
		CROUCH_IDLE				: !HAS_VELOCITY
		CROUCH_IDLE				: BLOCKED "2"

		PRONE_IDLE				: +CROUCH CHECK_HEIGHT "stand" !PRONE_VIEW_IN_WATER !FORCED_CROUCH
		PRONE_IDLE				: +PRONE !LADEN CHECK_HEIGHT "prone" !PRONE_VIEW_IN_WATER !FORCED_CROUCH
		PRONE_IDLE				: FORCED_PRONE

		PRONE_DENIED			: ONGROUND +PRONE PRONE_VIEW_IN_WATER

		CROUCH_RUN_LEFT			: RUN STRAFE_LEFT			//!FORWARD !BACKWARD
		CROUCH_RUN_RIGHT		: RUN STRAFE_RIGHT			//!FORWARD !BACKWARD
		CROUCH_RUN_FORWARD		: RUN FORWARD
		CROUCH_RUN_BACKWARD		: RUN BACKWARD
		
		CROUCH_WALK_LEFT		: STRAFE_LEFT			//!FORWARD !BACKWARD
		CROUCH_WALK_RIGHT		: STRAFE_RIGHT			//!FORWARD !BACKWARD
		CROUCH_WALK_BACKWARD	: BACKWARD
		
		// restart if our weapon has changed
		CROUCH_WALK_FORWARD		: +HAS_WEAPON
		CROUCH_WALK_FORWARD		: -HAS_WEAPON
	}
}

state CROUCH_WALK_BACKWARD
{
	entrycommands
	{
		modheight "duck"
		movementstealth "1.0"
		moveposflags "crouching" "walking"
	}
	legs
	{
		mxcxb_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxcxb_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxcxb_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxcxb_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxcxb_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxcxb_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxcxb_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxcxb_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxcxb_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxcxb_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmcab_Crouch_Walk_Aim			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrcab_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpcab_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmcab_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmcab_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgcxb_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mucxb_Crouch_Walk_Backward		: default		//unarmed
	}

	states
	{
		FALL_DUCKED				: FALLING

		STAND					: JUMP CHECK_HEIGHT "stand" !FORCED_CROUCH
		//STAND					: +CROUCH CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: VIEW_IN_WATER CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: FORCED_STAND
		STAND					: +STAND CHECK_HEIGHT "stand"	!FORCED_CROUCH

		CROUCH_IDLE				: !HAS_VELOCITY
		CROUCH_IDLE				: BLOCKED "2"

		PRONE_IDLE				: +PRONE !LADEN CHECK_HEIGHT "prone" !PRONE_VIEW_IN_WATER !FORCED_CROUCH
		PRONE_IDLE				: FORCED_PRONE
		PRONE_DENIED			: ONGROUND +PRONE PRONE_VIEW_IN_WATER
		
		CROUCH_RUN_LEFT			: RUN STRAFE_LEFT			//!FORWARD !BACKWARD
		CROUCH_RUN_RIGHT		: RUN STRAFE_RIGHT			//!FORWARD !BACKWARD
		CROUCH_RUN_FORWARD		: RUN FORWARD
		CROUCH_RUN_BACKWARD		: RUN BACKWARD
		
		CROUCH_WALK_LEFT		: STRAFE_LEFT				//!FORWARD !BACKWARD
		CROUCH_WALK_RIGHT		: STRAFE_RIGHT				//!FORWARD !BACKWARD
		CROUCH_WALK_FORWARD		: FORWARD

		// restart if our weapon has changed
		CROUCH_WALK_BACKWARD	: +HAS_WEAPON
		CROUCH_WALK_BACKWARD	: -HAS_WEAPON
	}
}

state CROUCH_WALK_LEFT
{
	entrycommands
	{
		modheight "duck"
		movementstealth "1.0"
		moveposflags "crouching" "walking"
	}
	legs
	{
		mxcxl_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxcxl_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxcxl_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxcxl_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxcxl_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxcxl_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxcxl_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxcxl_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxcxl_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxcxl_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmcal_Crouch_Walk_Aim			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrcal_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpcal_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmcal_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmcal_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgcxl_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mucxl_Crouch_Walk_Left			: default		//unarmed
	}

	states
	{
		FALL_DUCKED				: FALLING

		STAND					: JUMP CHECK_HEIGHT "stand" !FORCED_CROUCH
		//STAND					: +CROUCH CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: VIEW_IN_WATER CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: FORCED_STAND
		STAND					: +STAND CHECK_HEIGHT "stand"	!FORCED_CROUCH

		CROUCH_IDLE				: !HAS_VELOCITY
		CROUCH_IDLE				: BLOCKED "2"

		PRONE_IDLE				: +PRONE !LADEN CHECK_HEIGHT "prone" !PRONE_VIEW_IN_WATER !FORCED_CROUCH
		PRONE_IDLE				: FORCED_PRONE
		PRONE_DENIED			: ONGROUND +PRONE PRONE_VIEW_IN_WATER
			
		CROUCH_RUN_LEFT			: RUN STRAFE_LEFT
		CROUCH_RUN_RIGHT		: RUN STRAFE_RIGHT
		CROUCH_RUN_FORWARD		: RUN FORWARD			//!STRAFE_LEFT !STRAFE_RIGHT
		CROUCH_RUN_BACKWARD		: RUN BACKWARD			//!STRAFE_LEFT !STRAFE_RIGHT
		
		CROUCH_WALK_RIGHT		: STRAFE_RIGHT
		CROUCH_WALK_FORWARD		: FORWARD !STRAFE_LEFT !STRAFE_RIGHT
		CROUCH_WALK_BACKWARD	: BACKWARD !STRAFE_LEFT !STRAFE_RIGHT
		
		// restart if our weapon has changed
		CROUCH_WALK_LEFT		: +HAS_WEAPON
		CROUCH_WALK_LEFT		: -HAS_WEAPON
	}
}

state CROUCH_WALK_RIGHT
{
	entrycommands
	{
		modheight "duck"
		movementstealth "1.0"
		moveposflags "crouching" "walking"
	}
	legs
	{
		mxcxr_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxcxr_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxcxr_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxcxr_Carry_Crouch_Walk			: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxcxr_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxcxr_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxcxr_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxcxr_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxcxr_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxcxr_CS_Walk					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmcar_Crouch_Walk_Aim			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrcar_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpcar_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmcar_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmcar_Crouch_Walk_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgcxr_Walk						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mucxr_Crouch_Walk_Right			: default		//unarmed
	}

	states
	{
		FALL_DUCKED				: FALLING

		STAND					: JUMP CHECK_HEIGHT "stand" !FORCED_CROUCH
		//STAND					: +CROUCH CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: VIEW_IN_WATER CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: FORCED_STAND
		STAND					: +STAND CHECK_HEIGHT "stand"	!FORCED_CROUCH

		CROUCH_IDLE				: !HAS_VELOCITY
		CROUCH_IDLE				: BLOCKED "2"

		PRONE_IDLE				: +PRONE !LADEN CHECK_HEIGHT "prone" !PRONE_VIEW_IN_WATER !FORCED_CROUCH
		PRONE_IDLE				: FORCED_PRONE
		PRONE_DENIED			: ONGROUND +PRONE PRONE_VIEW_IN_WATER
			
		CROUCH_RUN_LEFT			: RUN STRAFE_LEFT
		CROUCH_RUN_RIGHT		: RUN STRAFE_RIGHT
		CROUCH_RUN_FORWARD		: RUN FORWARD			//!STRAFE_LEFT !STRAFE_RIGHT
		CROUCH_RUN_BACKWARD		: RUN BACKWARD			//!STRAFE_LEFT !STRAFE_RIGHT
		
		CROUCH_WALK_LEFT		: STRAFE_LEFT
		CROUCH_WALK_FORWARD		: FORWARD !STRAFE_LEFT !STRAFE_RIGHT
		CROUCH_WALK_BACKWARD	: BACKWARD !STRAFE_LEFT !STRAFE_RIGHT
		
		// restart if our weapon has changed
		CROUCH_WALK_RIGHT		: +HAS_WEAPON
		CROUCH_WALK_RIGHT		: -HAS_WEAPON
	}
}

////////////////////////////////////////////////////////////////
//
// Crouch Running
//
////////////////////////////////////////////////////////////////

state CROUCH_RUN_FORWARD
{
	entrycommands
	{
		modheight "duck"
		movementstealth "0.75"
		moveposflags "crouching" "running"
	}
	legs
	{
		mxcxf_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxcxf_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxcxf_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxcxf_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxcxf_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxcxf_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxcxf_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxcxf_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxcxf_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxcxf_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmcaf_Crouch_Run_Aim			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrcaf_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpcaf_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmcaf_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmcaf_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgcxf_Run						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mucxf_Crouch_Forward			: default		//unarmed
	}

	states
	{
		FALL_DUCKED				: FALLING

		STAND					: JUMP CHECK_HEIGHT "stand" !FORCED_CROUCH
		//STAND					: +CROUCH CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: VIEW_IN_WATER CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: FORCED_STAND
		STAND					: +STAND CHECK_HEIGHT "stand"	!FORCED_CROUCH

		CROUCH_IDLE				: !HAS_VELOCITY
		CROUCH_IDLE				: BLOCKED "2"
						
		PRONE_IDLE				: +CROUCH !LADEN CHECK_HEIGHT "prone" !PRONE_VIEW_IN_WATER !FORCED_CROUCH
		PRONE_IDLE				: FORCED_PRONE
		PRONE_DENIED			: ONGROUND +CROUCH PRONE_VIEW_IN_WATER
		PRONE_DIVE			: +PRONE !LADEN ONGROUND CHECK_HEIGHT "prone" !FORCED_STAND !PRONE_VIEW_IN_WATER
							
		CROUCH_WALK_LEFT		: !RUN STRAFE_LEFT			//!FORWARD !BACKWARD
		CROUCH_WALK_RIGHT		: !RUN STRAFE_RIGHT			//!FORWARD !BACKWARD
		CROUCH_WALK_FORWARD		: !RUN FORWARD
		CROUCH_WALK_BACKWARD	: !RUN BACKWARD

		CROUCH_RUN_LEFT			: STRAFE_LEFT				//!FORWARD !BACKWARD
		CROUCH_RUN_RIGHT		: STRAFE_RIGHT				//!FORWARD !BACKWARD
		CROUCH_RUN_BACKWARD		: BACKWARD
		
		// restart if our weapon has changed
		CROUCH_RUN_FORWARD	: +HAS_WEAPON
		CROUCH_RUN_FORWARD	: -HAS_WEAPON
	}
}

state CROUCH_RUN_BACKWARD
{
	entrycommands
	{
		modheight "duck"
		movementstealth "0.75"
		moveposflags "crouching" "running"
	}
	legs
	{
		mxcxb_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxcxb_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxcxb_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxcxb_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxcxb_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxcxb_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxcxb_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxcxb_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxcxb_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxcxb_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmcab_Crouch_Run_Aim			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrcab_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpcab_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmcab_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmcab_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgcxb_Run						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mucxb_Crouch_Backward			: default		//unarmed
	}

	states
	{
		FALL_DUCKED				: FALLING

		STAND					: JUMP CHECK_HEIGHT "stand" !FORCED_CROUCH
		//STAND					: +CROUCH CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: VIEW_IN_WATER CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: FORCED_STAND
		STAND					: +STAND CHECK_HEIGHT "stand"	!FORCED_CROUCH

		CROUCH_IDLE				: !HAS_VELOCITY
		CROUCH_IDLE				: BLOCKED "2"
		
		PRONE_IDLE				: +CROUCH !LADEN CHECK_HEIGHT "prone" !PRONE_VIEW_IN_WATER !FORCED_CROUCH
		PRONE_IDLE				: FORCED_PRONE
		PRONE_DENIED			: ONGROUND +CROUCH PRONE_VIEW_IN_WATER
		PRONE_DIVE		: +PRONE !LADEN ONGROUND CHECK_HEIGHT "prone" !FORCED_STAND !PRONE_VIEW_IN_WATER
		
		CROUCH_WALK_LEFT		: !RUN STRAFE_LEFT				//!FORWARD !BACKWARD
		CROUCH_WALK_RIGHT		: !RUN STRAFE_RIGHT				//!FORWARD !BACKWARD
		CROUCH_WALK_FORWARD		: !RUN FORWARD
		CROUCH_WALK_BACKWARD	: !RUN BACKWARD

		CROUCH_RUN_LEFT			: STRAFE_LEFT					//!FORWARD !BACKWARD
		CROUCH_RUN_RIGHT		: STRAFE_RIGHT					//!FORWARD !BACKWARD
		CROUCH_RUN_FORWARD		: FORWARD
		
		// restart if our weapon has changed
		CROUCH_RUN_BACKWARD		: +HAS_WEAPON
		CROUCH_RUN_BACKWARD		: -HAS_WEAPON
	}
}

state CROUCH_RUN_LEFT
{
	entrycommands
	{
		modheight "duck"
		movementstealth "0.75"
		moveposflags "crouching" "running"
	}
	legs
	{
		mxcxl_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxcxl_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxcxl_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxcxl_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxcxl_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxcxl_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxcxl_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxcxl_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxcxl_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxcxl_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmcal_Crouch_Run_Aim			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrcal_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpcal_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmcal_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmcal_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgcxl_Run						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mucxl_Crouch_Left				: default		//unarmed
	}

	states
	{
		FALL_DUCKED				: FALLING

		STAND					: JUMP CHECK_HEIGHT "stand" !FORCED_CROUCH
		//STAND					: +CROUCH CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: VIEW_IN_WATER CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: FORCED_STAND
		STAND					: +STAND CHECK_HEIGHT "stand"	!FORCED_CROUCH

		CROUCH_IDLE				: !HAS_VELOCITY
		CROUCH_IDLE				: BLOCKED "2"
		
		PRONE_IDLE				: +CROUCH !LADEN CHECK_HEIGHT "prone" !PRONE_VIEW_IN_WATER !FORCED_CROUCH
		PRONE_IDLE				: FORCED_PRONE
		PRONE_DENIED			: ONGROUND +CROUCH PRONE_VIEW_IN_WATER
		PRONE_DIVE_ROLL_LEFT			: +PRONE !LADEN ONGROUND CHECK_HEIGHT "prone" !FORCED_STAND !PRONE_VIEW_IN_WATER
		
		CROUCH_WALK_LEFT		: !RUN STRAFE_LEFT
		CROUCH_WALK_RIGHT		: !RUN STRAFE_RIGHT
		CROUCH_WALK_FORWARD		: !RUN FORWARD				//!STRAFE_LEFT !STRAFE_RIGHT
		CROUCH_WALK_BACKWARD	: !RUN BACKWARD				//!STRAFE_LEFT !STRAFE_RIGHT

		CROUCH_RUN_RIGHT		: STRAFE_RIGHT
		CROUCH_RUN_FORWARD		: FORWARD !STRAFE_LEFT !STRAFE_RIGHT
		CROUCH_RUN_BACKWARD		: BACKWARD !STRAFE_LEFT !STRAFE_RIGHT
		
		// restart if our weapon has changed
		CROUCH_RUN_LEFT			: +HAS_WEAPON
		CROUCH_RUN_LEFT			: -HAS_WEAPON
	}
}

state CROUCH_RUN_RIGHT
{
	entrycommands
	{
		modheight "duck"
		movementstealth "0.75"
		moveposflags "crouching" "running"
	}
	legs
	{
		mxcxr_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxcxr_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxcxr_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxcxr_Carry_Crouch_Run			: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxcxr_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxcxr_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxcxr_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxcxr_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxcxr_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxcxr_CS_Run					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmcar_Crouch_Run_Aim			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrcar_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpcar_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmcar_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmcar_Crouch_Run_Aim			: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgcxr_Run						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mucxr_Crouch_Right				: default		//unarmed
	}

	states
	{
		FALL_DUCKED				: FALLING

		STAND					: JUMP CHECK_HEIGHT "stand" !FORCED_CROUCH
		//STAND					: +CROUCH CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: VIEW_IN_WATER CHECK_HEIGHT "stand" !FORCED_CROUCH
		STAND					: FORCED_STAND
		STAND					: +STAND CHECK_HEIGHT "stand"	!FORCED_CROUCH

		CROUCH_IDLE				: !HAS_VELOCITY
		CROUCH_IDLE				: BLOCKED "2"
		
		PRONE_IDLE				: +CROUCH !LADEN CHECK_HEIGHT "prone" !PRONE_VIEW_IN_WATER !FORCED_CROUCH
		PRONE_IDLE				: FORCED_PRONE
		PRONE_DENIED			: ONGROUND +CROUCH PRONE_VIEW_IN_WATER
		PRONE_DIVE_ROLL_RIGHT			: +PRONE !LADEN ONGROUND CHECK_HEIGHT "prone" !FORCED_STAND !PRONE_VIEW_IN_WATER
			
		CROUCH_WALK_LEFT		: !RUN STRAFE_LEFT
		CROUCH_WALK_RIGHT		: !RUN STRAFE_RIGHT
		CROUCH_WALK_FORWARD		: !RUN FORWARD				//!STRAFE_LEFT !STRAFE_RIGHT
		CROUCH_WALK_BACKWARD	: !RUN BACKWARD				//!STRAFE_LEFT !STRAFE_RIGHT

		CROUCH_RUN_LEFT			: STRAFE_LEFT
		CROUCH_RUN_FORWARD		: FORWARD !STRAFE_LEFT !STRAFE_RIGHT
		CROUCH_RUN_BACKWARD		: BACKWARD !STRAFE_LEFT !STRAFE_RIGHT
		
		// restart if our weapon has changed
		CROUCH_RUN_RIGHT		: +HAS_WEAPON
		CROUCH_RUN_RIGHT		: -HAS_WEAPON
	}
}

////////////////////////////////////////////////////////////////
//
// Falling
//
////////////////////////////////////////////////////////////////

// falling in standing position
state FALL
{
	entrycommands
	{
		modheight "stand"
		movementstealth "0.5"
		moveposflags "offground" "falling"
	}
	legs
	{
		mxjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrjax_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpjxx_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmjxx_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmjxx_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgjxx_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mujxx_Jump_Fall					: default		//unarmed
	}

	states
	{
//		LAND			: ONGROUND CHECK_HEIGHT "stand"
//		LAND_DUCKED		: ONGROUND
		LAND			: ONGROUND
		
		FALL_DUCKED		: +CROUCH
	}
}

state FALL_RUNNING
{
	entrycommands
	{
		modheight "stand"
		movementstealth "0.5"
		moveposflags "offground" "falling"
	}
	legs
	{
		mxjax_Jump_Fall_Run				: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxjax_Jump_Fall_Run				: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxjax_Jump_Fall_Run				: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxjax_Jump_Fall_Run				: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxjax_CS_Jump_Fall_Run			: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxjax_CS_Jump_Fall_Run			: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxjax_CS_Jump_Fall_Run			: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxjax_CS_Jump_Fall_Run			: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxjax_CS_Jump_Fall_Run			: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxjax_CS_Jump_Fall_Run			: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmjax_Jump_Fall_Run				: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrjax_Jump_Fall_Run				: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpjax_Jump_Fall_Run				: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmjax_Jump_Fall_Run				: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmjax_Jump_Fall_Run				: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgjax_Jump_Fall_Run				: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mujax_Jump_Fall_Run				: default		//unarmed
	}

	states
	{
		LAND_RUNNING		: ONGROUND RUN FORWARD HAS_VELOCITY !BLOCKED "2"
//		LAND			: ONGROUND CHECK_HEIGHT "stand"
//		LAND_DUCKED		: ONGROUND
		LAND			: ONGROUND

		FALL_DUCKED		: +CROUCH
	}
}

state LAND_RUNNING
{
	entrycommands
	{
		movementstealth "0.25"
		moveposflags "standing"
	}
	legs
	{
		mxjax_Jump_Land_Run				: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxjax_Jump_Land_Run				: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxjax_Jump_Land_Run				: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxjax_Jump_Land_Run				: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxjax_CS_Jump_Land_Run			: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxjax_CS_Jump_Land_Run			: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxjax_CS_Jump_Land_Run			: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxjax_CS_Jump_Land_Run			: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxjax_CS_Jump_Land_Run			: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxjax_CS_Jump_Land_Run			: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmjax_Jump_Land_Run				: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrjax_Jump_Land_Run				: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpjax_Jump_Land_Run				: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmjax_Jump_Land_Run				: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmjax_Jump_Land_Run				: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgjax_Jump_Land_Run				: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mujax_Jump_Land_Run				: default		//unarmed
	}

	states
	{
		JUMP_FORWARD_RUN	: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND RUN FORWARD HAS_VELOCITY !BLOCKED "2"
		JUMP_STANDING		: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND

		STAND 				: ANIMDONE_LEGS CHECK_HEIGHT "stand"
		CROUCH_IDLE			: ANIMDONE_LEGS
	}
}


// land from falling in  a standing position
state LAND
{
	entrycommands
	{
		modheight "stand"
		movementstealth "0.5"
		moveposflags "standing"
	}
	states
	{
		LAND_IMPACT_HARD	: HARD_IMPACT
		LAND_IMPACT			: MEDIUM_IMPACT

		JUMP_FORWARD_RUN	: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND RUN FORWARD HAS_VELOCITY !BLOCKED "2"
		JUMP_STANDING		: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND

		STAND 				: CHECK_HEIGHT "stand"
		CROUCH_IDLE			: default
	}
}

// land from falling in  a standing position
state LAND_IMPACT
{
	entrycommands
	{
		movementstealth "0.25"
		moveposflags "standing"
	}
	legs
	{
		mxjxx_Jump_Land					: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxjxx_Jump_Land					: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxjxx_Jump_Land					: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxjxx_Jump_Land					: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxjxx_CS_Jump_Land				: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxjxx_CS_Jump_Land				: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxjxx_CS_Jump_Land				: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxjxx_CS_Jump_Land				: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxjxx_CS_Jump_Land				: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxjxx_CS_Jump_Land				: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmjxx_Jump_Land					: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrjax_Jump_Land					: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpjxx_Jump_Land					: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmjxx_Jump_Land					: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmjxx_Jump_Land					: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgjxx_Jump_Land					: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mujxx_Jump_Land					: default		//unarmed
	}

	states
	{
		JUMP_FORWARD_RUN	: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND RUN FORWARD HAS_VELOCITY !BLOCKED "2"
		JUMP_STANDING		: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND

		STAND 			: ANIMDONE_LEGS CHECK_HEIGHT "stand"
		CROUCH_IDLE		: ANIMDONE_LEGS
	}
}

// land from falling in  a standing position
state LAND_IMPACT_HARD
{
	entrycommands
	{
		movementstealth "0.25"
		moveposflags "standing"
	}
	legs
	{
		mxjxx_Jump_Land_Hard			: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxjxx_Jump_Land_Hard			: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxjxx_Jump_Land_Hard			: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxjxx_Jump_Land_Hard			: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxjxx_CS_Jump_Land_Hard			: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxjxx_CS_Jump_Land_Hard			: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxjxx_CS_Jump_Land_Hard			: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxjxx_CS_Jump_Land_Hard			: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxjxx_CS_Jump_Land_Hard			: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxjxx_CS_Jump_Land_Hard			: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmjxx_Jump_Land_Hard			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrjax_Jump_Land_Hard			: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpjxx_Jump_Land_Hard			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmjxx_Jump_Land_Hard			: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmjxx_Jump_Land_Hard			: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgjxx_Jump_Land_Hard			: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mujxx_Jump_Land_Hard			: default		//unarmed
	}

	states
	{
		JUMP_FORWARD_RUN	: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND RUN FORWARD HAS_VELOCITY !BLOCKED "2"
		JUMP_STANDING		: +JUMP ONGROUND !DUCKED_VIEW_IN_WATER !FORCED_STAND

		STAND 			: ANIMDONE_LEGS CHECK_HEIGHT "stand"
		CROUCH_IDLE		: ANIMDONE_LEGS
	}
}

state FALL_DUCKED
{
	entrycommands
	{
		modheight "duck"
		movementstealth "0.75"
		moveposflags "offground" "falling"
	}
	legs
	{
		mxjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrjax_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpjxx_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmjxx_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmjxx_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgjxx_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mujxx_Jump_Fall					: default		//unarmed
	}
	
	states
	{
		LAND_DUCKED			: ONGROUND
//		FALL				: !CROUCH DOWN_VELOCITY "100" CHECK_HEIGHT "stand"

//		FALL				: +CROUCH CHECK_HEIGHT "stand"
//		FALL				: +JUMP CHECK_HEIGHT "stand"
	}
}

state FALL_DUCKED_WANT_STAND
{
	entrycommands
	{
//		modheight "duck"
		movementstealth "0.75"
		moveposflags "offground" "falling"
	}
	legs
	{
		mxjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxjxx_CS_Jump_Fall				: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmjxx_Jump_Fall					: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrjax_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpjxx_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmjxx_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmjxx_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgjxx_Jump_Fall					: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mujxx_Jump_Fall					: default		//unarmed
	}
	
	states
	{
//		FALL				: CHECK_HEIGHT "stand"
//		FALL				: +JUMP CHECK_HEIGHT "stand"
		FALL_DUCKED			: +CROUCH
	
		LAND				: ONGROUND CHECK_HEIGHT "stand"
		LAND_DUCKED			: ONGROUND
	}
}

state LAND_DUCKED
{
	entrycommands
	{
		movementstealth "0.5"
		moveposflags "crouching"
	}
	states
	{
		STAND				: HARD_IMPACT !CROUCH !INSTANT_CROUCH CHECK_HEIGHT "stand"
		CROUCH_IDLE			: default
	}
}


////////////////////////////////////////////////////////////////
//
// JUMPING
//
////////////////////////////////////////////////////////////////

state JUMP_STANDING
{
	entrycommands
	{
		movementstealth "0.3"
//////		moveposflags "crouching"
		moveposflags "standing"

		modheight "jumpstart"
//		commanddelay 0.05 jump 56
		jump 56

	}
	legs
	{
		mxjxx_Jump_Take_Off				: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxjxx_Jump_Take_Off				: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxjxx_Jump_Take_Off				: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxjxx_Jump_Take_Off				: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxjxx_CS_Jump_Take_Off			: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxjxx_CS_Jump_Take_Off			: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxjxx_CS_Jump_Take_Off			: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxjxx_CS_Jump_Take_Off			: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxjxx_CS_Jump_Take_Off			: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxjxx_CS_Jump_Take_Off			: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmjxx_Jump_Take_Off				: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrjax_Jump_Take_Off				: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpjxx_Jump_Take_Off				: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmjxx_Jump_Take_Off				: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmjxx_Jump_Take_Off				: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgjxx_Jump_Take_Off				: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mujxx_Jump_Take_Off				: default		//unarmed
	}
	
	states
	{
//		FALL_DUCKED				: ANIMDONE_LEGS CROUCH
//		FALL					: ANIMDONE_LEGS CHECK_HEIGHT "stand"
//		FALL_DUCKED_WANT_STAND	: ANIMDONE_LEGS !DUCKED_VIEW_IN_WATER
		FALL					: ANIMDONE_LEGS
		LAND					: IN_LEGS_STATE_TIME "0.1" ONGROUND
	}
}

state JUMP_FORWARD_RUN
{
	entrycommands
	{
		movementstealth "0.2"
		moveposflags "running"
//		moveposflags "crouching" "running"
		modheight "jumpstart"
//		commanddelay 0.05 jump 56
		jump 56
	}
	legs
	{
		// need "_Carry_" versions of jumps/falls
		mxjax_Jump_Take_Off_mobile		: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxjax_Jump_Take_Off_mobile		: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxjax_Jump_Take_Off_mobile		: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxjax_Jump_Take_Off_mobile		: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxjax_CS_Jump_Take_Off_mobile	: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxjax_CS_Jump_Take_Off_mobile	: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxjax_CS_Jump_Take_Off_mobile	: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxjax_CS_Jump_Take_Off_mobile	: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxjax_CS_Jump_Take_Off_mobile	: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxjax_CS_Jump_Take_Off_mobile	: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmjax_Jump_Take_Off_mobile		: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrjax_Jump_Take_Off_mobile		: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpjax_Jump_Take_Off_mobile		: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmjax_Jump_Take_Off_mobile		: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmjax_Jump_Take_Off_mobile		: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgjax_Jump_Take_Off_mobile		: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mujax_Jump_Take_Off_mobile		: default		//unarmed
	}
	
	states
	{
//		FALL_DUCKED				: ANIMDONE_LEGS CROUCH
//		FALL					: ANIMDONE_LEGS CHECK_HEIGHT "stand"
//		FALL_DUCKED_WANT_STAND	: ANIMDONE_LEGS !DUCKED_VIEW_IN_WATER

		FALL_RUNNING			: ANIMDONE_LEGS
		LAND_RUNNING			: IN_LEGS_STATE_TIME "0.1" ONGROUND
	}
}

////////////////////////////////////////////////////////////////
//
// VEHICLES
//
////////////////////////////////////////////////////////////////

state VEHICLE_START
{
	states
	{
		VEHICLE_ENTER : IS_USING_VEHICLE "entering"
		VEHICLE_EXIT  : IS_USING_VEHICLE "exiting"
		VEHICLE_USING : default
	}
}

state VEHICLE_ENTER
{
	entrycommands
	{
		//setanimatedview 1
	}
	exitcommands
	{
		setanimatedview 0
		vehicleenterdone
	}

	legs
	{
		//Jeep
		xvxxd_js_mount_player	: VEHICLE_TYPE "Jeep" IS_DRIVER
		//xuxxx_jeep_gun_mount	: VEHICLE_TYPE "Jeep" IS_IN_TURRETSLOT
		xvxxp_js_mount_player	: VEHICLE_TYPE "Jeep" IS_PASSENGER "0"
		
		//Scout car
		xvxxp_js_mount_player	: VEHICLE_TYPE "Scout" IS_DRIVER
		xvxxd_js_mount_player	: VEHICLE_TYPE "Scout" IS_PASSENGER "0"
		//right_rear
		xvxxr_js_mount_player	: VEHICLE_TYPE "Scout" IS_PASSENGER "1"
		//left_rear
		xvxxl_js_mount_player	: VEHICLE_TYPE "Scout" IS_PASSENGER "2"
		// alternate front passenger		
		xvxxd_js_mount_player	: VEHICLE_TYPE "Scout" IS_PASSENGER "3"
		
		//Model 94 Truck
		//LEFT
		xvxxl_truck_mount_01_player	: VEHICLE_TYPE "Model94" IS_PASSENGER "1"
		xvxxl_truck_mount_02_player	: VEHICLE_TYPE "Model94" IS_PASSENGER "3"
		xvxxl_truck_mount_03_player	: VEHICLE_TYPE "Model94" IS_PASSENGER "5"
		//RIGHT
		xvxxr_truck_mount_01_player	: VEHICLE_TYPE "Model94" IS_PASSENGER "2"
		xvxxr_truck_mount_02_player	: VEHICLE_TYPE "Model94" IS_PASSENGER "4"
		xvxxr_truck_mount_03_player	: VEHICLE_TYPE "Model94" IS_PASSENGER "6"

		// Raft
//		xvxxx_raft_mount_player		: VEHICLE_TYPE "RaftLCRS" IS_DRIVER
		xvxxx_raft_mount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "1"
		xvxxx_raft_mount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "2"
		xvxxx_raft_mount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "3"
		xvxxx_raft_mount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "4"
		xvxxx_raft_mount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "5"
		xvxxx_raft_mount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "6"
		xvxxx_raft_mount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "7"
		xvxxx_raft_mount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "8"

		//Default
		xuxxx_jeep_driver_mount	: default
	}
	
	states
	{
		VEHICLE_USING			: ANIMDONE_LEGS
	}
}


state VEHICLE_USING
{
	legs
	{
		xuxxx_jeep_driving_idle : default
	}
	
	states
	{
		VEHICLE_EXIT 		: IS_USING_VEHICLE "exiting"
		STAND : !IS_USING_VEHICLE
	}
}

state VEHICLE_EXIT
{
	entrycommands
	{
		//setanimatedview 1
	}
	exitcommands
	{
		setanimatedview 0
		vehicleexitdone
	}
	legs
	{
		//Jeep
		xvxxd_js_dismount_player : VEHICLE_TYPE "Jeep" IS_DRIVER
		xvxxp_js_dismount_player : VEHICLE_TYPE "Jeep" IS_PASSENGER "0"
		
		//Scout
		xvxxp_js_dismount_player 	: VEHICLE_TYPE "Scout" IS_DRIVER
		xvxxd_js_dismount_player    : VEHICLE_TYPE "Scout" IS_PASSENGER "0"
		//right_rear
		xvxxr_js_dismount_player	: VEHICLE_TYPE "Scout" IS_PASSENGER "1"
		//left_rear
		xvxxl_js_dismount_player	: VEHICLE_TYPE "Scout" IS_PASSENGER "2"
		// alternate front passenger		
		xvxxd_js_dismount_player    : VEHICLE_TYPE "Scout" IS_PASSENGER "3"
		
		//Model 94 Truck
		//LEFT
		xvxxl_truck_dismount_01_player	: VEHICLE_TYPE "Model94" IS_PASSENGER "1"
		xvxxl_truck_dismount_02_player	: VEHICLE_TYPE "Model94" IS_PASSENGER "3"
		xvxxl_truck_dismount_03_player	: VEHICLE_TYPE "Model94" IS_PASSENGER "5"
		//RIGHT
		xvxxr_truck_dismount_01_player	: VEHICLE_TYPE "Model94" IS_PASSENGER "2"
		xvxxr_truck_dismount_02_player	: VEHICLE_TYPE "Model94" IS_PASSENGER "4"
		xvxxr_truck_dismount_03_player	: VEHICLE_TYPE "Model94" IS_PASSENGER "6"

		// Raft
//		xvxxx_raft_dismount_player		: VEHICLE_TYPE "RaftLCRS" IS_DRIVER
		xvxxx_raft_dismount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "1"
		xvxxx_raft_dismount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "2"
		xvxxx_raft_dismount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "3"
		xvxxx_raft_dismount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "4"
		xvxxx_raft_dismount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "5"
		xvxxx_raft_dismount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "6"
		xvxxx_raft_dismount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "7"
		xvxxx_raft_dismount_player		: VEHICLE_TYPE "RaftLCRS" IS_PASSENGER "8"

		//default
		xvxxd_js_dismount_player	: default
	}
	
	states
	{
		STAND 		: ANIMDONE_LEGS
	}
}

// for when using a turret on a vehicle

state VEHICLE_TURRET_START
{
	legs
	{
		unarmed_idle : default
	}
	
	states
	{
		VEHICLE_TURRET_USING	: ANIMDONE_LEGS
	}
}

state VEHICLE_TURRET_USING
{
	legs
	{
		unarmed_idle	: TURRET_TYPE "MG42"
		unarmed_idle	: default
	}
	
	states
	{
		STAND		: !IS_USING_VEHICLE
		STAND		: !IS_USING_TURRET
	}
}

////////////////////////////////////////////////////////////////
//
// TURRETS
//
////////////////////////////////////////////////////////////////

state TURRET_START
{
//	legs
//	{
//		xsxxx_idle : default
//	}
	
	states
	{
		TURRET_START_CROUCHING		: IS_WEAPON_ACTIVE "mainhand" "US M2 60MM Mortar"
		TURRET_START_CROUCHING		: IS_WEAPON_ACTIVE "mainhand" "M99 81mm Mortar"
		TURRET_START_STANDING		: default

//		TURRET_USING			: ANIMDONE_LEGS
	}
}

state TURRET_START_STANDING
{
	entrycommands
	{
		modheight "stand"
		movementstealth "1.0"
		moveposflags "standing"
	}

	states
	{
		TURRET_IDLE : default
	}
}

state TURRET_START_CROUCHING
{
	entrycommands
	{
		modheight "duck"
		movementstealth "1.25"
		moveposflags "crouching"
	}

	states
	{
		TURRET_IDLE : default
	}
}

state TURRET_START_PRONE
{
	entrycommands
	{
		modheight "duck"
		movementstealth "1.25"
		moveposflags "crouching"
	}

	states
	{
		TURRET_IDLE : default
	}
}

state TURRET_IDLE
{
	legs
	{
		mxcxx_MW_Morter_Idle	: IS_WEAPON_ACTIVE "mainhand" "US M2 60MM Mortar"
		mxcxx_MW_Morter_Idle	: IS_WEAPON_ACTIVE "mainhand" "M99 81mm Mortar"
		mxsxx_MW_Mounted_Idle	: default
	}

	states
	{
		STAND			: !IS_USING_TURRET

		TURRET_WALKING_LEFT	: LEFT !IS_WEAPON_ACTIVE "mainhand" "US M2 60MM Mortar" !IS_WEAPON_ACTIVE "mainhand" "M99 81mm Mortar"
		TURRET_WALKING_RIGHT	: RIGHT !IS_WEAPON_ACTIVE "mainhand" "US M2 60MM Mortar" !IS_WEAPON_ACTIVE "mainhand" "M99 81mm Mortar"
	}
}

state TURRET_WALKING_LEFT
{
	legs
	{
		mxsxx_MW_Mounted_Left	: default
	}

	states
	{
		STAND					: !IS_USING_TURRET

		TURRET_IDLE				: !LEFT !RIGHT
		TURRET_WALKING_RIGHT	: RIGHT
	}
}

state TURRET_WALKING_RIGHT
{
	legs
	{
		mxsxx_MW_Mounted_Right	: default
	}

	states
	{
		STAND					: !IS_USING_TURRET

		TURRET_IDLE				: !LEFT !RIGHT
		TURRET_WALKING_LEFT		: LEFT
	}
}

//state TURRET_USING
//{
//	legs
//	{
//		xsxxx_idle : default
//	}
//	
//	states
//	{
//		STAND : !IS_USING_TURRET
//	}
//}

////////////////////////////////////////////////////////////////
//
// Prone
//
////////////////////////////////////////////////////////////////

// this state is called to notify the player that he can't duck
state PRONE_DENIED
{
	entrycommands
	{
		msguser "Slugline:CantProneUnderWater"
//		iprint "Can't prone under water"
	}
	
	states
	{
		CROUCH_IDLE	: !DUCKED_VIEW_IN_WATER
		STAND		: DUCKED_VIEW_IN_WATER
	}
}

state PRONE_IDLE
{
	entrycommands
	{
		modheight "prone"
		movementstealth "1.25"
		moveposflags "prone"				
	}
	
	legs
	{		
		mxpxi_Carry_Prone_Idle			: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxpxi_Carry_Prone_Idle			: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxpxi_Carry_Prone_Idle			: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxpxi_Carry_Prone_Idle			: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxpxi_CS_Prone_Idle				: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxpxi_CS_Prone_Idle				: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxpxi_CS_Prone_Idle				: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxpxi_CS_Prone_Idle				: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxpxi_CS_Prone_Idle				: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxpxi_CS_Prone_Idle				: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmpxi_aim_idle					: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrpai_Aim_Idle					: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mppai_aim_idle					: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmpxi_aim_idle					: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmpxi_aim_idle					: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgpxi_Prone_Idle				: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mupxi_Prone_Idle				: default		//unarmed
	}

	states
	{
		FALL_DUCKED				: FALLING

		TURRET_START			: IS_USING_TURRET !HAS_WEAPON

		CROUCH_IDLE				: JUMP CHECK_HEIGHT "stand" !FORCED_PRONE
		CROUCH_IDLE				: INSTANT_CROUCH CHECK_HEIGHT "stand" !FORCED_PRONE
		CROUCH_IDLE				: VIEW_IN_WATER CHECK_HEIGHT "duck" !FORCED_PRONE
		CROUCH_IDLE				: FORCED_CROUCH
		CROUCH_IDLE				: FORCED_STAND 
		CROUCH_IDLE				: PRONE_VIEW_IN_WATER !FORCED_PRONE

		PRONE_TO_STAND				: +STAND CHECK_HEIGHT "stand" !FORCED_PRONE
	
		PRONE_WALK_FORWARD		: FORWARD HAS_VELOCITY !BLOCKED "2" !PRONE_VIEW_IN_WATER
		PRONE_WALK_BACKWARD		: BACKWARD HAS_VELOCITY !BLOCKED "2" !PRONE_VIEW_IN_WATER
		PRONE_WALK_LEFT			: STRAFE_LEFT HAS_VELOCITY !BLOCKED "2" !FORWARD !BACKWARD
		PRONE_WALK_RIGHT		: STRAFE_RIGHT HAS_VELOCITY !BLOCKED "2" !FORWARD !BACKWARD
//		PRONE_ROLL_LEFT			: LEAN_LEFT !BLOCKED "2" !PRONE_VIEW_IN_WATER
//		PRONE_ROLL_RIGHT		: LEAN_RIGHT !BLOCKED "2" !PRONE_VIEW_IN_WATER
			
		// restart if our weapon has changed
		PRONE_IDLE				: +HAS_WEAPON
		PRONE_IDLE				: -HAS_WEAPON
	}
}

state PRONE_DIVE
{
	entrycommands
	{
		dive 52		
		modheight "prone"
		moveposflags "prone"
	}
	
	exitcommands
	{	
	}
	
	legs
	{	
		xxsxx_dive_forward				: POSITION_TYPE "standing"
		xxcxx_dive_forward				: POSITION_TYPE "crouching"
		xxpxx_dive					: default			
	}

	states
	{
		PRONE_IDLE				: IN_LEGS_STATE_TIME "0.8"
	}
}

state PRONE_DIVE_ROLL_LEFT
{
	entrycommands
	{
		dive 52		
		modheight "prone"
		moveposflags "prone"
	}
	
	exitcommands
	{	
	}
	
	legs
	{				
		xxsxx_dive_left				: POSITION_TYPE "standing"
		xxcxx_dive_left				: POSITION_TYPE "crouching"
		xxpxx_dive				: default			
	}

	states
	{
	//	PRONE_ROLL_LEFT			: ONGROUND ANIMDONE_LEGS
		PRONE_IDLE				: IN_LEGS_STATE_TIME "0.8"
	}
}

state PRONE_DIVE_ROLL_RIGHT
{
	entrycommands
	{
		dive 52
		modheight "prone"
		moveposflags "prone"
	}
	
	exitcommands
	{	
	}
	
	legs
	{				
		xxsxx_dive_right			: POSITION_TYPE "standing"
		xxcxx_dive_right			: POSITION_TYPE "crouching"
		xxpxx_dive				: default				
	}

	states
	{
	//	PRONE_ROLL_RIGHT		: ONGROUND ANIMDONE_LEGS
		PRONE_IDLE				: IN_LEGS_STATE_TIME "0.8"
	}
}

state PRONE_TO_STAND
{
	entrycommands
	{
		modheight "stand"
		movementstealth "1.0"
		moveposflags "standing"
	}
	
	exitcommands
	{
	}
	
	legs
	{
		xxrpxx_prone_to_stand				: default
	}
	
	states
	{
		STAND				: default
	}
}

state PRONE_WALK_FORWARD
{
	entrycommands
	{
		modheight "prone"
		movementstealth "1.0"
		moveposflags "prone" "walking"
	}
	legs
	{
		mxpxf_Carry_Prone_forward		: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxpxf_Carry_Prone_forward		: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxpxf_Carry_Prone_forward		: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxpxf_Carry_Prone_forward		: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxpxf_CS_Prone_Forward			: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxpxf_CS_Prone_Forward			: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxpxf_CS_Prone_Forward			: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxpxf_CS_Prone_Forward			: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxpxf_CS_Prone_Forward			: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxpxf_CS_Prone_Forward			: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mrpxf_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mppxf_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmpxf_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmpxf_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgpxf_Prone_Forward				: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mupxf_Prone_Forward				: default		//unarmed
	}

	states
	{
	
//		STAND					: +PRONE CHECK_HEIGHT "prone" !FORCED_PRONE
		PRONE_TO_STAND				: +STAND CHECK_HEIGHT "stand" !FORCED_PRONE

		CROUCH_IDLE				: -JUMP CHECK_HEIGHT "duck" !FORCED_PRONE
		CROUCH_IDLE				: -INSTANT_CROUCH CHECK_HEIGHT "duck" !FORCED_PRONE
		CROUCH_IDLE				: VIEW_IN_WATER CHECK_HEIGHT "duck" !FORCED_PRONE
		CROUCH_IDLE				: FORCED_CROUCH
		CROUCH_IDLE				: FORCED_STAND
								
		PRONE_IDLE				: !HAS_VELOCITY
		PRONE_IDLE				: BLOCKED "2"
		PRONE_IDLE				: ANIMDONE_LEGS
									
		PRONE_WALK_BACKWARD		: BACKWARD HAS_VELOCITY !BLOCKED "2"
		PRONE_WALK_LEFT			: STRAFE_LEFT HAS_VELOCITY !BLOCKED "2" !FORWARD !BACKWARD
		PRONE_WALK_RIGHT		: STRAFE_RIGHT HAS_VELOCITY !BLOCKED "2" !FORWARD !BACKWARD
		
		// restart if our weapon has changed
		PRONE_WALK_FORWARD		: +HAS_WEAPON
		PRONE_WALK_FORWARD		: -HAS_WEAPON
			
	}
}

state PRONE_WALK_BACKWARD
{
	entrycommands
	{
		modheight "prone"
		movementstealth "1.0"
		moveposflags "prone" "walking"
	}
	legs
	{
		mxpxb_Carry_Prone_Backward		: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxpxb_Carry_Prone_Backward		: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxpxb_Carry_Prone_Backward		: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxpxb_Carry_Prone_Backward		: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxpxb_CS_Prone_Backward			: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxpxb_CS_Prone_Backward			: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxpxb_CS_Prone_Backward			: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxpxb_CS_Prone_Backward			: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxpxb_CS_Prone_Backward			: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxpxb_CS_Prone_Backward			: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mrpxb_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mppxb_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmpxb_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmpxb_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgpxb_Prone_Backward			: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mupxb_Prone_Backward			: default		//unarmed
	}

	states
	{
		FALL_DUCKED				: FALLING

//		STAND					: +PRONE CHECK_HEIGHT "prone" !FORCED_PRONE
		PRONE_TO_STAND				: +STAND CHECK_HEIGHT "stand" !FORCED_PRONE

		CROUCH_IDLE				: -JUMP CHECK_HEIGHT "duck" !FORCED_PRONE
		CROUCH_IDLE				: -INSTANT_CROUCH CHECK_HEIGHT "duck" !FORCED_PRONE
		CROUCH_IDLE				: VIEW_IN_WATER CHECK_HEIGHT "duck" !FORCED_PRONE
		CROUCH_IDLE				: FORCED_CROUCH
		CROUCH_IDLE				: FORCED_STAND
	
		PRONE_IDLE				: !HAS_VELOCITY
		PRONE_IDLE				: BLOCKED "2"
		PRONE_IDLE				: ANIMDONE_LEGS
		
//		STAND					: +PRONE CHECK_HEIGHT "prone"
		
		PRONE_WALK_FORWARD		: FORWARD HAS_VELOCITY !BLOCKED "2"
		PRONE_WALK_LEFT			: STRAFE_LEFT HAS_VELOCITY !BLOCKED "2" !FORWARD !BACKWARD
		PRONE_WALK_RIGHT		: STRAFE_RIGHT HAS_VELOCITY !BLOCKED "2" !FORWARD !BACKWARD
		
		// restart if our weapon has changed
		PRONE_WALK_BACKWARD		: +HAS_WEAPON
		PRONE_WALK_BACKWARD		: -HAS_WEAPON
		
		
	}
}

state PRONE_WALK_LEFT
{
	entrycommands
	{
		modheight "prone"
		movementstealth "1.0"
		moveposflags "prone" "walking"
	}
	legs
	{
		mxpxl_Carry_Prone_Left			: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxpxl_Carry_Prone_Left			: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxpxl_Carry_Prone_Left			: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxpxl_Carry_Prone_Left			: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxpxl_CS_Prone_Left				: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxpxl_CS_Prone_Left				: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxpxl_CS_Prone_Left				: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxpxl_CS_Prone_Left				: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxpxl_CS_Prone_Left				: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxpxl_CS_Prone_Left				: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mrpxl_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mppxl_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmpxl_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmpxl_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgpxl_Prone_Left				: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mupxl_Prone_Left				: default		//unarmed
	}

	states
	{
		FALL_DUCKED				: FALLING

//		STAND					: +PRONE CHECK_HEIGHT "prone" !FORCED_PRONE
		PRONE_TO_STAND				: +STAND CHECK_HEIGHT "stand" !FORCED_PRONE

		CROUCH_IDLE				: -JUMP CHECK_HEIGHT "duck" !FORCED_PRONE
		CROUCH_IDLE				: -INSTANT_CROUCH CHECK_HEIGHT "duck" !FORCED_PRONE
		CROUCH_IDLE				: VIEW_IN_WATER CHECK_HEIGHT "duck" !FORCED_PRONE
		CROUCH_IDLE				: FORCED_CROUCH
		CROUCH_IDLE				: FORCED_STAND

		PRONE_IDLE				: !HAS_VELOCITY
		PRONE_IDLE				: BLOCKED "2"
	//	PRONE_IDLE				: ANIMDONE_LEGS
			
		PRONE_WALK_FORWARD		: FORWARD HAS_VELOCITY !BLOCKED "2" 
		PRONE_WALK_BACKWARD		: BACKWARD HAS_VELOCITY !BLOCKED "2"
		PRONE_WALK_RIGHT		: STRAFE_RIGHT HAS_VELOCITY !BLOCKED "2" !FORWARD !BACKWARD
				
		// restart if our weapon has changed
		PRONE_WALK_LEFT		: +HAS_WEAPON
		PRONE_WALK_LEFT		: -HAS_WEAPON
	
		
	}
}

state PRONE_WALK_RIGHT
{
	entrycommands
	{
		modheight "prone"
		movementstealth "1.0"
		moveposflags "prone" "walking"
	}
	legs
	{
		mxpxr_Carry_Prone_Right			: IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"
		mxpxr_Carry_Prone_Right			: IS_WEAPON_ACTIVE "mainhand" "Packed US Boys .55"
		mxpxr_Carry_Prone_Right			: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		mxpxr_Carry_Prone_Right			: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"

		mxpxr_CS_Prone_Right			: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxpxr_CS_Prone_Right			: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxpxr_CS_Prone_Right			: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxpxr_CS_Prone_Right			: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxpxr_CS_Prone_Right			: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxpxr_CS_Prone_Right			: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mrpxr_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mppxr_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmpxr_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmpxr_crawl						: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgpxr_Prone_Right				: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mupxr_Prone_Right				: default		//unarmed
	}

	states
	{
		FALL_DUCKED				: FALLING

//		STAND					: +PRONE CHECK_HEIGHT "prone" !FORCED_PRONE
		PRONE_TO_STAND				: +STAND CHECK_HEIGHT "stand" !FORCED_PRONE

		CROUCH_IDLE				: -JUMP CHECK_HEIGHT "duck" !FORCED_PRONE
		CROUCH_IDLE				: -INSTANT_CROUCH CHECK_HEIGHT "duck" !FORCED_PRONE
		CROUCH_IDLE				: VIEW_IN_WATER CHECK_HEIGHT "duck" !FORCED_PRONE
		CROUCH_IDLE				: FORCED_CROUCH
		CROUCH_IDLE				: FORCED_STAND

		PRONE_IDLE				: !HAS_VELOCITY
		PRONE_IDLE				: BLOCKED "2"
	//	PRONE_IDLE				: ANIMDONE_LEGS
		
		PRONE_WALK_FORWARD		: FORWARD HAS_VELOCITY !BLOCKED "2"
		PRONE_WALK_BACKWARD		: BACKWARD HAS_VELOCITY !BLOCKED "2"
		PRONE_WALK_LEFT			: STRAFE_LEFT HAS_VELOCITY !BLOCKED "2" !FORWARD !BACKWARD
		
		// restart if our weapon has changed
		PRONE_WALK_RIGHT		: +HAS_WEAPON
		PRONE_WALK_RIGHT		: -HAS_WEAPON
		
		
	}
}

state PRONE_ROLL_LEFT
{
	entrycommands
	{
		modheight "prone"
		movementstealth "1.0"
		moveposflags "prone" "walking"
		setanimatedview 1
		viewmodelanim prone_roll_left
		forcetorsostate "NO_ANIMATION"
		begin_listen_anim_complete
	}

	exitcommands
	{
		setanimatedview 0
		forcetorsostate "STAND"
	}
	
	legs
	{
		mgpxl_Roll						: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mrpxl_roll						: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mppxl_roll						: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmpxl_roll						: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmpxl_roll						: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgpxl_Roll						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mupxl_Roll						: default		//unarmed
	}

	states
	{
		// Animation must report when appropriate
		PRONE_IDLE				: ANIM_LISTEN_COMPLETE  !LEAN_LEFT 
	}
}

state PRONE_ROLL_RIGHT
{
	entrycommands
	{
		modheight "prone"
		movementstealth "1.0"
		moveposflags "prone" "walking"
		setanimatedview 1
		viewmodelanim prone_roll_right
		forcetorsostate "NO_ANIMATION"
		begin_listen_anim_complete
	}

	exitcommands
	{
		setanimatedview 0
		forcetorsostate "STAND"
	}
	
	legs
	{
		mgpxr_Roll						: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mrpxr_roll						: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mppxr_roll						: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmpxr_roll						: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmpxr_roll						: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgpxr_Roll						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mupxr_Roll						: default		//unarmed
	}

	states
	{
		// Animation must report when appropriate
		PRONE_IDLE				: ANIM_LISTEN_COMPLETE !LEAN_RIGHT 
	}
}

