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

function [ vars2set, values2set ] = getallVSExplVarSettingForDefaultVariant( NodeList )
%SETALLVS2DEFAULTVARIANT Summary of this function goes here
%   Detailed explanation goes here

    if ~any(NodeList.IsVariantSubsystem)
        vars2set = cell(0,1);
        values2set = cell(0,1);
        return;
    end

    filt_isVS = NodeList.IsVariantSubsystem;
    %VSidx = find(filt_isVS);

    vars2set = NodeList.VSControlVariable(filt_isVS,1);
    values2set = NodeList.VSDefaultVariantNr(filt_isVS,1);

end

