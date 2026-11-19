	// =======================================================	//
	// Action state machine for the MOHPA Player character		//
	// =======================================================	//

// The action state machine takes care of
// a) all torso-only animations which are layer on top of leg animations
// b) most full-body animations
// c) which states are to take their full-body animations from the leg state
//    machine.
// The states which control only torso animations have "movetype legs" and 
// animations under the token "action".  This allows the leg state to continue
// controlling the leg animations.  The states which control the whole body have
// movetype not legs and animations under the token "action". This overrides the
// leg state machine. States such as STAND, below, which have "none" specified
// as the torso animation, take the torso animation from the leg animaiton
// specified in the legs state machine.

//==============================================================================
//==============================================================================
//
// Stand (really means not doing an action)
//
//==============================================================================

state STAND
{
	movetype legs

	camera behind

	entrycommands
	{
		viewmodelanim idle
	}
	
	action
	{
		none : default // no torso animation
	}

	states
	{
		VERGE_OF_DEATH_START : DOING_VERGEOFDEATH
		KILLED				: KILLED
		KILLED				: INCAPACITATED

		//VEHICLE_START			: IS_USING_VEHICLE
		TURRET_START			: IS_USING_TURRET

		RAILCAR_FORWARD			: ON_RAILCAR_FORWARD
		RAILCAR_BACKWARD		: ON_RAILCAR_BACKWARD
		
		// if we're on a ladder, make sure we're climbing the ladder
		LADDER_IDLE_LEFT			: ON_LADDER !IS_USING_VEHICLE
	
		// Using objects is dictated by the object being used.  The three objects 
		// here are for objects which trigger interactive actions when touched, 
		// for objects which the player uses (such as doors), and for when the 
		// player tries to use an object that is not usable.
		USE_LADDER				: ONGROUND +USE AT_LADDER CHECK_HEIGHT "stand" !IS_USING_VEHICLE !LADEN
		// latch onto ladder in mid-air
		USE_LADDER				: +USE AT_LADDER CHECK_HEIGHT "stand" !IS_USING_VEHICLE !LADEN // can also latch onto a ladder in mid-air
		// auto use of ladder when at the bottom (AT_LADDER check is last because it does a trace)
		USE_LADDER				: ONGROUND FORWARD LOOKING_UP "35" !PUTAWAYMAIN !NEW_WEAPON !RELOAD !ATTACK_PRIMARY !ATTACK_SECONDARY AT_LADDER CHECK_HEIGHT "stand" !IS_USING_VEHICLE !LADEN
		// auto use of ladder when at the top (AT_LADDER check is last because it does a trace)
		USE_LADDER				: ONGROUND FORWARD !LOOKING_UP "-35" !PUTAWAYMAIN !NEW_WEAPON !RELOAD !ATTACK_PRIMARY !ATTACK_SECONDARY AT_LADDER CHECK_HEIGHT "stand" !IS_USING_VEHICLE !LADEN

		// Using objects is dictated by the object being used.  The three objects
		// here are for objects which trigger interactive actions when touched,
		// for objects which the player uses (such as doors), and for when the
		// player tries to use an object that is not usable.
//		USE_USEANIM				: ONGROUND TOUCHEDUSEANIM
//		USE_USEANIM				: ONGROUND USE AT_USEANIM
//		GENERIC_USE				: ONGROUND +USE

		// This is not functional for the prototype, but is here as a placeholder for
		// future functionality.
		// While the player can only fire weapons with his right hand, he can switch them 
		// to his left if he wants to use an item with his left.  Gameplay-wise, this should 
		// be the same as putting the weapon away, but it will create a nice graphical "cool 
		// factor" which is always good in computer games.
		// When we have two items out, the game code will flag them both as putaway, and we 
		// need to put the right one away first, followed by the left.
		PUTAWAY_MAIN			: PUTAWAYMAIN	// Basic put weapon away move.
		RAISE_WEAPON			: NEW_WEAPON

		RELOAD_WEAPON			: RELOAD HAS_AMMO "mainhand"
		PUTAWAY_MAIN			: RELOAD IS_WEAPONCLASS_ACTIVE "mainhand" "grenade" !HAS_AMMO "mainhand"

		AIM_PULLOUT						: IS_WEAPON_READY_TO_FIRE "mainhand" "binoculars" BINOCULAR_AIM
		CHECK_PRIMARY_ATTACK_SEMIAUTO	: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" !IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		CHECK_PRIMARY_ATTACK_FULLAUTO	: ATTACK_PRIMARY !IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPON_READY_TO_FIRE "mainhand" !IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		CHECK_SECONDARY_ATTACK			: +ATTACK_SECONDARY !POSITION_TYPE "prone" !IS_WEAPON_ACTIVE "mainhand" "binoculars"  !IS_WEAPON_ACTIVE "mainhand" "corpsman bag" !IS_WEAPON_ACTIVE "mainhand" "Landmine"  !IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"  !IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"  !IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"

		// Note:  With corpsman pack, player primary attack goes with weapon secondary,
		//				and player secondary goes with weapon primary.
		//				This is currently what is intended.  Please do not change this.
		ATTACK_MEDIC_POUCH_HEAL_SELF		: +ATTACK_PRIMARY IS_WEAPON_READY_TO_FIRE "mainhand" "corpsman bag" "secondary"
		ATTACK_MEDIC_POUCH_HEAL_OTHER		: +ATTACK_SECONDARY IS_WEAPON_READY_TO_FIRE "mainhand" "corpsman bag" "primary"

		// Ammo satchel secondary fire
		ATTACK_AMMOBOX_SECONDARY			: +ATTACK_SECONDARY !POSITION_TYPE "prone" IS_WEAPON_READY_TO_FIRE "mainhand" "Ammo Satchel" "secondary"

		// check for needing to restart the STAND state so that we can select a different 
		// viewmodel anim (part of the viewmodel idle anim setting code)
		STAND				: +CHECK_MOVEMENT_SPEED "mainhand"
		STAND				: -CHECK_MOVEMENT_SPEED "mainhand"

		// Go into AIM mode
		AIM_PULLOUT			: AIM !LADEN
		
		// Rest
		REST				: !DM_ACTIVE ALL_IDLE !IS_USING_VEHICLE

		// Note about "DM_ACTIVE" condition:
		//		Admittedly this pretty much amounts to a sort of "ifdef strategy".
		//		However, they are only here to ease the going-live transition
		//		and to minimize either side jeopardizing the other side's Alpha.
		//		The DM_ACTIVE checks are mainly around areas that are still being
		//		tweaked, or are currently problem cases, sync-wise.
		//		Obviously, and ideally in the long run, we hope not to have any
		//		of these "cheater checks", and just be using all the same exact anims
		//		in Single Player as we use in MP.
	}
}

// REST
// Carrying weapon in idle position
///////////////////////////////////////////

state REST
{
	movetype legs

	entrycommands
	{
		viewmodelanim rest
	}

	action
	{	
		mgcxi_Idle : !RUN POSITION_TYPE "standing" IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mgpxi_Idle : POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"	
		mgcxi_Idle : POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mgsxi_Idle : IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		
		mrcai_Aim_Idle : !RUN POSITION_TYPE "standing" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mrpai_Aim_Idle : POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"	
		mrcai_Aim_Idle : POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mrsai_Aim_Idle : IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
				
		mmcai_Aim_Idle : !RUN POSITION_TYPE "standing"			
		mmpxi_Aim_Idle : POSITION_TYPE "prone"	
		mmcai_Aim_Idle : POSITION_TYPE "crouching"
		mmsai_Aim_Idle : default	 	 				
	} 

	states
	{
		KILLED				: KILLED
		KILLED				: INCAPACITATED

		//VEHICLE_START			: IS_USING_VEHICLE
		TURRET_START			: IS_USING_TURRET

		UNREST				: PUTAWAYMAIN
		UNREST				: NEW_WEAPON

		UNREST				: RELOAD
	
		CHECK_PRIMARY_ATTACK_SEMIAUTO	: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" !IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		CHECK_PRIMARY_ATTACK_FULLAUTO	: ATTACK_PRIMARY !IS_WEAPON_SEMIAUTO "mainhand" !IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		CHECK_SECONDARY_ATTACK			: +ATTACK_SECONDARY !POSITION_TYPE "prone" !IS_WEAPON_ACTIVE "mainhand" "corpsman bag"

		UNREST				: AIM
		
		UNREST				: !ALL_IDLE
	}
}

// UNREST
// Stop carrying weapon in idle position
///////////////////////////////////////////

state UNREST
{
	movetype legs

	entrycommands
	{
		viewmodelanim unrest
	}

	action
	{
		mgcxi_Idle : !RUN POSITION_TYPE "standing" IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mgpxi_Idle : POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"	
		mgcxi_Idle : POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mgsxi_Idle : IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		
		mrcai_Aim_Idle : !RUN POSITION_TYPE "standing" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mrpai_Aim_Idle : POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"	
		mrcai_Aim_Idle : POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mrsai_Aim_Idle : IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
				
		mmcai_Aim_Idle : !RUN POSITION_TYPE "standing"			
		mmpxi_Aim_Idle : POSITION_TYPE "prone"	
		mmcai_Aim_Idle : POSITION_TYPE "crouching"
		mmsai_Aim_Idle : default		 				
	} 

	states
	{
		STAND					: KILLED
		STAND					: INCAPACITATED
		STAND					: ANIMDONE_TORSO	
	}
}

///////////////////////////////////////////
// AIM STATES
///////////////////////////////////////////

// AIM_PULLOUT 
// This is the state executed when the player first sets AIM mode, it raises the weapon up to the
// player's eyes
///////////////////////////////////////////

state AIM_PULLOUT
{
	movetype legs

	entrycommands
	{
		viewmodelanim aim_pullout
		aimadjustfov 1
	}

	action
	{
		// Single Player

		binoculars_aim_pullout			: !DM_ACTIVE IS_WEAPON_ACTIVE "mainhand" "binoculars"

		// Multiplayer

		// No visible external difference between iron-sights and normal in multiplayer

		// prone

		mxpxi_CS_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxpxi_CS_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxpxi_CS_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxpxi_CS_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxpxi_CS_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxpxi_CS_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmpai_Aimmode_Pullout			: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmpai_Aimmode_Heavy_Pullout		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "BAR"
		mmpai_Aimmode_Heavy_Pullout		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"
		mrpai_Aimmode_Pullout			: POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mppai_Aimmode_Pullout			: POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmpai_Aimmode_Pullout			: POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmpai_Aimmode_Pullout			: POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgpxi_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mupxi_Prone_Idle				: POSITION_TYPE "prone"

		// crouching

		mxcxi_CS_Idle					: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxcxi_CS_Idle					: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxcxi_CS_Idle					: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxcxi_CS_Idle					: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxcxi_CS_Idle					: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxcxi_CS_Idle					: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmcai_Aimmode_Pullout			: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmcai_Aimmode_Heavy_Pullout		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "BAR"
		mmcai_Aimmode_Heavy_Pullout		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"
		mrcai_Aimmode_Pullout			: POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpcai_Aimmode_Pullout			: POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmcai_Aimmode_Pullout			: POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmcai_Aimmode_Pullout			: POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgcxi_Idle						: POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mucxi_Crouch_Idle				: POSITION_TYPE "crouching"

		// standing

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

		mmsai_SneakWalk_Aimmode_Pullout	: !RUN IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mpsai_SneakWalk_Aimmode_Pullout	: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mgsai_SneakWalk_Idle			: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mmsai_SneakWalk_Aimmode_Pullout	: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsai_SneakWalk_Aimmode_Pullout	: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mmsai_SneakWalk_Aimmode_Heavy_Pullout	: !RUN IS_WEAPON_ACTIVE "mainhand" "BAR"
		mmsai_SneakWalk_Aimmode_Heavy_Pullout	: !RUN IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"
		mrsai_SneakWalk_Aimmode_Pullout	: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		musai_SneakWalk_Idle			: !RUN

		mmsai_Aimmode_Pullout			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmsai_Aimmode_Heavy_Pullout		: IS_WEAPON_ACTIVE "mainhand" "BAR"
		mmsai_Aimmode_Heavy_Pullout		: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"
		mrsai_Aimmode_Pullout			: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpsai_Aimmode_Pullout			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmsai_Aimmode_Pullout			: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsai_Aimmode_Pullout			: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgsxi_Idle						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		musxi_Stand_Idle				: default		//unarmed
	}
	
	states
	{			
		AIM_PUTAWAY			: +AIM !IS_WEAPON_ACTIVE "mainhand" "binoculars"

		AIM_IDLE_STAND		: ANIMDONE_TORSO ONGROUND POSITION_TYPE "standing"
		AIM_IDLE_CROUCH		: ANIMDONE_TORSO ONGROUND POSITION_TYPE "crouching"
		AIM_IDLE_PRONE		: ANIMDONE_TORSO !PRONE ONGROUND POSITION_TYPE "prone"
	}	
}

// AIM_PUTAWAY
// Returns from AIM mode to the normal weapon position
///////////////////////////////////////////

state AIM_PUTAWAY
{
	movetype legs

	entrycommands
	{
		viewmodelanim aim_putaway
		aimadjustfov 0
	}

	action
	{			
		// Single Player

		binoculars_aim_putaway			: !DM_ACTIVE IS_WEAPON_ACTIVE "mainhand" "binoculars"

		// Multiplayer

		// No visible external difference between iron-sights and normal in multiplayer

		// prone

		mxpxi_CS_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxpxi_CS_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxpxi_CS_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxpxi_CS_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxpxi_CS_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxpxi_CS_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"
		
		mmpai_Aimmode_Putaway			: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmpai_Aimmode_Heavy_Putaway		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "BAR"
		mmpai_Aimmode_Heavy_Putaway		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"
		mrpai_Aimmode_Putaway			: POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mppai_Aimmode_Putaway			: POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmpai_Aimmode_Putaway			: POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmpai_Aimmode_Putaway			: POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgpxi_Prone_Idle				: POSITION_TYPE "prone" IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mupxi_Prone_Idle				: POSITION_TYPE "prone"

		// crouching

		mxcxi_CS_Idle					: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxcxi_CS_Idle					: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxcxi_CS_Idle					: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxcxi_CS_Idle					: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxcxi_CS_Idle					: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxcxi_CS_Idle					: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmcai_Aimmode_Putaway			: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmcai_Aimmode_Heavy_Putaway		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "BAR"
		mmcai_Aimmode_Heavy_Putaway		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"		
		mrcai_Aimmode_Putaway			: POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpcai_Aimmode_Putaway			: POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmcai_Aimmode_Putaway			: POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmcai_Aimmode_Putaway			: POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgcxi_Idle						: POSITION_TYPE "crouching" IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mucxi_Crouch_Idle				: POSITION_TYPE "crouching"

		// standing

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

		mmsai_SneakWalk_Aimmode_Putaway	: !RUN IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mpsai_SneakWalk_Aimmode_Putaway	: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mgsai_SneakWalk_Idle			: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mmsai_SneakWalk_Aimmode_Putaway	: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsai_SneakWalk_Aimmode_Putaway	: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mmsai_SneakWalk_Aimmode_Heavy_Putaway	: !RUN IS_WEAPON_ACTIVE "mainhand" "BAR"
		mmsai_SneakWalk_Aimmode_Heavy_Putaway	: !RUN IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"		
		mrsai_SneakWalk_Aimmode_Putaway	: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		musai_SneakWalk_Idle			: !RUN

		mmsai_Aimmode_Putaway			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmsai_Aimmode_Heavy_Putaway		: IS_WEAPON_ACTIVE "mainhand" "BAR"
		mmsai_Aimmode_Heavy_Putaway		: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"
		mrsai_Aimmode_Putaway			: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpsai_Aimmode_Putaway			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmsai_Aimmode_Putaway			: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsai_Aimmode_Putaway			: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgsxi_Idle						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		musxi_Stand_Idle				: default		//unarmed
	} 

	states
	{
		STAND					: KILLED
		STAND					: INCAPACITATED
	
		STAND					: ANIMDONE_TORSO NEW_WEAPON
		STAND					: ANIMDONE_TORSO RELOAD
		STAND					: ANIMDONE_TORSO
	}
}

// AIM_IDLE_STAND
// This is the player state when he is standing idle in AIM mode
///////////////////////////////////////////

state AIM_IDLE_STAND
{
	movetype legs

	entrycommands
	{
		viewmodelanim	aim_idle
		modheight	"stand"	
		moveposflags	"stand"		
	}
	
	exitcommands
	{
	}

	action
	{
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

		mmsai_SneakWalk_Aimmode_Idle	: !RUN IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mpsai_SneakWalk_Aimmode_Idle	: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mgsai_SneakWalk_Idle			: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mmsxi_SneakWalk_Aimmode_Idle	: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsxi_SneakWalk_Aimmode_Idle	: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mrsai_SneakWalk_Aimmode_Idle	: !RUN IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		musai_SneakWalk_Idle			: !RUN

		mmsai_Aimmode_Idle				: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrsai_Aimmode_Idle				: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpsai_Aimmode_Idle				: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmsai_Aimmode_Idle				: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmsai_Aimmode_Idle				: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgsxi_Idle						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		musxi_Stand_Idle				: default		//unarmed
	}

	states
	{
		STAND					: KILLED
		STAND					: INCAPACITATED
		
		AIM_BINOCULARS_IDLE		: IS_WEAPON_ACTIVE "mainhand" "binoculars" BINOCULAR_AIM
		AIM_PUTAWAY				: NEW_WEAPON
		AIM_PUTAWAY				: RELOAD		
		AIM_PUTAWAY				: !AIM		

		// Full Automatics
		CHECK_AIM_FIRE_FULL_AUTO		:  ATTACK_PRIMARY !IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "rifle"
		CHECK_AIM_FIRE_FULL_AUTO		:  ATTACK_PRIMARY !IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "smg"				
	    CHECK_AIM_FIRE_FULL_AUTO		:  ATTACK_PRIMARY !IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "mg"				
		
		// Semi Automatics
		CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
	    CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
	    CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "shotgun"
	    
		AIM_IDLE_CROUCH					: ONGROUND POSITION_TYPE "crouching"
		AIM_IDLE_PRONE					: !PRONE ONGROUND POSITION_TYPE "prone"
		
		AIM_TO_MELEE					: +ATTACK_SECONDARY !POSITION_TYPE "prone" !IS_WEAPON_ACTIVE "mainhand" "binoculars"  !IS_WEAPON_ACTIVE "mainhand" "corpsman bag" !IS_WEAPON_ACTIVE "mainhand" "Landmine"  !IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"  !IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"  !IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
	}
}

state AIM_TO_MELEE
{
	entrycommands
	{
			aimadjustfov 0
			aimoff
	}
	
	states
	{
		CHECK_SECONDARY_ATTACK : default			
	}
}


// AIM_IDLE_CROUCH
// This is the player state when he is crouching idle in AIM mode
///////////////////////////////////////////

