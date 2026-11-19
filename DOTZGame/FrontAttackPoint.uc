/**
 * FrontAttackPoint - a trivial subclass with a unique icon (helpful for
 *                    debugging)
 *
 * @version $Rev: 5335 $
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    Month 2004
 */
class FrontAttackPoint extends AttackPoint;

#exec texture Import File=Textures/FrontAttackPointIcon.tga Name=FrontAttackPointIcon Mips=Off MASKED=1

//===========================================================================
// Default Properties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    Texture=Texture'FrontAttackPointIcon'
}