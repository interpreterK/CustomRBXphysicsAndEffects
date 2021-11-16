local Module = {
	Parts = {},
	Connections = {}
}
Module.__index = Module

local RS = game:GetService("RunService")
local wait = task.wait
local CN = CFrame.new
local ANG = CFrame.Angles
local Sine, Change = 0, 1

local function ClearConnections(self)
	for _,v in next, self.Connections do
		v:Disconnect()
	end
	self.Connections = {}
end

local function CreatePlainBlock(self, At)
	local Part = Instance.new("Part")
	Part.Name = "Effect_Part"
	Part.CFrame = At
	Part.Anchored = true
	Part.Parent = workspace
	table.insert(self.Parts, Part)
end

function Module:StopAllEffects(Destroy)
	ClearConnections(self)
	for _,v in next, self.Parts do
		if Destroy then
			v:Destroy()
		else
			v.CanCollide = true
			v.Anchored = false
		end
	end
	self.Parts = {}
end

function Module:BlockCircle(At)
	table.insert(self.Connections, RS.Heartbeat:Connect(function()
		for i = 1, #self.Parts do
			local Part = self.Parts[i]
			Part.CFrame = Part.CFrame * CN(0, 0.50, 0.50) * ANG(0.1, 0, 0)
		end
	end))
	for i = 1, 9 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.1)
	end
end

function Module:BlockSnake(At)
	table.insert(self.Connections, RS.Heartbeat:Connect(function()
		for i = 1, #self.Parts do
			local Part = self.Parts[i]
			Part.CFrame = Part.CFrame * CN(0, 0.50, 0.50) * ANG(0.1, 0, 0.1)
		end
	end))
	for i = 1, 50 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.1)
	end
end

function Module:SpiralBlockStairs(At)
	table.insert(self.Connections, RS.Heartbeat:Connect(function()
		for i = 1, #self.Parts do
			local Part = self.Parts[i]
			Part.CFrame = Part.CFrame * CN(0, 0.50, 0.50) * ANG(0, 0.1, 0)
		end
	end))
	for i = 1, 50 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.1)
	end
end

function Module:SawBlade(At)
	table.insert(self.Connections, RS.Heartbeat:Connect(function()
		for i = 1, #self.Parts do
			local Part = self.Parts[i]
			Part.CFrame = Part.CFrame * CN(0, 0.50, 0.50) * ANG(0.5, 0, 0)
		end
	end))
	for i = 1, 55 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.1)
	end
end

function Module:JetTurbine(At)
	table.insert(self.Connections, RS.Heartbeat:Connect(function()
		for i = 1, #self.Parts do
			local Part = self.Parts[i]
			Part.CFrame = Part.CFrame * ANG(1.50, 1.50, 1.50)
		end
	end))
	for i = 1, 100 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.1)
	end
end

function Module:DancingBlocks(At)
	table.insert(self.Connections, RS.Heartbeat:Connect(function()
		Sine += Change
		for i = 1, #self.Parts do
			local Part = self.Parts[i]
			Part.CFrame = Part.CFrame * CN(0, 0.70 * math.sin(Sine / 50), 0) * ANG(0, 0, 0.1) * CN(0, 0.5, 0)
		end
	end))
	for i = 1, 2 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.5)
	end
end

function Module:CubicSpin(At)
	table.insert(self.Connections, RS.Heartbeat:Connect(function()
		Sine += Change
		for i = 1, #self.Parts do
			local Part = self.Parts[i]
			Part.CFrame = Part.CFrame * CN(0, 0.1 * math.cos(Sine / 50), 0) * ANG(0, 0.1 * math.cos(50 / Sine), 0)
		end
	end))
	CreatePlainBlock(self, At or CN(0, 10, 0))
end

return Module