state AIM_IDLE_CROUCH
{
	movetype legs

	entrycommands
	{
		viewmodelanim aim_idle
		modheight "crouch"		
		moveposflags "crouching"
	}
	
	action
	{
		mxcxi_CS_Idle					: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxcxi_CS_Idle					: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxcxi_CS_Idle					: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxcxi_CS_Idle					: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxcxi_CS_Idle					: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxcxi_CS_Idle					: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mmcai_Aimmode_Idle				: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mrcai_Aimmode_Idle				: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mpcai_Aimmode_Idle				: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmcai_Aimmode_Idle				: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmcai_Aimmode_Idle				: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgcxi_Idle						: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mucxi_Crouch_Idle				: default		//unarmed
	}

	states
	{
		STAND					: KILLED	
		STAND					: INCAPACITATED
		AIM_BINOCULARS_IDLE		: IS_WEAPON_ACTIVE "mainhand" "binoculars" BINOCULAR_AIM
		AIM_PUTAWAY				: NEW_WEAPON
		AIM_PUTAWAY				: RELOAD
		
		AIM_PUTAWAY				: !AIM					


		// Full Automatics
		CHECK_AIM_FIRE_FULL_AUTO		:  ATTACK_PRIMARY !IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "rifle"
		CHECK_AIM_FIRE_FULL_AUTO		:  ATTACK_PRIMARY !IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "smg"				
	    CHECK_AIM_FIRE_FULL_AUTO		:  ATTACK_PRIMARY !IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "mg"				
		
		// Semi Automatics
		CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "shotgun"


		AIM_IDLE_STAND					: ONGROUND POSITION_TYPE "standing"
		AIM_IDLE_PRONE					: !PRONE ONGROUND POSITION_TYPE "prone"
		
		AIM_TO_MELEE					: +ATTACK_SECONDARY !POSITION_TYPE "prone" !IS_WEAPON_ACTIVE "mainhand" "binoculars"  !IS_WEAPON_ACTIVE "mainhand" "corpsman bag" !IS_WEAPON_ACTIVE "mainhand" "Landmine"  !IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"  !IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"  !IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
	}
}

// AIM_IDLE_PRONE
// This is the player state when he is prone idle in AIM mode
///////////////////////////////////////////

state AIM_IDLE_PRONE
{
	movetype legs

	entrycommands
	{
		viewmodelanim aim_idle
		modheight "prone"		
		moveposflags "prone"
	}
	
	exitcommands
	{
	}

	action
	{			
		mxpxi_CS_Prone_Idle				: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		mxpxi_CS_Prone_Idle				: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		mxpxi_CS_Prone_Idle				: IS_WEAPON_ACTIVE "mainhand" "Landmine"
		mxpxi_CS_Prone_Idle				: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		mxpxi_CS_Prone_Idle				: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		mxpxi_CS_Prone_Idle				: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mrpai_Aimmode_Idle				: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		mppai_aim_idle					: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		mmpai_Aimmode_Idle				: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		mmpai_Aimmode_Idle				: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		mgpxi_Prone_Idle				: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		mupxi_Prone_Idle				: default		//unarmed
	}

	states
	{
		STAND					: KILLED
		STAND					: INCAPACITATED
		AIM_BINOCULARS_IDLE		: IS_WEAPON_ACTIVE "mainhand" "binoculars" BINOCULAR_AIM
		AIM_PUTAWAY				: NEW_WEAPON
		AIM_PUTAWAY				: RELOAD
		
		AIM_PUTAWAY				: !AIM					


		// Full Automatics
		CHECK_AIM_FIRE_FULL_AUTO		:  ATTACK_PRIMARY !IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "rifle"
		CHECK_AIM_FIRE_FULL_AUTO		:  ATTACK_PRIMARY !IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "smg"				
	    CHECK_AIM_FIRE_FULL_AUTO		:  ATTACK_PRIMARY !IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "mg"
		
		// Semi Automatics
		CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		CHECK_AIM_FIRE_SEMI_AUTO		: +ATTACK_PRIMARY IS_WEAPON_SEMIAUTO "mainhand" IS_WEAPONCLASS_ACTIVE "mainhand" "shotgun"


		AIM_IDLE_STAND					: ONGROUND POSITION_TYPE "standing"
		AIM_IDLE_CROUCH					: ONGROUND POSITION_TYPE "crouching"
	}
}

// CHECK_AIM_FIRE_FULL_AUTO
// Full automatic weapon fire in AIM mode
///////////////////////////////////////////

state CHECK_AIM_FIRE_FULL_AUTO
{
	movetype legs

	action
	{
		none : default // stop torso animation
	}

	states
	{
		AIM_FIRE_FULL_AUTO		: IS_WEAPON_READY_TO_FIRE "mainhand"
	}
}

// AIM_FIRE_FULL_AUTO
// Full automatic weapon fire in AIM mode
///////////////////////////////////////////

state AIM_FIRE_FULL_AUTO
{
	movetype legs

	entrycommands
	{
		viewmodelanim aim_fire 1
	}

	action
	{			
		mmcai_Crouch_Aim_Shoot			: !RUN POSITION_TYPE "standing"
		mmpxi_aim_shoot					: POSITION_TYPE "prone"
		mmcai_Crouch_Aim_Shoot			: POSITION_TYPE "crouching"
		mmsai_Aim_Shoot					: default
	}

	states
	{
		STAND							: KILLED
		STAND							: INCAPACITATED
				
		AIM_IDLE_STAND					:  !ATTACK_PRIMARY POSITION_TYPE "stand" ANIMDONE_TORSO
		AIM_IDLE_STAND					:  !IS_WEAPON_READY_TO_FIRE "mainhand" POSITION_TYPE "stand" ANIMDONE_TORSO
		
		AIM_IDLE_CROUCH					:  !ATTACK_PRIMARY POSITION_TYPE "crouching" ANIMDONE_TORSO
		AIM_IDLE_CROUCH					:  !IS_WEAPON_READY_TO_FIRE "mainhand" POSITION_TYPE "crouching" ANIMDONE_TORSO
		
		AIM_IDLE_PRONE					:  !ATTACK_PRIMARY POSITION_TYPE "prone" ANIMDONE_TORSO
		AIM_IDLE_PRONE					:  !IS_WEAPON_READY_TO_FIRE "mainhand" POSITION_TYPE "prone" ANIMDONE_TORSO
		
		CHECK_AIM_FIRE_FULL_AUTO		: ATTACK_PRIMARY +IS_WEAPON_READY_TO_FIRE "mainhand"
		CHECK_AIM_FIRE_FULL_AUTO		: +ATTACK_PRIMARY IS_WEAPON_READY_TO_FIRE "mainhand"			
	}
}

// CHECK_AIM_FIRE_SEMI_AUTO
// Semi automatic weapon fire in AIM mode
///////////////////////////////////////////

state CHECK_AIM_FIRE_SEMI_AUTO
{
	movetype legs

	action
	{
		none : default // stop torso animation
	}

	states
	{
		//waiting to aim fire semiauto is for semi auto weapons that fire rapidly.  This state captures the player's button press and holds
		//the state until the server allows the weapon to fire.
		WAITING_TO_AIM_FIRE_SEMIAUTO	: !IS_WEAPON_READY_TO_FIRE "mainhand" HAS_AMMO "mainhand" IS_WEAPON_ACTIVE "mainhand" "M1 Carbine"
		WAITING_TO_AIM_FIRE_SEMIAUTO	: !IS_WEAPON_READY_TO_FIRE "mainhand" HAS_AMMO "mainhand" IS_WEAPON_ACTIVE "mainhand" "M1 Garand"		
		WAITING_TO_AIM_FIRE_SEMIAUTO	: !IS_WEAPON_READY_TO_FIRE "mainhand" HAS_AMMO "mainhand" IS_WEAPON_ACTIVE "mainhand" "M1911A1 Colt .45"
		WAITING_TO_AIM_FIRE_SEMIAUTO	: !IS_WEAPON_READY_TO_FIRE "mainhand" HAS_AMMO "mainhand" IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol"
		WAITING_TO_AIM_FIRE_SEMIAUTO	: !IS_WEAPON_READY_TO_FIRE "mainhand" HAS_AMMO "mainhand" IS_WEAPON_ACTIVE "mainhand" "US .45"
		AIM_FIRE_SEMI_AUTO				: IS_WEAPON_READY_TO_FIRE "mainhand"
		
		AIM_IDLE_CROUCH					:  POSITION_TYPE "crouching"
		AIM_IDLE_PRONE					:  POSITION_TYPE "prone"
		AIM_IDLE_STAND					:  default
	}
}

state WAITING_TO_AIM_FIRE_SEMIAUTO
{
	action
	{
		none : default // stop torso animation
	}
	
	states
	{
		STAND					: KILLED
		STAND					: INCAPACITATED
		
		AIM_PUTAWAY				: NEW_WEAPON
		AIM_PUTAWAY				: RELOAD
		
		AIM_PUTAWAY				: !AIM	

		AIM_FIRE_SEMI_AUTO : IS_WEAPON_READY_TO_FIRE "mainhand"
	}
}

// AIM_FIRE_SEMI_AUTO
// Semi automatic weapon fire in AIM mode
///////////////////////////////////////////

state AIM_FIRE_SEMI_AUTO
{
	movetype legs

	entrycommands
	{
		viewmodelanim aim_fire 1		
	}

	action
	{	
		// No visible external difference between iron-sights and normal in multiplayer
		mpcai_Aim_shoot			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" !RUN POSITION_TYPE "standing"
		mppai_Aim_shoot			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" POSITION_TYPE "prone"
		mpcai_Aim_shoot			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" POSITION_TYPE "crouching"
		mpsai_Aim_shoot			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"

		mmcai_Aim_Shoot_Shotgun			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot" !RUN POSITION_TYPE "standing" 
		mmpai_Aim_Shoot_Shotgun			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot" POSITION_TYPE "prone" 
		mmcai_Aim_Shoot_Shotgun			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot" POSITION_TYPE "crouching"
		mmsai_Aim_Shoot_Shotgun			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"

		mrcai_Crouch_Aim_Shoot			: !RUN POSITION_TYPE "standing"
		mrpai_Aim_Shoot					: POSITION_TYPE "prone"
		mrcai_Crouch_Aim_Shoot			: POSITION_TYPE "crouching"
		mrsai_Aim_Shoot					: default
	}

	states
	{
		STAND							: KILLED
		STAND							: INCAPACITATED
	
		//new behavior, goes straight to reload instead of rechambering when clip is empty
		AIM_PUTAWAY						:	!HAS_AMMO_IN_CLIP "mainhand" HAS_AMMO "mainhand" ANIMDONE_TORSO
		AIM_RIFLE_RECHAMBER				:   IS_WEAPON_ACTIVE "mainhand" "G Model 38 Arisaka" ANIMDONE_TORSO
		AIM_RIFLE_RECHAMBER_SNIPER		:   IS_WEAPON_ACTIVE "mainhand" "Springfield M1903" ANIMDONE_TORSO	
		AIM_RIFLE_RECHAMBER				:   IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle" ANIMDONE_TORSO			
		AIM_RIFLE_RECHAMBER				:   IS_WEAPON_ACTIVE "mainhand" "Japan 44" ANIMDONE_TORSO	
		AIM_RIFLE_RECHAMBER_SNIPER		:   IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle" ANIMDONE_TORSO				

		AIM_IDLE_STAND					:  !ATTACK_PRIMARY POSITION_TYPE "stand" ANIMDONE_TORSO
		AIM_IDLE_STAND					:  !IS_WEAPON_READY_TO_FIRE "mainhand" POSITION_TYPE "stand" ANIMDONE_TORSO
		
		AIM_IDLE_CROUCH					:  !ATTACK_PRIMARY POSITION_TYPE "crouching" ANIMDONE_TORSO
		AIM_IDLE_CROUCH					:  !IS_WEAPON_READY_TO_FIRE "mainhand" POSITION_TYPE "crouching" ANIMDONE_TORSO
		
		AIM_IDLE_PRONE					:  !ATTACK_PRIMARY POSITION_TYPE "prone" ANIMDONE_TORSO
		AIM_IDLE_PRONE					:  !IS_WEAPON_READY_TO_FIRE "mainhand" POSITION_TYPE "prone" ANIMDONE_TORSO
				
		CHECK_AIM_FIRE_SEMI_AUTO		:   +ATTACK_PRIMARY IS_WEAPON_ACTIVE "mainhand" "M1 Carbine"
		CHECK_AIM_FIRE_SEMI_AUTO		:   +ATTACK_PRIMARY IS_WEAPON_ACTIVE "mainhand" "M1 Garand"		
		CHECK_AIM_FIRE_SEMI_AUTO		:   +ATTACK_PRIMARY IS_WEAPON_ACTIVE "mainhand" "M1911A1 Colt .45"
		CHECK_AIM_FIRE_SEMI_AUTO		:   +ATTACK_PRIMARY IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol"
		CHECK_AIM_FIRE_SEMI_AUTO		:   +ATTACK_PRIMARY IS_WEAPON_ACTIVE "mainhand" "US .45"

		CHECK_AIM_FIRE_SEMI_AUTO		:   +ATTACK_PRIMARY ANIMDONE_TORSO
	}
}

/////////////////////////////////////////// End AIM States

//==============================================================================
//==============================================================================
//
// Primary Attacks - Full Auto
//
//==============================================================================

state CHECK_PRIMARY_ATTACK_FULLAUTO
{
	movetype legs

	action
	{
		none : default // stop torso animation
	}

	states
	{
		STAND					: KILLED
		STAND					: INCAPACITATED
		STAND					: PUTAWAYMAIN
		STAND					: NEW_WEAPON
		STAND					: RELOAD
		STAND					: !IS_WEAPON_READY_TO_FIRE "mainhand"
		
//		ATTACK_PISTOL_PRIMARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "pistol"
		ATTACK_RIFLE_PRIMARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "rifle"		
//		CHARGE_ATTACK_GRENADE	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "grenade"
		ATTACK_SMG_PRIMARY		: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "smg"	    
	    ATTACK_SMG_PRIMARY		: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "mg"	    
		
//		STAND					: IS_WEAPON_ACTIVE "Error" // Generates an error if no appropriate
															// attack state is chosen
		STAND					: !ATTACK_PRIMARY
	}
}

state ATTACK_SMG_PRIMARY
{
	movetype legs

	entrycommands
	{
		viewmodelanim fire 1
	}

	action
	{
		mmcai_Crouch_Aim_Shoot			: !RUN POSITION_TYPE "standing"
		mmpxi_aim_shoot					: POSITION_TYPE "prone"
		mmcai_Crouch_Aim_Shoot			: POSITION_TYPE "crouching"
		mmsai_Aim_Shoot					: default
	}

	states
	{
		STAND							: KILLED
		STAND							: INCAPACITATED

		STAND							: !ATTACK_PRIMARY ANIMDONE_TORSO 
		STAND							: ANIMDONE_TORSO !IS_WEAPON_READY_TO_FIRE "mainhand"
		STAND							: RELOAD !ATTACK_PRIMARY
		
		CHECK_PRIMARY_ATTACK_FULLAUTO	: ATTACK_PRIMARY +IS_WEAPON_READY_TO_FIRE "mainhand"
		CHECK_PRIMARY_ATTACK_FULLAUTO	: +ATTACK_PRIMARY IS_WEAPON_READY_TO_FIRE "mainhand"
	}
}

state ATTACK_RIFLE_PRIMARY
{
	movetype legs

	entrycommands
	{
		viewmodelanim fire 1
	}

	action
	{
		mmcai_Aim_Shoot_Shotgun			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot" !RUN POSITION_TYPE "standing" 
		mmpai_Aim_Shoot_Shotgun			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot" POSITION_TYPE "prone" 
		mmcai_Aim_Shoot_Shotgun			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot" POSITION_TYPE "crouching"
		mmsai_Aim_Shoot_Shotgun			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		
		mrcai_Crouch_Aim_Shoot			: !RUN POSITION_TYPE "standing"
		mrpai_Aim_Shoot					: POSITION_TYPE "prone"
		mrcai_Crouch_Aim_Shoot			: POSITION_TYPE "crouching"
		mrsai_Aim_Shoot					: default
	}

	states
	{
		STAND							: KILLED
		STAND							: INCAPACITATED
		
		//new behavior, goes straght to reload instead of rechambering when clip is empty
		RELOAD_WEAPON					: ANIMDONE_TORSO !HAS_AMMO_IN_CLIP "mainhand" HAS_AMMO "mainhand"
		ATTACK_RIFLE_RECHAMBER			: ANIMDONE_TORSO IS_WEAPON_ACTIVE "mainhand" "G Model 38 Arisaka"
		ATTACK_RIFLE_RECHAMBER			: ANIMDONE_TORSO IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		ATTACK_RIFLE_RECHAMBER			: ANIMDONE_TORSO IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		ATTACK_RIFLE_RECHAMBER			: ANIMDONE_TORSO IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		ATTACK_RIFLE_RECHAMBER			: ANIMDONE_TORSO IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"

		STAND							: ANIMDONE_TORSO
		
		//the following weapons have quick attacks and don't have to wait for IS_WEAPON_READY_TO_FIRE
		//button presses will be trapped later and the gun will fire only when it is truly able to.
		//this prevents delays in the rapid fire semi autos 
		CHECK_PRIMARY_ATTACK_SEMIAUTO	: +ATTACK_PRIMARY IS_WEAPON_ACTIVE "mainhand" "M1 Carbine"
		CHECK_PRIMARY_ATTACK_SEMIAUTO	: +ATTACK_PRIMARY IS_WEAPON_ACTIVE "mainhand" "M1 Garand"		

		CHECK_PRIMARY_ATTACK_SEMIAUTO	: +ATTACK_PRIMARY IS_WEAPON_READY_TO_FIRE "mainhand"
		
		STAND							: !HAS_WEAPON
	}
}

state ATTACK_RIFLE_RECHAMBER
{
	movetype legs
   
	entrycommands
	{
		viewmodelanim rechamber
	}

	action
	{
		mrsxx_rechamber_springsniper	: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrcxx_rechamber_springsniper	: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrpxx_rechamber_springsniper	: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrsxx_rechamber_springsniper	: IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"

		mrsxx_rechamber_springfield		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		mrcxx_rechamber_springfield		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		mrpxx_rechamber_springfield		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		mrsxx_rechamber_springfield		: IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"

		mrsxx_rechamber_44carbine		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		mrcxx_rechamber_44carbine		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		mrpxx_rechamber_44carbine		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		mrsxx_rechamber_44carbine		: IS_WEAPON_ACTIVE "mainhand" "Japan 44"

		mrsxx_rechamber_97sniper		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"
		mrcxx_rechamber_97sniper		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"
		mrpxx_rechamber_97sniper		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"
		mrsxx_rechamber_97sniper		: IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"

		mrsxx_rechamber_arisaka			: !RUN POSITION_TYPE "standing"
		mrcxx_rechamber_arisaka			: POSITION_TYPE "crouching"
		mrpxx_rechamber_arisaka			: POSITION_TYPE "prone"
		mrsxx_rechamber_arisaka			: default
	}

	states
	{
		STAND						: KILLED
		STAND						: INCAPACITATED
		
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS :    IS_USING_TURRET
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS_SECONDARYATTACK	: +ATTACK_SECONDARY !POSITION_TYPE "prone"

		STAND						: ANIMDONE_TORSO
	}
}

state AIM_RIFLE_RECHAMBER_SNIPER
{
	movetype legs

	entrycommands
	{
	//	jsl-->Using the normal rechamber so we can abort the zoom 
		viewmodelanim rechamber
	}

	action
	{
		mrsxx_rechamber_springsniper	: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrcxx_rechamber_springsniper	: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrpxx_rechamber_springsniper	: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrsxx_rechamber_springsniper	: IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"

		mrsxx_rechamber_springfield		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		mrcxx_rechamber_springfield		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		mrpxx_rechamber_springfield		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		mrsxx_rechamber_springfield		: IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"

		mrsxx_rechamber_44carbine		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		mrcxx_rechamber_44carbine		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		mrpxx_rechamber_44carbine		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		mrsxx_rechamber_44carbine		: IS_WEAPON_ACTIVE "mainhand" "Japan 44"

		mrsxx_rechamber_97sniper		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"
		mrcxx_rechamber_97sniper		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"
		mrpxx_rechamber_97sniper		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"
		mrsxx_rechamber_97sniper		: IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"

		mrsxx_aim_rechamber_arisaka		: !RUN POSITION_TYPE "standing"
		mrcxx_aim_rechamber_arisaka		: POSITION_TYPE "crouching"
		mrpxx_aim_rechamber_arisaka		: POSITION_TYPE "prone"
		mrsxx_aim_rechamber_arisaka		: default
	}

	states
	{
		STAND						: KILLED
		STAND						: INCAPACITATED
		
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS   :    IS_USING_TURRET
		AIM_TO_MELEE					: +ATTACK_SECONDARY !POSITION_TYPE "prone"
		
		AIM_IDLE_STAND					:  POSITION_TYPE "stand"  ANIMDONE_TORSO
		AIM_IDLE_CROUCH					:  POSITION_TYPE "crouching"  ANIMDONE_TORSO
		AIM_IDLE_PRONE					:  POSITION_TYPE "prone"  ANIMDONE_TORSO

		// jsl-->Allow player to zoom back in during the rechamber.
		ATTACK_RIFLE_RECHAMBER			: !AIM
	}
}


