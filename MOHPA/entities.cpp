//---------------------------------------------------------------------------------------------
/*QUAKED func_TOWObjective (1.0 0.0 1.0) (-12 -12 -12) (12 12 12) StartOn Respawner

  This object is an extension of the standard objective object.  It is used for Tug of War
  Maps.

  object used to simplify placing objectives.  You may optionally connect this object to the
  target you want to use for the compass position....

  Checkboxes:
	StartOn - check this if you want this objective to be displayed when the level first loads

	Respawner - check this if the objective is the respawn point for a team.  If you set this
	you must set ControlledBy to a valid team and not Neutral.


  Parameters:
  ControlledBy			0 = Axis, 1 = Allies, 2 = Neutral
  AxisObjNum			1 - 5.  Set the objective number for the axis.  This will associate the objective with
						the check box for the corresponding text in the score screen.
  AlliesObjNum			1 - 5.  Set the objective number for the allies.  This will associate the objective with
						the check box for the corresponding text in the score screen.

  ObjectiveNbr			<nObjNbr=0>	Please ignore this for now.

  Events:
	TurnOn
	TurnOff
	Complete
	Text <sNewText>
	SetCurrent
	SetController <ControlledBy> - This will set the starting controller default is neutral.  See ControlledBy var above.

//---------------------------------------------------------------------------------------------
*/

/*****************************************************************************/

/*QUAKED ProjectileGenerator_Target (1.0 0.0 1.0) (-12 -12 -12) (12 12 12)

  Place this target down and assign it a ProjectileGenerator ID and it will
  shoot here....

  Here are the params:

  ID      <nIdNum>   (Generator ID number.)

******************************************************************************/
/*****************************************************************************/

/*QUAKED ProjectileGenerator_Projectile (1.0 0.0 1.0) (-12 -12 -12) (12 12 12)  LaunchSound x TargetRandom StartOn FlipYaw FlipRoll TargetPlayer HideModel

  Allows you to launch projectiles without the need for actual AI.  Useful for faking large battles.
  Here are the params:

  ID <nIdNum>
  Model		 <sModelName>			(Defaults to bazooka weapon)
  Projectile <sModelName>			(Defaults to bazooka projectile)
  MinDuration <nMinDur=1>           (Min burst cycle duration)
  MaxDuration <nMaxDur=3>           (Max burst cycle duration)
  Cycles <nCycles=0>                (0=infinite)
  MinNumShots <nMinNumShots=1>      (Minimum # of shots per cycle)
  MaxNumShots <nMaxNumShots=1>      (Maximum # of shots per cycle)

  MinDelay <nDelay=2>               (min amount of time between cycles)
  MaxDelay <nDelay=10>              (max amount of time between cycles)
  Accuracy <nAccuracy=10>           (accuracy measured in feet. 0-25 feet range)
  FireOnStartUp						(defaults to 1.  This flag tells the PG to fire immediately when turned on.  Then do its delay from then on.)

  IsDonut	<nIsDonut=1>			(indicates to use donut to calculate impact location)
  Arc		<nArc=#degrees)			(how many degrees does the arc have)
  minDonut <nMinDonut=15>			(mindistance from player)
  maxDonut <nMaxDonut=30>			(maxdistance from player)
  launchsound <sSoundName>          (Defaults to no sound)

  preimpactsound <sSoundName>       (Defaults to no sound)
  preimpactsoundtime <nTime=1.0>    (Time before impact to begin preimpact sound)
  preimpactsoundprob <nProb=0.0>    (Chance of an impact sound being played. 0..1 range )

  Here are some useful script commands:

  $<generatorName> TurnOn
  $<generatorName> TurnOff
  $<generatorName> playpreimpact     ( plays the preimpact sound immediately )
  $<generatorName> gettargetentity   ( return the entity that is targeted )
  $<generatorName> isturnedon        ( is the projectil generator turned on? )

******************************************************************************/
/*****************************************************************************/

/*QUAKED ProjectileGenerator_Gun (1.0 0.0 1.0) (-12 -12 -12) (12 12 12) LaunchSound x TargetRandom StartOn FlipYaw FlipRoll TargetPlayer HideModel

  Allows you to launch projectiles without the need for actual AI.  Useful for faking large battles.
  Here are the params:

  ID <nIdNum>
  MinDuration <nMinDur=1>           (Min burst cycle duration)
  MaxDuration <nMaxDur=3>           (Max burst cycle duration)
  Cycles <nCycles=0>                (0=infinite)
  MinNumShots <nMinNumShots=1>      (Minimum # of shots per cycle)
  MaxNumShots <nMaxNumShots=1>      (Maximum # of shots per cycle)

  MinDelay <nDelay=2>               (min amount of time between cycles)
  MaxDelay <nDelay=10>              (max amount of time between cycles)
  Accuracy <nAccuracy=10>           (accuracy measured in feet. 0-25 feet range)
  launchsound <sSoundName>          (Defaults to no sound)
  FireOnStartUp						(defaults to 1.  This flag tells the PG to fire immediately when turned on.  Then do its delay from then on.)

  bulletLarge <0,1,2,3>				(whether to fire normal, rifle, artillery or larger bullets)
  tracerSpeed <0,2>					(scale factor for tracer speed)

  Here are some useful script commands:

  $<generatorName> TurnOn
  $<generatorName> TurnOff
  $<generatorName> gettargetentity   ( return the entity that is targeted )
  $<generatorName> isturnedon        ( is the projectil generator turned on? )

******************************************************************************/
/*****************************************************************************/

