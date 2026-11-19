class DOTZAttractor extends Attractor
placeable;

var Sound EnabledSound;

function Activate( Pawn instigator ){
   Super.Activate( instigator );
   AmbientSound = EnabledSound;
}

function Deactivate(){
   Super.Deactivate();
   AmbientSound = None;
}