state AIM_RIFLE_RECHAMBER
{
	movetype legs
   
	entrycommands
	{
		viewmodelanim aim_rechamber
	}

	action
	{
		mrsxx_rechamber_springsniper	: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrcxx_rechamber_springsniper	: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrpxx_rechamber_springsniper	: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrsxx_rechamber_springsniper	: IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"

		mrsxx_rechamber_springfield		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		mrcxx_rechamber_springfield		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		mrpxx_rechamber_springfield		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		mrsxx_rechamber_springfield		: IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"

		mrsxx_rechamber_44carbine		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		mrcxx_rechamber_44carbine		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		mrpxx_rechamber_44carbine		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		mrsxx_rechamber_44carbine		: IS_WEAPON_ACTIVE "mainhand" "Japan 44"

		mrsxx_rechamber_97sniper		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"
		mrcxx_rechamber_97sniper		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"
		mrpxx_rechamber_97sniper		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"
		mrsxx_rechamber_97sniper		: IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"

		mrsxx_aim_rechamber_arisaka		: !RUN POSITION_TYPE "standing"
		mrcxx_aim_rechamber_arisaka		: POSITION_TYPE "crouching"
		mrpxx_aim_rechamber_arisaka		: POSITION_TYPE "prone"
		mrsxx_aim_rechamber_arisaka		: default
	}

	states
	{
		STAND						: KILLED
		STAND						: INCAPACITATED
		
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS   :    IS_USING_TURRET
		AIM_TO_MELEE					: +ATTACK_SECONDARY !POSITION_TYPE "prone"
		
		AIM_IDLE_STAND					:  POSITION_TYPE "stand"  ANIMDONE_TORSO
		AIM_IDLE_CROUCH					:  POSITION_TYPE "crouching"  ANIMDONE_TORSO
		AIM_IDLE_PRONE					:  POSITION_TYPE "prone"  ANIMDONE_TORSO
	}
}

state ATTACK_LANDMINE
{
	entrycommands
	{
		viewmodelanim fire
	}

	action
	{
		mxcxx_CS_Toss_landmine		: !RUN POSITION_TYPE "standing"
		mxpxx_CS_Toss_landmine		: POSITION_TYPE "prone"
		mxcxx_CS_Toss_landmine		: POSITION_TYPE "crouching"
		mxsxx_CS_Toss_landmine		: default
	}

	states
	{
		STAND						: KILLED
		STAND						: INCAPACITATED

		FORCE_PUTAWAY_GRENADE		: !HAS_AMMO "mainhand"	// TKO - Jason Abbott
		STAND						: ANIMDONE_TORSO
	}
}

state ATTACK_AMMOBOX
{
	entrycommands
	{
		viewmodelanim fire
	}

	action
	{
		mxcxx_CS_Toss					: !RUN POSITION_TYPE "standing"
		mxpxx_CS_Toss					: POSITION_TYPE "prone"
		mxcxx_CS_Toss					: POSITION_TYPE "crouching"
		mxsxx_CS_Toss					: default
	}

	states
	{
		STAND						: KILLED
		STAND						: INCAPACITATED

		FORCE_PUTAWAY_GRENADE		: !HAS_AMMO "mainhand"	// TKO - Jason Abbott
		STAND						: ANIMDONE_TORSO
	}
}

state ATTACK_AMMOBOX_SECONDARY
{
	movetype legs

	entrycommands
	{
		viewmodelanim putaway
	}

	action
	{
		mxcxx_ammobox_secondary			: !RUN POSITION_TYPE "standing"
		mxcxx_ammobox_secondary			: POSITION_TYPE "crouching"
		mxsxx_ammobox_secondary			: default
	}

	states
	{
		STAND						: KILLED
		STAND						: INCAPACITATED

		FORCE_PUTAWAY_GRENADE		: !HAS_AMMO "mainhand"	// TKO - Jason Abbott
		STAND						: ANIMDONE_TORSO
	}
}


state ATTACK_MEDIC_POUCH_HEAL_OTHER
{
	states
	{
		ATTACK_MEDIC_POUCH_HEAL_INTRO			: CORPSMAN_BAG_MODE "==" "1"
		ATTACK_MEDIC_POUCH_REVIVE_INTRO			: CORPSMAN_BAG_MODE "==" "2"
		STAND									: default
	}
}


state ATTACK_MEDIC_POUCH_HEAL_INTRO
{
	movetype legs

	entrycommands
	{
		viewmodelanim fire 1
	}

	action
	{
		mccxx_sulfa_pullout				: !RUN POSITION_TYPE "standing"
		mcpxx_sulfa_pullout				: POSITION_TYPE "prone"
		mccxx_sulfa_pullout				: POSITION_TYPE "crouching"
		mcsxx_sulfa_pullout				: default
	}

	states
	{
		STAND								: KILLED
		STAND								: INCAPACITATED

		ATTACK_MEDIC_POUCH_HEAL_ATTEMPT		: ANIMDONE_TORSO
	}
}

state ATTACK_MEDIC_POUCH_HEAL_ATTEMPT
{
	entrycommands
	{
		fire		// this will detect success or failure
	}

	states
	{
		ATTACK_MEDIC_POUCH_HEAL_SUCCESS			: CORPSMAN_BAG_MODE "==" "1"
		ATTACK_MEDIC_POUCH_HEAL_FAILURE			: default
	}
}

state ATTACK_MEDIC_POUCH_HEAL_SUCCESS
{
	movetype legs

	entrycommands
	{
		viewmodelanim charge 1		// "charge" slot intentionally used
	}

	action
	{
		mccxx_sulfa_heal				: !RUN POSITION_TYPE "standing"
		mcpxx_sulfa_heal				: POSITION_TYPE "prone"
		mccxx_sulfa_heal				: POSITION_TYPE "crouching"
		mcsxx_sulfa_heal				: default
	}

	states
	{
		STAND								: KILLED
		STAND								: INCAPACITATED
		STAND								: ANIMDONE_TORSO
	}
}

state ATTACK_MEDIC_POUCH_HEAL_FAILURE
{
	movetype legs

	entrycommands
	{
		viewmodelanim rechamber 1		// "rechamber" slot intentionally used
	}

	action
	{
		mccxx_sulfa_putback				: !RUN POSITION_TYPE "standing"
		mcpxx_sulfa_putback				: POSITION_TYPE "prone"
		mccxx_sulfa_putback				: POSITION_TYPE "crouching"
		mcsxx_sulfa_putback				: default
	}

	states
	{
		STAND								: KILLED
		STAND								: INCAPACITATED
		STAND								: ANIMDONE_TORSO
	}
}


state ATTACK_MEDIC_POUCH_REVIVE_INTRO
{
	movetype legs

	entrycommands
	{
		viewmodelanim reload 1			// "reload" slot used intentionally
	}

	action
	{
		mccxx_syrette_pullout			: !RUN POSITION_TYPE "standing"
		mcpxx_syrette_pullout			: POSITION_TYPE "prone"
		mccxx_syrette_pullout			: POSITION_TYPE "crouching"
		mcsxx_syrette_pullout			: default
	}

	states
	{
		STAND								: KILLED
		STAND								: INCAPACITATED

		ATTACK_MEDIC_POUCH_REVIVE_ATTEMPT	: ANIMDONE_TORSO
	}
}

state ATTACK_MEDIC_POUCH_REVIVE_ATTEMPT
{
	entrycommands
	{
		fire		// this will detect success or failure
	}

	states
	{
		ATTACK_MEDIC_POUCH_REVIVE_SUCCESS			: CORPSMAN_BAG_MODE "==" "2"
		ATTACK_MEDIC_POUCH_REVIVE_FAILURE			: default
	}
}

state ATTACK_MEDIC_POUCH_REVIVE_SUCCESS
{
	movetype legs

	entrycommands
	{
		viewmodelanim reload_single 1		// "reload_single" slot intentionally used
	}

	action
	{
		mccxx_syrette_poke				: !RUN POSITION_TYPE "standing"
		mcpxx_syrette_poke				: POSITION_TYPE "prone"
		mccxx_syrette_poke				: POSITION_TYPE "crouching"
		mcsxx_syrette_poke				: default
	}

	states
	{
		STAND								: KILLED
		STAND								: INCAPACITATED
		STAND								: ANIMDONE_TORSO
	}
}

state ATTACK_MEDIC_POUCH_REVIVE_FAILURE
{
	movetype legs

	entrycommands
	{
		viewmodelanim reload_end 1		// "reload_end" slot intentionally used
	}

	action
	{
		mccxx_syrette_putback			: !RUN POSITION_TYPE "standing"
		mcpxx_syrette_putback			: POSITION_TYPE "prone"
		mccxx_syrette_putback			: POSITION_TYPE "crouching"
		mcsxx_syrette_putback			: default
	}

	states
	{
		STAND								: KILLED
		STAND								: INCAPACITATED
		STAND								: ANIMDONE_TORSO
	}
}


state ATTACK_MEDIC_POUCH_deprecated
{
	movetype legs

	entrycommands
	{
		viewmodelanim fire 1
	}

	action
	{
		mccxx_sulfa						: !RUN POSITION_TYPE "standing"
		mcpxx_sulfa						: POSITION_TYPE "prone"
		mccxx_sulfa						: POSITION_TYPE "crouching"
		mcsxx_sulfa						: default
	}

	states
	{
		STAND							: KILLED
		STAND							: INCAPACITATED
		STAND							: ANIMDONE_TORSO

		CHECK_PRIMARY_ATTACK_SEMIAUTO	: +ATTACK_PRIMARY IS_WEAPON_READY_TO_FIRE "mainhand"
	}
}

state ATTACK_MEDIC_POUCH_HEAL_SELF
{
	movetype legs

	entrycommands
	{
		viewmodelanim fire_secondary 1
	}

	action
	{
		mccxx_sulfa_self				: !RUN POSITION_TYPE "standing"
		mcpxx_sulfa_self				: POSITION_TYPE "prone"
		mccxx_sulfa_self				: POSITION_TYPE "crouching"
		mcsxx_sulfa_self				: default
	}

	states
	{
		STAND							: KILLED
		STAND							: INCAPACITATED
		STAND							: ANIMDONE_TORSO
	}
}


state ATTACK_AXE
{
	entrycommands
	{
		viewmodelanim fire
	}

	action
	{
		us_axe_fire		: default
	}

	states
	{
		STAND						: KILLED
		STAND						: INCAPACITATED

		STAND						: ANIMDONE_TORSO
	}
}


state ATTACK_PISTOL_PRIMARY
{
	movetype legs

	entrycommands
	{
		viewmodelanim fire 1
	}

	action
	{
		mpcai_Aim_shoot			: !RUN POSITION_TYPE "standing"
		mppai_Aim_shoot			: POSITION_TYPE "prone"
		mpcai_Aim_shoot			: POSITION_TYPE "crouching"
		mpsai_Aim_shoot			: default
	}

	states
	{
		STAND							: KILLED
		STAND							: INCAPACITATED
		STAND							: ANIMDONE_TORSO

		CHECK_PRIMARY_ATTACK_SEMIAUTO	: +ATTACK_PRIMARY IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol"
		CHECK_PRIMARY_ATTACK_SEMIAUTO	: +ATTACK_PRIMARY IS_WEAPON_ACTIVE "mainhand" "US .45"
		CHECK_PRIMARY_ATTACK_SEMIAUTO	: +ATTACK_PRIMARY IS_WEAPON_ACTIVE "mainhand" "M1911A1 Colt .45"
	
		CHECK_PRIMARY_ATTACK_SEMIAUTO	: +ATTACK_PRIMARY IS_WEAPON_READY_TO_FIRE "mainhand"
		
		// allow pistol whip immediatly after firing
		ATTACK_PISTOL_SECONDARY			: +ATTACK_SECONDARY IS_WEAPON_READY_TO_FIRE "mainhand" !POSITION_TYPE "prone"

	}
}


//==============================================================================
//==============================================================================
//
// Primary Attacks - Semi-Auto
//
//==============================================================================

state CHECK_PRIMARY_ATTACK_SEMIAUTO
{
	movetype legs

	action
	{
		none : default // stop torso animation
	}

	states
	{
		STAND					: KILLED
		STAND					: INCAPACITATED
		STAND					: PUTAWAYMAIN
		STAND					: NEW_WEAPON
		STAND					: RELOAD
		
		//waiting to fire semiauto is for semi auto weapons that fire rapidly.  This state captures the player's button press and holds
		//the state until the server allows the weapon to fire.
		WAITING_TO_FIRE_SEMIAUTO	: !IS_WEAPON_READY_TO_FIRE "mainhand" HAS_AMMO "mainhand" IS_WEAPON_ACTIVE "mainhand" "M1 Carbine"
		WAITING_TO_FIRE_SEMIAUTO	: !IS_WEAPON_READY_TO_FIRE "mainhand" HAS_AMMO "mainhand" IS_WEAPON_ACTIVE "mainhand" "M1 Garand"		
		WAITING_TO_FIRE_SEMIAUTO	: !IS_WEAPON_READY_TO_FIRE "mainhand" HAS_AMMO "mainhand" IS_WEAPON_ACTIVE "mainhand" "M1911A1 Colt .45"
		WAITING_TO_FIRE_SEMIAUTO	: !IS_WEAPON_READY_TO_FIRE "mainhand" HAS_AMMO "mainhand" IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol"
		WAITING_TO_FIRE_SEMIAUTO	: !IS_WEAPON_READY_TO_FIRE "mainhand" HAS_AMMO "mainhand" IS_WEAPON_ACTIVE "mainhand" "US .45"
		STAND						: !IS_WEAPON_READY_TO_FIRE "mainhand"

		ATTACK_LANDMINE			: IS_WEAPON_READY_TO_FIRE "mainhand" "Landmine"
		ATTACK_LANDMINE			: IS_WEAPON_READY_TO_FIRE "mainhand" "Landmine Axis"
		ATTACK_LANDMINE			: IS_WEAPON_READY_TO_FIRE "mainhand" "Landmine Allied"
		ATTACK_AMMOBOX			: IS_WEAPON_READY_TO_FIRE "mainhand" "Ammo Satchel"
		ATTACK_AXE				: IS_WEAPON_READY_TO_FIRE "mainhand" "US Axe"
		AIM_PULLOUT				: IS_WEAPON_READY_TO_FIRE "mainhand" "binoculars"
		CHARGE_ATTACK_GRENADE	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "grenade" !POSITION_TYPE "prone"
		CHARGE_ATTACK_GRENADE	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "explosive"
		ATTACK_RIFLE_PRIMARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "rifle"
		ATTACK_RIFLE_PRIMARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "shotgun"
		ATTACK_PISTOL_PRIMARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "pistol"

//		STAND					: IS_WEAPON_ACTIVE "Error" // Generates an error if no appropriate
											// attack state is chosen
		STAND					: !ATTACK_PRIMARY
	}
}

state WAITING_TO_FIRE_SEMIAUTO
{
	action
	{
		none : default // stop torso animation
	}
	
		states
	{
		STAND						: KILLED
		STAND						: INCAPACITATED
	
		STAND						: NEW_WEAPON
		STAND						: RELOAD

		CHECK_PRIMARY_ATTACK_SEMIAUTO : IS_WEAPON_READY_TO_FIRE "mainhand"
	}
}


//==============================================================================
//==============================================================================
//
// Secondary Attacks (Always Semi-Auto fire)
//
//==============================================================================
state CHECK_SECONDARY_ATTACK
{
	movetype legs

	action
	{
		none : default // no torso animation
	}

	states
	{
		STAND					: KILLED
		STAND					: INCAPACITATED
		
		STAND					: !HAS_WEAPON
	
//		STAND					: RELOAD
		STAND					: !HAS_AMMO_IN_CLIP "mainhand" "secondary"

		STAND	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "pistol" "secondary"  IS_WEAPON_ACTIVE "mainhand" "binoculars"		
		ATTACK_PISTOL_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "pistol" "secondary"
		ATTACK_SMG_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "smg" "secondary" IS_WEAPON_ACTIVE "mainhand" "M1928A1 Thompson SMG 50"
		ATTACK_SMG_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "smg" "secondary" IS_WEAPON_ACTIVE "mainhand" "M1928A1 Thompson SMG 30"
		ATTACK_SMG_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "smg" "secondary" IS_WEAPON_ACTIVE "mainhand" "Type 100 SMG"
		ATTACK_SMG_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "smg" "secondary" IS_WEAPON_ACTIVE "mainhand" "Reising"
		ATTACK_SMG_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "smg" "secondary" IS_WEAPON_ACTIVE "mainhand" "Johnson LMG"		
		ATTACK_SMG_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "mg" "secondary" IS_WEAPON_ACTIVE "mainhand" "BAR"
		ATTACK_SMG_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "mg" "secondary" IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"
		ATTACK_AXE				: IS_WEAPON_READY_TO_FIRE "mainhand" "US Axe"
		ATTACK_RIFLE_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "rifle" "secondary" IS_WEAPON_ACTIVE "mainhand" "M1 Carbine"
		ATTACK_RIFLE_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "rifle" "secondary" IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"
		ATTACK_RIFLE_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "rifle" "secondary" IS_WEAPON_ACTIVE "mainhand" "G Model 38 Arisaka"
		ATTACK_RIFLE_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "rifle" "secondary" IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		ATTACK_RIFLE_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "rifle" "secondary" IS_WEAPON_ACTIVE "mainhand" "M1 Garand"		
		ATTACK_RIFLE_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "rifle" "secondary" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		ATTACK_RIFLE_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "rifle" "secondary" IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		ATTACK_RIFLE_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "shotgun" "secondary" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		ATTACK_TURRET_SECONDARY : IS_WEAPON_ACTIVE "mainhand" "Packed Anti-Tank Rifle" "secondary"
		ATTACK_TURRET_SECONDARY : IS_WEAPON_ACTIVE "mainhand" "Packed M92 7.7mm Portable Machine Gun" "secondary"
		ATTACK_TURRET_SECONDARY : IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar" "secondary"
		ATTACK_TURRET_SECONDARY : IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar" "secondary"
		ATTACK_TURRET_SECONDARY : DM_ACTIVE IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis" "secondary"
		

//		ATTACK_TURRET_SECONDARY : IS_WEAPON_ACTIVE "mainhand" "Packed MG42 Turret" "secondary"
		
		STAND					: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "rifle" "secondary" IS_WEAPON_ACTIVE "mainhand" "M1 Carbine - Sniper"
		
		CHARGE_ATTACK_GRENADE_SECONDARY	: IS_WEAPONCLASS_READY_TO_FIRE "mainhand" "grenade" "secondary" !POSITION_TYPE "prone"
		CHARGE_ATTACK_GRENADE_SECONDARY	: IS_WEAPON_READY_TO_FIRE "mainhand" "Satchel Charge" "secondary" !POSITION_TYPE "prone"

		PUT_AWAY_ITEM			: IS_WEAPON_ACTIVE "mainhand" "binoculars"


		STAND					: default
	}
}


