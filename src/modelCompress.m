% Copyright (C) 2020, Jorge M. Perez Zerpa, J. Bruno Bazzano, Joaquin Viera,
%   Mauricio Vanzulli, Marcelo Forets, Jean-Marc Battini, Sebastian Toro
%
% This file is part of ONSAS.
%
% ONSAS is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% ONSAS is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with ONSAS.  If not, see <https://www.gnu.org/licenses/>.

% function for storing solver's input/output data structures.

function [ modelCurrSol, modelProperties, BCsData ] = modelCompress( timeIndex, currTime, U, Udot, Udotdot, Stress, convDeltau, systemDeltauMatrix, timeStepStopCrit, timeStepIters, factorLoadsFextCell, loadFactorsFuncCell, neumDofs, KS, userLoadsFilename, Nodes, Conec, materials, elements, analysisSettings, outputDir, currLoadFactorsVals, problemName, plotsFormat, timesPlotsVec )

modelCurrSol = struct ( 'timeIndex'          , timeIndex,...
                        'currTime'           , currTime,...
                        'U'                  , U , ...
                        'Udot'               , Udot , ...
                        'Udotdot'            , Udotdot , ...
                        'Stress'             , Stress , ...
                        'convDeltau'         , convDeltau, ...
                        'currLoadFactorsVals', currLoadFactorsVals, ...
                        'systemDeltauMatrix' , systemDeltauMatrix, ...
                        'timeStepStopCrit'   , timeStepStopCrit , ...
                        'timeStepIters'      , timeStepIters     ...
                      ) ;

BCsData.factorLoadsFextCell = factorLoadsFextCell ;
BCsData.loadFactorsFuncCell = loadFactorsFuncCell ;
BCsData.neumDofs            = neumDofs            ;
BCsData.KS                  = KS                  ;
BCsData.userLoadsFilename   = userLoadsFilename   ;

modelProperties = struct( 'Nodes'                    , Nodes             ...
                        , 'Conec'                    , Conec             ...
                        , 'materials'                , materials         ...
                        , 'elements'                 , elements          ...
                        , 'analysisSettings'         , analysisSettings  ...
                        , 'outputDir'                , outputDir         ...
                        , 'problemName'              , problemName       ...
                        , 'plotsFormat'              , plotsFormat  ...
                        , 'timesPlotsVec'            , timesPlotsVec ...
                        ) ;
