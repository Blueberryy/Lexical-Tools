--[[
	Fading Doors (c) 2012-2013 Lex Robinson
	Thanks to Conna Wiles for releasing the first version of this tool
	This code is released freely under the MIT license
--]]

--[[ Tool Related Settings ]]--
TOOL.Category = "Lexical Tools";
TOOL.Name = "#Fading Doors";

TOOL.ClientConVar["key"]      = "5"
TOOL.ClientConVar["toggle"]   = "0"
TOOL.ClientConVar["reversed"] = "0"

local function checkTrace(tr)
    return IsValid(tr.Entity) and not (tr.Entity:IsPlayer() or tr.Entity:IsNPC() or tr.Entity:IsVehicle());
end

if (CLIENT) then
	usermessage.Hook("FadingDoorHurrah!", function()
		GAMEMODE:AddNotify("Fading door has been created!", NOTIFY_GENERIC, 10);
		surface.PlaySound ("ambient/water/drip" .. math.random(1, 4) .. ".wav");
	end);
	language.Add("Tool.fading.doors_name", "Fading Doors");
	language.Add("Tool.fading.doors_desc", "Makes anything into a fadable door");
	language.Add("Tool.fading.doors_0",    "Click on something to make it a fading door. Reload to set it back to normal");
	language.Add("Undone_fading_door",     "Undone Fading Door");
	
	function TOOL.BuildCPanel(panel)
        panel:CheckBox("Reversed (Starts invisible, becomes solid)", "fading_doors_reversed");
	    panel:CheckBox("Toggle Active", "fading_doors_toggle");
        panel:AddControl("Numpad",
            {
                Label = "Button",
                Command = "fading_doors_key"
            }
        );
	end
	
	TOOL.LeftClick = checkTrace;
	
	return;
end	

require('fadingdoors');

local function doUndo(undoData)
	for _, ent in pairs(undoData.Entities) do
		fadingdoors.RemoveDoor(ent);
	end
end

function TOOL:LeftClick(tr)
	if (not checkTrace(tr)) then
		return false;
	end
	local ent = tr.Entity;
	local ply = self:GetOwner();
	fadingdoors.SetupDoor(ply, ent, {
		key      = self:GetClientNumber("key");
		toggle   = self:GetClientNumber("toggle") == 1;
		reversed = self:GetClientNumber("reversed") == 1;
	});
	undo.Create("fading_door");
		undo.AddFunction(doUndo);
		undo.SetPlayer(ply);
	undo.Finish();
	
	SendUserMessage("FadingDoorHurrah!", ply);
	return true
end

function TOOL:Reload(tr)
	return checkTrace(tr) and fadingdoors.RemoveDoor(tr.Entity);
end
