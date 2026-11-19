can u translate this to uc?\
[https://github.com/iortcw/iortcw/blob/master/SP/code/cgame/cg_flamethrower.c](https://github.com/iortcw/iortcw/blob/master/SP/code/cgame/cg_flamethrower.c)



this is the original\
[https://github.com/igiteam/postal2-half-dude-the-thing/blob/main/Postal2Game/FlameWeapon.uc](https://github.com/igiteam/postal2-half-dude-the-thing/blob/main/Postal2Game/FlameWeapon.uc)\
[https://github.com/igiteam/postal2-half-dude-the-thing/blob/main/Postal2Game/FlameProjectile.uc](https://github.com/igiteam/postal2-half-dude-the-thing/blob/main/Postal2Game/FlameProjectile.uc)

Worked for 17s

Designed and refined flame chunk implementation

Mapping the port

Searched the web

Yes. I would translate the **Return to Castle Wolfenstein flamethrower’s flame simulation** into UnrealScript for Postal 2, using your existing `FlamethrowerWeapon.uc` and `FlameProjectile.uc` as the starting point.



There is one important distinction: `cg_flamethrower.c` is not simply a weapon implementation. It is a client-side particle simulation. It maintains individual flame chunks, interpolates their positions between frames, applies velocity, friction and gravity, checks world collision, and manages their lifetimes.&#x20;

GitHub



The best approach is to reproduce those mechanics with UE2 actors and emitters rather than attempting a literal C-to-UnrealScript translation.

## **How I'd port it**

I recommend splitting the implementation into three responsibilities:

|   |
| - |

File

|   |
| - |

Changes

|   |
| - |

`FlamethrowerWeapon.uc`

|   |
| - |

Keep the existing wind-up, firing and wind-down animations and sounds. Replace the single long trace with continuous flame-chunk spawning.

|   |
| - |

`FlameProjectile.uc`

|   |
| - |

Preserve its existing projectile behaviour where other weapons depend on it. Reuse its emitter-handling ideas where appropriate.

|   |
| - |

`ThingFlameChunk.uc`

|   |
| - |

New class implementing individual flame movement, collision, bouncing, expansion, damage and expiration.

Your current weapon already has useful foundations: it has wind-up and wind-down states, separate primary/alternate firing, bone-attached emitters, damage traces and fire attachment to NPCs. However, its primary fire currently uses a 512-unit trace and spawns a fire actor at the endpoint every 0.1 seconds. Alternate fire is empty.&#x20;

GitHub+1



Your existing `FlameProjectile` is closer to a thrown fire projectile: it carries an emitter, moves using projectile velocity, explodes on impact and destroys its visual effect when it dies. It doesn't implement the continuous flame-stream simulation.&#x20;

GitHub



## **Mechanics to reproduce**

**Flame simulation**

Port target

# **950**

Initial speed (units/sec)

# **2048**

Original chunk pool capacity

# **200**

Maximum flame size

# **100 ms**

Damage-check interval

1. **Continuous emission:** Spawn flame chunks along the nozzle's movement, rather than just at the end of a trace.
2. **Momentum:** Chunks start fast and gradually lose velocity through friction.
3. **Collision:** Chunks bounce off surfaces, losing velocity, rather than simply disappearing.
4. **Expansion:** Chunks grow from small ignition particles into larger orange flame sprites.
5. **Ignition phase:** A short blue flame section appears close to the nozzle.
6. **Damage:** Apply fire damage with a cooldown and line-of-sight checks.
7. **Optimization:** Merge nearby chunks and impose a sensible active-actor limit.

GitHub+4

### **One important Unreal Engine 2 consideration**

I would **not** create 2,048 Unreal actors to reproduce the original C pool. That pool consists of lightweight client-side structures, not full game actors.



Instead, I'd use a capped number of `ThingFlameChunk` actors, each controlling an emitter. That gives you real collision and damage in Postal 2 without unnecessarily overwhelming its actor simulation.



The original also uses a 45-frame flame animation, eight nozzle sprites, stretched fuel trails and dynamic lighting. Those visual effects should be reproduced using UE2 emitters and suitable texture assets, not by trying to translate the original OpenGL rendering functions.&#x20;

GitHub+2



**One question before I write the actual&#x20;**`.uc`**&#x20;files:** should I preserve your existing flamethrower's wind-up/wind-down animations, sounds, weapon configuration and ammo system, replacing only its flame simulation and damage logic?



My recommendation is yes. That gives you the RTCW flame behaviour while retaining the existing Postal 2 weapon integration.



*Licensing note:* the RTCW source identifies itself as GPLv3-or-later with additional terms. If you distribute a derivative implementation, retain the appropriate notices and check the applicable licence requirements.&#x20;

GitHub