state ATTACK_PISTOL_SECONDARY
{
	movetype legs

	entrycommands
	{
		viewmodelanim fire_secondary 1
	}

	action
	{
		mpcxx_melee				: !RUN POSITION_TYPE "standing"
		mpcxx_melee				: POSITION_TYPE "crouching"
		mpsxx_melee				: default
	}

	states
	{
		STAND	 	: KILLED
		STAND		: INCAPACITATED
		
		STAND	 	: ANIMDONE_TORSO
		
		STAND		: !HAS_WEAPON
	}
}
   

state ATTACK_SMG_SECONDARY
{
	movetype legs

	entrycommands
	{
		viewmodelanim fire_secondary 1
	}

	action
	{
		mmcxx_melee_BAR			: IS_WEAPON_ACTIVE "mainhand" "BAR" !RUN POSITION_TYPE "standing"
		mmcxx_melee_BAR			: IS_WEAPON_ACTIVE "mainhand" "BAR" POSITION_TYPE "crouching"
		mmsxx_melee_BAR			: IS_WEAPON_ACTIVE "mainhand" "BAR"

		mmcxx_meleeStab_Model96	: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG" !RUN POSITION_TYPE "standing"
		mmcxx_meleeStab_Model96	: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG" POSITION_TYPE "crouching"
		mmsxx_meleeStab_Model96	: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"

		mmcxx_melee				: !RUN POSITION_TYPE "standing"
		mmcxx_melee				: POSITION_TYPE "crouching"
		mmsxx_melee				: default
	}
	
	states
	{
		STAND	 	: KILLED
		STAND		: INCAPACITATED
		
		STAND	 	: ANIMDONE_TORSO
		
		//rapid fire melee, not working yet
		//ATTACK_SMG_SECONDARY : +ATTACK_SECONDARY !IS_IN_MELEE_ATTACK "mainhand"
		
		STAND		: !HAS_WEAPON
	}
}

state ATTACK_TURRET_SECONDARY
{
	movetype legs

	states
	{
		// Single Player

		ATTACK_TURRET_SECONDARY_SINGLE_PLAYER		: !DM_ACTIVE

		// Multiplayer
		
		ATTACK_TURRET_SECONDARY_MULTIPLAYER			: default
	}
}

state ATTACK_TURRET_SECONDARY_MULTIPLAYER
{
	movetype legs

	entrycommands
	{
		fire mainhand secondary
	}

	states
	{
		STAND	 	: default
	}
}

state ATTACK_TURRET_SECONDARY_SINGLE_PLAYER
{
	movetype legs

	entrycommands
	{
		viewmodelanim fire_secondary 1
	}

	action
	{
		turret_deploy	: default
	}

	states
	{
		STAND	 	: KILLED
		STAND		: INCAPACITATED
		
		STAND	 	: ANIMDONE_TORSO
	}
}


state ATTACK_RIFLE_SECONDARY
{
	movetype legs

	entrycommands
	{
		viewmodelanim fire_secondary 1
	}

	action
	{
		// Single Player
		us_axe_melee				: !DM_ACTIVE IS_WEAPON_ACTIVE "mainhand" "US Axe"
		
		mrcxx_meleeStab				: IS_WEAPON_ACTIVE "mainhand" "Japan 44" !RUN POSITION_TYPE "standing"
		mrcxx_meleeStab				: IS_WEAPON_ACTIVE "mainhand" "Japan 44" POSITION_TYPE "crouching"
		mrsxx_meleeStab				: IS_WEAPON_ACTIVE "mainhand" "Japan 44"

		mrcxx_meleeStab				: IS_WEAPON_ACTIVE "mainhand" "M1 Garand" !RUN POSITION_TYPE "standing"
		mrcxx_meleeStab				: IS_WEAPON_ACTIVE "mainhand" "M1 Garand" POSITION_TYPE "crouching"
		mrsxx_meleeStab				: IS_WEAPON_ACTIVE "mainhand" "M1 Garand"

		mrcxx_meleeStab				: IS_WEAPON_ACTIVE "mainhand" "G Model 38 Arisaka" !RUN POSITION_TYPE "standing"
		mrcxx_meleeStab				: IS_WEAPON_ACTIVE "mainhand" "G Model 38 Arisaka" POSITION_TYPE "crouching"
		mrsxx_meleeStab				: IS_WEAPON_ACTIVE "mainhand" "G Model 38 Arisaka"

		mmcxx_melee_shotgun			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot" !RUN POSITION_TYPE "standing"
		mmcxx_melee_shotgun			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot" POSITION_TYPE "crouching"
		mmsxx_melee_shotgun			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"

		mrcxx_melee					: !RUN POSITION_TYPE "standing"
		mrcxx_melee					: POSITION_TYPE "crouching"
		mrsxx_melee					: default
	}
	
	states
	{
		STAND	 	: KILLED
		STAND		: INCAPACITATED
		
		STAND	 	: ANIMDONE_TORSO
		
		STAND		: !HAS_WEAPON
	}
}

// put away the item and pull out the last active weapon
state PUT_AWAY_ITEM
{
	entrycommands
	{
//		deactivateweapon righthand
		commanddelay 0.05 uselast
	}

	states
	{
		STAND		: default
	}
	
//	exitcommands
//	{
//		uselast
//	}
}


//==============================================================================
//==============================================================================
//
// Primary Charge Up Attacks (grenades)
//
//==============================================================================

state CHARGE_ATTACK_GRENADE
{
	movetype legs

	entrycommands
	{
		viewmodelanim charge
	}
	
	action
	{
		mgcxx_Pull_Pin_Training			: IS_WEAPON_ACTIVE "mainhand" "Training Grenade" !RUN POSITION_TYPE "standing"
		mgcxx_Pull_Pin_Training			: IS_WEAPON_ACTIVE "mainhand" "Training Grenade" POSITION_TYPE "crouching"
		mgpxx_Pull_Pin_Training			: IS_WEAPON_ACTIVE "mainhand" "Training Grenade" POSITION_TYPE "prone"
		mgsxx_Pull_Pin_Training			: IS_WEAPON_ACTIVE "mainhand" "Training Grenade"
				
		mgcxx_Pull_Pin_JPN				: IS_WEAPON_ACTIVE "mainhand" "JPN Frag Grenade" !RUN POSITION_TYPE "standing"
		mgcxx_Pull_Pin_JPN				: IS_WEAPON_ACTIVE "mainhand" "JPN Frag Grenade" POSITION_TYPE "crouching"
		mgpxx_Pull_Pin_JPN				: IS_WEAPON_ACTIVE "mainhand" "JPN Frag Grenade" POSITION_TYPE "prone"
		mgsxx_Pull_Pin_JPN				: IS_WEAPON_ACTIVE "mainhand" "JPN Frag Grenade"
				
		mgcxx_Pull_Pin_Satchel			: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" !RUN POSITION_TYPE "standing"
		mgcxx_Pull_Pin_Satchel			: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" POSITION_TYPE "crouching"
		mgpxx_Pull_Pin_Satchel			: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" POSITION_TYPE "prone"
		mgsxx_Pull_Pin_Satchel			: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" 

		mgcxx_Pull_Pin					: !RUN POSITION_TYPE "standing"
		mgcxx_Pull_Pin					: POSITION_TYPE "crouching"
		mgpxx_Pull_Pin					: POSITION_TYPE "prone"
		mgsxx_Pull_Pin					: default
	}

	states
	{
		RELEASE_KILLED_FRAG				: KILLED
		RELEASE_KILLED_FRAG				: INCAPACITATED

		RELEASE_ATTACK_GRENADE			: ANIMDONE_TORSO !ATTACK_PRIMARY MIN_CHARGE_TIME_MET "mainhand"
	}
}

state RELEASE_ATTACK_GRENADE
{
	movetype legs

	entrycommands
	{
		viewmodelanim fire
	}

	action
	{
		mxcxx_satchelcharge_Throw	: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" !RUN POSITION_TYPE "standing"
		mxcxx_satchelcharge_Throw	: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" POSITION_TYPE "crouching"
		mxpxx_satchelcharge_Throw	: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" POSITION_TYPE "prone"
		mxsxx_satchelcharge_throw	: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mgcxx_Throw					: !RUN POSITION_TYPE "standing"
		mgpxx_Throw					: POSITION_TYPE "prone"
		mgcxx_Throw					: POSITION_TYPE "crouching"
		mgsxx_Throw					: default
	}

	states
	{
		RELEASE_KILLED_FRAG			: KILLED MIN_CHARGE_TIME_MET "mainhand" // killed before the grenade was released
		RELEASE_KILLED_FRAG			: INCAPACITATED MIN_CHARGE_TIME_MET "mainhand" // killed before the grenade was released
		STAND	 					: KILLED
		STAND	 					: INCAPACITATED
		STAND 						: ANIMDONE_TORSO HAS_AMMO "mainhand" IN_TORSO_STATE_TIME "0.25"
		
		PUTAWAY_MAIN				: ANIMDONE_TORSO !HAS_AMMO "mainhand"
	}
}

state CHARGE_ATTACK_GRENADE_SECONDARY
{
	movetype legs

	entrycommands
	{
		viewmodelanim charge
	}
	
	action
	{
		mgcxx_Pull_Pin_secondary_Training			: IS_WEAPON_ACTIVE "mainhand" "Training Grenade" !RUN POSITION_TYPE "standing"
		mgcxx_Pull_Pin_secondary_Training			: IS_WEAPON_ACTIVE "mainhand" "Training Grenade" POSITION_TYPE "crouching"
		mgpxx_Pull_Pin_secondary_Training			: IS_WEAPON_ACTIVE "mainhand" "Training Grenade" POSITION_TYPE "prone"
		mgsxx_Pull_Pin_secondary_Training			: IS_WEAPON_ACTIVE "mainhand" "Training Grenade"
				
		mgcxx_Pull_Pin_secondary_JPN				: IS_WEAPON_ACTIVE "mainhand" "JPN Frag Grenade" !RUN POSITION_TYPE "standing"
		mgcxx_Pull_Pin_secondary_JPN				: IS_WEAPON_ACTIVE "mainhand" "JPN Frag Grenade" POSITION_TYPE "crouching"
		mgpxx_Pull_Pin_secondary_JPN				: IS_WEAPON_ACTIVE "mainhand" "JPN Frag Grenade" POSITION_TYPE "prone"
		mgsxx_Pull_Pin_secondary_JPN				: IS_WEAPON_ACTIVE "mainhand" "JPN Frag Grenade" 
		
		mgcxx_Pull_Pin_Satchel						: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" !RUN POSITION_TYPE "standing"
		mgcxx_Pull_Pin_Satchel						: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" POSITION_TYPE "crouching"
		mgpxx_Pull_Pin_Satchel						: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" POSITION_TYPE "prone"
		mgsxx_Pull_Pin_Satchel						: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" 
				
		mgcxx_Pull_Pin_secondary					: !RUN POSITION_TYPE "standing"
		mgcxx_Pull_Pin_secondary					: POSITION_TYPE "crouching"
		mgpxx_Pull_Pin_secondary					: POSITION_TYPE "prone"
		mgsxx_Pull_Pin_secondary					: default
	}

	states
	{
		RELEASE_KILLED_FRAG							: KILLED
		RELEASE_KILLED_FRAG							: INCAPACITATED
		RELEASE_ATTACK_GRENADE_SECONDARY			: ANIMDONE_TORSO !ATTACK_SECONDARY MIN_CHARGE_TIME_MET "mainhand"
		STAND										: !HAS_WEAPON
	}
}

state RELEASE_ATTACK_GRENADE_SECONDARY
{
	movetype legs

	entrycommands
	{
		viewmodelanim fire_secondary
	}

	action
	{
		mxcxx_satchelcharge_Throw				: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" !RUN POSITION_TYPE "standing"
		mxcxx_satchelcharge_Throw				: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" POSITION_TYPE "crouching"
		mxpxx_satchelcharge_Throw				: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge" POSITION_TYPE "prone"
		mxsxx_satchelcharge_throw				: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"

		mgcxx_Throw_secondary					: !RUN POSITION_TYPE "standing"
		mgcxx_Throw_secondary					: POSITION_TYPE "crouching"
		mgpxx_Throw_secondary					: POSITION_TYPE "prone"
		mgsxx_Throw_secondary					: default
	}

	states
	{
		RELEASE_KILLED_FRAG						: KILLED MIN_CHARGE_TIME_MET "mainhand" // killed before the grenade was released
		RELEASE_KILLED_FRAG						: INCAPACITATED MIN_CHARGE_TIME_MET "mainhand" // killed before the grenade was released
		STAND	 								: KILLED
		STAND	 								: INCAPACITATED
		STAND 									: ANIMDONE_TORSO HAS_AMMO "mainhand"
	
		PUTAWAY_MAIN							: ANIMDONE_TORSO !HAS_AMMO "mainhand"
	}
}

// killed while charging a frag grenade
state RELEASE_KILLED_FRAG
{
	entrycommands
	{
		charge mainhand secondary // prep to drop the grenade
		releasefire mainhand secondary // drop the grenade
	}
	
	states
	{
		STAND	: default
	}
}


//==============================================================================
//==============================================================================
//
// PUTAWAY
//
//==============================================================================

state PUTAWAY_MAIN
{
//	movetype legs

	entrycommands
	{
		zoomoff
		viewmodelanim putaway
	}

	states
	{
		// don't go through the putaway anim if 
		// we're switching to another weapon
		// only do if g_immediateswitch is set
		PUTAWAY_SKIPANIM	: IMMEDIATE_SWITCH NEW_WEAPON
	
		PUTAWAY_PORTABLE_WEAPON			: IS_WEAPON_ACTIVE "mainhand" "Packed M92 7.7mm Portable Machine Gun"
		PUTAWAY_PORTABLE_WEAPON			: IS_WEAPON_ACTIVE "mainhand" "Packed Anti-Tank Rifle"
		PUTAWAY_PORTABLE_WEAPON			: IS_WEAPON_ACTIVE "mainhand" "Packed 60MM Mortar"
		PUTAWAY_PORTABLE_WEAPON			: IS_WEAPON_ACTIVE "mainhand" "Packed M99 81mm Mortar"
		PUTAWAY_PORTABLE_WEAPON			: DM_ACTIVE IS_WEAPON_ACTIVE "mainhand" "Packed Single Lewis"

		
		PUTAWAY_GENERIC_CARRY	: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		PUTAWAY_GENERIC_CARRY	: IS_WEAPON_ACTIVE "mainhand" "Ammo Satchel"
		PUTAWAY_GENERIC_CARRY	: IS_WEAPON_ACTIVE "mainhand" "Landmine"		
		PUTAWAY_GENERIC_CARRY	: IS_WEAPON_ACTIVE "mainhand" "Landmine Axis"
		PUTAWAY_GENERIC_CARRY	: IS_WEAPON_ACTIVE "mainhand" "Landmine Allied"
		PUTAWAY_GENERIC_CARRY	: IS_WEAPON_ACTIVE "mainhand" "binoculars"		
		
		PUTAWAY_PISTOL		: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		PUTAWAY_GRENADE_NOAMMO : IS_WEAPONCLASS_ACTIVE "mainhand" "grenade" !HAS_AMMO "mainhand"
		PUTAWAY_GRENADE_NOAMMO : IS_WEAPONCLASS_ACTIVE "mainhand" "explosive" !HAS_AMMO "mainhand"
		PUTAWAY_GENERIC_CARRY	: IS_WEAPON_ACTIVE "mainhand" "Satchel Charge"
		PUTAWAY_GRENADE		: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade"
		PUTAWAY_SMG			: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		PUTAWAY_SMG			: IS_WEAPONCLASS_ACTIVE "mainhand" "sword"
		PUTAWAY_SMG			: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		PUTAWAY_RIFLE		: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		PUTAWAY_RIFLE		: IS_WEAPONCLASS_ACTIVE "mainhand" "shotgun"
		PUTAWAY_NOANIM		: default
	}
}

state PUTAWAY_PORTABLE_WEAPON
{
	movetype legs
	
	action
	{
		mxcxx_Unequip				: !RUN POSITION_TYPE "standing"
		mxpxx_Unequip				: POSITION_TYPE "prone"
		mxcxx_Unequip				: POSITION_TYPE "crouching"
		mxsxx_Unequip				: default
	}
	
	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED

		GET_ON_LADDER		: ANIMDONE_TORSO ON_LADDER
		STAND	 			: ANIMDONE_TORSO
	}
}

state PUTAWAY_GENERIC_CARRY
{
	movetype legs
	
	action
	{
		binoculars_putaway			: IS_WEAPON_ACTIVE "mainhand" "binoculars"
		mxcxx_CS_Unequip			: !RUN POSITION_TYPE "standing"
		mxpxx_CS_Prone_Unequip		: POSITION_TYPE "prone"
		mxcxx_CS_Unequip			: POSITION_TYPE "crouching"
		mxsxx_CS_Unequip			: default
	}
	
	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED

		GET_ON_LADDER		: ANIMDONE_TORSO ON_LADDER
		STAND	 			: ANIMDONE_TORSO
	}
}

// called when we want to skip the putaway anim
state PUTAWAY_SKIPANIM
{
	entrycommands
	{
		deactivateweapon righthand
	}
	
	states
	{
		RAISE_WEAPON	: default
	}
}

state PUTAWAY_NOANIM
{
	entrycommands
	{
		deactivateweapon righthand
	}

	states
	{
		RAISE_WEAPON	: NEW_WEAPON
		STAND			: default
	}
}


state PUTAWAY_PISTOL
{
	movetype legs
	
	action
	{
		mpcax_Aim_Unequip			: !RUN POSITION_TYPE "standing"
		mpcax_Aim_Unequip			: POSITION_TYPE "crouching"
		mppai_aim_unequip			: POSITION_TYPE "prone"
		mpsax_Aim_Unequip			: default
	}
//	legs
//	{
//		pistol_idle		: default
//	}
	
	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED

		GET_ON_LADDER		: ANIMDONE_TORSO ON_LADDER
		STAND	 			: ANIMDONE_TORSO
	}
}


state PUTAWAY_SMG
{
	movetype legs
	
	action
	{
		mmcax_Aim_Unequip_BAR		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"
		mmpax_Aim_Unequip_BAR		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"
		mmcax_Aim_Unequip_BAR		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"
		mmsax_Aim_Unequip_BAR		: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"

		mmcax_Aim_Unequip_BAR		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "BAR"
		mmpax_Aim_Unequip_BAR		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "BAR"
		mmcax_Aim_Unequip_BAR		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "BAR"
		mmsax_Aim_Unequip_BAR		: IS_WEAPON_ACTIVE "mainhand" "BAR"

		mmcax_Aim_Unequip			: !RUN POSITION_TYPE "standing"
		mmcax_Aim_Unequip			: POSITION_TYPE "crouching"
		mmpax_Aim_Unequip			: POSITION_TYPE "prone"
		mmsax_Aim_Unequip			: default
	}
//	legs
//	{
//		xxsxx_idle		: default
//	}
	
	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED
		
		STAND	 			: ANIMDONE_TORSO

		GET_ON_LADDER		: ANIMDONE_TORSO ON_LADDER
	}
}

state PUTAWAY_RIFLE
{
	movetype legs

	action
	{
		// Single Player
		us_axe_putaway				: !DM_ACTIVE IS_NEW_WEAPON "mainhand" "US Axe"
		
		mmcax_Aim_Unequip			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot" !RUN POSITION_TYPE "standing"
		mmcax_Aim_Unequip			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot" POSITION_TYPE "crouching"
		mmpax_Aim_Unequip			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot" POSITION_TYPE "prone"
		mmsax_Aim_Unequip			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
				
		mrcax_Aim_Unequip			: !RUN POSITION_TYPE "standing"
		mrcax_Aim_Unequip			: POSITION_TYPE "crouching"
		mrpax_Aim_Unequip			: POSITION_TYPE "prone"
		mrsax_Aim_Unequip			: default
	}
//	legs
//	{
//		xxsxx_idle		: default
//	}
	
	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED
		
		STAND	 			: ANIMDONE_TORSO

		GET_ON_LADDER		: ANIMDONE_TORSO ON_LADDER
	}
}

