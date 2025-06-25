-- SHANZ GUI FINAL by shanz ☠️
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local logo = "https://raw.githubusercontent.com/Shandika539/Shanz-script/main/logo.png"

local Window = Rayfield:CreateWindow({
   Name = "SHANZ GUI ☠️",
   LoadingTitle = "SHANZ GUI",
   LoadingSubtitle = "by shanz",
   ConfigurationSaving = {
      Enabled = false,
   },
   Discord = {
      Enabled = false,
   },
   KeySystem = false,
   Image = logo
})

-- MAIN TAB
local Main = Window:CreateTab("Main Menu", 4483362458)

Main:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 200},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end
})

Main:CreateSlider({
   Name = "JumpPower",
   Range = {50, 300},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end
})

Main:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Callback = function(State)
      getgenv().InfiniteJump = State
      game:GetService("UserInputService").JumpRequest:Connect(function()
         if getgenv().InfiniteJump then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
         end
      end)
   end
})

Main:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Callback = function(v)
      if v then
         loadstring(game:HttpGet("https://pastefy.app/flyfe/raw"))()
      end
   end
})

Main:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Callback = function(state)
      getgenv().noclip = state
      local plr = game.Players.LocalPlayer
      game:GetService("RunService").Stepped:Connect(function()
         if getgenv().noclip then
            pcall(function()
               plr.Character.Humanoid:ChangeState(11)
            end)
         end
      end)
   end
})

Main:CreateToggle({
   Name = "Invisible",
   CurrentValue = false,
   Callback = function(state)
      if state then
         local char = game.Players.LocalPlayer.Character
         local root = char:FindFirstChild("HumanoidRootPart")
         if root then
            root:Destroy()
         end
      end
   end
})

Main:CreateToggle({
   Name = "Fullbright",
   CurrentValue = false,
   Callback = function(v)
      if v then
         game:GetService("Lighting").Ambient = Color3.new(1, 1, 1)
         game:GetService("Lighting").Brightness = 2
         game:GetService("Lighting").FogEnd = 1e10
      else
         game:GetService("Lighting").Ambient = Color3.new(0, 0, 0)
         game:GetService("Lighting").Brightness = 1
         game:GetService("Lighting").FogEnd = 1000
      end
   end
})

Main:CreateButton({
   Name = "Teleport Tool",
   Callback = function()
      local tool = Instance.new("Tool", game.Players.LocalPlayer.Backpack)
      tool.RequiresHandle = false
      tool.Name = "Teleport Tool"
      tool.Activated:Connect(function()
         local mouse = game.Players.LocalPlayer:GetMouse()
         game.Players.LocalPlayer.Character:MoveTo(mouse.Hit.Position)
      end)
   end
})

Main:CreateButton({
   Name = "Auto Collect Tools (non-paid)",
   Callback = function()
      for _, obj in pairs(workspace:GetDescendants()) do
         if obj:IsA("Tool") and not obj:FindFirstChildWhichIsA("RemoteEvent") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, obj.Handle, 0)
            task.wait(1)
         end
      end
   end
})

Main:CreateInput({
   Name = "Auto Tanam (Grow A Garden)",
   PlaceholderText = "Nama Seed (Contoh: Banana)",
   RemoveTextAfterFocusLost = true,
   Callback = function(seedName)
      for _, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
         if v:IsA("Tool") and v.Name:lower():find(seedName:lower()) then
            v.Parent = game.Players.LocalPlayer.Character
            task.wait(0.5)
            v:Activate()
         end
      end
   end
})

-- ESP TAB
local ESP = Window:CreateTab("ESP Menu", 4483362458)

ESP:CreateToggle({
   Name = "ESP Player",
   CurrentValue = false,
   Callback = function(state)
      if state then
         loadstring(game:HttpGet("https://pastefy.app/espplayer/raw"))()
      end
   end
})

ESP:CreateToggle({
   Name = "ESP Mob",
   CurrentValue = false,
   Callback = function(state)
      if state then
         loadstring(game:HttpGet("https://pastefy.app/espmob/raw"))()
      end
   end
})

ESP:CreateToggle({
   Name = "ESP Unicorn (Dead Rails)",
   CurrentValue = false,
   Callback = function(state)
      if state then
         loadstring(game:HttpGet("https://pastefy.app/espunicorn/raw"))()
      end
   end
})

ESP:CreateToggle({
   Name = "Aimbot (Zombie)",
   CurrentValue = false,
   Callback = function(on)
      if on then
         loadstring(game:HttpGet("https://pastefy.app/aimbotzombie/raw"))()
      end
   end
})
