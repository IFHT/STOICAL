% STOICAL - A Toolbox for Efficient Parameter and Structure Variation of Simulation Models in Simulink
% Copyright (C) 2015 Tilman Wippenbeck, Institute for High Voltage Technology, RWTH Aachen University
% 
% This file is part of STOICAL.
% 
% STOICAL is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% at your option any later version.
%
% STOICAL is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>. 

function writeVariantsToModelWorkspace( NodeList, model_name, topstructurename )
%GETSIGNALSFROMMODELWORKSPACE Summary of this function goes here
%   Detailed explanation goes here
    
%% Get Model Workspace Handle
    hws = get_param(model_name,'ModelWorkspace');
    
%% Get Signals
    % Check if a STOICAL Data Entry exists
    if hws.hasVariable(topstructurename)
        TOPSTRUCT = hws.getVariable(topstructurename);
    else
        TOPSTRUCT = struct();
    end
    
    TOPSTRUCT.VariantDefinition = NodeList;
    
    hws.assignin(topstructurename,TOPSTRUCT);
    
end