/*QUAKED ProjectileGenerator_Heavy (1.0 0.0 1.0) (-12 -12 -12) (12 12 12)  LaunchSound x TargetRandom StartOn FlipYaw FlipRoll TargetPlayer HideModel

  Allows you to launch projectiles without the need for actual AI.  Useful for faking large battles.
  Here are the params:

  ID <nIdNum>
  Model		 <sModelName>			(Defaults to bazooka weapon)
  Projectile <sModelName>			(Defaults to bazooka projectile)
  MinDuration <nMinDur=1>           (Min burst cycle duration)
  MaxDuration <nMaxDur=3>           (Max burst cycle duration)
  Cycles <nCycles=0>                (0=infinite)
  MinNumShots <nMinNumShots=1>      (Minimum # of shots per cycle)
  MaxNumShots <nMaxNumShots=1>      (Maximum # of shots per cycle)

  MinDelay <nDelay=2>               (min amount of time between cycles)
  MaxDelay <nDelay=10>              (max amount of time between cycles)
  Accuracy <nAccuracy=10>           (accuracy measured in feet. 0-25 feet range)

  FireOnStartUp						(defaults to 1.  This flag tells the PG to fire immediately when turned on.  Then do its delay from then on.)

  IsDonut	<nIsDonut=1>			(indicates to use donut to calculate impact location)
  Arc		<nArc=#degrees)			(how many degrees does the arc have)
  minDonut <nMinDonut=15>			(mindistance from player)
  maxDonut <nMaxDonut=30>			(maxdistance from player)
  launchsound <sSoundName>          (Defaults to no sound)

  Here are some useful script commands:

  $<generatorName> TurnOn
  $<generatorName> TurnOff
  $<generatorName> gettargetentity   ( return the entity that is targeted )
  $<generatorName> isturnedon        ( is the projectil generator turned on? )

******************************************************************************/
/*QUAKED ThrobbingBox_Generic (1.0 0.0 1.0) (-12 -12 -12) (12 12 12) 

  Generic throbbing box.  Connect to the object you want to make explode.

    Parameters:
		throbbing_model - name of throbbing version (default="throbbing")
		used_model - name of used version (default="used")
		destroyed_model - name of destroyed version (default="destroyed")
		explosioneffect -  Set the explosion effect model
		ExplosionSound - name of explosion sound (default=explode_flak88)
		ActivateSound - name of activation sound (default=plantbomb)
		TickSound - name of 'ticking' sound (default=bombtick)
		Damage - amount of damage to do (default=300)
		radius - radius to do the damage (default=300)
		stopwatchduration - how long should the stopwatch go (default=5 seconds)
		setthread - name of thread to call when the explosion happens...
		setusethread - name of thread to call when explosive was placed.
		explosionpos - vector of the position the explosion should occur

  Note:
	* Set stopwatchduration to 0 to prevent the explosion and stopwatch from happening.
	* You may then send the Explode event to this object to make the explosion happen.

 ---------------------------------------------------------------------------------------------

*/
// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
/*QUAKED ThrobbingBox_explosive (1.0 0.0 1.0) (-12 -12 -12) (12 12 12) ReplaceModel

  Explosive throbbing box.  Connect to the object you want to make explode.

  ReplaceModel - check this if you want the destroy model to replace the model instead of doing
                 a model switch.


  Parameters:
		Model - name of pulse model (default=items/pulse_explosive.tik")
		UsedModel - name of non-pulse version (default=items/explosive.tik")
		ExplosionSound - name of explosion sound (default=explode_flak88)
		ActivateSound - name of activation sound (default=plantbomb)
		TickSound - name of 'ticking' sound (default=bombtick)
		Damage - amount of damage to do (default=300)
		radius - radius to do the damage (default=300)
		stopwatchduration - how long should the stopwatch go (default=5 seconds)
		DestroyModel - name of model to switch target to.
		setthread - name of thread to call when the explosion happens...
		setusethread - name of thread to call when explosive was placed.
		explosionpos - vector of the position the explosion should occur

  Note:
	* Set stopwatchduration to 0 to prevent the explosion and stopwatch from happening.
	* You may then send the Explode event to this object to make the explosion happen.

 ---------------------------------------------------------------------------------------------

*/
// ---------------------------------------------------------------------------------------------
/*QUAKED ThrobbingBox_ExplodePlayerFlak88 (1.0 0.0 1.0) (-12 -12 -12) (12 12 12)

  Explosive throbbing box.  Connect to the object you want to make explode.


  Parameters:
		Model - name of pulse model (default=items/pulse_explosive.tik")
		UsedModel - name of non-pulse version (default=items/explosive.tik")
		ExplosionSound - name of explosion sound (default=explode_flak88)
		ActivateSound - name of activation sound (default=plantbomb)
		TickSound - name of 'ticking' sound (default=bombtick)
		Damage - amount of damage to do (default=300)
		radius - radius to do the damage (default=300)
		stopwatchduration - how long should the stopwatch go (default=5 seconds)
		setthread - name of thread to call when the explosion happens...

 ---------------------------------------------------------------------------------------------
*/
// ---------------------------------------------------------------------------------------------
/*QUAKED ThrobbingBox_ExplodeFlak88 (1.0 0.0 1.0) (-12 -12 -12) (12 12 12)

  Explosive throbbing box.  Connect to the object you want to make explode.

  Parameters:
		Model - name of pulse model (default=items/pulse_explosive.tik")
		UsedModel - name of non-pulse version (default=items/explosive.tik")
		ExplosionSound - name of explosion sound (default=explode_flak88)
		ActivateSound - name of activation sound (default=plantbomb)
		TickSound - name of 'ticking' sound (default=bombtick)
		Damage - amount of damage to do (default=300)
		radius - radius to do the damage (default=300)
		stopwatchduration - how long should the stopwatch go (default=5 seconds)
		setthread - name of thread to call when the explosion happens...

 ---------------------------------------------------------------------------------------------
*/
// ---------------------------------------------------------------------------------------------
/*QUAKED ThrobbingBox_ExplodeNebelwerfer (1.0 0.0 1.0) (-12 -12 -12) (12 12 12) ReplaceModel

  Explosive throbbing box.  Connect to the object you want to make explode.

  Parameters:
		Model - name of pulse model (default=items/pulse_explosive.tik")
		UsedModel - name of non-pulse version (default=items/explosive.tik")
		ExplosionSound - name of explosion sound (default=explode_flak88)
		ActivateSound - name of activation sound (default=plantbomb)
		TickSound - name of 'ticking' sound (default=bombtick)
		Damage - amount of damage to do (default=300)
		radius - radius to do the damage (default=300)
		stopwatchduration - how long should the stopwatch go (default=5 seconds)
		setthread - name of thread to call when the explosion happens...

 ---------------------------------------------------------------------------------------------
*/
// ---------------------------------------------------------------------------------------------
/*QUAKED ThrobbingBox_ExplodePlayerNebelwerfer (1.0 0.0 1.0) (-12 -12 -12) (12 12 12) ReplaceModel

  Explosive throbbing box.  Connect to the object you want to make explode.

  Parameters:
		Model - name of pulse model (default=items/pulse_explosive.tik")
		UsedModel - name of non-pulse version (default=items/explosive.tik")
		ExplosionSound - name of explosion sound (default=explode_flak88)
		ActivateSound - name of activation sound (default=plantbomb)
		TickSound - name of 'ticking' sound (default=bombtick)
		Damage - amount of damage to do (default=300)
		radius - radius to do the damage (default=300)
		stopwatchduration - how long should the stopwatch go (default=5 seconds)
		setthread - name of thread to call when the explosion happens...

 ---------------------------------------------------------------------------------------------
*/
// ---------------------------------------------------------------------------------------------
/*QUAKED ThrobbingBox_Stickybomb (1.0 0.0 1.0) (-12 -12 -12) (12 12 12) ReplaceModel WetFuse

  Stickybomb throbbing box.  Connect to the object you want to make explode.
  When WetFuse is selected, the bomb will fizzle out and can only be destroyed by shooting it.

  Parameters:
		ExplosionSound - name of explosion sound (default=explode_flak88)
		Damage - amount of damage to do (default=300)
		radius - radius to do the damage (default=300)
		stopwatchduration - how long should the fuse go (default=5 seconds)
		setthread - name of thread to call when the explosion happens...
		DestroyModel - name of model to switch target to.
		setusethread - name of thread to call when stickybomb is placed.

 ---------------------------------------------------------------------------------------------
*/
//---------------------------------------------------------------------------------------------
/*QUAKED func_objective (1.0 0.0 1.0) (-12 -12 -12) (12 12 12) StartOn

  object used to simplify placing objectives.  You may optionally connect this object to the
  target you want to use for the compass position....

  Checkboxes:
	StartOn - check this if you want this objective to be displayed when the level first loads

  Parameters:

  ObjectiveNbr <nObjNbr=0>
  Text <sText>

  Events:
	TurnOn
	TurnOff
	Complete
	Text <sNewText>
	SetCurrent

//---------------------------------------------------------------------------------------------
*/
//---------------------------------------------------------------------------------------------
/*QUAKED func_fencepost (0 1 0) ?
  fencepost that can be blown up
  "health" how much health the fence post should have (default 50)
//---------------------------------------------------------------------------------------------
*/
/*****************************************************************************/

/*QUAKED script_object (0 0.5 1) ? NOT_SOLID

******************************************************************************/
/*****************************************************************************/

/*QUAKED script_model (0 0.5 1) (0 0 0) (0 0 0) NOT_SOLID ALWAYS_DRAW

******************************************************************************/
/*****************************************************************************/
/*QUAKED script_model_realdamage (0 0.5 1) (0 0 0) (0 0 0) NOT_SOLID ALWAYS_DRAW

******************************************************************************/
/*****************************************************************************/

/*QUAKED script_origin (1.0 0 0) (-8 -8 -8) (8 8 8)

Used as an alternate origin for objects.  Bind the object to the script_origin
in order to simulate changing that object's origin.
******************************************************************************/
/*****************************************************************************/

/*QUAKED script_skyorigin (1.0 0 0) (-8 -8 -8) (8 8 8)

Used to specify the origin of a portal sky
******************************************************************************/
/*****************************************************************************/

/*QUAKED worldspawn (0 0 0) ? CINEMATIC

Only used for the world.

"soundtrack" the soundtrack to use on the map
"gravity"	 800 is default gravity
"skipthread" thread that is activated to skip this level (if cinematic)
"nextmap"    map to goto when player exits
"message"	 text to print at user logon
"script"	    script to run on start of map
"farplane_color" color to fade to when the far clip plane.  RGB (0-255)
"farplane_cull" whether or not the far plane should cull, default is yes
"farplane"   Farplane distance in GU
"farplane_bias" distance biasing for fog in GU
"farplane_skybox"   The skybox farplane distance in GU
"ai_visiondistance" default vision distance for all ai, defaults to 2048
"northyaw" sets the yaw angle that is considered to be north
"skyextent"
"skyaltitude"
LIGHTMAPS
---------
"terrain_lightmap_1" - lightmap for the first (default) inset
"shadow1_texture_1" - shadowmap 1 for the first (default) inset
"shadow2_texture_1" - shadowmap 2 for the first (default) inset
"shadow3_texture_1" - shadowmap 3 for the first (default) inset
"terrain_lightmap_2" - lightmap for the second inset
"shadow1_texture_2" - shadowmap 1 for the second inset
"shadow2_texture_2" - shadowmap 2 for the second inset
"shadow3_texture_2" - shadowmap 3 for the second inset
"terrain_lightmap_3" - lightmap for the third inset
"shadow1_texture_3" - shadowmap 1 for the third inset
"shadow2_texture_3" - shadowmap 2 for the third inset
"shadow3_texture_3" - shadowmap 3 for the third inset
GLOBAL LIGHTING SETTINGS
------------------------
"global_light_direction" Set the direction of the global light (Pitch,Yaw) in degrees
"global_light_shadow_direction" Set the direction of the global shadow direction (Pitch,Yaw) in degrees
"global_light_color" Set the color of global light RGB (0-255)
"global_light_ambientcolor"	Set the color of the global ambient light RGB (0-255)
"global_light_ambientdirectionalcolor" Set the color of the global ambient directional light RGB(0-255)
******************************************************************************/
/*****************************************************************************/

/*QUAKED light (0.75 0.5 0) (-8 -8 -8) (8 8 8)

"falloff" - the falloff of the light, default 300
"color" - the color of the light
"intensity" - this gets multiplied agains the color

******************************************************************************/
/*****************************************************************************/

