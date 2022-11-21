local Player = game.Players.LocalPlayer
local Vehicle

local function StartRace()
    firesignal(Player.PlayerGui.MainGUI.Events.List["Sprint_Shirosato Quarter Mile Drag"].TeleportButton.MouseButton1Click)
    repeat task.wait() until Player.PlayerGui:FindFirstChild("EventGui") and Player.PlayerGui.EventGui:FindFirstChild("Main")
    firesignal(Player.PlayerGui.EventGui.Main.KeyToJoin.MouseButton1Down)
    task.wait(1.2)
    firesignal(Player.PlayerGui.EventGui.Main.Players.List.VoteButton.MouseButton1Click)
end

local Goal = CFrame.new(1218.19165, 3.48384881, -2157.81152, -0.970356345, -0.0539006814, -0.235591307, 0.000348039641, 0.974499762, -0.224388257, 0.241678342, -0.217818573, -0.945593297)

local PathfindingService = game:GetService("PathfindingService")
local Path = PathfindingService:CreatePath({
    AgentCanJump = false,
    WaypointSpacing = 20
})

Path:ComputeAsync(Vector3.new(1089.49634, 3.99999762, -3679.16406), Goal.p)

local Waypoints = Path:GetWaypoints()

while true do
    StartRace()
    repeat task.wait() until Player.PlayerGui:FindFirstChild("ProgressGui") and Player.PlayerGui.ProgressGui:FindFirstChild("Header")
    task.wait(2)
    Player.PlayerGui.ProgressGui.Header.TimeScore.Changed:Wait()
    
    local Vehicle = workspace.VehiclesFolder[Player.Name]:GetChildren()[1]
    for i = 1, #Waypoints do
        local v = Waypoints[i]
        Vehicle:PivotTo(CFrame.new(v.Position) * CFrame.new(0, 1.25, 0))
        task.wait()
    end

    Vehicle:PivotTo(CFrame.new(1240.78992, 4.49661136, -2171.28442, -0.98174423, 0.0423743129, 0.185425758, 0.000132641959, 0.975020766, -0.222113758, -0.190205872, -0.218034312, -0.957226634))
    
    if Player.PlayerGui:FindFirstChild("ProgressGui") then
        repeat task.wait() until Player.PlayerGui.ProgressGui.Results.Visible
        Player.PlayerGui.ProgressGui:Destroy()
    end
    
    task.wait(1)
end
