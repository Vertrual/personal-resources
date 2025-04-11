--[[
Will prob rewrite this to work as a module with better code whenever i want to. This is old and not made by me 

Call the arrow function to create an arrow in workspace. If you call the function twice with the same name, the second call will replace & reuse the original.
This works well when calling from within a Heartbeat event listener to update the arrow every frame.

arrow(name: string, from: Vector3, to: Vector3) -> Creates an arrow between from and to
arrow(name: string, point: Vector3) -> Creates an arrow pointing at point
arrow(name: string, cframe: CFrame) -> Creates an arrow with its point at the CFrame position facing the CFrame LookVector
arrow(name: string, part: BasePart) -> Arrow represents the Part's CFrame
arrow(name: string, fromPart: BasePart, toPart: BasePart) -> Arrow between the two parts

]]


local function arrow(name, from, to, color, scale)
	color = color or BrickColor.random().Color
	scale = scale or 1

	if typeof(from) == "Instance" then
		if from:IsA("BasePart") then

			from = from.CFrame
		elseif from:IsA("Attachment") then
			from = from.WorldCFrame
		end

		if to ~= nil then
			from = from.p
		end
	end

	if typeof(to) == "Instance" then
		if to:IsA("BasePart") then
			to = to.Position
		elseif to:IsA("Attachment") then
			to = to.WorldPosition
		end
	end

	if typeof(from) == "CFrame" and to == nil then
		local look = from.lookVector
		to = from.p
		from = to + (look * -10)
	end

	if to == nil then
		to = from
		from = to + Vector3.new(0, 10, 0)
	end

	assert(typeof(from) == "Vector3" and typeof(to) == "Vector3", "Passed parameters are of invalid types")

	local container = workspace:FindFirstChild("Arrows") or Instance.new("Folder")
	container.Name = "Arrows"
	container.Parent = workspace

	local shaft = container:FindFirstChild(name .. "_shaft") or Instance.new("CylinderHandleAdornment")

	shaft.Height = (from - to).magnitude - 2

	shaft.CFrame = CFrame.lookAt(
		((from + to)/2) - ((to - from).unit * 1),
		to
	)

	if shaft.Parent == nil then
		shaft.Name = name .. "_shaft"
		shaft.Color3 = color
		shaft.Radius = 0.15
		shaft.Adornee = workspace.Terrain
		shaft.Transparency = 0
		shaft.Radius = 0.15 * scale
		shaft.Transparency = 0
		shaft.AlwaysOnTop = true
		shaft.ZIndex = 5 - math.ceil(scale)
	end

	shaft.Parent = container

	local pointy = container:FindFirstChild(name .. "_head") or Instance.new("ConeHandleAdornment")

	scale = scale == 1 and 1 or 1.4

	if pointy.Parent == nil then
		pointy.Name = name .. "_head"
		pointy.Color3 = color
		pointy.Radius = 0.5 * scale
		pointy.Transparency = 0
		pointy.Adornee = workspace.Terrain
		pointy.Height = 2 * scale
		pointy.AlwaysOnTop = true
		pointy.ZIndex = 5 - math.ceil(scale)
	end

	pointy.CFrame = CFrame.lookAt((CFrame.lookAt(to, from) * CFrame.new(0, 0, -2 - ((scale-1)/2))).p, to)

	pointy.Parent = container
	
	if scale == 1 then
		arrow(name .. "_backdrop", from, to, Color3.new(0, 0, 0), 2)
	end
end