/*QUAKED func_camera (0 0.25 0.5) (-8 -8 0) (8 8 16) ORBIT START_ON AUTOMATIC NO_TRACE NO_WATCH LEVEL_EXIT

Camera used for cinematic sequences.

"target" points to the target to orbit or follow.  If it points to a path,
the camera will follow the path.
"speed" specifies how fast to move on the path or orbit.  (default 1).
"fov" specifies fov of camera, default 90.
if fov is less than 3 than an auto-fov feature is assumed.  The fov will then
specify the ratio to be used to keep a watched entity zoomed in and on the screen
"follow_yaw" specifies yaw of the follow camera, default 0.
"follow_distance" the distance to follow or orbit if the target is not a path. (default 128).
"orbit_height" specifies height of camera from origin for orbiting, default 128.
"nextcamera" a link to the next camera in a chain of cameras
"thread" a thread label that will be fired when the camera is looked through
"auto_state" if specified, denotes the state the player must be in for the camera to engage
any number of states can be specified and only the first few letters need be specified as well
a state of 'pipe' would mean that any player state that started with 'pipe' would trigger this
camera
"auto_radius" the radius, in which the camera will automatically turn on (default 512)
"auto_starttime" how long it takes for the camera to be switched to (default 0.2)
"auto_stoptime" how long it takes for the camera to switch back to the player (default 0.2)
"auto_maxfov" Sets the maximum FOV that should be used when automatically calculating FOV. (default 90)

ORBIT tells the camera to create a circular path around the object it points to.
It the camera points to a path, it will loop when it gets to the end of the path.
START_ON causes the camera to be moving as soon as it is spawned.
AUTOMATIC causes the camera to be switched to automatically when the player is within
a certain radius, if "thread" is specified, that thread will be triggered when the camers is activated
NO_TRACE when the camera is in automatic mode, it will try to trace to the player before
switching automatically, this turns off that feature
NO_WATCH if this is an automatic camera, the camera will automatically watch the player
unless this is set, camera's "score" will be affected by how close to the middle of the camera
the player is.
LEVEL_EXIT if the camera is being used, the level exit state will be set

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_multiple (1 0 0) ? x FRIEND NOT_PLAYERS ENEMY PROJECTILES x HAVOK DAMAGE

Variable sized repeatable trigger.  Must be targeted at one or more entities.

If "health" is set, the trigger must be killed to activate each time.
If "delay" is set, the trigger waits some time after activating before firing.

"setthread" name of thread to trigger.  This can be in a different script file as well\
by using the '::' notation.

if "angle" is set, the trigger will only fire when someone is facing the
direction of the angle.
"cone" the cone in which a directed trigger can be triggered (default 60 degrees)

"wait" : Seconds between triggerings. (.2 default)
"cnt" how many times it can be triggered (infinite default)

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOT_PLAYERS is set, the trigger does not respond to players
If ENEMY is set, the trigger will respond to axis
If FRIEND is set, the trigger will respond to allies
If PROJECTILES is set, the trigger will respond to projectiles (rockets, grenades, etc.)
If DAMAGE is set, the trigger will only respond to bullets

set "message" to text string

******************************************************************************/
/*****************************************************************************/
/*QUAKED trigger_vehicle (0.25 0.5 0.35) ? x x x x x x HAVOK x
works exactly like a trigger_multiple but only responds to vehicles.
******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_multipleall (1 0 0) ? x FRIEND NOT_PLAYERS ENEMY PROJECTILES x HAVOK DAMAGE 

Variable sized repeatable trigger.  Must be targeted at one or more entities.

If "health" is set, the trigger must be killed to activate each time.
If "delay" is set, the trigger waits some time after activating before firing.

"setthread" name of thread to trigger.  This can be in a different script file as well\
by using the '::' notation.

if "angle" is set, the trigger will only fire when someone is facing the
direction of the angle.
"cone" the cone in which a directed trigger can be triggered (default 60 degrees)

"wait" : Seconds between triggerings. (.2 default)

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOT_PLAYERS is set, the trigger does not respond to players
If ENEMY is set, the trigger will respond to axis
If FRIEND is set, the trigger will respond to allies
If PROJECTILES is set, the trigger will respond to projectiles (rockets, grenades, etc.)
If DAMAGE is set, the trigger will only respond to bullets

set "message" to text string

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_once (1 0 0) ? NOTOUCH FRIEND NOT_PLAYERS ENEMY PROJECTILES x HAVOK x FRIEND

Variable sized trigger. Triggers once, then removes itself.
You must set the key "target" to the name of another object in the
level that has a matching

If "health" is set, the trigger must be killed to activate it.
If "delay" is set, the trigger waits some time after activating before firing.

"targetname".  If "health" is set, the trigger must be killed to activate.

"setthread" name of thread to trigger.  This can be in a different script file as well\
by using the '::' notation.

if "killtarget" is set, any objects that have a matching "target" will be
removed when the trigger is fired.

if "angle" is set, the trigger will only fire when someone is facing the
direction of the angle.
"cone" the cone in which a directed trigger can be triggered (default 60 degrees)

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOTOUCH is set, trigger will not respond to touch
If NOT_PLAYERS is set, the trigger does not respond to players
If ENEMY is set, the trigger will respond to axis
If FRIEND is set, the trigger will respond to allies
If PROJECTILES is set, the trigger will respond to projectiles (rockets, grenades, etc.)

set "message" to text string

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_save (1 0 0) ? NOTOUCH FRIEND NOT_PLAYERS ENEMY PROJECTILES x HAVOK x FRIEND

Variable sized trigger. Triggers once, then removes itself.
You must set the key "target" to the name of another object in the
level that has a matching

"savename". The Save Name that is appended to the world.message.

If "health" is set, the trigger must be killed to activate it.
If "delay" is set, the trigger waits some time after activating before firing.

"targetname".  If "health" is set, the trigger must be killed to activate.

"setthread" name of thread to trigger.  This can be in a different script file as well\
by using the '::' notation.

if "killtarget" is set, any objects that have a matching "target" will be
removed when the trigger is fired.

if "angle" is set, the trigger will only fire when someone is facing the
direction of the angle.
"cone" the cone in which a directed trigger can be triggered (default 60 degrees)

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOTOUCH is set, trigger will not respond to touch
If NOT_PLAYERS is set, the trigger does not respond to players
If ENEMY is set, the trigger will respond to axis
If FRIEND is set, the trigger will respond to allies
If PROJECTILES is set, the trigger will respond to projectiles (rockets, grenades, etc.)

set "message" to text string

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_relay (1 0 0) (-8 -8 -8) (8 8 8) x FRIEND NOT_PLAYERS ENEMY PROJECTILES x HAVOK x 

This fixed size trigger cannot be touched, it can only be fired by other events.
It can contain killtargets, targets, delays, and messages.

If NOT_PLAYERS is set, the trigger does not respond to events triggered by players
If ENEMY is set, the trigger will respond to axis
If FRIEND is set, the trigger will respond to allies
If PROJECTILES is set, the trigger will respond to events triggered by projectiles (rockets, grenades, etc.)

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_secret (1 0 0) ? NOTOUCH FRIEND NOT_PLAYERS ENEMY PROJECTILES x HAVOK x 
Secret counter trigger.  Automatically sets and increments script variables \
level.total_secrets and level.found_secrets.

set "message" to text string

if "angle" is set, the trigger will only fire when someone is facing the
direction of the angle.
"cone" the cone in which a directed trigger can be triggered (default 60 degrees)

"setthread" name of thread to trigger.  This can be in a different script file as well \
by using the '::' notation.  (defaults to "global/universal_script.scr::secret")

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOTOUCH is set, trigger will not respond to touch
If NOT_PLAYERS is set, the trigger does not respond to players
If ENEMY is set, the trigger will respond to axis
If FRIEND is set, the trigger will respond to allies
If PROJECTILES is set, the trigger will respond to projectiles (rockets, grenades, etc.)

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_push (1 0 0) ? x FRIEND NOT_PLAYERS ENEMY PROJECTILES x HAVOK x 

Pushes entities as if they were caught in a heavy wind.

"speed" indicates the rate that entities are pushed (default 1000).

"angle" indicates the direction the wind is blowing (-1 is up, -2 is down)

"target" if target is set, then a velocity will be calculated based on speed

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOT_PLAYERS is set, the trigger does not push players
If ENEMY is set, the trigger will respond to axis
If FRIEND is set, the trigger will respond to allies
If PROJECTILES is set, the trigger will push projectiles (rockets, grenades, etc.)

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_pushany (1 0 0) ? x FRIEND NOT_PLAYERS ENEMY PROJECTILES x HAVOK x 

Pushes entities as if they were caught in a heavy wind.

"speed" indicates the rate that entities are pushed (default 1000).
"angles" indicates the direction of the push
"target" if target is set, then a velocity will be calculated based on speed

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOT_PLAYERS is set, the trigger does not push players
If ENEMY is set, the trigger will respond to axis
If FRIEND is set, the trigger will respond to allies
If PROJECTILES is set, the trigger will push projectiles (rockets, grenades, etc.)

******************************************************************************/
/*****************************************************************************/

/*QUAKED sound_speaker (0 0.75 0.75) (-8 -8 -8) (8 8 8) AMBIENT-ON AMBIENT-OFF NOT_PLAYERS ENEMY PROJECTILES TOGGLE HAVOK x

play a sound when it is used

AMBIENT-ON specifies an ambient sound that starts on
AMBIENT-OFF specifies an ambient sound that starts off
TOGGLE specifies that the speaker toggles on triggering

if (AMBIENT-?) is not set, then the sound is sent over explicitly this creates more net traffic

"volume" how loud 0-4 (1 default full volume, ambients do not respond to volume)
"noise" sound to play
"channel" channel on which to play sound\
(0 auto, 1 weapon, 2 voice, 3 item, 4 body, 8 don't use PHS) (voice is default)
"setthread" name of thread to trigger.  This can be in a different script file as well\
by using the '::' notation.

Normal sounds play each time the target is used.

Ambient Looped sounds have a volume 1, and the use function toggles it on/off.

If NOT_PLAYERS is set, the trigger does not respond to players
If ENEMY is set, the trigger will respond to axis
If PROJECTILES is set, the trigger will respond to projectiles (rockets, grenades, etc.)

******************************************************************************/
/*****************************************************************************/