state PUTAWAY_GRENADE
{
	movetype legs
	
	action
	{
		mgcxx_Unequip			: !RUN POSITION_TYPE "standing"
		mgpxx_Unequip			: POSITION_TYPE "prone"
		mgcxx_Unequip			: POSITION_TYPE "crouching"
		mgsxx_Unequip			: default
	}
//	legs
//	{
//		xxsxx_idle				: default
//	}
	
	states
	{
		STAND	 				: KILLED
		STAND					: INCAPACITATED
		
		STAND	 				: ANIMDONE_TORSO
		GET_ON_LADDER			: ANIMDONE_TORSO ON_LADDER
	}
}

state PUTAWAY_GRENADE_NOAMMO
{
	movetype legs
	
	entrycommands
	{
		uselast
	}
	
	action
	{
		mgcxx_Unequip_Noammo : !RUN POSITION_TYPE "standing"
		mgpxx_Unequip_Noammo : POSITION_TYPE "prone"
		mgcxx_Unequip_Noammo : POSITION_TYPE "crouching"
		mgsxx_Unequip_Noammo : default						 
	}
	
	states
	{
		STAND	 				: KILLED
		STAND					: INCAPACITATED
		
		STAND	 				: default
	}
}

state FORCE_PUTAWAY_GRENADE
{
	entrycommands
	{
		uselast
	}
	states
	{
		STAND	 				: KILLED
		STAND					: INCAPACITATED
		STAND	 				: ANIMDONE_TORSO
		GET_ON_LADDER			: ANIMDONE_TORSO ON_LADDER
	}
}


//==============================================================================
//==============================================================================
//
// RAISE_WEAPON
//
//==============================================================================

state RAISE_WEAPON
{
	movetype legs

	entrycommands
	{
		viewmodelanim pullout

		// just to make sure nothing funky's 
		// attached that shouldn't be.
		correctweaponattachments
		
		crosshair 1
	}

	states
	{
		RAISE_PORTABLE_WEAPON			: IS_NEW_WEAPON "mainhand" "Packed M92 7.7mm Portable Machine Gun"
		RAISE_PORTABLE_WEAPON			: IS_NEW_WEAPON "mainhand" "Packed Anti-Tank Rifle"
		RAISE_PORTABLE_WEAPON			: IS_NEW_WEAPON "mainhand" "Packed 60MM Mortar"
		RAISE_PORTABLE_WEAPON			: IS_NEW_WEAPON "mainhand" "Packed M99 81mm Mortar"
		RAISE_PORTABLE_WEAPON			: DM_ACTIVE IS_NEW_WEAPON "mainhand" "Packed Single Lewis"

		RAISE_GENERIC_CARRY		: IS_NEW_WEAPON "mainhand" "corpsman bag"
		RAISE_GENERIC_CARRY		: IS_NEW_WEAPON "mainhand" "Ammo Satchel"
		RAISE_GENERIC_CARRY		: IS_NEW_WEAPON "mainhand" "Landmine"
		RAISE_GENERIC_CARRY		: IS_NEW_WEAPON "mainhand" "Landmine Axis"
		RAISE_GENERIC_CARRY		: IS_NEW_WEAPON "mainhand" "Landmine Allied"
		RAISE_GENERIC_CARRY		: IS_NEW_WEAPON "mainhand" "Satchel Charge"
		RAISE_GENERIC_CARRY		: IS_NEW_WEAPON "mainhand" "binoculars"		

		RAISE_PISTOL		: IS_NEW_WEAPONCLASS "mainhand" "pistol"
		RAISE_GRENADE		: IS_NEW_WEAPONCLASS "mainhand" "grenade"
		RAISE_GRENADE		: IS_NEW_WEAPONCLASS "mainhand" "explosive"
		RAISE_SMG			: IS_NEW_WEAPONCLASS "mainhand" "smg"
		RAISE_SMG			: IS_NEW_WEAPONCLASS "mainhand" "sword"
		RAISE_SMG			: IS_NEW_WEAPONCLASS "mainhand" "mg"
		RAISE_RIFLE			: IS_NEW_WEAPONCLASS "mainhand" "rifle"
		RAISE_RIFLE			: IS_NEW_WEAPONCLASS "mainhand" "shotgun"
		RAISE_NOANIM		: default
	}
}

state RAISE_PORTABLE_WEAPON
{
	movetype legs

	action
	{
		portable_Equip				: !RUN POSITION_TYPE "standing"
		portable_Equip				: POSITION_TYPE "prone"
		portable_Equip				: POSITION_TYPE "crouching"
		portable_Equip				:  default
	}

	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED
		
		STAND	 			: ANIMDONE_TORSO
		
		// allow immediate switching to a different weapon instead
		RAISE_ABORT			: +NEW_WEAPON
	}
}

state RAISE_GENERIC_CARRY
{
	movetype legs

	action
	{
		binoculars_pullout		: IS_NEW_WEAPON "mainhand" "binoculars"
		mxcxx_CS_Equip			: !RUN POSITION_TYPE "standing"
		mxpxx_CS_Prone_Equip	: POSITION_TYPE "prone"
		mxcxx_CS_Equip			: POSITION_TYPE "crouching"
		mxsxx_CS_Equip			:  default
	}

	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED
		
		// allow immediate switching to a different weapon instead
		RAISE_ABORT			: +NEW_WEAPON

		RELOAD_NOANIM		: ANIMDONE_TORSO RELOAD HAS_AMMO "mainhand"

		STAND	 			: ANIMDONE_TORSO
	}
}

state RAISE_NOANIM
{
	entrycommands
	{
		// delay the activation for a frame so that the player
		// spends at least one frame without a weapon, thus 
		// letting the legs state know that we've switched
		commanddelay 0.05 activatenewweapon
		commanddelay 0.05 forcetorsostate "STAND"
	}

//	states
//	{
//		STAND		: default
//	}
}


state RAISE_PISTOL
{
	movetype legs
	
	action
	{
		mpcax_equip_nambu		: IS_NEW_WEAPON "mainhand" "Nambu Pistol" !RUN POSITION_TYPE "standing"
		mpcax_equip_nambu		: IS_NEW_WEAPON "mainhand" "Nambu Pistol" POSITION_TYPE "crouching"
		mppai_equip_nambu		: IS_NEW_WEAPON "mainhand" "Nambu Pistol" POSITION_TYPE "prone"
		mpsax_equip_nambu		: IS_NEW_WEAPON "mainhand" "Nambu Pistol"

		mpcax_equip_revolver	: IS_NEW_WEAPON "mainhand" "US .45" !RUN POSITION_TYPE "standing"
		mpcax_equip_revolver	: IS_NEW_WEAPON "mainhand" "US .45" POSITION_TYPE "crouching"
		mppai_equip_revolver	: IS_NEW_WEAPON "mainhand" "US .45" POSITION_TYPE "prone"
		mpsax_equip_revolver	: IS_NEW_WEAPON "mainhand" "US .45"

		mpcax_equip_colt45		: !RUN POSITION_TYPE "standing"
		mpcax_equip_colt45		: POSITION_TYPE "crouching"
		mppai_equip_colt45		: POSITION_TYPE "prone"
		mpsax_equip_colt45		: default
	}

	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED
		
		STAND	 			: ANIMDONE_TORSO
		
		// allow immediate switching to a different weapon instead
		RAISE_ABORT			: +NEW_WEAPON
	}
}


state RAISE_SMG
{
	movetype legs
	
	action
	{
		mmcax_Aim_Equip_Reising		: !RUN POSITION_TYPE "standing" IS_NEW_WEAPON "mainhand" "Reising"
		mmpax_Aim_Equip_Reising		: POSITION_TYPE "prone" IS_NEW_WEAPON "mainhand" "Reising"
		mmcax_Aim_Equip_Reising		: POSITION_TYPE "crouching" IS_NEW_WEAPON "mainhand" "Reising"
		mmsax_Aim_Equip_Reising		: IS_NEW_WEAPON "mainhand" "Reising"
		
		mmcax_Aim_Equip_BAR			: !RUN POSITION_TYPE "standing" IS_NEW_WEAPON "mainhand" "Model96 LMG"
		mmpax_Aim_Equip_BAR			: POSITION_TYPE "prone" IS_NEW_WEAPON "mainhand" "Model96 LMG"
		mmcax_Aim_Equip_BAR			: POSITION_TYPE "crouching" IS_NEW_WEAPON "mainhand" "Model96 LMG"
		mmsax_Aim_Equip_BAR			: IS_NEW_WEAPON "mainhand" "Model96 LMG"

		mmcax_Aim_Equip_BAR			: !RUN POSITION_TYPE "standing" IS_NEW_WEAPON "mainhand" "BAR"
		mmpax_Aim_Equip_BAR			: POSITION_TYPE "prone" IS_NEW_WEAPON "mainhand" "BAR"
		mmcax_Aim_Equip_BAR			: POSITION_TYPE "crouching" IS_NEW_WEAPON "mainhand" "BAR"
		mmsax_Aim_Equip_BAR			: IS_NEW_WEAPON "mainhand" "BAR"

		mmcax_Aim_Equip				: !RUN POSITION_TYPE "standing"
		mmcax_Aim_Equip				: POSITION_TYPE "crouching"
		mmpax_Aim_Equip				: POSITION_TYPE "prone"
		mmsax_Aim_Equip				: default
	}
	
	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED
		
		STAND	 			: ANIMDONE_TORSO
		
		// allow immediate switching to a different weapon instead
		RAISE_ABORT			: +NEW_WEAPON
	}
}

state RAISE_RIFLE
{
	movetype legs
	
	action
	{
		// Single Player
		us_axe_pullout				: !DM_ACTIVE IS_NEW_WEAPON "mainhand" "US Axe"

		mmcax_Aim_Equip				: IS_NEW_WEAPON "mainhand" "Remington Riot" !RUN POSITION_TYPE "standing"
		mmcax_Aim_Equip				: IS_NEW_WEAPON "mainhand" "Remington Riot" POSITION_TYPE "crouching"
		mmpax_Aim_Equip				: IS_NEW_WEAPON "mainhand" "Remington Riot" POSITION_TYPE "prone"
		mmsax_Aim_Equip				: IS_NEW_WEAPON "mainhand" "Remington Riot"

		mrcax_equip_carbine			: !RUN POSITION_TYPE "standing"
		mrcax_equip_carbine			: POSITION_TYPE "crouching"
		mrpax_equip_carbine			: POSITION_TYPE "prone"
		mrsax_equip_carbine			: default
	}
	
	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED
		
		STAND	 			: ANIMDONE_TORSO
		
		// allow immediate switching to a different weapon instead
		RAISE_ABORT			: +NEW_WEAPON
	}
}

state RAISE_GRENADE
{
	movetype legs

	entrycommands
	{
		weaponcommand mainhand clip_fill	// avoid the whole "double raise/reload" thing
	}

	action
	{
		mgcxx_Equip				: !RUN POSITION_TYPE "standing"
		mgpxx_Equip				: POSITION_TYPE "prone"
		mgcxx_Equip				: POSITION_TYPE "crouching"
		mgsxx_Equip				: default
	}
	
	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED

		// allow immediate switching to a different weapon instead
		RAISE_ABORT			: +NEW_WEAPON

		RELOAD_NOANIM		: ANIMDONE_TORSO RELOAD HAS_AMMO "mainhand"
		STAND	 			: ANIMDONE_TORSO
	}
}

// This state allows the player to abort the raising 
// of a weapon in favor of a different new weapon.
state RAISE_ABORT
{
	entrycommands
	{
		deactivateweapon righthand
	}
	
	states
	{
		RAISE_WEAPON	: default
	}
}

//==============================================================================
//==============================================================================
//
// Weapon Reloading
//
//==============================================================================

state RELOAD_NOANIM
{
	entrycommands
	{
		weaponcommand mainhand clip_fill
		weaponcommand mainhand donereloading
	}

	states
	{
		STAND : default
	}
}

state RELOAD_WEAPON
{
	entrycommands
	{
		aimoff
	}
	states
	{
		RELOAD_SINGLE_BULLET_RIFLE	: IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		RELOAD_SINGLE_BULLET_RIFLE	: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		RELOAD_GRENADE				: IS_WEAPON_ACTIVE "mainhand" "corpsman bag"
		RELOAD_REVOLVER				: IS_WEAPON_ACTIVE "mainhand" "US .45"
		
		//No rechamber needed as clip based gun was not empty
		RELOAD_PISTOL_NOBOLT	: IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol" HAS_AMMO_IN_CLIP "mainhand"
		RELOAD_PISTOL_NOBOLT	: IS_WEAPON_ACTIVE "mainhand" "M1911A1 Colt .45" HAS_AMMO_IN_CLIP "mainhand"
		
		RELOAD_PISTOL			: IS_WEAPONCLASS_ACTIVE "mainhand" "pistol"
		RELOAD_SMG				: IS_WEAPONCLASS_ACTIVE "mainhand" "smg"
		RELOAD_SMG				: IS_WEAPONCLASS_ACTIVE "mainhand" "mg"
		RELOAD_RIFLE			: IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		RELOAD_GRENADE			: IS_WEAPONCLASS_ACTIVE "mainhand" "grenade" //HAS_AMMO_IN_CLIP "mainhand"
		RELOAD_GRENADE			: IS_WEAPONCLASS_ACTIVE "mainhand" "explosive"
		RELOAD_SMG				: default
	}
}

state RELOAD_PISTOL_NOBOLT
{
	movetype legs

	entrycommands
	{
		viewmodelanim reload_single 1
	}

	action
	{
		mpcxx_reload2_nambu			: IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol" !RUN POSITION_TYPE "standing"
		mppxx_reload2_nambu			: IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol" POSITION_TYPE "prone"
		mpcxx_reload2_nambu			: IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol" POSITION_TYPE "crouching"
		mpsxx_reload2_nambu			: IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol"
		
		mpcxx_reload2_colt45		: !RUN POSITION_TYPE "standing"
		mppxx_reload2_colt45		: POSITION_TYPE "prone"
		mpcxx_reload2_colt45		: POSITION_TYPE "crouching"
		mpsxx_reload2_colt45		: default
	}

	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED
		STAND				: ANIMDONE_TORSO !RELOAD
		
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS	: IS_USING_TURRET
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS_SECONDARYATTACK	: +ATTACK_SECONDARY !POSITION_TYPE "prone"
		PUTAWAY_MAIN		: PUTAWAYMAIN
	}
}

state RELOAD_PISTOL
{
	movetype legs

	entrycommands
	{
		viewmodelanim reload 1
	}

	action
	{
		mpcxx_reload_nambu_notempty : IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol"!RUN POSITION_TYPE "standing" HAS_AMMO_IN_CLIP "mainhand"
		mppxx_reload_nambu_notempty : IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol" POSITION_TYPE "prone" HAS_AMMO_IN_CLIP "mainhand"
		mpcxx_reload_nambu_notempty : IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol" POSITION_TYPE "crouching" HAS_AMMO_IN_CLIP "mainhand"
		mpsxx_reload_nambu_notempty : IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol" HAS_AMMO_IN_CLIP "mainhand"

		mpcxx_reload_nambu			: IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol" !RUN POSITION_TYPE "standing"
		mppxx_reload_nambu			: IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol" POSITION_TYPE "prone"
		mpcxx_reload_nambu			: IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol" POSITION_TYPE "crouching"
		mpsxx_reload_nambu			: IS_WEAPON_ACTIVE "mainhand" "Nambu Pistol"
		
		mpcxx_reload_colt45_notempty : !RUN POSITION_TYPE "standing" HAS_AMMO_IN_CLIP "mainhand"
		mppxx_reload_colt45_notempty : POSITION_TYPE "prone" HAS_AMMO_IN_CLIP "mainhand"
		mpcxx_reload_colt45_notempty : POSITION_TYPE "crouching" HAS_AMMO_IN_CLIP "mainhand"
		mpsxx_reload_colt45_notempty : HAS_AMMO_IN_CLIP "mainhand"

		mpcxx_reload_colt45		: !RUN POSITION_TYPE "standing"
		mppxx_reload_colt45		: POSITION_TYPE "prone"
		mpcxx_reload_colt45		: POSITION_TYPE "crouching"
		mpsxx_reload_colt45		: default
	}

	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED
		STAND				: ANIMDONE_TORSO !RELOAD
		
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS	: IS_USING_TURRET
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS_SECONDARYATTACK	: +ATTACK_SECONDARY !POSITION_TYPE "prone"
		PUTAWAY_MAIN		: PUTAWAYMAIN
	}
}

state RELOAD_REVOLVER
{
	movetype legs

	entrycommands
	{
		viewmodelanim reload
	}

	action
	{
		mpcxx_reload_dump_two_sw45	: !HAS_THREE_BULLETS !RUN POSITION_TYPE "standing"
		mppxx_reload_dump_two_sw45	: !HAS_THREE_BULLETS POSITION_TYPE "prone"
		mpcxx_reload_dump_two_sw45	: !HAS_THREE_BULLETS POSITION_TYPE "crouching"
		mpsxx_reload_dump_two_sw45	: !HAS_THREE_BULLETS

		mpcxx_reload_dump_one_sw45	: !RUN POSITION_TYPE "standing"
		mppxx_reload_dump_one_sw45	: POSITION_TYPE "prone"
		mpcxx_reload_dump_one_sw45	: POSITION_TYPE "crouching"
		mpsxx_reload_dump_one_sw45	: default
	}

	states
	{
		STAND	 					: KILLED
		STAND						: INCAPACITATED
		RELOAD_INTERUPTED			: NEW_WEAPON
		
		RELOAD_DOUBLE_CLIP_REVOLVER		: ANIMDONE_TORSO !HAS_THREE_BULLETS
		RELOAD_SINGLE_CLIP_REVOLVER		: ANIMDONE_TORSO
		
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS	: IS_USING_TURRET
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS_SECONDARYATTACK	: +ATTACK_SECONDARY !POSITION_TYPE "prone"
		PUTAWAY_MAIN		: PUTAWAYMAIN
	}
}

state RELOAD_SINGLE_CLIP_REVOLVER
{
	movetype legs
	
	entrycommands
	{
		viewmodelanim reload_single
	}

	action
	{
		mpcxx_reload_one_sw45	: !RUN POSITION_TYPE "standing"
		mppxx_reload_one_sw45	: POSITION_TYPE "prone"
		mpcxx_reload_one_sw45	: POSITION_TYPE "crouching"
		mpsxx_reload_one_sw45	: default
	}
	
	states
	{
		STAND				: KILLED
		STAND				: INCAPACITATED
		STAND				: ANIMDONE_TORSO !RELOAD			
		RELOAD_INTERUPTED	: NEW_WEAPON
		
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS	: IS_USING_TURRET
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS_SECONDARYATTACK	: +ATTACK_SECONDARY !POSITION_TYPE "prone"

		PUTAWAY_MAIN		: PUTAWAYMAIN		
	}
}

state RELOAD_DOUBLE_CLIP_REVOLVER
{
	movetype legs
	
	entrycommands
	{
		viewmodelanim reload_end
	}
	
	action
	{
		mpcxx_reload_two_sw45	: !RUN POSITION_TYPE "standing"
		mppxx_reload_two_sw45	: POSITION_TYPE "prone"
		mpcxx_reload_two_sw45	: POSITION_TYPE "crouching"
		mpsxx_reload_two_sw45	: default
	}
	
	states
	{
		STAND				: KILLED
		STAND				: INCAPACITATED
		STAND				: ANIMDONE_TORSO !RELOAD
		RELOAD_INTERUPTED	: NEW_WEAPON
		
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS	: IS_USING_TURRET
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS_SECONDARYATTACK	: +ATTACK_SECONDARY !POSITION_TYPE "prone"

		PUTAWAY_MAIN		: PUTAWAYMAIN		
	}
}

