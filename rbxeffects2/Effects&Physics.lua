--[[
	Effects&Physics.lua
	https://github.com/interpreterK/CustomRBXphysicsAndEffects
]]

local Module = {
	Parts = {},
	Connections = {}
}
Module.__index = Module

local RS = game:GetService("RunService")
local wait = task.wait
local CN, ANG = CFrame.new, CFrame.Angles
local Sine, Change = 0, 1
local V3 = Vector3.new
local insert = table.insert

local function ClearConnections(self)
	for _, Connection in next, self.Connections do
		Connection:Disconnect()
	end
	self.Connections = {}
end

local function CreatePlainBlock(self, At)
	local Part = Instance.new("Part")
	Part.CFrame = At
	Part.Anchored = true
	Part.Parent = workspace
	insert(self.Parts, Part)
	return Part
end

function Module:StopAllEffects(Destroy)
	ClearConnections(self)
	for _, Part in next, self.Parts do
		if Destroy then
			pcall(function()
				Part:Destroy()
			end)
		else
			pcall(function()
				Part.CanCollide = true
				Part.Anchored = false
			end)
		end
	end
	self.Parts = {}
end

function Module:BlockCircle(At)
	insert(self.Connections, RS.Heartbeat:Connect(function()
		for i = 1, #self.Parts do
			self.Parts[i].CFrame *= CN(0, 0.40, 0.40) * ANG(0.1, 0, 0)
		end
	end))
	for i = 1, 9 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.1)
	end
end

function Module:BlockSnake(At)
	insert(self.Connections, RS.Heartbeat:Connect(function()
		for i = 1, #self.Parts do
			self.Parts[i].CFrame *= CN(0, 0.50, 0.50) * ANG(0.1, 0, 0.1)
		end
	end))
	for i = 1, 50 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.1)
	end
end

function Module:SpiralBlockStairs(At)
	insert(self.Connections, RS.Heartbeat:Connect(function()
		for i = 1, #self.Parts do
			self.Parts[i].CFrame *= CN(0, 0.50, 0.50) * ANG(0, 0.1, 0)
		end
	end))
	for i = 1, 50 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.1)
	end
end

function Module:SawBlade(At)
	insert(self.Connections, RS.Heartbeat:Connect(function()
		for i = 1, #self.Parts do
			self.Parts[i].CFrame *= CN(0, 0.50, 0.50) * ANG(0.5, 0, 0)
		end
	end))
	for i = 1, 55 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.1)
	end
end

function Module:JetTurbine(At)
	insert(self.Connections, RS.Heartbeat:Connect(function()
		for i = 1, #self.Parts do
			self.Parts[i].CFrame *= ANG(1.50, 1.50, 1.50)
		end
	end))
	for i = 1, 100 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.1)
	end
end

function Module:DancingBlocks(At)
	insert(self.Connections, RS.Heartbeat:Connect(function()
		Sine += Change
		for i = 1, #self.Parts do
			self.Parts[i].CFrame *= CN(0, 0.70 * math.sin(Sine / 50), 0) * ANG(0, 0, 0.1) * CN(0, 0.5, 0)
		end
	end))
	for i = 1, 2 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.5)
	end
end

function Module:CubicSpin(At)
	insert(self.Connections, RS.Heartbeat:Connect(function()
		Sine += Change
		for i = 1, #self.Parts do
			self.Parts[i].CFrame *= CN(0, 0.1 * math.cos(Sine / 50), 0) * ANG(0, 0.1 * math.cos(50 / Sine), 0)
		end
	end))
	CreatePlainBlock(self, At or CN(0, 10, 0))
end

function Module:StretchyCircle(At)
	insert(self.Connections, RS.Heartbeat:Connect(function()
		Sine += Change
		for i = 1, #self.Parts do
			self.Parts[i].CFrame *= CN(0, 0.50, 0.50) * ANG(0.1, 0, 0) * (#self.Parts == 70 and CN(0, 0.50 * math.cos(50 / Sine), 0.50 * math.cos(50 / Sine)) or CN())
		end
	end))
	for i = 1, 70 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.01)
	end
end

function Module:CosInfinity(At)
	insert(self.Connections, RS.Heartbeat:Connect(function()
		Sine += Change
		for i = 1, #self.Parts do
			self.Parts[i].CFrame *= CN(0, 0.55 * math.cos(Sine / 30), 0) * ANG(0.1, 0, 0)
		end
	end))
	for i = 1, 200 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0)
	end
end

function Module:Rope(At)
	insert(self.Connections, RS.Heartbeat:Connect(function()
		Sine += Change
		for i = 1, #self.Parts do
			self.Parts[i].CFrame *= CN(3 * math.cos(Sine / 30), 0.50 * math.cos(Sine / 30), 0) * ANG(0.1, 0.3, 0)
		end
	end))
	for i = 1, 195 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0)
	end
end

function Module:BuildingLineStrip(At)
	insert(self.Connections, RS.Heartbeat:Connect(function()
		Sine += Change
		for i = 1, #self.Parts do
			self.Parts[i].CFrame *= CN(1 * math.sin(Sine / 100), 0, 0.25 * math.sin(Sine / 100)) * ANG(0.5, 0.1, 0.1 * math.cos(10 / Sine))
		end
	end))
	for i = 1, 150 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0.01)
	end
end

function Module:BuildingSpiralStrip(At)
	insert(self.Connections, RS.Heartbeat:Connect(function()
		Sine += Change
		for i = 1, #self.Parts do
			self.Parts[i].CFrame *= CN(0.1 * math.cos(20 / Sine), 0.1 * math.cos(20 / Sine), 0.1 * math.cos(20 / Sine)) * ANG(-0.1, -0.1, 0.1)
		end
	end))
	for i = 1, 500 do
		CreatePlainBlock(self, At or CN(0, 10, 0))
		wait(0)
	end
end

function Module:GenerateTerrain(Xaxis, Zaxis, Seed, Height)
	local Xaxis, Zaxis = math.abs(Xaxis or 100), math.abs(Zaxis or 100)
	local Seed = Seed or Random.new():NextNumber(1, 1e5)
	for X = -Xaxis, Xaxis do
		for Z = -Zaxis, Zaxis do
			local Block = CreatePlainBlock(self, CN())
			Block.Position = V3(X, math.noise(Seed, X/10, Z/10) * (Height or 5), Z)
		end
		wait(0)
	end
end

function Module:GenerateEvenTerrain(Xaxis, Zaxis, Seed, Height)
	local Xaxis, Zaxis = math.abs(Xaxis or 100), math.abs(Zaxis or 100)
	local Seed = Seed or Random.new():NextNumber(1, 1e5)
	for X = -Xaxis, Xaxis do
		for Z = -Zaxis, Zaxis do
			local Block = CreatePlainBlock(self, CN())
			Block.Position = V3(X, math.noise(Seed, X/10, Z/10) * (Height or 5), Z) * Block.Size
		end
		wait(0)
	end
end

return Module
