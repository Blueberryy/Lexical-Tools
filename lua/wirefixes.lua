--[[
	WireLib Additions (c) 2013 Lex Robinson
	This code is freely distributed under the MIT License
--]]

if (not WireLib or WireLib.AddInputs) then return; end

--[[
	
	Adds functions to non-destructively add or remove
	 Wire inputs and outputs to and from an entity.
	This abuses the oddly useless "destroy everything"
	 method that WireLib.AdjustSpeical(xxx) functions use.

--]]

function WireLib.AddSpecialInputs(ent, names, types, descs)
	-- TODO
end

function WireLib.AddSpecialOutputs(ent, names, types, descs)
	-- TODO
end

function WireLib.RemoveSpecialInputs(ent, names)
	-- TODO
end

function WireLib.RemoveSpeicalOutputs(ent, names)
	-- TODO
end



function Wire_AddInputs(ent, names, descs)
	-- TODO
end

function Wire_AddOutputs(ent, names, descs)
	-- TODO
end

function Wire_RemoveInputs(ent, names)
	-- TODO
end

function Wire_RemoveOutputs(ent, names)
	-- TODO
end



WireLib.AddInputs            = Wire_AddInputs
WireLib.AddOutputs           = Wire_AddOutputs
WireLib.RemoveInputs         = Wire_RemoveInputs
WireLib.RemoveOutputs        = Wire_RemoveOutputs