state RELOAD_SMG
{
	movetype legs

	entrycommands
	{
		viewmodelanim reload 1
	}

	action
	{
		mmcxx_reload_johnson_notempty	: IS_WEAPON_ACTIVE "mainhand" "Johnson LMG" HAS_AMMO_IN_CLIP "mainhand" !RUN POSITION_TYPE "standing" 
		mmcxx_reload_johnson_notempty	: IS_WEAPON_ACTIVE "mainhand" "Johnson LMG" HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "crouching"
		mmpxx_reload_johnson_notempty	: IS_WEAPON_ACTIVE "mainhand" "Johnson LMG" HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "prone"
		mmsxx_reload_johnson_notempty	: IS_WEAPON_ACTIVE "mainhand" "Johnson LMG" HAS_AMMO_IN_CLIP "mainhand"		

		mmcxx_reload_johnson			: IS_WEAPON_ACTIVE "mainhand" "Johnson LMG" !RUN POSITION_TYPE "standing"
		mmpxx_reload_johnson			: IS_WEAPON_ACTIVE "mainhand" "Johnson LMG" POSITION_TYPE "prone"
		mmcxx_reload_johnson			: IS_WEAPON_ACTIVE "mainhand" "Johnson LMG" POSITION_TYPE "crouching"
		mmsxx_reload_johnson			: IS_WEAPON_ACTIVE "mainhand" "Johnson LMG"
		
		mmcxx_reload_type100_notempty	: IS_WEAPON_ACTIVE "mainhand" "Type 100 SMG" HAS_AMMO_IN_CLIP "mainhand" !RUN POSITION_TYPE "standing" 
		mmcxx_reload_type100_notempty	: IS_WEAPON_ACTIVE "mainhand" "Type 100 SMG" HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "crouching"
		mmpxx_reload_type100_notempty	: IS_WEAPON_ACTIVE "mainhand" "Type 100 SMG" HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "prone"
		mmsxx_reload_type100_notempty	: IS_WEAPON_ACTIVE "mainhand" "Type 100 SMG" HAS_AMMO_IN_CLIP "mainhand"		

		mmcxx_reload_type100			: IS_WEAPON_ACTIVE "mainhand" "Type 100 SMG" !RUN POSITION_TYPE "standing"
		mmpxx_reload_type100			: IS_WEAPON_ACTIVE "mainhand" "Type 100 SMG" POSITION_TYPE "prone"
		mmcxx_reload_type100			: IS_WEAPON_ACTIVE "mainhand" "Type 100 SMG" POSITION_TYPE "crouching"
		mmsxx_reload_type100			: IS_WEAPON_ACTIVE "mainhand" "Type 100 SMG"
		
		mmcxx_reload_reising_notempty	: IS_WEAPON_ACTIVE "mainhand" "Reising" HAS_AMMO_IN_CLIP "mainhand" !RUN POSITION_TYPE "standing" 
		mmcxx_reload_reising_notempty	: IS_WEAPON_ACTIVE "mainhand" "Reising" HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "crouching"
		mmpxx_reload_reising_notempty	: IS_WEAPON_ACTIVE "mainhand" "Reising" HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "prone"
		mmsxx_reload_reising_notempty	: IS_WEAPON_ACTIVE "mainhand" "Reising" HAS_AMMO_IN_CLIP "mainhand"
		
		mmcxx_reload_reising			: IS_WEAPON_ACTIVE "mainhand" "Reising" !RUN POSITION_TYPE "standing"
		mmpxx_reload_reising			: IS_WEAPON_ACTIVE "mainhand" "Reising" POSITION_TYPE "prone"
		mmcxx_reload_reising			: IS_WEAPON_ACTIVE "mainhand" "Reising" POSITION_TYPE "crouching"
		mmsxx_reload_reising			: IS_WEAPON_ACTIVE "mainhand" "Reising"
		
		mmcxx_reload_bar_notempty		: IS_WEAPON_ACTIVE "mainhand" "BAR" HAS_AMMO_IN_CLIP "mainhand" !RUN POSITION_TYPE "standing" 
		mmcxx_reload_bar_notempty		: IS_WEAPON_ACTIVE "mainhand" "BAR" HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "crouching"
		mmpxx_reload_bar_notempty		: IS_WEAPON_ACTIVE "mainhand" "BAR" HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "prone"
		mmsxx_reload_bar_notempty		: IS_WEAPON_ACTIVE "mainhand" "BAR" HAS_AMMO_IN_CLIP "mainhand"		

		mmcxx_reload_bar				: IS_WEAPON_ACTIVE "mainhand" "BAR" !RUN POSITION_TYPE "standing"
		mmpxx_reload_bar				: IS_WEAPON_ACTIVE "mainhand" "BAR" POSITION_TYPE "prone"
		mmcxx_reload_bar				: IS_WEAPON_ACTIVE "mainhand" "BAR" POSITION_TYPE "crouching"
		mmsxx_reload_bar				: IS_WEAPON_ACTIVE "mainhand" "BAR"
		
		mmcxx_reload_model96_notempty	: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG" HAS_AMMO_IN_CLIP "mainhand" !RUN POSITION_TYPE "standing" 
		mmcxx_reload_model96_notempty	: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG" HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "crouching"
		mmpxx_reload_model96_notempty	: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG" HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "prone"
		mmsxx_reload_model96_notempty	: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG" HAS_AMMO_IN_CLIP "mainhand"

		mmcxx_reload_model96			: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG" !RUN POSITION_TYPE "standing"
		mmpxx_reload_model96			: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG" POSITION_TYPE "prone"
		mmcxx_reload_model96			: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG" POSITION_TYPE "crouching"
		mmsxx_reload_model96			: IS_WEAPON_ACTIVE "mainhand" "Model96 LMG"
		
		mmcxx_reload_thompson30_notempty	: IS_WEAPON_ACTIVE "mainhand" "M1928A1 Thompson SMG 30" HAS_AMMO_IN_CLIP "mainhand" !RUN POSITION_TYPE "standing" 
		mmcxx_reload_thompson30_notempty	: IS_WEAPON_ACTIVE "mainhand" "M1928A1 Thompson SMG 30" HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "crouching"
		mmpxx_reload_thompson30_notempty	: IS_WEAPON_ACTIVE "mainhand" "M1928A1 Thompson SMG 30" HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "prone"
		mmsxx_reload_thompson30_notempty	: IS_WEAPON_ACTIVE "mainhand" "M1928A1 Thompson SMG 30" HAS_AMMO_IN_CLIP "mainhand"

		mmcxx_reload_thompson30			: IS_WEAPON_ACTIVE "mainhand" "M1928A1 Thompson SMG 30" !RUN POSITION_TYPE "standing"
		mmcxx_reload_thompson30			: IS_WEAPON_ACTIVE "mainhand" "M1928A1 Thompson SMG 30" POSITION_TYPE "crouching"
		mmpxx_reload_thompson30			: IS_WEAPON_ACTIVE "mainhand" "M1928A1 Thompson SMG 30" POSITION_TYPE "prone"
		mmsxx_reload_thompson30			: IS_WEAPON_ACTIVE "mainhand" "M1928A1 Thompson SMG 30"
		
		mmcxx_reload_thompson_notempty	: HAS_AMMO_IN_CLIP "mainhand" !RUN POSITION_TYPE "standing"
		mmcxx_reload_thompson_notempty	: HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "crouching"
		mmpxx_reload_thompson_notempty	: HAS_AMMO_IN_CLIP "mainhand" POSITION_TYPE "prone"
		mmsxx_reload_thompson_notempty	: HAS_AMMO_IN_CLIP "mainhand"

		mmcxx_reload_thompson			: !RUN POSITION_TYPE "standing"
		mmcxx_reload_thompson			: POSITION_TYPE "crouching"
		mmpxx_reload_thompson			: POSITION_TYPE "prone"
		mmsxx_reload_thompson			: default
	}

	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED
		STAND				: ANIMDONE_TORSO !RELOAD
		
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS	: IS_USING_TURRET
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS_SECONDARYATTACK	: +ATTACK_SECONDARY !POSITION_TYPE "prone"
		PUTAWAY_MAIN		: PUTAWAYMAIN
	}
}

state RELOAD_RIFLE
{
	movetype legs

	entrycommands
	{
		zoomoff
		viewmodelanim reload 1
	}

	action
	{
		mrcxx_reload_springfield	: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		mrcxx_reload_springfield	: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		mrpxx_reload_springfield	: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"
		mrsxx_reload_springfield	: IS_WEAPON_ACTIVE "mainhand" "M1903 Springfield Rifle"

		mrcxx_reload_arisaka		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "G Model 38 Arisaka"
		mrcxx_reload_arisaka		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "G Model 38 Arisaka"
		mrpxx_reload_arisaka		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "G Model 38 Arisaka"
		mrsxx_reload_arisaka		: IS_WEAPON_ACTIVE "mainhand" "G Model 38 Arisaka"
		
		mrcxx_reload_97sniper		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"
		mrcxx_reload_97sniper		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"
		mrpxx_reload_97sniper		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"
		mrsxx_reload_97sniper		: IS_WEAPON_ACTIVE "mainhand" "M97 Sniper Rifle"

		mrcxx_reload_44carbine		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		mrcxx_reload_44carbine		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		mrpxx_reload_44carbine		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Japan 44"
		mrsxx_reload_44carbine		: IS_WEAPON_ACTIVE "mainhand" "Japan 44"

		mrcxx_reload_garand			: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "M1 Garand"
		mrcxx_reload_garand			: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "M1 Garand"
		mrpxx_reload_garand			: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "M1 Garand"
		mrsxx_reload_garand			: IS_WEAPON_ACTIVE "mainhand" "M1 Garand"

		mmcxx_reload_shotgun		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmcxx_reload_shotgun		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmpxx_reload_shotgun		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmsxx_reload_shotgun		: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"

		mrcxx_reload_carbine_notempty	: !RUN POSITION_TYPE "standing" HAS_AMMO_IN_CLIP "mainhand"
		mrcxx_reload_carbine_notempty	: POSITION_TYPE "crouching" HAS_AMMO_IN_CLIP "mainhand" 
		mrpxx_reload_carbine_notempty	: POSITION_TYPE "prone" HAS_AMMO_IN_CLIP "mainhand" 
		mrsxx_reload_carbine_notempty	: HAS_AMMO_IN_CLIP "mainhand"
		
		mrcxx_reload_carbine		: !RUN POSITION_TYPE "standing"
		mrcxx_reload_carbine		: POSITION_TYPE "crouching"
		mrpxx_reload_carbine		: POSITION_TYPE "prone"
		mrsxx_reload_carbine		: default
	}

	states
	{
		STAND	 					: KILLED
		STAND						: INCAPACITATED
		STAND						: ANIMDONE_TORSO !RELOAD

		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS	: IS_USING_TURRET
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS_SECONDARYATTACK	: +ATTACK_SECONDARY !POSITION_TYPE "prone"
		PUTAWAY_MAIN		: PUTAWAYMAIN
	}
}

state RELOAD_SINGLE_BULLET_RIFLE
{
	movetype legs

	entrycommands
	{
		zoomoff
		viewmodelanim reload 1
	}

	action
	{
		mrcxx_reload_springsniper	: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrcxx_reload_springsniper	: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrpxx_reload_springsniper	: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrsxx_reload_springsniper	: IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		
		mmcxx_reload_shotgun		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmcxx_reload_shotgun		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmpxx_reload_shotgun		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmsxx_reload_shotgun		: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"		
	}

	states
	{
		STAND	 					: KILLED
		RELOAD_SINGLE_BULLET		: ANIMDONE_TORSO
		RELOAD_INTERUPTED			: NEW_WEAPON
		
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS	: IS_USING_TURRET
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS_SECONDARYATTACK	: +ATTACK_SECONDARY !POSITION_TYPE "prone"
		PUTAWAY_MAIN		: PUTAWAYMAIN
	}
}

state RELOAD_SINGLE_BULLET
{
	movetype legs
	
	entrycommands
	{
		viewmodelanim reload_single 1
	}
	
	action
	{
		mrcxx_reload_single_springsniper	: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrcxx_reload_single_springsniper	: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrpxx_reload_single_springsniper	: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrsxx_reload_single_springsniper	: IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
				
		mmcxx_reload_single_shotgun			: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmcxx_reload_single_shotgun			: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmpxx_reload_single_shotgun			: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmsxx_reload_single_shotgun			: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"		
	}
	
	states
	{
		STAND	 							: KILLED
		RELOAD_SINGLE_BULLET_END			: NEW_WEAPON
		
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS	: IS_USING_TURRET
		RELOAD_INTERUPTED_CORRECT_ATTACHMENTS_SECONDARYATTACK	: +ATTACK_SECONDARY !POSITION_TYPE "prone"

		// allow early out
		ATTACK_RIFLE_WHILE_RELOADING			: +ATTACK_PRIMARY HAS_AMMO_IN_CLIP "mainhand"
		RELOAD_SINGLE_BULLET_END				: PUTAWAYMAIN

		RELOAD_SINGLE_CHECK_CONTINUE	: ANIMDONE_TORSO
	}
}

state ATTACK_RIFLE_WHILE_RELOADING
{
	movetype legs
	
	entrycommands
	{
		reload_abort
	}
	
	action
	{
		mrcxx_reload_exit_springsniper	: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrcxx_reload_exit_springsniper	: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrpxx_reload_exit_springsniper	: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrsxx_reload_exit_springsniper	: IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		
		mmcxx_reload_exit_shotgun		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmcxx_reload_exit_shotgun		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmpxx_reload_exit_shotgun		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmsxx_reload_exit_shotgun		: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"		
	}

	states
	{
		STAND	 				: KILLED
		
		ATTACK_RIFLE_PRIMARY	: IS_WEAPONCLASS_READY_TO_FIRE "rifle"
	}
}

state RELOAD_SINGLE_CHECK_CONTINUE
{
	movetype legs

	entrycommands
	{
		reload
	}
	
	action
	{
		none					: default
	}
	
	states
	{
		RELOAD_SINGLE_BULLET			: RELOAD
		RELOAD_SINGLE_BULLET_END		: default
	}
}

state RELOAD_SINGLE_BULLET_END
{
	movetype legs
	
	entrycommands
	{
		viewmodelanim reload_end
	}
	
	action
	{
		mrcxx_reload_end_springsniper	: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrcxx_reload_end_springsniper	: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrpxx_reload_end_springsniper	: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		mrsxx_reload_end_springsniper	: IS_WEAPON_ACTIVE "mainhand" "Springfield M1903"
		
		mmcxx_reload_end_shotgun		: !RUN POSITION_TYPE "standing" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmcxx_reload_end_shotgun		: POSITION_TYPE "crouching" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmpxx_reload_end_shotgun		: POSITION_TYPE "prone" IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
		mmsxx_reload_end_shotgun		: IS_WEAPON_ACTIVE "mainhand" "Remington Riot"
	}

	states
	{
		STAND	 				: KILLED
		STAND	 				: ANIMDONE_TORSO
	}
}

state RELOAD_GRENADE
{
	movetype legs

	entrycommands
	{
		viewmodelanim reload
	}

	action
	{
		xgsxx_reload			: default
	}

	states
	{
		STAND	 				: KILLED
		STAND					: INCAPACITATED
		STAND					: ANIMDONE_TORSO !RELOAD 

//		RELOAD_INTERUPTED		: NEW_WEAPON // so quick, don't bother with interupting it
	}
}




state RELOAD_INTERUPTED
{
	states
	{
		STAND	: default
	}
}

state RELOAD_INTERUPTED_CORRECT_ATTACHMENTS
{
	entrycommands
	{
		correctweaponattachments
	}
	
	states
	{
		STAND	: default
	}
}

state RELOAD_INTERUPTED_SECONDARYATTACK
{
	states
	{
		CHECK_SECONDARY_ATTACK	: default
	}
}

state RELOAD_INTERUPTED_CORRECT_ATTACHMENTS_SECONDARYATTACK
{
	entrycommands
	{
		reload_abort
		correctweaponattachments
	}
	
	states
	{
		CHECK_SECONDARY_ATTACK	: default
	}
}

//==============================================================================
//
// Death
//
//==============================================================================

//state KILLED
//{
//	movetype legs
//
//	states
//	{
//		KILLED_ON_GROUND	: ONGROUND
//	}
//}

state KILLED
{
	movetype anim

	entrycommands
	{
		nextpaintime -1 // allow all pain calls to work properly for death anim selection
		aimadjustfov 0
	}

	states
	{
//@		KILLED_EXITCOMMAND_DEAD : PAIN_TYPE "vehicle"

		VERGE_OF_DEATH_START : DOING_VERGEOFDEATH
//		KILLED_EXPLOSION	: PAIN_TYPE "explosion"
//		KILLED_EXPLOSION	: PAIN_TYPE "grenade"
//		KILLED_EXPLOSION	: PAIN_TYPE "rocket"

//@		KILLED_EXITCOMMAND_DEAD	: !INCAPACITATED KILLED
		KILLED_RUNNING		: FORWARD_VELOCITY "130"
		KILLED_STANDING		: POSITION_TYPE "standing"
		KILLED_CROUCHING	: POSITION_TYPE "crouching"
		KILLED_PRONE		: POSITION_TYPE "prone"
		KILLED_STANDING		: default
	}
}


state KILLED_RUNNING
{
	states
	{
		KILLED_XPSXX_SHOT_RUNNING_IN_HEAD_01		: PAIN_LOCATION "head"
		KILLED_XPSXX_SHOT_RUNNING_IN_HEAD_01		: PAIN_LOCATION "helmet"
		KILLED_XPSXX_SHOT_RUNNING_IN_HEAD_01		: PAIN_LOCATION "neck"

		KILLED_XPSXX_SHOT_RUNNING_IN_RIGHTLEG_01		: PAIN_LOCATION "r_foot"
		KILLED_XPSXX_SHOT_RUNNING_IN_RIGHTLEG_01		: PAIN_LOCATION "r_leg_lower"
		KILLED_XPSXX_SHOT_RUNNING_IN_RIGHTLEG_01		: PAIN_LOCATION "r_leg_upper"

		KILLED_XPSXX_SHOT_RUNNING_IN_LEFTLEG_01		: PAIN_LOCATION "l_foot"
		KILLED_XPSXX_SHOT_RUNNING_IN_LEFTLEG_01		: PAIN_LOCATION "l_leg_lower"
		KILLED_XPSXX_SHOT_RUNNING_IN_LEFTLEG_01		: PAIN_LOCATION "l_leg_upper"

		KILLED_XPSXX_SHOT_RUNNING_IN_RIGHTARM_01		: PAIN_LOCATION "r_hand"
		KILLED_XPSXX_SHOT_RUNNING_IN_RIGHTARM_01		: PAIN_LOCATION "r_arm_lower"
		KILLED_XPSXX_SHOT_RUNNING_IN_RIGHTARM_01		: PAIN_LOCATION "r_arm_upper"

		KILLED_XPSXX_SHOT_RUNNING_IN_LEFTARM_01		: PAIN_LOCATION "l_hand"
		KILLED_XPSXX_SHOT_RUNNING_IN_LEFTARM_01		: PAIN_LOCATION "l_leg_lower"
		KILLED_XPSXX_SHOT_RUNNING_IN_LEFTARM_01		: PAIN_LOCATION "l_leg_upper"

		KILLED_XPSXX_SHOT_RUNNING_FROM_BACK_01		: PAIN_DIRECTION "back" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" CHANCE ".20"
		KILLED_XPSXX_SHOT_RUNNING_FROM_BACK_02		: PAIN_DIRECTION "back" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" CHANCE ".25"
		KILLED_XPSXX_SHOT_RUNNING_FROM_BACK_03		: PAIN_DIRECTION "back" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" CHANCE ".33"
		KILLED_XXXXX_SHOT_RUNNING_FROM_BACK_01		: PAIN_DIRECTION "back" CHANCE ".50"
		KILLED_XXXXX_SHOT_RUNNING_FROM_BACK_02		: PAIN_DIRECTION "back" 
		
		KILLED_XPSXX_SHOT_RUNNING_FROM_FRONT_01		: PAIN_DIRECTION "front" CHANCE ".25"
		KILLED_XPSXX_SHOT_RUNNING_FROM_FRONT_02		: PAIN_DIRECTION "front" CHANCE ".33"
//		KILLED_XPSXX_SHOT_RUNNING_FROM_FRONT_03		: PAIN_DIRECTION "front" CHANCE ".50"
		KILLED_XPSXX_SHOT_RUNNING_FROM_FRONT_04		: PAIN_DIRECTION "front"
		
		KILLED_XXXXX_SHOT_RUNNING_FROM_BACK_02		: default
	}
}