/*QUAKED sound_randomspeaker (0 0.75 0.75) (-8 -8 -8) (8 8 8) x x NOT_PLAYERS ENEMY PROJECTILES x HAVOK x

play a sound at random times

"mindelay" minimum delay between sound triggers (default 3)
"maxdelay" maximum delay between sound triggers (default 10)
"chance" chance that sound will play when fired (default 1)
"volume" how loud 0-4 (1 default full volume)
"noise" sound to play
"channel" channel on which to play sound\
(0 auto, 1 weapon, 2 voice, 3 item, 4 body, 8 don't use PHS) (voice is default)

Normal sounds play each time the target is used.

If NOT_PLAYERS is set, the trigger does not respond to players
If ENEMY is set, the trigger will respond to axis
If PROJECTILES is set, the trigger will respond to projectiles (rockets, grenades, etc.)

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_changelevel (1 0 0) ? NO_INTERMISSION FRIEND NOT_PLAYERS ENEMY PROJECTILES x HAVOK x 

When the player touches this, he gets sent to the map listed in the "map" variable.
Unless the NO_INTERMISSION flag is set, the view will go to the info_intermission
spot and display stats.

"spawnspot"  name of the spawn location to start at in next map.
"setthread" This defaults to "LevelComplete" and should point to a thread that is called just
before the level ends.

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOT_PLAYERS is set, the trigger does not respond to players
If ENEMY is set, the trigger will respond to axis
If FRIEND is set, the trigger will respond to allies
If PROJECTILES is set, the trigger will respond to projectiles (rockets, grenades, etc.)

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_use (1 0 0) ? x FRIEND NOT_PLAYERS ENEMY x x x x 

Activates targets when 'used' by an entity
"setthread" name of thread to trigger.  This can be in a different script file as well\
by using the '::' notation.

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOT_PLAYERS is set, the trigger does not respond to players
If ENEMY is set, the trigger will respond to axis
If FRIEND is set, the trigger will respond to allies

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_dropzone (1 0 0) ? x x NOT_PLAYERS MONSTERS

Designates "drop zones" for wounded bodies.

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_useonce (1 0 0) ? x FRIEND NOT_PLAYERS ENEMY x x x x 

Activates targets when 'used' by an entity, but only once
"setthread" name of thread to trigger.  This can be in a different script file as well\
by using the '::' notation.

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOT_PLAYERS is set, the trigger does not respond to players
If ENEMY is set, the trigger will respond to axis
If FRIEND is set, the trigger will respond to allies

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_hurt (1 0 0) ? x FRIEND NOT_PLAYERS ENEMY PROJECTILES x HAVOK x 

"damage" amount of damage to cause. (default 10)
"damagetype" what kind of damage should be given to the player. (default CRUSH)

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOT_PLAYERS is set, the trigger does not hurt players
If ENEMY is set, the trigger will respond to axis
If FRIEND is set, the trigger will respond to allies
If PROJECTILES is set, the trigger will hurt projectiles (rockets, grenades, etc.)

******************************************************************************/

/*****************************************************************************/
/*QUAKED trigger_explosiondamage (1 0 0) ?

******************************************************************************/

/*****************************************************************************/
/*QUAKED func_explosiontarget (0 0.25 0.5) (-16 -16 -16) (16 16 16)

  Marks the location of an explosion to be triggered by trigger_explosiondamage triggers.

  "delay" specifies the fuse delay (in seconds) between activation and explosion (default 0)
  "fdamage" specifies the amount of damage caused by the explosion (default 200)
  "radius" specifies the radius of the explosion (default 400)
  "effectmodel" specifies the TIKI model for the explosion effect (default "fx/fx_explosion.tik")

******************************************************************************/

/*****************************************************************************/


/*QUAKED trigger_camerause (1 0 0) ? VISIBLE x NOT_PLAYERS ENEMY

Activates 'targeted' camera when 'used'
If activated, toggles through cameras
"setthread" name of thread to trigger.  This can be in a different script file as well\
by using the '::' notation.

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOT_PLAYERS is set, the trigger does not respond to players
If ENEMY is set, the trigger will respond to axis

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_music (1 0 0) ? NORMAL ACTION NOT_PLAYERS ENEMY PROJECTILES SUSPENSE MYSTERY SURPRISE

Variable sized repeatable trigger to change the music mood.

If "delay" is set, the trigger waits some time after activating before firing.
"current" can be used to set the current mood
"fallback" can be used to set the fallback mood
"altcurrent" can be used to set the current mood of the opposite face, if multiFaceted
"altfallback" can be used to set the fallback mood of the opposite face, if multiFaceted
"edgeTriggerable" trigger only fires when entering a trigger
"multiFaceted" if 1, then trigger is North/South separate triggerable\
if 2, then trigger East/West separate triggerable

"setthread" name of thread to trigger.  This can be in a different script file as well\
by using the '::' notation.
"wait" : Seconds between triggerings. (1.0 default)
"cnt" how many times it can be triggered (infinite default)
"oneshot" make this a one time trigger

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOT_PLAYERS is set, the trigger does not respond to players
If ENEMY is set, the trigger will respond to axis
If PROJECTILES is set, the trigger will respond to projectiles (rockets, grenades, etc.)

NORMAL, ACTION, SUSPENSE, MYSTERY, and SURPRISE are the moods that can be triggered

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_pushobject (1 0 0) ?
Special trigger that can only be triggered by a push object.

"triggername" if set, trigger only responds to objects with a targetname the same as triggername.
"cnt" how many times it can be triggered (default 1, use -1 for infinite)
******************************************************************************/

/*****************************************************************************/

/*QUAKED trigger_clickitem (1 0 0) ?

Trigger that detects a hit by items like the camera of binoculars.

If "delay" is set, the trigger waits some time after activating before firing.
"reverbtype" what kind of reverb should be used
"reverblevel" how much of the reverb effect should be applied
"altreverbtype" what kind of reverb should be used
"altreverblevel" how much of the reverb effect should be applied
"edgeTriggerable" trigger only fires when entering a trigger
"multiFaceted" if 1, then trigger is North/South separate triggerable\
if 2, then trigger East/West separate triggerable

"setthread" name of thread to trigger.  This can be in a different script file as well\
by using the '::' notation.
"wait" : Seconds between triggerings. (1.0 default)
"cnt" how many times it can be triggered (infinite default)
"oneshot" make this a one time trigger

"triggerable" turn trigger on
"nottriggerable" turn trigger off

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_nodamage (1 0 0) ? x x NOT_PLAYERS ENEMY PROJECTILES x HAVOK x

When the player is in this field, he will be invulnerable

"triggerable" turn trigger on
"nottriggerable" turn trigger off

If NOT_PLAYERS is set, the trigger does not hurt players
******************************************************************************/
/*****************************************************************************/

/*QUAKED info_pathnode (1 0 1) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE" 

"low_wall_arc" key enables low-wall behavior and specifies an arc centered around "angles" where this node is good for low-wall behavior.  "low_wall_arc 30" would flag this as good for +/- 30 degrees from angles.
"aggressive" key enables aggressive cover mode
"retreat" key sets this node as a retreat node

DONT_LINK     marks the node as not linking into navigation.
DUCK          marks the node as a good place to crouch at during weapon fire.
COVER         marks the node as a good place to hide at during weapon fire.
CONCEALMENT   marks the node as a cover node that doesn't get sight checked; use for foliage and combat locations.
CORNER_LEFT   marks the node as a place to fire around a corner to the left; cannot also be CRATE
CORNER_RIGHT  marks the node as a place to fire around a corner to the right; cannot also be CRATE
SNIPER        marks the node as a sniper node. Actor will move to the sniper node to target the enemy if directly running towards the enemy is inconvenient.
CRATE         marks the node as a place to stand up and fire over; should always be used with DUCK

** corner behaviors should have their origin 16 units from the wall and 16 units from the appropriate corner.

*/

/******************************************************************************/
/*QUAKED info_grenadehint (.5 .5 .5) (-8 -8 -8) (8 8 8)
Just a hint to the AI that it may be able to throw a grenade through this point
*/
/*****************************************************************************/
/*QUAKED func_barrel (0 0.25 0.5) ? INDESTRUCTABLE
Brush model barrel object
Bashing only makes thunk or gong sounds (depending on wether it's full or not)
Bullets and explosions effects are dependant apon the type of barrel.
"barreltype" sets the type of barrel that it is. Valid settings are:
   - "water" makes the barrel be filled with water.
      Always non-volitile. Only destroyed by explosion.
   - "oil" makes the barrel be filled with oil.
      Leakes oil when shot (not destroyed), shower of flames when exploded.
   - "gas" makes the barrel be filled with gas.
      A few bullet hits will make it explode.
	  Explosions will also make it explode.
   - "empty" makes the barrel completely empty.
      Does nothing special at all. It's just a poor empty barrel. aww :(
*/
/*****************************************************************************/
/*****************************************************************************/

/*QUAKED info_splinepath (0.2 0.5 1) (-16 -16 -16) (16 16 16)

******************************************************************************/
/*****************************************************************************/
/*QUAKED func_crate (0 0.25 0.5) ? INDESTRUCTABLE NOTSTACKEDON
Brush model crate object
"spawnitems" is a list of items to spawn when the crate is destroyed.
INDESTRUCTABLE makes the crate, well, indestructable.
   Since the same effect can be achieved by not making it an entity, this should only
   be used when stacking indestructable crates on top of destructable crates.
   Otherwise, they should just be brushes to save on entity count.
NOTSTACKED prevents the crate from causing crates above it to fall. Great for crates on shelves.
"health" sets the crate's health. Default is 300
"debristype" sets the type of debris to spawn from the crate. Valid values are from 0 - ?. Default is 0
0: wooden crate 32 units to a side
1: wooden crate 64 units to a side
2: cardboard crate 16 units to a side
3: cardboard crate 32 units to a side
*/
/*****************************************************************************/
/*****************************************************************************/

/*QUAKED func_rotatingdoor (0 0.25 0.5) ? START_OPEN OPEN_DIRECTION DOOR_DONT_LINK NOT_PLAYERS NOT_MONSTERS TOGGLE AUTO_OPEN TARGETED
if two doors touch, they are assumed to be connected and operate as a unit.

TOGGLE causes the door to wait in both the start and end states for a trigger event.
DOOR_DONT_LINK is for when you have two doors that are touching but you want to operate independently.

START_OPEN causes the door to move to its destination when spawned, and operate in reverse.  It is used to temporarily or permanently close off an area when triggered (not usefull for touch or takedamage doors).
OPEN_DIRECTION indicates which direction to open when START_OPEN is set.
AUTO_OPEN causes the door to open when a player is near instead of waiting for the player to use the door.
TARGETED door is only operational from triggers or script

"message"		is printed when the door is touched if it is a trigger door and it hasn't been fired yet
"openangle"		how wide to open the door
"angle"			determines the opening direction.  point toward the middle of the door (away from the hinge)
"targetname"	if set, no touch field will be spawned and a remote button or trigger field activates the door.
"health"		if set, door must be shot open
"time"			move time (0.3 default)
"wait"			wait before returning (3 default, -1 = never return)
"dmg"			damage to inflict when blocked (0 default)
"alwaysaway"	makes the door always open away from the opener

"sound_open_start"		Specify the sound that plays when the door starts opening (default global door_wood_open)
"sound_close_start"		Specify the sound that plays when the door starts closing (default global door_wood_close)
"sound_open_end"		Sets the sound to use when the door stops to opens. (defaults to door_wood_open_stop)
"sound_close_end"		Sets the sound to use when the door closes. (defaults to door_wood_close_stop


"sound_message"		Specify the sound that plays when the door displays a message
"sound_locked"		Specify the sound that plays when the door is locked (default global door_wood_locked)

******************************************************************************/
/*****************************************************************************/

