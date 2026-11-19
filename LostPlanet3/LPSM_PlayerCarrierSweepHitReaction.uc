class LPSM_PlayerCarrierSweepHitReaction extends LPSM_DirectionalHitReaction
    config(Game);

function GetHitAngle()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AdjustedHitDir, RotationVector, X, Y, Z;

    local /*0x97E50000-0x00000000*/ private float AngleInDegrees;

    // End:0x14B
    if(MySPPawn != none)
    {
        AdjustedHitDir = Class'SPEngine.SPAnimNodeTemplateLogicHitDirection'.static.GetHitDirectionMomentum(MySPPawn);
        AdjustedHitDir.Z = 0.0000000;
        AdjustedHitDir = -Normal(AdjustedHitDir);
        RotationVector = Vector(MySPPawn.Rotation);
        AngleInDegrees = Acos(RotationVector Dot AdjustedHitDir) * 57.2957800;
        GetAxes(MySPPawn.Rotation, X, Y, Z);
        // End:0x14B
        if((Y Dot AdjustedHitDir) < float(0))
        {
            AngleInDegrees = 180.0000000 + (float(180) - AngleInDegrees);
        }
    }
    return AngleInDegrees;
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;
    local /*0x97E50000-0x00000000*/ private float HitAngle;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x170
    if(NextMove == none)
    {
        HitAngle = GetHitAngle();
        // End:0x96
        if((HitAngle >= 315.0000000) || HitAngle < 45.0000000)
        {
            MySPPawn.DoSpecialMove(Class'LPSM_PlayerCarrierSweepOnGround');            
        }
        else
        {
            // End:0xED
            if((HitAngle >= 45.0000000) && HitAngle < 135.0000000)
            {
                MySPPawn.DoSpecialMove(Class'LPSM_PlayerCarrierSweepOnGroundHitFromRight');                
            }
            else
            {
                // End:0x144
                if((HitAngle >= 135.0000000) && HitAngle < 225.0000000)
                {
                    MySPPawn.DoSpecialMove(Class'LPSM_PlayerCarrierSweepOnGroundHitFromBack');                    
                }
                else
                {
                    MySPPawn.DoSpecialMove(Class'LPSM_PlayerCarrierSweepOnGroundHitFromLeft');
                }
            }
        }
    }
    //return;    
}