state KILLED_STANDING
{
	states
	{
		KILLED_XXSXX_SHOT_IN_CROTCH_01			: PAIN_LOCATION "pelvis"
		KILLED_XXSXX_SHOT_IN_CROTCH_01			: PAIN_LOCATION "torso_lower"

		KILLED_XPSXX_SHOT_IN_HEAD_01			: PAIN_LOCATION "head" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" CHANCE ".25"
		KILLED_XPSXX_SHOT_IN_HEAD_02			: PAIN_LOCATION "head" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" CHANCE ".33"
		KILLED_XXSXX_SHOT_IN_HEAD_01			: PAIN_LOCATION "head" CHANCE ".50"
		KILLED_XXSXX_SHOT_IN_HEAD_02			: PAIN_LOCATION "head"
		KILLED_XPSXX_SHOT_IN_HEAD_01			: PAIN_LOCATION "helmet" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" CHANCE ".25"
		KILLED_XPSXX_SHOT_IN_HEAD_02			: PAIN_LOCATION "helmet" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" CHANCE ".33"
		KILLED_XXSXX_SHOT_IN_HEAD_01			: PAIN_LOCATION "helmet" CHANCE ".50"
		KILLED_XXSXX_SHOT_IN_HEAD_02			: PAIN_LOCATION "helmet"
		KILLED_XPSXX_SHOT_IN_HEAD_01			: PAIN_LOCATION "neck" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" CHANCE ".25"
		KILLED_XPSXX_SHOT_IN_HEAD_02			: PAIN_LOCATION "neck" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" CHANCE ".33"
		KILLED_XXSXX_SHOT_IN_HEAD_01			: PAIN_LOCATION "neck" CHANCE ".50"
		KILLED_XXSXX_SHOT_IN_HEAD_02			: PAIN_LOCATION "neck"

		KILLED_XXSXX_SHOT_IN_LEFTARM_01			: PAIN_LOCATION "l_hand"
		KILLED_XXSXX_SHOT_IN_LEFTARM_01			: PAIN_LOCATION "l_arm_lower"
		KILLED_XXSXX_SHOT_IN_LEFTARM_01			: PAIN_LOCATION "l_arm_upper"

		KILLED_XXSXX_SHOT_IN_LEFTLEG_01			: PAIN_LOCATION "l_foot"
		KILLED_XXSXX_SHOT_IN_LEFTLEG_01			: PAIN_LOCATION "l_leg_lower"
		KILLED_XXSXX_SHOT_IN_LEFTLEG_01			: PAIN_LOCATION "l_leg_upper"

		KILLED_XXSXX_SHOT_IN_RIGHTARM_01			: PAIN_LOCATION "r_hand"
		KILLED_XXSXX_SHOT_IN_RIGHTARM_01			: PAIN_LOCATION "r_arm_lower"
		KILLED_XXSXX_SHOT_IN_RIGHTARM_01			: PAIN_LOCATION "r_arm_upper"

		KILLED_XXSXX_SHOT_IN_RIGHTLEG_01			: PAIN_LOCATION "r_foot"
		KILLED_XXSXX_SHOT_IN_RIGHTLEG_01			: PAIN_LOCATION "r_leg_lower"
		KILLED_XXSXX_SHOT_IN_RIGHTLEG_01			: PAIN_LOCATION "r_leg_upper"

		KILLED_XRSXX_SHOT_FROM_BACK_01			: PAIN_DIRECTION "back" IS_WEAPONCLASS_ACTIVE "mainhand" "rifle"
		KILLED_XXXXX_SHOT_FROM_BACK_01			: PAIN_DIRECTION "back" CHANCE ".50"
		KILLED_XXXXX_SHOT_FROM_BACK_02			: PAIN_DIRECTION "back"

		KILLED_XPSXX_SHOT_FROM_FRONT_01			: PAIN_DIRECTION "front" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" CHANCE ".14"
		KILLED_XPSXX_SHOT_FROM_FRONT_02			: PAIN_DIRECTION "front" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" CHANCE ".16"
		KILLED_XPSXX_SHOT_FROM_FRONT_03			: PAIN_DIRECTION "front" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" CHANCE ".20"
		KILLED_XRSXX_SHOT_FROM_FRONT_01			: PAIN_DIRECTION "front" IS_WEAPONCLASS_ACTIVE "mainhand" "pistol" CHANCE ".20"
//		KILLED_XXSXX_SHOT_FROM_FRONT_01			: PAIN_DIRECTION "front" CHANCE ".25" // this anim's end isn't aligned with pain idles
		KILLED_XXSXX_SHOT_FROM_FRONT_02			: PAIN_DIRECTION "front" CHANCE ".33"
//		KILLED_XXSXX_SHOT_FROM_FRONT_03			: PAIN_DIRECTION "front" CHANCE ".50" // this anim's end isn't aligned with pain idles
//		KILLED_XXXXX_SHOT_FROM_FRONT_01			: PAIN_DIRECTION "front" // this anim's end isn't aligned with pain idles
		
		KILLED_XXSXX_SHOT_IN_HEAD_01			: default
	}
}

state KILLED_CROUCHING
{
	states
	{
		KILLED_XRCDX_SHOT_CROUCHING_IN_HEAD_01		: PAIN_LOCATION "head"
		KILLED_XRCDX_SHOT_CROUCHING_IN_HEAD_01		: PAIN_LOCATION "helmet"
		KILLED_XRCDX_SHOT_CROUCHING_IN_HEAD_01		: PAIN_LOCATION "neck"

		KILLED_XRCDX_SHOT_CROUCHING_IN_LEFTARM_01	: PAIN_LOCATION "l_hand"
		KILLED_XRCDX_SHOT_CROUCHING_IN_LEFTARM_01	: PAIN_LOCATION "l_arm_lower"
		KILLED_XRCDX_SHOT_CROUCHING_IN_LEFTARM_01	: PAIN_LOCATION "l_arm_upper"

		KILLED_XRCDX_SHOT_CROUCHING_IN_RIGHTARM_01	: PAIN_LOCATION "r_hand"
		KILLED_XRCDX_SHOT_CROUCHING_IN_RIGHTARM_01	: PAIN_LOCATION "r_arm_lower"
		KILLED_XRCDX_SHOT_CROUCHING_IN_RIGHTARM_01	: PAIN_LOCATION "r_arm_upper"

		KILLED_XRCDX_SHOT_CROUCHING_IN_LEFTLEG_01	: PAIN_LOCATION "l_foot"
		KILLED_XRCDX_SHOT_CROUCHING_IN_LEFTLEG_01	: PAIN_LOCATION "l_leg_lower"
		KILLED_XRCDX_SHOT_CROUCHING_IN_LEFTLEG_01	: PAIN_LOCATION "l_leg_upper"

		KILLED_XRCDX_SHOT_CROUCHING_IN_RIGHTLEG_01	: PAIN_LOCATION "r_foot"
		KILLED_XRCDX_SHOT_CROUCHING_IN_RIGHTLEG_01	: PAIN_LOCATION "r_leg_lower"
		KILLED_XRCDX_SHOT_CROUCHING_IN_RIGHTLEG_01	: PAIN_LOCATION "r_leg_upper"

		KILLED_XRCDX_SHOT_CROUCHING_IN_CHEST_01		: PAIN_LOCATION "torso_upper"
		KILLED_XRCDX_SHOT_CROUCHING_IN_CHEST_01		: PAIN_LOCATION "torso_mid"
		KILLED_XRCDX_SHOT_CROUCHING_IN_CHEST_01		: default
	}
}

state KILLED_PRONE
{
	states
	{
		KILLED_XMPDX_SHOT_PRONE_FROM_FRONT_03		: PAIN_LOCATION "head"
		KILLED_XMPDX_SHOT_PRONE_FROM_FRONT_03		: PAIN_LOCATION "helmet"
		KILLED_XMPDX_SHOT_PRONE_FROM_FRONT_03		: PAIN_LOCATION "neck"
		KILLED_XMPDX_SHOT_PRONE_FROM_FRONT_03		: PAIN_DIRECTION "front"
		KILLED_XMPDX_SHOT_PRONE_FROM_FRONT_01		: CHANCE ".50" 
		KILLED_XMPDX_SHOT_PRONE_FROM_FRONT_02		: default
	}
}

