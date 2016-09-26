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

function [ named_params ] = setModelParameters2ExplVar( named_params )
%SETMODEL2EXPLVAR Summary of this function goes here
%   Detailed explanation goes here

    for iPidx = 1:named_params.NrParams
        
        if isempty(named_params.BlkField2Set{iPidx})
            continue;
        end
        
        if isempty(named_params.BlkFieldSyntax{iPidx})
            continue;
        end
        
        Syntax = named_params.BlkFieldSyntax{iPidx};
        
        Fieldentry = strrep(Syntax,'#',['eval(' named_params.ParamVariable{iPidx} ')']);
        
        set_param(named_params.BlkHandle(iPidx),...
                  named_params.BlkField2Set{iPidx},...
                  Fieldentry);
        
    end

end

