class LPWinchCable extends ActorComponent;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CableMesh;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SplinesPool[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldUpdateEveryFrame;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUpdateInUpdateTransform;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool EnableDebugLines[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool HasBeenInitialized[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldTighten[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bActive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableShadows;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Phase[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmpScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FreqScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxLength;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinLength;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MeshThickness;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float vertampscale[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float oldinterpfactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL oldsourcepos[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL oldtargetpos[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __PollEndpoints__Delegate;

simulated function UpdateSplines()
{
    local /*0x97E50000-0x00000000*/ private float Elapsed[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL sourcepos[8388609], TargetPos;
    local /*0x97E50000-0x00000000*/ private int I, ip1, im1, N, knotsneeded, knotsskipped;

    local /*0x97E50000-0x00000000*/ private float J, X, Dist, fdist;
    local /*0x97E50000-0x00000000*/ private @NULL Delta, gravhang, Dir, tinytan, dcross, dup,
	    knot, sourcevel, TargetVel, pos, Tangent;

    local /*0x97E50000-0x00000000*/ private float sphase, fphase, Freq, jdenom, amp, amp1,
	    amp2, ampscaler, hang, hang1, hang2,
	    interpfactor, interprate;

    local /*0x97E50000-0x00000000*/ private @NULL NoRot;

    // End:0x11
    if(!HasBeenInitialized)
    {
        return;
    }
    N = SplinesPool.Length;
    Delta = TargetPos - sourcepos;
    Dist = VSize(Delta);
    // End:0x155
    if(Dist <= MinLength)
    {
        I = 0;
        J0x7A:

        // End:0xD0 [Loop If]
        if(I < N)
        {
            knot = SplinesPool[I];
            SetSplineSegmentVisibility(knot, false);
            ++I;
            // [Loop Continue]
            goto J0x7A;
        }
        oldsourcepos = sourcepos;
        oldtargetpos = TargetPos;
        oldinterpfactor = 0.0000000;
        Phase = FMax(0.0000000, Phase - (Elapsed * 0.5000000));
        vertampscale = Cos(Phase * float(100)) * 0.5000000;
        return;
    }
    Dir = Delta / Dist;
    tinytan = Dir * 0.0100000;
    knotsneeded = Min(N, FCeil((float(N - 1) * Dist) / MaxLength) + 1);
    // End:0x1E4
    if(knotsneeded <= 1)
    {
        return;
    }
    knotsskipped = N - knotsneeded;
    // End:0x242
    if(Elapsed <= 0.0000000)
    {
        sourcevel = vect(0.0000000, 0.0000000, 0.0000000);
        TargetVel = sourcevel;        
    }
    else
    {
        TargetVel = (TargetPos - oldtargetpos) / Elapsed;
        sourcevel = (sourcepos - oldsourcepos) / Elapsed;
    }
    oldtargetpos = TargetPos;
    oldsourcepos = sourcepos;
    amp1 = 2400.0000000;
    hang1 = 0.0900000;
    amp2 = 0.0000000;
    hang2 = 0.0000000;
    Freq = 1.0000000;
    // End:0x3EE
    if(!bShouldTighten)
    {
        oldinterpfactor = 0.0000000;
        interpfactor = 0.0000000;
        X = (MaxLength - Dist) / MaxLength;
        Freq *= ((((X * X) * X) * 5.0000000) + 0.5000000);
        X = 1.0000000 - X;
        hang1 *= X;
        amp1 *= ((X * X) * X);        
    }
    else
    {
        interpfactor = 1.0000000;
        interprate = 2.2000000;
        interpfactor = Class'SPCamera.SPCameraBlend'.static.LowPassFloat(oldinterpfactor, interpfactor, interprate, Elapsed);
        // End:0x49F
        if((interpfactor > 0.0100000) && interpfactor < 0.9900000)
        {
            Freq += (7.0000000 * interpfactor);            
        }
        else
        {
            Freq = 0.0100000;
            amp1 = 0.0000000;
        }
        oldinterpfactor = interpfactor;
    }
    amp = Lerp(amp1, amp2, interpfactor) * AmpScale;
    hang = Lerp(hang1, hang2, interpfactor);
    dup = vect(0.0000000, 0.0000000, 1.0000000);
    dcross = Normal(Delta Cross dup);
    gravhang = ((dup * hang) * float(Min(int(Dist), int(MaxLength * 0.2500000)))) * float(4);
    Phase = Phase + Elapsed;
    fphase = Phase * Freq;
    fdist = 0.4000000;
    jdenom = MaxLength / (float(N - 1) * Dist);
    I = 0;
    J0x62B:

    // End:0x681 [Loop If]
    if(I < knotsskipped)
    {
        knot = SplinesPool[I];
        SetSplineSegmentVisibility(knot, false);
        ++I;
        // [Loop Continue]
        goto J0x62B;
    }
    I = knotsskipped;
    J0x694:

    // End:0x802 [Loop If]
    if(I < N)
    {
        knot = SplinesPool[I];
        SetSplineSegmentVisibility(knot, true);
        J = FMax(0.0000000, 1.0000000 - (float((N - 1) - I) * jdenom));
        pos = (sourcepos + (Delta * J)) + (gravhang * (J * (float(1) - J)));
        knot.SetLocation(pos);
        knot.SetRotation(NoRot);
        knot.Velocity = VLerp(sourcevel, TargetVel, J);
        ++I;
        // [Loop Continue]
        goto J0x694;
    }
    I = knotsskipped;
    J0x815:

    // End:0xAF8 [Loop If]
    if(I < N)
    {
        knot = SplinesPool[I];
        im1 = Max(I - 1, knotsskipped);
        ip1 = Min(I + 1, N - 1);
        // End:0x8BB
        if(im1 == ip1)
        {
            Tangent = tinytan;            
        }
        else
        {
            Tangent = (SplinesPool[ip1].Location - SplinesPool[im1].Location) * 0.2500000;
        }
        // End:0xAA3
        if(((amp != float(0)) && I > knotsskipped) && I < (N - 1))
        {
            J = FMax(0.0000000, 1.0000000 - (float((N - 1) - I) * jdenom));
            sphase = fphase + (fdist * float(I));
            sphase *= FreqScale;
            ampscaler = amp;
            // End:0xA4D
            if(I == (knotsskipped + 1))
            {
                ampscaler *= FMin(1.0000000, ((J * Dist) * float(N - 1)) / MaxLength);
            }
            Tangent += (((Sin(sphase) * dcross) + ((Cos(sphase * -0.1100000) * vertampscale) * dup)) * ampscaler);
        }
        knot.SplineActorTangent = Tangent;
        knot.UpdateSplineParams();
        ++I;
        // [Loop Continue]
        goto J0x815;
    }
    //return;    
}

simulated function SetActive()
{
    local /*0x97E50000-0x00000000*/ private bool bNewActive[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x82
    if(bNewActive != bActive)
    {
        // End:0x33
        if(bNewActive)
        {
            EnableSpline();            
        }
        else
        {
            I = 0;
            J0x3E:

            // End:0x82 [Loop If]
            if(I < SplinesPool.Length)
            {
                SetSplineSegmentVisibility(SplinesPool[I], false);
                ++I;
                // [Loop Continue]
                goto J0x3E;
            }
        }
    }
    bActive = bNewActive;
    //return;    
}

function EnableSpline()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x5C [Loop If]
    if(I < SplinesPool.Length)
    {
        SplinesPool[I].bShouldUpdate = true;
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function DisableSpline()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x5C [Loop If]
    if(I < SplinesPool.Length)
    {
        SplinesPool[I].bShouldUpdate = false;
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated event Update()
{
    local /*0x97E50000-0x00000000*/ private float Elapsed[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL sourcepos, TargetPos;

    // End:0x66
    if(((int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone)) && !bShouldUpdateEveryFrame) && Elapsed > float(0))
    {
        return;
    }
    // End:0x77
    if(!HasBeenInitialized)
    {
        return;
    }
    // End:0x88
    if(__PollEndpoints__Delegate == none)
    {
        return;
    }
    // End:0x99
    if(!bActive)
    {
        return;
    }
    PollEndpoints(sourcepos, TargetPos);
    UpdateSplines(Elapsed, sourcepos, TargetPos);
    //return;    
}

simulated function DestroySplines()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x68 [Loop If]
    if(I < SplinesPool.Length)
    {
        SplinesPool[I].Destroy();
        SplinesPool[I] = none;
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    SplinesPool.Length = 0;
    //return;    
}

simulated function CreateSplines()
{
    local /*0x97E50000-0x00000000*/ private @NULL winchowner[8388609];
    local /*0x97E50000-0x00000000*/ private int maxsegments[8388609], I, J;
    local /*0x97E50000-0x00000000*/ private @NULL knot;

    // End:0x11
    if(CableMesh == none)
    {
        return;
    }
    SplinesPool.Length = maxsegments + 1;
    I = 0;
    J0x33:

    // End:0x2B7 [Loop If]
    if(I <= maxsegments)
    {
        // End:0x93
        if(bEnableShadows)
        {
            knot = winchowner.Spawn(Class'LPSplineLoftActorWithShadow');            
        }
        else
        {
            knot = winchowner.Spawn(Class'LPSplineLoftActorSpawnable');
        }
        // End:0x12F
        if(knot.MeshLightEnvironment != none)
        {
            knot.MeshLightEnvironment.bCastShadows = bEnableShadows;
        }
        SetSplineSegmentVisibility(knot, false);
        knot.bBlockActors = false;
        knot.SetCollisionType(1);
        knot.DeformMesh = CableMesh;
        knot.ScaleX = MeshThickness;
        knot.ScaleY = MeshThickness;
        knot.SplineActorTangent = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x26D
        if(I > 0)
        {
            SplinesPool[I - 1].AddConnectionTo(knot);
        }
        SplinesPool[I] = knot;
        knot.UpdateSplineComponents();
        ++I;
        // [Loop Continue]
        goto J0x33;
    }
    I = 0;
    J0x2C2:

    // End:0x38B [Loop If]
    if(I < SplinesPool.Length)
    {
        J = 0;
        J0x2E5:

        // End:0x37D [Loop If]
        if(J < SplinesPool[I].SplineMeshComps.Length)
        {
            SplinesPool[I].SplineMeshComps[J].CastShadow = bEnableShadows;
            J++;
            // [Loop Continue]
            goto J0x2E5;
        }
        I++;
        // [Loop Continue]
        goto J0x2C2;
    }
    Phase = 0.0000000;
    CableMesh = none;
    oldinterpfactor = 0.0000000;
    HasBeenInitialized = true;
    //return;    
}

simulated function SetSplineSegmentVisibility()
{
    local /*0x97E50000-0x00000000*/ private @NULL SplineSegmentToHide[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    SplineSegmentToHide.SetHidden(!bVisible);
    // End:0x59
    if(bVisible)
    {
        SplineSegmentToHide.bShouldUpdate = true;
    }
    //return;    
}

simulated function SetTighten()
{
    local /*0x97E50000-0x00000000*/ private bool bNewTighten[8388609];

    bShouldTighten = bNewTighten;
    //return;    
}

delegate PollEndpoints()
{
    local /*0x97E50000-0x00000000*/ private @NULL sourcepos[25165825], TargetPos;

    //return;    
}

simulated function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL winchowner[8388609];
    local /*0x97E50000-0x00000000*/ private int maxsegments[8388609];
    local /*0x97E50000-0x00000000*/ private float max_length[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> poll_function[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShouldUpdatePerFrame[9437185];

    true
    MaxLength = max_length;
    __PollEndpoints__Delegate = poll_function;
    CreateSplines(winchowner, maxsegments);
    bShouldUpdateEveryFrame = bShouldUpdatePerFrame;
    Update(0.0000000);
    //return;    
}

defaultproperties
{
    bActive=true
    AmpScale=1.0000000
    FreqScale=1.0000000
    MinLength=45.0000000
    MeshThickness=1.0000000
    TickGroup=ETickingGroup.TG_PostAsyncWork
}