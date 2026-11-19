/**
 * CheckPoint - Its a checkpoint
 *
 * @version $Revision: 1.0 $
 * @author  name (email@digitalextremes.com)
 * @date    Month 2003
 */
class CheckPoint extends PlayerStart;


var(CheckPointInfo) int id;                         // the checkpoint ID local to level
var(CheckPointInfo) bool bTouchable;                // whether this checkpoint is active
var(CheckPointInfo) vector playerOffset;            // player spawn offset from this checkpoint
var bool bPostLinearize;









// Decompiled with UE Explorer.
defaultproperties
{
    Id=1
    bTouchable=true
}