/*QUAKED func_door (0 0.25 0.5) ? START_OPEN x DOOR_DONT_LINK NOT_PLAYERS NOT_MONSTERS TOGGLE AUTO_OPEN TARGETED
if two doors touch, they are assumed to be connected and operate as a unit.

TOGGLE causes the door to wait in both the start and end states for a trigger event.
DOOR_DONT_LINK is for when you have two doors that are touching but you want to operate independently.

START_OPEN causes the door to move to its destination when spawned, and operate in reverse.  It is used to temporarily or permanently close off an area when triggered (not usefull for touch or takedamage doors).
OPEN_DIRECTION indicates which direction to open when START_OPEN is set.
AUTO_OPEN causes the door to open when a player is near instead of waiting for the player to use the door.
TARGETED door is only operational from triggers or script

"message"		is printed when the door is touched if it is a trigger door and it hasn't been fired yet
"angle"			determines the opening direction.  point toward the middle of the door (away from the hinge)
"targetname"	if set, no touch field will be spawned and a remote button or trigger field activates the door.
"health"			if set, door must be shot open
"speed"			move speed (100 default)
"time"			move time (1/speed default, overides speed)
"wait"			wait before returning (3 default, -1 = never return)
"lip"				lip remaining at end of move (8 default)
"dmg"				damage to inflict when blocked (0 default)

"sound_stop"		Specify the sound that plays when the door stops moving (default global door_stop)
"sound_move"		Specify the sound that plays when the door opens or closes (default global door_moving)
"sound_message"	Specify the sound that plays when the door displays a message
"sound_locked"	   Specify the sound that plays when the door is locked

******************************************************************************/
/*****************************************************************************/

/*QUAKED script_door (0 0.5 1) ? START_OPEN x DOOR_DONT_LINK NOT_PLAYERS NOT_MONSTERS TOGGLE AUTO_OPEN TARGETED
if two doors touch, they are assumed to be connected and operate as a unit.

TOGGLE causes the door to wait in both the start and end states for a trigger event.
DOOR_DONT_LINK is for when you have two doors that are touching but you want to operate independently.

START_OPEN causes the door to move to its destination when spawned, and operate in reverse.  It is used to temporarily or permanently close off an area when triggered (not usefull for touch or takedamage doors).
OPEN_DIRECTION indicates which direction to open when START_OPEN is set.
AUTO_OPEN causes the door to open when a player is near instead of waiting for the player to use the door.
TARGETED door is only operational from triggers or script

"message"		is printed when the door is touched if it is a trigger door and it hasn't been fired yet
"angle"			determines the opening direction.  point toward the middle of the door (away from the hinge)
"targetname"	if set, no touch field will be spawned and a remote button or trigger field activates the door.
"health"			if set, door must be shot open
"speed"			move speed (100 default)
"time"			move time (1/speed default, overides speed)
"wait"			wait before returning (3 default, -1 = never return)
"dmg"				damage to inflict when blocked (0 default)
"initthread"   code to execute to setup the door (optional)
"openthread"   code to execute when opening the door (required)
               The openthread should send the "dooropened" event to the door, when it is completely open
"closethread"  code to execute when closing the door (required)
               The closethread should send the "doorclosed" event to the door, when it is completely closed

"sound_stop"		Specify the sound that plays when the door stops moving (default global door_stop)
"sound_move"		Specify the sound that plays when the door opens or closes (default global door_moving)
"sound_message"	Specify the sound that plays when the door displays a message
"sound_locked"	   Specify the sound that plays when the door is locked

******************************************************************************/
/*****************************************************************************/
/*QUAKED func_viewjitter (0 0.25 0.5) (-8 -8 -8) (8 8 8)
Causes a radius view jitter
"radius" sets the max effective range if the view jitter. Default is 128
"edgeeffect" set the fraction of the total jitter to apply at the max range. Default is 0.2
"jitteramount" sets the amount to jitter the view. Set in angles as "pitch yaw roll". Default is "2 2 3"
"duration" set how long the view jitter should last. Default is 0 (instantanious)
"timedecay" sets how the jitter angles will fall off over the jitter's duraction in degrees per second. Default is "2 2 3"
"donedeath" makes the view jitter remove itself after being fired once. Any non-zero value will work.
******************************************************************************/
/*****************************************************************************/

/*QUAKED func_exploder (0 0.25 0.5) (0 0 0) (8 8 8)

  Spawns an explosion when triggered.  Triggers any targets.

  "dmg" specifies how much damage to cause. Default indicates 120.
  "key" The item needed to activate this. (default nothing)
  "setthread" name of thread to trigger.  This can be in a different script file as well\
by using the '::' notation.
******************************************************************************/
/*****************************************************************************/

/*QUAKED func_multi_exploder (0 0.25 0.5) ? MULTI_USE RANDOM_TIME VISIBLE RANDOM_SCALE

  Spawns an explosion when triggered.  Triggers any targets.
  size of brush determines where explosions will occur.

  "dmg" specifies how much damage to cause from each explosion. (Default 120)
  "delay" delay before exploding (Default 0 seconds)
  "duration" how long to explode for (Default 1 second)
  "wait" time between each explosion (default 0.25 seconds)
  "random" random factor (default 0.25)
  "key" The item needed to activate this. (default nothing)
  "setthread" name of thread to trigger.  This can be in a different script file as well\
by using the '::' notation.
  "health" makes the object damageable
  "scale" set the maximum size for spawned debris and explosions.

  MULTI_USE allows the func_multi_exploder to be used more than once
  RANDOM_TIME adjusts the wait between each explosion by the random factor
  VISIBLE allows you to make the trigger visible
  RANDOM_SCALE scale explosions randomly. size will be between 0.25 and 1 times scale

******************************************************************************/
/*****************************************************************************/

/*QUAKED func_explodeobject (0 0.25 0.5) ? MULTI_USE RANDOM_TIME VISIBLE RANDOM_SCALE NO_EXPLOSIONS METAL_DEBRIS ROCK_DEBRIS NOTSOLID

  Spawns different kinds of debris when triggered.  Triggers any targets.
  size of brush determines where explosions and debris will be spawned.

  "dmg" specifies how much damage to cause from each explosion. (Default 120)
  "delay" delay before exploding (Default 0 seconds)
  "duration" how long to explode for (Default 1 second)
  "wait" time between each explosion (default 0.25 seconds)
  "random" random factor (default 0.25)
  "health" if specified, object must be damaged to trigger
  "key" The item needed to activate this. (default nothing)
  "severity" how violent the debris should be ejected from the object( default 1.0 )
  "debrismodel" What kind of debris to spawn (default nothing)
  "amount" how much debris to spawn for each explosion (default 4)
  "thread" name of thread to trigger.  This can be in a different script file as well\
by using the '::' notation.
  "health" makes the object damageable
  "scale" set the maximum size for spawned debris and explosions

  MULTI_USE allows the func_explodeobject to be used more than once
  RANDOM_TIME adjusts the wait between each explosion by the random factor
  VISIBLE allows you to make the trigger visible
  RANDOM_SCALE scale explosions and debris randomly. size will be between 0.25 and 1 times scale
  NO_EXPLOSIONS, if checked no explosions will be created
  METAL_DEBRIS automatically spawn metal debris, no need for debrismodel to be set
  ROCK_DEBRIS automatically spawn rock debris, no need for debrismodel to be set
  NOTSOLID debris is not solid

  other valid tiki files include:

  obj_debris_glass1-4.tik
  obj_debris_wood1-4.tik

******************************************************************************/
/*****************************************************************************/

/*QUAKED detail (0.5 0 1.0) ?

Used to fake detail brushes, convenient for grouping

******************************************************************************/

/*****************************************************************************/

/*QUAKED func_group (0.5 0.5 0.5) ?

Used to group brushes together just for editor convenience.

******************************************************************************/

/*****************************************************************************/

/*QUAKED vis_leafgroup (1.0 0.25 0.25) ?

Used to manually block visibility between groups of leafs.

******************************************************************************/

/*****************************************************************************/

/*QUAKED vis_entity (1.0 0.25 0.25) ?

A visibility entity that defines a volume used for vis.

******************************************************************************/

/*****************************************************************************/

/*QUAKED func_remove (0.75 0.75 0.75) ?

Used for lighting and such

******************************************************************************/
/*****************************************************************************/

/*QUAKED info_null (0 0.5 0) (-4 -4 -4) (4 4 4)

Used as a positional target for spotlights, etc.

******************************************************************************/
/*****************************************************************************/

/*QUAKED info_notnull (0 0.75 0) (-12 -12 -12) (12 12 12)

Used as a positional target for lightning.

******************************************************************************/
/*****************************************************************************/

/*QUAKED func_explodingwall (0 0.25 0.5) ? RANDOMANGLES LANDSHATTER NOT_PLAYERS MONSTERS PROJECTILES INVISIBLE ACCUMALATIVE TWOSTAGE

Blows up on activation or when attacked

"explosions"      number of explosions to spawn ( default 1 )
"land_angles"     The angles you want this piece to\
                  orient to when it lands on the ground
"land_radius"     The distance of the ground the piece\
                  should be when on the ground ( default 16 )
"anglespeed"      Speed at which pieces rotate ( default 100 ) \
                  if RANDOMANGLES ( default is 600 )
"key"             The item needed to activate this. (default nothing)
"base_velocity"   The speed that the debris will have when triggered.  (default 0 0 280)
"random_velocity" The variation of the velocity. x & y will be from -n < X,Y < n and z is 0 <= Z < n.  (default 140 140 140)


IF RANDOMANGLES is set, object randomly spins while in the air.
IF LANDSHATTER is set, object shatters when it hits the ground.
IF TWOSTAGE is set, object can be shattered once it lands on the ground.
IF ACCUMALATIVE is set, damage is accumlative not threshold
IF INVISIBLE is set, these are invisible and not solid until triggered
If NOT_PLAYERS is set, the trigger does not respond to players
If MONSTERS is set, the trigger will respond to monsters
If PROJECTILES is set, the trigger will respond to projectiles (rockets, grenades, etc.)

******************************************************************************/
/*****************************************************************************/

