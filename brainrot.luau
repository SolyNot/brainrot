local LocalPlayer = game:GetService("Players").LocalPlayer

if not (getcustomasset and writefile and isfile) then
    LocalPlayer:Kick("Your executor is not supported!")
end

writefile("brainrot.mp3", "https://github.com/SolyNot/brainrot/raw/refs/heads/main/brainrot.mp3")

local count = 0
while not isfile("brainrot.mp3") and count < 60 do
    task.wait(1)
    count += 1
end

if count == 60 then
    LocalPlayer:Kick("Timeout!")
end

local music = Instance.new("Sound")
music.SoundId = getcustomasset("brainrot.mp3")
music.Volume = 10
music.Looped = true
music.Parent = game:GetService("SoundService")
music:Play()

local key = Instance.new("Sound")
key.SoundId = "rbxassetid://9116156872"
key.Volume = 1
key.Parent = game:GetService("SoundService")

game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
    key:Play()
end)