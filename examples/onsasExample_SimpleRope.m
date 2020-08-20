% ------------------------------------
% TEST example simple pendulum Boolean Self Whight
% ------------------------------------

clear all, close all

% --- general data ---
inputONSASversion = '0.1.10';
dirOnsas = [ pwd '/..' ] ;
problemName = 'simpleRope' ;
% ------------------------------------

% -- scalar params -----
Es  = 10e11   ;
nu  = 0       ;
d   = .1      ;
l   = 40      ;
rho  = 7850   ;
g   = 9.81    ;

nodalDispDamping = 0.5 ;




% ----- geometry -----------------
Nelem = 20 ;

Nodes = [ (0:(Nelem))'*l/Nelem zeros(Nelem+1,2) ] ;

auxconec = [ (ones(Nelem,1)*[ 1 2 0 1 0]) (1:(Nelem))' (2:(Nelem+1))' ] ;

Conec = cell(2+Nelem,1) ;

Conec{1, 1} = [ 0 1 0 0 1                     1       ] ; % fixed node
Conec{2, 1} = [ 0 1 0 0 1                     Nelem+1 ] ; % fixed node
for i=1:Nelem
  Conec{2+i, 1} =  auxconec(i,:) ;
end

%  --- MELCS params ---

materialsParams = { [ rho 3 Es nu ] } ; %truss
% materialsParams = { [ rho 3 Es nu ] } ; %beam
% elementsParams = { 1 ; [ 3 ] } ;
elementsParams = { 1 ; [ 2 0] } ;

% loadsParams  = {[ 1 0  0  0  0  0  -rho*A*l0*0.5*g  0 ]};
booleanSelfWeightZ = 1 ;

crossSecsParams = { [2 d/2 d/2 ] } ;

springsParams = {[  inf  0  inf  0  inf 0 ]};

% -------------------


% method

timeIncr   =  0.05    ;
%~ timeIncr   =  0.1    ;

finalTime  =  4.13*10                ;
nLoadSteps = finalTime/timeIncr ;


alphaHHT = -0.05 ;
%~ DeltaNW    =  0.5               ;
%~ AlphaNW    =  0.25              ;
%~ alphaHHT = 0 ;

% tolerances
stopTolDeltau = 0           ; 
stopTolForcesTight = 1e-6           ;

stopTolIts    = 30              ;
% ------------------------------------

reportBoolean = 0 ;

controlDofs = [ 2 1 1 ] ;

% analysis parameters

%~ numericalMethodParams = [ 3 timeIncr finalTime stopTolDeltau stopTolForcesTight stopTolIts DeltaNW AlphaNW] ;
numericalMethodParams = [ 4 timeIncr finalTime stopTolDeltau stopTolForcesTight stopTolIts alphaHHT ] ;

%~ plotParamsVector = [ 1 ];
% sectPar = [12 .3 .3 ] ;
plotParamsVector = [ 3 50 ];

printFlag = 0 ;

acdir = pwd ; cd(dirOnsas); ONSAS, cd examples ;