/*QUAKED trigger_teleport (0.5 0.5 0.5) ? VISIBLE x NOT_PLAYERS MONSTERS PROJECTILES NO_EFFECTS FAST_EFFECTS

Touching this entity will teleport players to the targeted object.

"key"						The item needed to activate this. (default nothing)

"teleportthread"		The thread that is run when the player is teleported

If NOT_PLAYERS is set, the teleporter does not teleport players
If MONSTERS is set, the teleporter teleports monsters
If PROJECTILES is set, the teleporter teleports projectiles (rockets, grenades, etc.)
If NO_EFFECTS is set, the special effect will not happen and the teleport will be instant
If FAST_EFFECTS is set, the teleport will be instant, and the effects will appear

******************************************************************************/
/*****************************************************************************/

/*QUAKED func_teleportdest (0 0.25 0.5) (-32 -32 0) (32 32 8)

Point trigger_teleport at these.

******************************************************************************/
/*****************************************************************************/

/*QUAKED func_useanim (0 0.5 0) ? VISIBLE TOUCHABLE CONTINUOUS

This object allows you to place the player into a specific animation for the
purposes of using an object within the world.

This object should point at a func_useanimdest which contains specific
information about how the player is supposed to be posed.

"count" - how many times this should trigger (default -1, infinite)
"thread" - thread to fire when used
"triggertarget" - what to trigger when used.
"delay" - how long it takes to be re-triggered ( default 3 seconds )
"key" - item needed to activate this

VISIBLE - if this is checked the trigger itself will be visible
TOUCHABLE - if this is set we can activate the trigger by standing in it.
CONTINUOUS - if this is checked the thing will re-trigger continously, otherwise
it waits until the player has left the trigger field.

******************************************************************************/
/*****************************************************************************/

/*QUAKED func_useobject (0 0.5 0) ? MULTI-STATE

Allows you to setup a special object that places the player into a specific state
sequence.  Primarily used for levers and cranks.

Object starts out in the "start" animation, when used the following occurs:

It is determined whether or not the player is in the right position to activate
the object, if it is, the player is moved to the exact offset and angle specified
by "offset" and "yaw_offset".  The right position is determined by a dot product
with "offset" and "yaw_offset".  The "cone" parameter controls the cone in which the
object can be triggered. Once the player is in the right position, the player is placed
into "state" and the "move" animation is played. Once the player animation ends, the
"move_thread" will be called.  If the use button is continued to be held down and count
is not finite, the animation will be continued to be played until the use key is held
down.  Once the use key is let go, the "stop" animation will be played on the lever and
the "stop_thread" will be called.

"activate" - turns the useobject on
"deactivate" - turns the useobject off
"offset" - vector offset of where the player should stand
"state" - state to go into when used
"state_backwards" - what state to use when reversing the object
"yaw_offset" - what direction the player should be facing when using the object
"cone" - the cone in which the object can be used
"count" - how many times this should trigger (default -1, infinite)
"move_thread" - thread that is fired when the object has cycled one animation
"stop_thread" - thread that is fired when the object has finished animating
"reset_thread" - thread that is fired when the object is resetting itself
"reset_time" - the time it takes for the object to reset, (default 0, it doesn't)
"triggertarget" - target to trigger when finished animating, if reset_time is set, target
will be fired again when resetting
"damage_type" - if set, can be triggered by using a weapon to activate it.  If set to "all",
any damage will activate it.

MULTI-STATE - the object has two different states and must be used each time to set the state
when multi state is active, the reset_thread is called instead of stop_thread.  All UseObjects
have two states on and off.  When reset_time is set, the object will automatically return to the
off state after a preset amount of time.  When multi-state is set this must be done manually.

******************************************************************************/
/*****************************************************************************/

/*QUAKED info_waypoint (0 0.5 0) (-16 -16 -16) (16 16 16)

Used as a positioning device for objects

******************************************************************************/
/*****************************************************************************/

/*QUAKED info_vehiclepoint (0.15 0.5 0.25) (-8 -8 -8) (8 8 8) START_STOPPING START_SKIDDING STOP_SKIDDING

Like info_waypoints, but with spawnflags for vehicles.

******************************************************************************/
/*****************************************************************************/

/*QUAKED func_pushobject (0.75 0.75 0.75) ?

Pushable object

"dmg" how much damage to cause when blocked.  (default 2)
"pushsound" Sound to play when object is pushed (default is none)

******************************************************************************/
/*****************************************************************************/

/*QUAKED func_fallingrock (0.75 0.75 0.75) ? AUTO_RESET NO_RANDOMNESS REMOVE_ON_GROUND

Creates a rock that, when triggered, begins falling and bounces along a path
specified by targetname.  Use info_waypoint for the path.

"targetname" the path to follow.
"dmg" how much damage to cause creatures it hits (default 20).
"speed" how fast to move (default 200).
"wait" how long to wait before falling when triggered (default 0).
"noise" sound to play when rock touches the world

AUTO_RESET - when done falling, automatically return to the start
NO_RANDOMNESS - don't use any randomness when making the rocks fall
REMOVE_ON_GROUND - remove the rocks when done

******************************************************************************/
/*****************************************************************************/

/*QUAKED func_ladder (0.75 0.75 0.75) ?

Ladder trigger volume

******************************************************************************/
/*****************************************************************************/

/*QUAKED func_emitter (0 0.25 0.5) ?

"emitter" - Name of emitter to use.
******************************************************************************/
/*****************************************************************************/

/*QUAKED func_rain (0 0.25 0.5) ?

This creates a raining effect in the brush

"emitter" - Name of emitter to use for the rain.
******************************************************************************/
/*****************************************************************************/

/*QUAKED info_player_start (0.75 0.75 0) (-16 -16 0) (16 16 96)

The normal starting point for a level.

"angle" - the direction the player should face
"thread" - the thread that should be called when spawned at this position

******************************************************************************/
/*****************************************************************************/

/*QUAKED info_player_deathmatch (0.6 1 0.6) (-16 -16 0) (16 16 96)

potential spawning position for deathmatch games

"angle" - the direction the player should face
"thread" - the thread that should be called when spawned at this position
"arena" - the arena that this start point is located in

******************************************************************************/
/*****************************************************************************/

/*QUAKED info_player_allied (0.75 0.75 1) (-16 -16 0) (16 16 96)

potential spawning position for an allied player in a team games... ignored for FFA.

"angle" - the direction the player should face
"thread" - the thread that should be called when spawned at this position
"arena" - the arena that this start point is located in

******************************************************************************/
/*****************************************************************************/

/*QUAKED info_player_axis (1 .75 .75) (-16 -16 0) (16 16 96)

potential spawning position for an axis player in a team games... ignored for FFA.

"angle" - the direction the player should face
"thread" - the thread that should be called when spawned at this position
"arena" - the arena that this start point is located in

******************************************************************************/
/*****************************************************************************/

/*QUAKED info_player_neutral (1 .75 .75) (-16 -16 0) (16 16 96)

potential spawning position for a player in invader mode.  When flags are taken
neutral spawn points will become Axis or Allied spawners.

"angle" - the direction the player should face
"thread" - the thread that should be called when spawned at this position
"arena" - the arena that this start point is located in

******************************************************************************/
/*****************************************************************************/

/*QUAKED info_player_intermission (0.75 0.75 0.5) (-16 -16 0) (16 16 96)

viewing point in between deathmatch levels

******************************************************************************/
/*QUAKED portal_surface (1 0 1) (-8 -8 -8) (8 8 8)
The portal surface nearest this entity will show a view from the targeted portal_camera, or a mirror view if untargeted.
*/
/*QUAKED portal_camera (1 0 1) (-8 -8 -8) (8 8 8) slowrotate fastrotate
The target for a portal_surface.  You can set either angles or target another entity to determine the direction of view.
"roll" an angle modifier to orient the camera around the target vector;
*/
/*****************************************************************************/
/*QUAKED func_window (0 0.25 0.5) ? WINDOW_BROKEN_BLOCK
Brush model Window object
"spawnitems" is a list of items to spawn when the Window is destroyed.
"health" sets the Window's health. Default is 250
"debristype" sets the type of debris to spawn from the Window. Valid values are from 0 - ?. Default is 0
0: clear glass Window
1: colored glass Window
"target" is the targetname of the script_object to use as the broken version of the window
WINDOW_BROKEN_BLOCK will make the window still block the passage of the player & monsters when broken
*/
/*****************************************************************************/
/*****************************************************************************/

/*QUAKED ai_actor (0.5 1.0 1.0) (-16 -16 0) (16 16 92)

******************************************************************************/
/*****************************************************************************/

