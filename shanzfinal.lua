-- SHANZ GUI FINAL by shanz ☠️
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()
local UI = Rayfield:CreateWindow({
   Name = "SHANZ GUI FINAL ☠️",
   LoadingTitle = "SHANZ GUI",
   LoadingSubtitle = "by shanz",
   ConfigurationSaving = {
       Enabled = true,
       FolderName = "SHANZConfig"
   },
   Discord = {
       Enabled = false
   },
   KeySystem = false
})

local Main = UI:CreateTab("Main Menu", 4483362458)
Main:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 200},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(v)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
   end
})

Main:CreateSlider({
   Name = "JumpPower",
   Range = {50, 300},
   Increment = 10,
   CurrentValue = 50,
   Callback = function(v)
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
   end
})

Main:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Callback = function(v)
       if v then
           game:GetService("UserInputService").JumpRequest:Connect(function()
               game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
           end)
       end
   end
})

Main:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Callback = function(v)
       loadstring(game:HttpGet("https://pastefy.app/VqVBJw26/raw"))()
   end
})

Main:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Callback = function(state)
       if state then
           game:GetService("RunService").Stepped:Connect(function()
               game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(11)
           end)
       end
   end
})

Main:CreateToggle({
   Name = "Invisible",
   CurrentValue = false,
   Callback = function(v)
       if v then
           local char = game.Players.LocalPlayer.Character
           char:FindFirstChild("Head").Transparency = 1
           char:FindFirstChild("Torso").Transparency = 1
           for _,v in pairs(char:GetChildren()) do
               if v:IsA("Accessory") then v.Handle.Transparency = 1 end
           end
       else
           local char = game.Players.LocalPlayer.Character
           char:FindFirstChild("Head").Transparency = 0
           char:FindFirstChild("Torso").Transparency = 0
           for _,v in pairs(char:GetChildren()) do
               if v:IsA("Accessory") then v.Handle.Transparency = 0 end
           end
       end
   end
})

Main:CreateButton({
   Name = "Teleport Tool",
   Callback = function()
       local tool = Instance.new("Tool", game.Players.LocalPlayer.Backpack)
       tool.Name = "TeleportTool"
       tool.RequiresHandle = false
       tool.Activated:Connect(function()
           local pos = game.Players.LocalPlayer:GetMouse().Hit.p
           game.Players.LocalPlayer.Character:MoveTo(pos)
       end)
   end
})

Main:CreateButton({
   Name = "Fullbright",
   Callback = function()
       game:GetService("Lighting").Brightness = 2
       game:GetService("Lighting").ClockTime = 14
       game:GetService("Lighting").FogEnd = 100000
       game:GetService("Lighting").GlobalShadows = false
   end
})

local ESP = UI:CreateTab("ESP Menu", 4483362458)
ESP:CreateToggle({
   Name = "ESP Player",
   CurrentValue = false,
   Callback = function(state)
       if state then
           loadstring(game:HttpGet("https://kishimotohub.xyz/esp"))()
       end
   end
})

ESP:CreateToggle({
   Name = "ESP Mob",
   CurrentValue = false,
   Callback = function(state)
       if state then
           loadstring(game:HttpGet("https://kishimotohub.xyz/esp-mob"))()
       end
   end
})

ESP:CreateToggle({
   Name = "ESP Unicorn (Dead Rails)",
   CurrentValue = false,
   Callback = function(state)
       if state then
           loadstring(game:HttpGet("https://pastefy.app/Hb1SCFx9/raw"))()
       end
   end
})