state KILLED_XPSXX_SHOT_RUNNING_IN_HEAD_01
{
	legs
	{
		xpsxx_shot_running_in_head_01 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XPSXX_SHOT_RUNNING_IN_RIGHTLEG_01
{
	legs
	{
		xpsxx_shot_running_in_rightleg_01 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XPSXX_SHOT_RUNNING_IN_LEFTLEG_01
{
	legs
	{
		xpsxx_shot_running_in_leftleg_01 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XPSXX_SHOT_RUNNING_IN_RIGHTARM_01
{
	legs
	{
		xpsxx_shot_running_in_rightarm_01 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XPSXX_SHOT_RUNNING_IN_LEFTARM_01
{
	legs
	{
		xpsxx_shot_running_in_leftarm_01 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XPSXX_SHOT_RUNNING_FROM_BACK_01
{
	legs
	{
		xpsxx_shot_running_from_back_01 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XPSXX_SHOT_RUNNING_FROM_BACK_02
{
	legs
	{
		xpsxx_shot_running_from_back_02 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XPSXX_SHOT_RUNNING_FROM_BACK_03
{
	legs
	{
		xpsxx_shot_running_from_back_03 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XXXXX_SHOT_RUNNING_FROM_BACK_01
{
	legs
	{
		xxxxx_shot_running_from_back_01 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XXXXX_SHOT_RUNNING_FROM_BACK_02
{
	legs
	{
		xxxxx_shot_running_from_back_02 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XPSXX_SHOT_RUNNING_FROM_FRONT_01
{
	legs
	{
		xpsxx_shot_running_from_front_01 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XPSXX_SHOT_RUNNING_FROM_FRONT_02
{
	legs
	{
		xpsxx_shot_running_from_front_02 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

//state KILLED_XPSXX_SHOT_RUNNING_FROM_FRONT_03
//{
//	legs
//	{
//		xpsxx_shot_running_from_front_03 : default
//	}
//	
//	states
//	{
//		KILLED_FACE_UP : default
//	}
//}

state KILLED_XPSXX_SHOT_RUNNING_FROM_FRONT_04
{
	legs
	{
		xpsxx_shot_running_from_front_04 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XXSXX_SHOT_IN_CROTCH_01
{
	legs
	{
		xxsxx_shot_in_crotch_01 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XPSXX_SHOT_IN_HEAD_01
{
	legs
	{
		xpsxx_shot_in_head_01 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XPSXX_SHOT_IN_HEAD_02
{
	legs
	{
		xpsxx_shot_in_head_02 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XXSXX_SHOT_IN_HEAD_01
{
	legs
	{
		xxsxx_shot_in_head_01 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XXSXX_SHOT_IN_HEAD_02
{
	legs
	{
		xxsxx_shot_in_head_02 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XXSXX_SHOT_IN_LEFTARM_01
{
	legs
	{
		xxsxx_shot_in_leftarm_01 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XXSXX_SHOT_IN_LEFTLEG_01
{
	legs
	{
		xxsxx_shot_in_leftleg_01 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XXSXX_SHOT_IN_RIGHTARM_01
{
	legs
	{
		xxsxx_shot_in_rightarm_01 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XXSXX_SHOT_IN_RIGHTLEG_01
{
	legs
	{
		xxsxx_shot_in_rightleg_01 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XRSXX_SHOT_FROM_BACK_01
{
	legs
	{
		xrsxx_shot_from_back_01 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XXXXX_SHOT_FROM_BACK_01
{
	legs
	{
		xxxxx_shot_from_back_01 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XXXXX_SHOT_FROM_BACK_02
{
	legs
	{
		xxxxx_shot_from_back_02 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XPSXX_SHOT_FROM_FRONT_01
{
	legs
	{
		xpsxx_shot_from_front_01 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XPSXX_SHOT_FROM_FRONT_02
{
	legs
	{
		xpsxx_shot_from_front_02 : default
	}

	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XPSXX_SHOT_FROM_FRONT_03
{
	legs
	{
		xpsxx_shot_from_front_03 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XRSXX_SHOT_FROM_FRONT_01
{
	legs
	{
		xrsxx_shot_from_front_01 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XXSXX_SHOT_FROM_FRONT_01
{
	legs
	{
		xxsxx_shot_from_front_01 : default
	}

	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XXSXX_SHOT_FROM_FRONT_02
{
	legs
	{
		xxsxx_shot_from_front_02 : default
	}
	
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XXSXX_SHOT_FROM_FRONT_03
{
	legs
	{
		xxsxx_shot_from_front_03 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XXXXX_SHOT_FROM_FRONT_01
{
	legs
	{
		xxxxx_shot_from_front_01 : default
	}
		
	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XRCDX_SHOT_CROUCHING_IN_HEAD_01
{
	legs
	{
		xrcdx_shot_crouching_in_head_01 : default
	}

	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XRCDX_SHOT_CROUCHING_IN_LEFTARM_01
{
	legs
	{
		xrcdx_shot_crouching_in_leftarm_01 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XRCDX_SHOT_CROUCHING_IN_RIGHTARM_01
{
	legs
	{
		xrcdx_shot_crouching_in_rightarm_01 : default
	}

	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XRCDX_SHOT_CROUCHING_IN_LEFTLEG_01
{
	legs
	{
		xrcdx_shot_crouching_in_leftleg_01 : default
	}

	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XRCDX_SHOT_CROUCHING_IN_RIGHTLEG_01
{
	legs
	{
		xrcdx_shot_crouching_in_rightleg_01 : default
	}

	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XRCDX_SHOT_CROUCHING_IN_CHEST_01
{
	legs
	{
		xrcdx_shot_crouching_in_chest_01 : default
	}

	states
	{
		KILLED_FACE_UP : default
	}
}

state KILLED_XMPDX_SHOT_PRONE_FROM_FRONT_03
{
	legs
	{
		xmpdx_shot_prone_from_front_03 : default
	}

	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XMPDX_SHOT_PRONE_FROM_FRONT_01
{
	legs
	{
		xmpdx_shot_prone_from_front_01 : default
	}

	states
	{
		KILLED_FACE_DOWN : default
	}
}

state KILLED_XMPDX_SHOT_PRONE_FROM_FRONT_02
{
	legs
	{
		xmpdx_shot_prone_from_front_02 : default
	}
	
	states
	{
		KILLED_FACE_DOWN : default
	}
}

//state KILLED_EXPLOSION
//{
//	legs
//	{
//		xxxxx_death_explosion_large	: PAIN_THRESHOLD "150"
////		xxxxx_death_explosion_small	: PAIN_THRESHOLD "130"
//		
//		// directional death animations of in middle damage range
////		xxxxx_death_explosion_front	: PAIN_DIRECTION "rear"
//		xxxxx_death_explosion_back	: PAIN_DIRECTION "front"
//		xxxxx_death_explosion_left	: PAIN_DIRECTION "left"
//		xxxxx_death_explosion_right	: PAIN_DIRECTION "right"
//		
//		xxxxx_death_explosion_small	: default // a just-in-case catch-all
//	}
//	
//	states
//	{
//		KILLED_WAIT_FOR_DONE	: default
//	}
//}

//state KILLED_WAIT_FOR_DONE
//{
//	states
//	{
//		INCAPACITATED		: ANIMDONE_LEGS INCAPACITATED
//		KILLED_EXITCOMMAND_DEAD	: ANIMDONE_LEGS KILLED
//	}
//}

// This state figures out whether we're dying or just incapacitated (face down).
state KILLED_FACE_DOWN
{
	states
	{
		DO_INCAPACITATED_FACE_DOWN	: INCAPACITATED !KILLED
		DO_KILLED_FACE_DOWN			: KILLED !INCAPACITATED
		DO_KILLED_FACE_DOWN			: default	// just in case
	}
}

// This state figures out whether we're dying or just incapacitated (face up).
state KILLED_FACE_UP
{
	states
	{
		DO_INCAPACITATED_FACE_UP	: INCAPACITATED !KILLED
		DO_KILLED_FACE_UP			: KILLED !INCAPACITATED
		DO_KILLED_FACE_UP			: default	// just in case
	}
}

// This state waits until the "death" animation is done, then goes into an
// incapacitated state (face down).
state DO_INCAPACITATED_FACE_DOWN
{
	states
	{
		INCAPACITATED_FACE_DOWN		: ANIMDONE_LEGS
	}
}

// This state waits until the "death" animation is done, then goes into an
// incapacitated state (face up).
state DO_INCAPACITATED_FACE_UP
{
	states
	{
		INCAPACITATED_FACE_UP		: ANIMDONE_LEGS
	}
}

// This state calls 'dead' to create a dead body that will properly assume the
// animation of the player, and then puts it into ragdoll (face down).  Meanwhile,
// the player's state machine can go on to being done dying.
state DO_KILLED_FACE_DOWN
{
	entrycommands
	{
		dead				// make sure the player dies correctly
	}
	
	states
	{
		KILLED_EXITCOMMAND_DEAD		: ANIMDONE_LEGS
	}
}

// This state calls 'dead' to create a dead body that will properly assume the
// animation of the player, and then puts it into ragdoll (face down).  Meanwhile,
// the player's state machine can go on to being done dying.
state DO_KILLED_FACE_UP
{
	entrycommands
	{
		dead				// make sure the player dies correctly
	}

	states
	{
		KILLED_EXITCOMMAND_DEAD		: ANIMDONE_LEGS
	}
}

state KILLED_EXITCOMMAND_DEAD
{
	states
	{
		KILLED_DONE		: ANIMDONE_LEGS
	}

	exitcommands
	{
		dead				// make sure the player dies correctly
	}
}

state KILLED_DONE
{
	movetype anim
}

state INCAPACITATED_FACE_UP
{
	entrycommands
	{
		modheight "prone"
	}
	
	action
	{
//		xxxxx_pain_on_back_04		: CHANCE ".16" // does NOT end in dead position (requires a death anim afterwards to look good)
//		xxxxx_pain_on_back_05		: CHANCE ".20" // does NOT end in dead position (requires a death anim afterwards to look good)
//		xxxxx_pain_on_back_06		: CHANCE ".25" // does NOT end in dead position (requires a death anim afterwards to look good)
//		xxxxx_pain_on_back_07		: CHANCE ".33" // does NOT end in dead position (requires a death anim afterwards to look good)
		xxxxx_pain_on_back_01		: CHANCE ".50" // DOES end in a dead position
		xxxxx_pain_on_back_02		: default // DOES end in a dead position
	}
	
	states
	{
//		INCAPACITATED_FACE_UP_TO_FACE_DOWN	: ANIMDONE_TORSO CHANCE "4" // currently not used because the player does a 180
		INCAPACITATED_FACE_UP_RECOVERING	: !INCAPACITATED !KILLED			
		KILLED_INCAPACITATED_FACE_UP		: !INCAPACITATED KILLED
		INCAPACITATED_FACE_UP			: ANIMDONE_TORSO
	}
}

//state INCAPACITATED_FACE_UP_TO_FACE_DOWN
//{
//	action
//	{
//		xxxxx_pain_back_to_belly_01	: CHANCE ".33"
//		xxxxx_pain_back_to_belly_02	: CHANCE ".50"
//		xxxxx_pain_back_to_belly_03	: default
//	}
//	
//	states
//	{
//		INCAPACITATED_FACE_DOWN		: ANIMDONE_TORSO	
//	}	
//}

state INCAPACITATED_FACE_DOWN
{
	entrycommands
	{
		modheight "prone"
	}	
	
	action
	{
//		xxxxx_pain_on_belly_02		: CHANCE ".16" // does NOT end in dead position (requires a death anim afterwards to look good)
//		xxxxx_pain_on_belly_03		: CHANCE ".20" // does NOT end in dead position (requires a death anim afterwards to look good)
//		xxxxx_pain_on_belly_04		: CHANCE ".20" // does NOT end in dead position (requires a death anim afterwards to look good)
		xxxxx_pain_on_belly_06		: CHANCE ".25" // DOES end in a dead position
		xxxxx_pain_on_belly_07		: CHANCE ".33" // DOES end in a dead position
		xxxxx_pain_on_belly_08		: default // DOES end in a dead position
	}
	
	states
	{
//		INCAPACITATED_FACE_DOWN_TO_FACE_UP	: ANIMDONE_TORSO CHANCE "4" // currently not used because the player does a 180
		INCAPACITATED_FACE_DOWN_RECOVERING	: !INCAPACITATED !KILLED			
		KILLED_INCAPACITATED_FACE_DOWN		: !INCAPACITATED KILLED
		INCAPACITATED_FACE_DOWN			: ANIMDONE_TORSO
	}	
}

//state INCAPACITATED_FACE_DOWN_TO_FACE_UP
//{
//	action
//	{
//		xxxxx_pain_belly_to_back_01	: CHANCE ".50"
//		xxxxx_pain_belly_to_back_02	: default
//	}
//	
//	states
//	{
//		INCAPACITATED_FACE_UP		: ANIMDONE_TORSO	
//	}	
//}

state INCAPACITATED_FACE_UP_RECOVERING
{
	action
	{
		xxxxx_recover_from_back_01	: CHANCE ".50"
		xxxxx_recover_from_back_02	: default
	}
	
	states
	{
		AIM_IDLE_CROUCH			: ANIMDONE_TORSO	
	}
}

state INCAPACITATED_FACE_DOWN_RECOVERING
{
	action
	{
		xxxxx_recover_from_belly_01	: CHANCE ".50"
		xxxxx_recover_from_belly_02	: default
	}
	
	states
	{
		AIM_IDLE_CROUCH			: ANIMDONE_TORSO
	}
}

state KILLED_INCAPACITATED_FACE_UP
{
	action
	{
		xrxxx_shot_incapacitated_on_back_01	: default
	}
	
	states
	{
		KILLED_EXITCOMMAND_DEAD			: default
	}	
}

state KILLED_INCAPACITATED_FACE_DOWN
{
	action
	{
		xrxxx_shot_incapacitated_on_belly_01	: default
	}
	
	states
	{
		KILLED_EXITCOMMAND_DEAD			: default
	}	
}

state INCAPACITATED
{
	states
	{
		INCAPACITATED_DONE	: !INCAPACITATED !KILLED
		KILLED_EXITCOMMAND_DEAD	: !INCAPACITATED KILLED
	}
}

state INCAPACITATED_DONE
{
	movetype anim
	
	states
	{
		AIM_IDLE_PRONE		: default
	}
}


//==============================================================================
//==============================================================================
//
// Ladder Climbing
//
//==============================================================================

state USE_LADDER
{
	movetype climbwall
	
	entrycommands
	{
		safeholster 1 // put our weapon away
		attachtoladder // gets the ladder we're going to be climbing
	}
	
	states 
	{
		LADDER_PUTAWAY			: PUTAWAYMAIN
		LATCH_ONTO_LADDER			: !ONGROUND 
		GET_ON_LADDER			: default
	}
}

state LADDER_PUTAWAY
{
	entrycommands
	{
		deactivateweapon righthand
	}
	
	states
	{
		LATCH_ONTO_LADDER			: !ONGROUND 
		GET_ON_LADDER			: default
	}
}

state GET_ON_LADDER
{
	movetype climbwall


	// these entry commands ensure that the player 
	// will be standing when he gets off the ladder
	entrycommands
	{
		modheight "stand"
		movementstealth "1.0"
		moveposflags "standing"
	}

	action
	{
		ladder_geton_top			: AT_TOP_OF_LADDER
		ladder_geton_bottom		: default
	}
	
	states
	{
		FINISHED_GET_OFF_LADDER		: KILLED
	
		// we go to LADDER_LEFT because the left hand will be up once we're on
		LADDER_IDLE_LEFT			: ANIMDONE_TORSO
	}
}

// This is for when the player grabs the ladder while not on the ground
state LATCH_ONTO_LADDER
{
	movetype climbwall

	// these entry commands ensure that the player 
	// will be standing when he gets off the ladder
	entrycommands
	{
		modheight "stand"
		movementstealth "1.0"
		moveposflags "standing"
		tweakladderpos // make sure we're positioned properly on the ladder
	}
	
	states
	{
		LADDER_DOWN_LEFT			: default
	}
}

state GET_OFF_LADDER_TOP
{
	movetype climbwall
	
	action
	{
		ladder_getoff_top			: default
	}
	
	states
	{
		FINISHED_GET_OFF_LADDER		: KILLED
		
		FINISHED_GET_OFF_LADDER		: ANIMDONE_TORSO
	}
}

state GET_OFF_LADDER_BOTTOM
{
	movetype climbwall
	
	action
	{
		ladder_getoff_bottom		: default
	}
	
	states
	{
		FINISHED_GET_OFF_LADDER		: KILLED
	
		FINISHED_GET_OFF_LADDER		: ANIMDONE_TORSO
	}
}

state FINISHED_GET_OFF_LADDER
{
	movetype legs
	
	entrycommands
	{
		unattachfromladder
		safeholster 0 // pull weapon back out if we put it away to get on the ladder
	}

	states
	{
		STAND					: default
	}
}

// same as FINISHED_GET_OFF_LADDER, except that the player is jumping off
state JUMP_OFF_LADDER
{
	movetype legs
	
	entrycommands
	{
		unattachfromladder
		safeholster 0 // pull weapon back out if we put it away to get on the ladder
		jumpxy -70 0 150
	}

	states
	{
		STAND					: default
	}
}

// idling on a ladder with the left hand high
state LADDER_IDLE_LEFT
{
	movetype climbwall

	entrycommands
	{
		tweakladderpos // make sure we're positioned properly on the ladder
	}
	
	action
	{
		ladder_idle_left			: default
	}

	states
	{
		FINISHED_GET_OFF_LADDER	: KILLED
		
		// check for emergency getaway
		JUMP_OFF_LADDER			: +JUMP
		
		PUTAWAY_MAIN			: PUTAWAYMAIN	// just in case the weapon isn't put away yet
		
		// check for getting off top of the ladder
		GET_OFF_LADDER_TOP		: FORWARD LOOKING_UP "-30" CAN_GET_OFF_LADDER_TOP
		GET_OFF_LADDER_TOP		: BACKWARD !LOOKING_UP "-30" CAN_GET_OFF_LADDER_TOP

		// check for getting off bottom of the ladder
		GET_OFF_LADDER_BOTTOM	      : FORWARD !LOOKING_UP "-30" CAN_GET_OFF_LADDER_BOTTOM
		GET_OFF_LADDER_BOTTOM	      : BACKWARD LOOKING_UP "-30" CAN_GET_OFF_LADDER_BOTTOM
		
		LADDER_UP_RIGHT			: FORWARD LOOKING_UP "-30" CAN_CLIMB_UP_LADDER
		LADDER_UP_RIGHT			: BACKWARD !LOOKING_UP "-30" CAN_CLIMB_UP_LADDER
		
		LADDER_DOWN_LEFT			: FORWARD !LOOKING_UP "-30" CAN_CLIMB_DOWN_LADDER
		LADDER_DOWN_LEFT			: BACKWARD LOOKING_UP "-30" CAN_CLIMB_DOWN_LADDER
	}
}

// idling on a ladder with the right hand high
state LADDER_IDLE_RIGHT
{
	movetype climbwall
	
	entrycommands
	{
		tweakladderpos // make sure we're positioned properly on the ladder
	}
	
	action
	{
		ladder_idle_right			: default
	}
	
	states
	{
		FINISHED_GET_OFF_LADDER 	: KILLED
	
		// check for emergency getaway
		JUMP_OFF_LADDER			: +JUMP
		
		PUTAWAY_MAIN			: PUTAWAYMAIN	// just in case the weapon isn't put away yet
		
		// check for getting off top of the ladder
		GET_OFF_LADDER_TOP		: FORWARD LOOKING_UP "-30" CAN_GET_OFF_LADDER_TOP
		GET_OFF_LADDER_TOP		: BACKWARD !LOOKING_UP "-30" CAN_GET_OFF_LADDER_TOP

		// check for getting off bottom of the ladder
		GET_OFF_LADDER_BOTTOM	      : FORWARD !LOOKING_UP "-30" CAN_GET_OFF_LADDER_BOTTOM
		GET_OFF_LADDER_BOTTOM	      : BACKWARD LOOKING_UP "-30" CAN_GET_OFF_LADDER_BOTTOM
		
		LADDER_UP_LEFT			: FORWARD LOOKING_UP "-30" CAN_CLIMB_UP_LADDER
		LADDER_UP_LEFT			: BACKWARD !LOOKING_UP "-30" CAN_CLIMB_UP_LADDER
		
		LADDER_DOWN_RIGHT			: FORWARD !LOOKING_UP "-30" CAN_CLIMB_DOWN_LADDER
		LADDER_DOWN_RIGHT			: BACKWARD LOOKING_UP "-30" CAN_CLIMB_DOWN_LADDER
	}
}

state LADDER_UP_LEFT
{
	movetype climbwall
	
	entrycommands
	{
//		tweakladderpos // make sure we're positioned properly on the ladder
	}
	
	legs
	{
		ladder_up_left			: default
	}
	
	states
	{
		FINISHED_GET_OFF_LADDER	      : KILLED
		
		// check for emergency getaway
		JUMP_OFF_LADDER			: +JUMP
		
		LADDER_IDLE_LEFT			: ANIMDONE_LEGS
	}
}

state LADDER_UP_RIGHT
{
	movetype climbwall
	
	entrycommands
	{
//		tweakladderpos // make sure we're positioned properly on the ladder
	}
	
	legs
	{
		ladder_up_right			: default
	}
	
	states
	{
		FINISHED_GET_OFF_LADDER	      : KILLED
		FINISHED_GET_OFF_LADDER	      : INCAPACITATED
		
		// check for emergency getaway
		JUMP_OFF_LADDER			: +JUMP
		
		LADDER_IDLE_RIGHT			: ANIMDONE_LEGS
	}
}

state LADDER_DOWN_LEFT
{
	movetype climbwall
	
	entrycommands
	{
//		tweakladderpos // make sure we're positioned properly on the ladder
	}
	
	legs
	{
		ladder_down_left			: default
	}
	
	states
	{
		FINISHED_GET_OFF_LADDER	      : KILLED
		FINISHED_GET_OFF_LADDER	      : INCAPACITATED
		
		// check for emergency getaway
		JUMP_OFF_LADDER			: +JUMP
		
		LADDER_IDLE_RIGHT			: ANIMDONE_LEGS
	}
}

state LADDER_DOWN_RIGHT
{
	movetype climbwall
	
	entrycommands
	{
//		tweakladderpos // make sure we're positioned properly on the ladder
	}
	
	legs
	{
		ladder_down_right			: default
	}
	
	states
	{
		FINISHED_GET_OFF_LADDER	      : KILLED
		FINISHED_GET_OFF_LADDER	      : INCAPACITATED
		
		// check for emergency getaway
		JUMP_OFF_LADDER			: +JUMP
		
		LADDER_IDLE_LEFT			: ANIMDONE_LEGS
	}
}

state LADDER_SLIDE
{
	movetype climbwall
	
	action
	{
		ladder_slide			: default
	}
	
	states
	{
		FINISHED_GET_OFF_LADDER	      : KILLED
		FINISHED_GET_OFF_LADDER	      : INCAPACITATED
		
		// check for emergency getaway
		FINISHED_GET_OFF_LADDER	      : +JUMP
		
		FINISHED_GET_OFF_LADDER	      : ONGROUND
		LADDER_IDLE_LEFT			: !CROUCH
	}
}


//==============================================================================
//==============================================================================
//
// Generic Use
//
//==============================================================================

state GENERIC_USE
{
	entrycommands
	{
		usestuff
	}

	states
	{
		STAND	: default
	}
}


//==============================================================================
//==============================================================================
//
// Vehicles
//
//==============================================================================

state VEHICLE_PUTAWAY
{
	entrycommands
	{
		deactivateweapon righthand
	}
	
	states
	{
		VEHICLE_IDLE	: default
	}
}

state VEHICLE_START
{
	movetype legs
	legs
	{
		unarmed_idle : default
	}
	
	states
	{
		VEHICLE_IDLE : default
		//VEHICLE_ENTER : default
		STAND	: !IS_USING_VEHICLE
	}
}

state VEHICLE_TURRET_IDLE
{
	entrycommands
	{
		modheight "duck"
		moveposflags "crouching"
	}

	exitcommands
	{
		modheight "stand"
		moveposflags "standing"
	}

	movetype anim
	
	action
	{
		aagun_idle	: VEHICLE_TYPE "aagun"
		flak88_idle	: VEHICLE_TYPE "flak88"
		vehicle_idle	: default
	}
	
	states
	{
		VEHICLE_USE		: +USE
		STAND			: !IS_USING_VEHICLE
	}
}

state VEHICLE_NORMAL_IDLE
{
	movetype anim
	
	action
	{
		vehicle_idle	: default
	}
	
	states
	{
		VEHICLE_USE		: +USE
		STAND			: !IS_USING_VEHICLE
	}
}


state VEHICLE_IDLE
{
	states
	{
		VEHICLE_TURRET_IDLE	: VEHICLE_TYPE "aagun"
		VEHICLE_TURRET_IDLE	: VEHICLE_TYPE "flak88"
		VEHICLE_NORMAL_IDLE	: default
	}
}

state VEHICLE_USE
{
	movetype anim

//	entrycommands
//	{
//		usestuff
//	}

	action
	{
		vehicle_idle			: default
	}

	states
	{
		VEHICLE_IDLE	: default
	}
}


//==============================================================================
//==============================================================================
//
// Turrets
//
//==============================================================================

state TURRET_PUTAWAY
{
	entrycommands
	{
		deactivateweapon righthand
	}
	
	states
	{
		TURRET_IDLE		: default
	}
}

state TURRET_START
{
//	movetype anim
	
//	action
//	{
//		turret_idle		: default
//	}
	
	states
	{
		TURRET_PUTAWAY	: PUTAWAYMAIN	// Basic put weapon away move.
		TURRET_IDLE		: default
	}
}

state TURRET_IDLE
{
	movetype legs

	entrycommands
	{
		enableikonlefthand
		enableikonrighthand
	}
	
	exitcommands
	{
		disableikonlefthand
		disableikonrighthand
	}

	action
	{
//		mg42tripod_crouch_aim_straight_straight		: IS_WEAPON_ACTIVE "mainhand" "Packed Anti-Tank Rifle"
//		mg42tripod_crouch_aim_straight_straight		: IS_WEAPON_ACTIVE "mainhand" "Packed M92 Portable Machine Gun"
//		//mg42tripod_crouch_aim_straight_straight	: IS_WEAPON_ACTIVE "mainhand" "Packed MG42 Turret"
		mxcxx_MW_Morter_Idle				: IS_WEAPON_ACTIVE "mainhand" "US M2 60MM Mortar"
		mxcxx_MW_Morter_Idle				: IS_WEAPON_ACTIVE "mainhand" "M99 81mm Mortar"
		mxsxx_MW_Mounted_Idle						: default
	}
	
	states
	{
//		TURRET_USE		: +USE
//		GENERIC_USE		: +USE
		STAND			: !IS_USING_TURRET
	}
}

//state TURRET_USE
//{
//	movetype anim
//
//	entrycommands
//	{
//		usestuff
//	}
//
//	action
//	{
//		turret_idle		: default
//	}
//
//	states
//	{
//		TURRET_IDLE	: default
//	}
//}

state NO_ANIMATION
{
	movetype legs
	
	action
	{
		none		: default
	}
	
	states
	{
		STAND	 			: KILLED
		STAND				: INCAPACITATED
	}
}


////////////////////////////////
//Verge of Death
////////////////////////////////
state VERGE_OF_DEATH_START
{
	movetype anim
	entrycommands
	{
		setanimatedview 1
	}
	action
	{
		jrsxx_finishing_player			: default
	}
	legs
	{
		jrsxx_finishing_player			: default
	}
	states
	{
		VERGE_OF_DEATH		: ANIMDONE_TORSO
		VERGE_OF_DEATH_WAKE	: !UNDEAD
	}
}

state VERGE_OF_DEATH
{
	movetype anim
	action
	{
		jrsxx_finishing_player_fallen_idle	: default
	}
	legs
	{
		jrsxx_finishing_player_fallen_idle	: default
	}
	states
	{
		VERGE_OF_DEATH_WAKE			: !UNDEAD
	}
}

state VERGE_OF_DEATH_WAKE
{
	exitcommands
	{
		setanimatedview 0
		modheight "crouch"		
		moveposflags "crouching"
	}
	action
	{
		jrsxx_finishing_player_recovery		: default
	}
	legs
	{
		jrsxx_finishing_player_recovery		: default
	}
	states
	{
		STAND			: ANIMDONE_TORSO
	}
}

///////////////////////////////////////////////////////////
// railcar states

state RAILCAR_FORWARD
{
	movetype anim

	entrycommands
	{
		viewmodelanim idle
	}

	action
	{
		mxsxi_railcar_forward	: default
	}

	states
	{
		STAND			: !ON_RAILCAR
	}

	exitcommands
	{
		set_playback_rate 1.0
	}
}

state RAILCAR_BACKWARD
{
	movetype anim

	entrycommands
	{
		viewmodelanim idle
	}

	action
	{
		mxsxi_railcar_backward	: default
	}
	
	states
	{
		STAND			: !ON_RAILCAR
	}

	exitcommands
	{
		set_playback_rate 1.0
	}
}

///////////////////////////////////////////////////////////

// STUBBED OUT FOR NOW
//state DEBUG_TEST_STATE
//{
//	movetype legs
//
////	entrycommands
////	{
////	}
//
//	action
//	{
//		xxxxx_debug_test_anim		: default
//	}
//
//	states
//	{
//		STAND		: ANIMDONE_TORSO
//	}
//}



state AIM_BINOCULARS_IDLE
{
	movetype legs

	entrycommands
	{
		overlaytype 3  // show binocs overlay
		viewmodelanim ""
	}

	exitcommands
	{
		overlaytype -1  //set to DEFAULT to allow dumb little state machine in code to work normally
	}

	action 
	{
		musxi_Stand_Idle				: default		//unarmed
	}

	states
	{
		AIM_PUTAWAY : !BINOCULAR_AIM
		AIM_PUTAWAY : DOING_VERGEOFDEATH
		AIM_PUTAWAY : PUTAWAYMAIN
	}
}