/*QUAKED func_beam (0 0.25 .5) (-8 -8 -8) (8 8 8) START_ON PERSIST WAVE NOISE

This creates a beam effect from the origin to the target's origin. If no
target is specified, uses angles and projects beam out from there.

"model" Specifies the model to use as the beam
"overlap" Specifies the amount of overlap each beam link should have. Use this to fill
in the cracks when using electric on beams. (Default is 0)
"minoffset" Minimum amount of electrical variation (Default is 0)
"maxoffset" Maximum amount of electrical variation (Default is 5)
"color" Vector specifiying the red,green, and blue components. (Default is "1 1 1")
"alpha" Alpha of the beam (Default is 1.0)
"damage" Amount of damage the beam inflicts if beam hits someone (Default is 0)
"angles" Sets the angle of the beam if no target is specified.
"life" Sets the life of the beam for use with the persist spawnflag.  This is how long a beam will
be displayed.
"numsegments" Number of segments in a beam (Default is 4)
"delay" Delay between beam updates.  (i.e. slows the effect of the beam down)
"shader" Set the shader of the beam
"scale" Set the width of the beam

START_ON  - Starts the beam on
PERSIST   - Keeps the last few beams around and fades them out over the life of the beam
WAVE      - Make the beam follow a sin wave pattern
NOISE     - Use a more computationally expensive random effect, but the results are smoother

If the model field is not set, then a renderer generated beam will be created
using the color, minoffset, maxoffset, scale, and subdivisions fields

If the targetname is set, it will use the target specified as the endpoint of the beam

/*****************************************************************************/
/*****************************************************************************/

/*QUAKED func_spawn(0 0.25 0.5) (-8 -8 -8) (8 8 8)
"modelname" The name of the TIKI file you wish to spawn. (Required)
"spawntargetname" This will be the targetname of the spawned model. (default is null)
"spawntarget" This will be the target of the spawned model. (default is null)
"pickup_thread" passed on to the spawned model
"key"       The item needed to activate this. (default nothing)
"attackmode" Attacking mode of the spawned actor (default 0)
******************************************************************************/
/*****************************************************************************/

/*QUAKED func_randomspawn(0 0.25 0.5) (-8 -8 -8) (8 8 8) START_OFF
Randomly spawns an entity.  The time between spawns is determined by min_time and max_time
The entity can be turned off and on by triggering it
"modelname"   The name of the TIKI file you wish to spawn. (Required)
"key"         The item needed to activate this. (default nothing)
"min_time" The minimum time between spawns (default 0.2 seconds)
"max_time" The maximum time between spawns (default 1 seconds)
START_OFF - spawn is off by default
******************************************************************************/
/*****************************************************************************/

/*QUAKED func_respawn(0 0.25 0.5) (-8 -8 -8) (8 8 8)
When the thing that is spawned is killed, this func_respawn will get
triggered.
"modelname"   The name of the TIKI file you wish to spawn. (Required)
"key"         The item needed to activate this. (default nothing)
******************************************************************************/
/*****************************************************************************/

/*QUAKED func_spawnoutofsight(0 0.25 0.5) (-8 -8 -8) (8 8 8)
Will only spawn something out of sight of its targets.
"modelname"   The name of the TIKI file you wish to spawn. (Required)
"spawntargetname" This will be the targetname of the spawned model. (default is null)
"spawntarget" This will be the target of the spawned model. (default is null)
"key"         The item needed to activate this. (default nothing)
******************************************************************************/
/*****************************************************************************/

/*QUAKED func_spawnchain(0 0.25 0.5) (-8 -8 -8) (8 8 8)
Tries to spawn something out of the sight of players.  If it fails, it will
trigger its targets.
"modelname"   The name of the TIKI file you wish to spawn. (Required)
"spawntargetname" This will be the targetname of the spawned model. (default is null)
"spawntarget" This will be the target of the spawned model. (default is null)
"key"         The item needed to activate this. (default nothing)
******************************************************************************/
/*****************************************************************************/

/*QUAKED func_fulcrum (0 0 1) ? X_AXIS_ONLY Y_AXIS_ONLY

This creates a fulcrum that when you stand on it, it will rotate due to
the weight exerted it will start rotating, when not standing on it, it
will return to its rest position.
"speed" - set the speed at which the fulcrum will operate (default is 48)
"resetspeed" - speed at whcih fulcrum resets, (default speed * 0.002)
"dampening" - dampen constant (default 0.95)
"limit" - limit the movement of the fulcrum (default 90 degrees)
"movesound" - sound to be played while fulcrum is moving

X_AXIS_ONLY - only adjust the X axis
Y_AXIS_ONLY - only adjust the Y axis

******************************************************************************/
/*****************************************************************************/

/*QUAKED func_runthrough (0 0 1) ?

This is a trigger field that the player can run through and spawn tiki models
at that position.  Used for releasing chaff from grass or butterflys from
flower gardens
"speed" - speed at which you have to be moving to trigger ( default 100 )
"delay" - time between triggering ( default 0.1 )
"chance" - chance that the trigger will spawn something( default 0.5 )
"lip" - how far below the surface of the trigger we should spawn these things ( default 3 )
"offset" - vector offset oriented along velocity vector( default "0 0 0" )
"spawnmodel" - thing to spawn when triggered

******************************************************************************/
/*****************************************************************************/

/*QUAKED water_disturbance

Use this to define a water disturbance generator.

"radius" - size in game units of the directly perterbed area.
"amplitude" - size of water disturbances.
"frequency" - disturbances per second (usually a fractional value).

******************************************************************************/
/*****************************************************************************/

/*QUAKED water (0.0 0.0 0.8) ? Interactive Ocean FFT InfiniteFFT x Reflective

Use this to define a water volume.

CheckBoxes:
Interactive	- Water that reacts to bullets, explosions. Good for small bodies of water, like puddles.
Ocean       - Default water type, can be used for oceans, lakes, swamps, depending on the specified material.
FFT	        - Ocean water that uses statistical data to simulate real ocean behavior.
InfiniteFFT - Ocean water that uses statistical data to simulate real ocean behavior, tileable and infinite.

"num_nodes" - Integer representing the number of vertices, defaults to 16000. Good for increasing or 
reducing poly count.

"targetname" - Name of the water brush, can be used to turn water on/off in script, with this syntax:
			   $world hide_water <targetname> or $world show_water <targetname>

"fft_type" - If FFT water is specified, you can choose between "choppy" or "smooth" simulations

"materialname" - Name of the material to set to the water. (located in MOHPA\Game\materials)
"collision_material_name" - Name of the collision material to apply to the water (default: Water)

"current_strength" - Floating point number specifying the current strength, good values range from 0 - 3
"current_direction" - 2D vector specifying direction of the current. [-1..1][-1..1]
“current_angle” – Angle from 0 – 360 which represents the direction of the current.

"drawmodel" - If a model is specified, the water type is overriden and the specified water model is used.

******************************************************************************/
/*****************************************************************************/

/*QUAKED procedural_rain (0.0 0.0 0.8) ?

Use this to define a rain volume.

"maxraindrops" - Maximum number of rain drops emitted
"life" - Floating point number specifying the life of each rain drop
"windvelocity" - Floating point number specifying the wind velocity
"winddirection" - Vector specifying the direction of the wind

"width" - Floating point number specifying the rain drop width
"height" - Floating point number specifying the rain drop height
"impactforce" - Floating point number specifying the amount of disturbance each drop will cause when it hits water
"fadeamount" - Floating point number specifying the number of particles that will trail the rain drop
"fadedistance" - Floating point number specifying the distance between each trailing particle
"shader" - Rain drop shader
"startcolor" - Vector specifying the starting color of the rain drops
"endcolor" - Vector specifying the ending color of the rain drops
"gravity" - Floating point number specifying the gravity to apply to the rain drops (i.e. 9.8)
"highlightpercentage" - Number from 0 - 100 that defines the percentage of particles that will "glow"

******************************************************************************/

/*****************************************************************************/

/*QUAKED func_sinkobject (0 0 1) ? x FALLAWAY NO_RESET

This creates an object which gradually sinks downward when stepped on.
"delay" - delay between when object starts reacting towards weight (default 0 seconds)
"speed" - set the speed at which sinkobject sinks (default is 50)
"resetspeed" - speed at which sinkobject resets its position, (default speed * 0.1)
"dampening" - dampening constant to mitigate acceleration (default 0.95)
"limit" - limit the movement of the sinkobject how far down it should go (default 1000 units)
"resetdelay" - time between player gets off platform, and platform starts resetting itself.
"sinksound" - sound to be played while platform is sinking.
"resetsound" - sound to be played while platform is resetting.
"active" - make the sink object active
"notactive" - make the sink object not active

FALLAWAY - the sink object will progressively fall down faster and faster
NO_RESET - the sink object will not reset, only move downward

******************************************************************************/


/*QUAKED vehicle_plane (0 0.5 1) (0 0 0) (0 0 0) NOT_SOLID ALWAYS_DRAW

variables:
maxroll - "Set maximum roll rate(default=60)
rollrate - Set maximum roll rate (degs/sec) (default=70)" );
	
*/

/*QUAKED vehicle_allied_ShermanTank (0.0 0.0 0.0) (-65 -40 0) (65 40 120)
American Sherman Tank */

/*QUAKED func_shellcamera (0 0.25 0.5) (-8 -8 0) (8 8 16)

*/

/*QUAKED func_throwobject (0 0 0.5) (-8 -8 0) (8 8 16)

*/

// ---------------------------------------------------------------------------------------------
/*QUAKED ThrobbingBox_ExplodeType96Cannon (1.0 0.0 1.0) (-12 -12 -12) (12 12 12) "REPLACE MODEL" "LEAVE MODEL"
  Explosive throbbing box for Type96 cannon.  Connect to the object you want to make explode.

  Check "LEAVE MODEL" to prevent any model swap/replacement (for unassembled cannon).

  Parameters:
		Model - name of pulse model (default=items/pulse_explosive.tik")
		UsedModel - name of non-pulse version (default=items/explosive.tik")
		ExplosionSound - name of explosion sound (default=explode_flak88)
		ActivateSound - name of activation sound (default=plantbomb)
		TickSound - name of 'ticking' sound (default=bombtick)
		Damage - amount of damage to do (default=300)
		radius - radius to do the damage (default=300)
		stopwatchduration - how long should the stopwatch go (default=5 seconds)
		setthread - name of thread to call when the explosion happens...

 ---------------------------------------------------------------------------------------------
*/

