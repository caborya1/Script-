# Quick Start Guide

## 🚀 Getting Started in 3 Easy Steps

### Step 1: Choose Your Version
- **`main.lua`** - Best for most users (auto-starts all features)
- **`AutoScriptGUI.lua`** - If you want manual control with a GUI

### Step 2: Execute the Script
1. Open your game executor
2. Copy the entire contents of `main.lua`
3. Paste into your executor
4. Click Execute/Inject

### Step 3: Enjoy!
The script will automatically start and display a notification. All features are now running!

## 🎮 What Each Feature Does

| Feature | Description | Default |
|---------|-------------|---------|
| Auto Money | Collects money from the game world | ON |
| Auto Collect | Collects all items and drops | ON |
| Auto Trade | Sells/trades items automatically | ON |
| Auto Upgrade | Upgrades all your stats | ON |
| Auto Speed | Makes you move faster | ON |
| Auto Rebirth | Rebirths when you hit 1M money | ON |

## ⚙️ Customization

### Change Rebirth Threshold
Find this line in the code:
```lua
RebirthThreshold = 1000000,
```
Change to your preferred amount (e.g., `5000000` for 5 million)

### Change Speed Multiplier
Find this line:
```lua
SpeedMultiplier = 2,
```
Change to your preferred speed (e.g., `3` for 3x speed)

### Disable a Feature
Find the feature in Config and change to `false`:
```lua
AutoRebirth = false,  -- This disables auto rebirth
```

## 🐛 Troubleshooting

### Script Not Working?
1. Make sure you're in the correct game
2. Try re-executing the script
3. Check if your executor is updated

### Speed Not Working?
Some games have anti-speed measures. Try lowering the `SpeedMultiplier` to `1.5` or `1.8`.

### Not Auto-Collecting?
The script looks for common folder names. The game might use different names for collectibles.

## 💡 Pro Tips

1. **Start Small**: If the script seems too aggressive, disable some features
2. **Monitor Progress**: Watch your rebirths counter to see if auto-rebirth is working
3. **Speed Settings**: If you get kicked, lower the speed multiplier
4. **AFK Friendly**: This script is designed to run while you're away!

## 📱 Need Help?

Check the main README.md for detailed feature explanations and configuration options.

---

**Happy Gaming!** 🎮
