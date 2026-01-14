local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local UIS = game:GetService("UserInputService")

local lp = Players.LocalPlayer

if not (getcustomasset and writefile and isfile) then
    lp:Kick("Your executor is not supported!")
end

local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))

local txt = Instance.new("TextLabel")
txt.Size = UDim2.fromScale(0.4, 0.08)
txt.Position = UDim2.fromScale(0.3, 0.45)
txt.TextScaled = true
txt.Text = "Preparing download..."
txt.Parent = gui

if not isfile("brainrot.mp3") then
    txt.Text = "Downloading..."

    local data
    local done = false

    task.spawn(function()
        data = game:HttpGet("https://github.com/SolyNot/brainrot/raw/refs/heads/main/brainrot.mp3", true)
        done = true
    end)

    local t = 0
    while not done do
        task.wait(0.1)
        t += 0.1

        txt.Text = ("Downloading... %d KB"):format(math.floor(t * 120))

        if t > 15 then
            lp:Kick("Download timeout!")
            return
        end
    end

    writefile("brainrot.mp3", data)

    local sizeKB = math.floor(#data / 1024)
    txt.Text = ("Download finished (%d KB)"):format(sizeKB)
    task.wait(1)
end

txt:Destroy()

local brainrottext = Instance.new("TextLabel")
brainrottext.Size = UDim2.fromScale(0.4, 0.08)
brainrottext.Position = UDim2.fromScale(0.3, 0)
brainrottext.BackgroundTransparency = 1
brainrottext.TextScaled = true
brainrottext.RichText = true
brainrottext.Text = "Say NOOB = BAN \nNO ONE IS GOOD ENOUGH TO SUPERCHAT"
brainrottext.Parent = gui

local music = Instance.new("Sound")
music.SoundId = getcustomasset("brainrot.mp3")
music.Volume = 1
music.Looped = true
music.Parent = SoundService
music:Play()

local key = Instance.new("Sound")
key.SoundId = "rbxassetid://9116156872"
key.Volume = 2
key.Parent = SoundService

UIS.InputBegan:Connect(function(_, e)
    key:Play()
end)