/*****************************************************************************/
/*QUAKED info_pathnode_navhint_duck (0.2 0 0.2) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE" 

Place instead of regular info_pathnode objects when wanting to duck under objects while moving.
(Currently, there is no animation for this to work.)

Parameters:
	see info_pathnode
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_pathnode_navhint_proneconnect (0.2 0 0.2) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE" 

Intermediate pathnode used for within long tunnels.  This node will connect in places where you need to be prone to get through.

Parameters:
	see info_pathnode
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_pathnode_navhint_crouchconnect (0.2 0 0.2) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE" 

Intermediate pathnode used for within long tunnels.  This node will connect in places where you need to be crouch to get through.

Parameters:
	see info_pathnode
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_pathnode_navhint_crouch (0.2 0 0.2) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE" 

Place instead of regular info_pathnode objects when needing to crawl through a height-limited space at crouch height.
Will transition you towards crouch.

Parameters:
	see info_pathnode
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_pathnode_navhint_tunnel (0.2 0 0.2) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE" 

Place instead of regular info_pathnode objects when needing to crawl through a height-limited space at prone height.
Will transition you towards prone.

Parameters:
	see info_pathnode
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_pathnode_navhint_jump_over_32 (0.2 0 0.2) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE"  

Place instead of regular info_pathnode objects to mark special jump over navigation.

Parameters: 
	see info_pathnode
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_pathnode_navhint_jump_over_40 (0.2 0 0.2) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE"  

Place instead of regular info_pathnode objects to mark special jump over navigation.

Parameters: 
	see info_pathnode
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_pathnode_navhint_jump_over_48 (0.2 0 0.2) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE"  

Place instead of regular info_pathnode objects to mark special jump over navigation.

Parameters: 
	see info_pathnode
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_pathnode_navhint_jump_up_64 (0.2 0 0.2) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE"  

Place instead of regular info_pathnode objects to mark special jump into navigation.

Parameters: 
	see info_pathnode
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_pathnode_navhint_jump_up_40 (0.2 0 0.2) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE"  

Place instead of regular info_pathnode objects to mark special jump into navigation.

Parameters: 
	see info_pathnode
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_pathnode_navhint_jump_down_64 (0.2 0 0.2) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE"  

Place instead of regular info_pathnode objects to mark special jump  onto navigation.

Parameters: 
	see info_pathnode
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_pathnode_navhint_jump_down_96 (0.2 0 0.2) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE"  

Place instead of regular info_pathnode objects to mark special jump  onto navigation.

Parameters: 
	see info_pathnode
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_pathnode_navhint_jump_down_128 (0.2 0 0.2) (-16 -16 0) (16 16 32) "DON'T LINK" "DUCK" "COVER" "CONCEALMENT" "CRNR. LEFT" "CRNR. RIGHT" "SNIPER" "CRATE"  

Place instead of regular info_pathnode objects to mark special jump  onto navigation.

Parameters: 
	see info_pathnode
******************************************************************************/


/*QUAKED info_pathnode_squadpathnode (1 1 0) (-16 -16 0) (16 16 32) DONT_LINK DUCK COVER CONCEALMENT CORNER_LEFT CORNER_RIGHT SNIPER CRATE

Parameters:

	set				- Sets the path node's sequence number


******************************************************************************/

/*****************************************************************************/

/*QUAKED trigger_playerpos (1 0 0) ?

Works like a trigger multiple but adds the ability to set the player location
on the objective Map.

"showlocation" location number to show on the objective map.  These should be
placed in order.

******************************************************************************/


/*****************************************************************************/
/*QUAKED trigger_planerepeller (0.25 0.5 0.35) ? x x x x x x x x
	Repells planes.  Set the trigger target to info-notnulls that you want
	the plane to go to avoid the obstacle.
******************************************************************************/

/*****************************************************************************/
/*QUAKED trigger_plane (0.25 0.5 0.35) ? x x x x x x x x
	Works just like trigger_multiple except only on planes.
******************************************************************************/


/*****************************************************************************/
/*QUAKED trigger_squadnode (1 0 0) ? x FRIEND NOT_PLAYERS ENEMY PROJECTILES x x DAMAGE 
	Works just like trigger_multiple.  It is specifically designed to support
	the triggering of squad nodes.
******************************************************************************/

/*****************************************************************************/
/*QUAKED trigger_moraleon (1 0 0) ? x FRIEND NOT_PLAYERS ENEMY PROJECTILES x x DAMAGE 
	Works just like trigger_multiple.  It is specifically designed to turn
	the morale of the player squad on
******************************************************************************/

/*****************************************************************************/
/*QUAKED trigger_moraleoff (1 0 0) ? x FRIEND NOT_PLAYERS ENEMY PROJECTILES x x DAMAGE 
	Works just like trigger_multiple.  It is specifically designed to turn
	the morale of the player squad off
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_cover_left (0.5 0 0) (-16 -16 0) (16 16 32) "DON'T LINK" "X" "X" "CONCEALMENT" "X" "X" "X" "X" 

DONT_LINK     marks the node as not linking into navigation.
CONCEALMENT   marks the node as a cover node that doesn't get sight checked; use for foliage and combat locations.

** corner behaviors should have their origin 16 units from the wall and 16 units from the appropriate corner.
$display_model$ models/characters/test/xrsxl_idle_wall.gr2
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_cover_right (0 0 1) (-16 -16 0) (16 16 32) "DON'T LINK" "X" "X" "CONCEALMENT" "X" "X" "X" "X" 

DONT_LINK     marks the node as not linking into navigation.
CONCEALMENT   marks the node as a cover node that doesn't get sight checked; use for foliage and combat locations.

** corner behaviors should have their origin 16 units from the wall and 16 units from the appropriate corner.
$display_model$ models/characters/test/xrsxr_idle_wall.gr2
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_cover_leftlow (1 0 0) (-16 -16 0) (16 16 32) "DON'T LINK" "X" "X" "CONCEALMENT" "X" "X" "X" "X" 

DONT_LINK     marks the node as not linking into navigation.
CONCEALMENT   marks the node as a cover node that doesn't get sight checked; use for foliage and combat locations.

** corner behaviors should have their origin 16 units from the wall and 16 units from the appropriate corner.

$display_model$ models/characters/test/xrcxl_idle_wall.gr2
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_cover_rightlow (0 0.78 1) (-16 -16 0) (16 16 32) "DON'T LINK" "X" "X" "CONCEALMENT" "X" "X" "X" "X" 

DONT_LINK     marks the node as not linking into navigation.
CONCEALMENT   marks the node as a cover node that doesn't get sight checked; use for foliage and combat locations.

** corner behaviors should have their origin 16 units from the wall and 16 units from the appropriate corner.

$display_model$ models/characters/test/xrcxr_idle_wall.gr2
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_cover_crate (1 0.5 0) (-16 -16 0) (16 16 32) "DON'T LINK" "X" "X" "CONCEALMENT" "X" "X" "X" "X" 

DONT_LINK     marks the node as not linking into navigation.
CONCEALMENT   marks the node as a cover node that doesn't get sight checked; use for foliage and combat locations.

$display_model$ models/characters/test/xrcxx_idle_crate.gr2
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_cover_grass (0 1 0) (-16 -16 0) (16 16 32) "DON'T LINK" "X" "X" "X" "X" "X" "X" "X" 

DONT_LINK     marks the node as not linking into navigation.

$display_model$ models/characters/test/xrcxx_aim_CN.gr2
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_cover_leftright (0.75 0.75 0.75) (-16 -16 0) (16 16 32) "DON'T LINK" "X" "X" "CONCEALMENT" "X" "X" "X" "X" 

DONT_LINK     marks the node as not linking into navigation.
CONCEALMENT   marks the node as a cover node that doesn't get sight checked; use for foliage and combat locations.

** corner behaviors should have their origin 16 units from the wall and 16 units from the appropriate corner.

$display_model$ models/characters/test/xrsxl_idle_wall.gr2
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_cover_leftrightlow (0.5 0.5 0.5) (-16 -16 0) (16 16 32) "DON'T LINK" "X" "X" "CONCEALMENT" "X" "X" "X" "X" 

DONT_LINK     marks the node as not linking into navigation.
CONCEALMENT   marks the node as a cover node that doesn't get sight checked; use for foliage and combat locations.

** corner behaviors should have their origin 16 units from the wall and 16 units from the appropriate corner.

$display_model$ models/characters/test/xrcxr_idle_wall.gr2
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_cover_stand (0.5 0.5 0.25) (-16 -16 0) (16 16 32) "DON'T LINK" "X" "X" "CONCEALMENT" "X" "X" "X" "X" 

DONT_LINK     marks the node as not linking into navigation.
CONCEALMENT   marks the node as a cover node that doesn't get sight checked; use for foliage and combat locations.

** stands when shooting, crouches when hiding...
$display_model$ models/characters/test/xrsxx_aim_CN.gr2
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_cover_crouch (0.5 0.5 0.25) (-16 -16 0) (16 16 32) "DON'T LINK" "X" "X" "CONCEALMENT" "X" "X" "X" "X" 

DONT_LINK     marks the node as not linking into navigation.
CONCEALMENT   marks the node as a cover node that doesn't get sight checked; use for foliage and combat locations.

** Good place to crouch and shoot

$display_model$ models/characters/test/xrcxx_aim_CN.gr2
******************************************************************************/

/*****************************************************************************/
/*QUAKED info_cover_prone (0.5 0.5 0.25) (-16 -16 0) (16 16 32) "DON'T LINK" "X" "X" "CONCEALMENT" "X" "X" "X" "X" 

DONT_LINK     marks the node as not linking into navigation.
CONCEALMENT   marks the node as a cover node that doesn't get sight checked; use for foliage and combat locations.

** Good place to shoot from the prone position

$display_model$ models/characters/test/xrpxx_idle.gr2
******************************************************************************/

/*****************************************************************************/
/*QUAKED flight_boundary (0.8 0.0 0.0) ?

** If the player flies far beyond these bounds the mission will be lost.

******************************************************************************/

