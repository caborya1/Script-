# REDYNHUB - Auto Features Script

OP auto money, auto collect, auto trade, auto upgrade, auto speed and auto rebirth and more!

## 🚀 Features

- ✅ **Auto Money** - Automatically collect money/coins/cash
- ✅ **Auto Collect** - Automatically collect gems, orbs, crystals, and other collectibles
- ✅ **Auto Trade** - Automatically interact with traders and merchants
- ✅ **Auto Upgrade** - Automatically upgrade your stats and abilities
- ✅ **Auto Speed** - Boost your movement speed with configurable multiplier
- ✅ **Auto Rebirth** - Automatically rebirth when threshold is reached
- ✅ **Easy-to-use GUI** - Simple interface with toggles and sliders
- ✅ **Customizable Settings** - Adjust intervals and thresholds to your preference

## 📦 Installation

### Method 1: Loader Script (Recommended)
Copy and paste this into your executor:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/caborya1/Script-/main/loader.lua"))()
```

### Method 2: Direct GUI Load
Copy and paste this into your executor:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/caborya1/Script-/main/GUI.lua"))()
```

### Method 3: Manual Loading
1. Download `REDYNHUB.lua` and `GUI.lua`
2. Load them in your executor

## 🎮 Usage

1. Execute the loader script in your game
2. A GUI will appear on the right side of your screen
3. Toggle the features you want to enable:
   - Click on each feature button to turn it ON/OFF
   - Green = ON, Red = OFF
4. Adjust settings using the sliders:
   - **Money Interval**: How often to collect money (0.1-5 seconds)
   - **Collect Interval**: How often to collect items (0.1-3 seconds)
   - **Speed Multiplier**: Movement speed boost (1-5x)
   - **Rebirth Threshold**: Level/money needed for auto rebirth (100-10000)
5. Click "START ALL" to activate all enabled features
6. Click "STOP ALL" to deactivate all features
7. The GUI is draggable - click and drag the top bar to move it

## ⚙️ Configuration

You can customize the script behavior by adjusting the settings in the GUI:

- **Intervals**: Control how frequently actions are performed
- **Speed Multiplier**: Control your movement speed boost
- **Rebirth Threshold**: Set when auto rebirth should trigger

## 🔧 Advanced Usage

For developers who want to use the REDYNHUB module directly:

```lua
local REDYNHUB = loadstring(game:HttpGet("https://raw.githubusercontent.com/caborya1/Script-/main/REDYNHUB.lua"))()

-- Enable features
REDYNHUB:SetConfig("AutoMoney", true)
REDYNHUB:SetConfig("AutoCollect", true)

-- Set custom intervals
REDYNHUB:SetConfig("MoneyInterval", 0.5)
REDYNHUB:SetConfig("SpeedMultiplier", 3)

-- Start the automation
REDYNHUB:Start()

-- Stop when done
REDYNHUB:Stop()
```

## 🛡️ Safety & Compatibility

- Works with most Roblox games that have standard remote patterns
- Uses protected calls (pcall) to prevent crashes
- Safe to use with other scripts
- Can be stopped at any time

## 📝 Notes

- Some features may not work in all games depending on the game's implementation
- Always use responsibly and follow game rules
- Script performance depends on game structure and network conditions
- The GUI can be closed using the X button in the top-right corner

## 🐛 Troubleshooting

**Script not loading?**
- Make sure you have a working executor
- Check your internet connection
- Try the direct GUI load method

**Features not working?**
- Different games use different remote patterns
- Try adjusting the intervals in settings
- Make sure you're in a compatible game

**GUI not appearing?**
- Check if it's already loaded (only one instance allowed)
- Try reloading the script
- Make sure your executor supports GUI creation

## 📜 Version

Current Version: **1.0.0**

## 🔗 Links

- Repository: https://github.com/caborya1/Script-
- Issues: https://github.com/caborya1/Script-/issues

## ⚠️ Disclaimer

This script is for educational purposes only. Use at your own risk. The developers are not responsible for any consequences of using this script.
