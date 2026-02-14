# REDYNHUB AutoScript

OP auto money, auto collect, auto trade, auto upgrade, auto speed and auto rebirth and more!

## 🚀 Features

✅ **Auto Money** - Automatically collects money/coins/cash from the game world  
✅ **Auto Collect** - Collects all collectibles, drops, and items automatically  
✅ **Auto Trade** - Automatically sells and trades items for maximum profit  
✅ **Auto Upgrade** - Upgrades all your stats (Damage, Speed, Power, etc.) automatically  
✅ **Auto Speed** - Boosts your character's movement speed for faster gameplay  
✅ **Auto Rebirth** - Automatically rebirths/prestiges when you reach the threshold  

## 📦 Files

- **`main.lua`** - Standalone version with all features (recommended for most users)
- **`AutoScript.lua`** - Core automation script (advanced users)
- **`AutoScriptGUI.lua`** - GUI version with toggle buttons for each feature

## 🎮 How to Use

### Quick Start (Recommended)
1. Copy the contents of `main.lua`
2. Paste into your executor
3. Execute the script
4. All features will start automatically!

### With GUI
1. Copy the contents of `AutoScriptGUI.lua`
2. Paste into your executor
3. Execute the script
4. Use the GUI to toggle features on/off

## ⚙️ Configuration

You can customize the script by modifying these settings in the code:

```lua
Config = {
    AutoMoney = true,           -- Enable/disable auto money
    AutoCollect = true,         -- Enable/disable auto collect
    AutoTrade = true,           -- Enable/disable auto trade
    AutoUpgrade = true,         -- Enable/disable auto upgrade
    AutoSpeed = true,           -- Enable/disable auto speed
    AutoRebirth = true,         -- Enable/disable auto rebirth
    RebirthThreshold = 1000000, -- Money needed before auto rebirth
    UpgradeInterval = 5,        -- Seconds between upgrade attempts
    CollectInterval = 1,        -- Seconds between collect attempts
    TradeInterval = 10,         -- Seconds between trade attempts
    SpeedMultiplier = 2,        -- Speed boost multiplier (2x default)
}
```

## 🎯 Features Explained

### Auto Money
Automatically teleports to and collects money pickups scattered around the game world.

### Auto Collect
Continuously collects all collectible items, drops, and other pickups in the game. Works with various collection systems.

### Auto Trade
Automatically executes trades and sells items to maximize your profits without manual intervention.

### Auto Upgrade
Upgrades all available stats including:
- Damage
- Speed
- Collection
- Multiplier
- Power
- Strength

### Auto Speed
Boosts your character's walking speed for faster movement around the game world.

### Auto Rebirth
Automatically triggers rebirth/prestige when you reach the configured money threshold, allowing for continuous progression.

## 📝 Notes

- All features use `pcall` for error handling to prevent crashes
- The script automatically handles character respawns
- Works with most common game structures and event systems
- Compatible with various executor tools

## ⚠️ Disclaimer

This script is for educational purposes only. Use at your own risk.

## 🔄 Updates

Check back regularly for updates and new features!

---

**Created by REDYNHUB** | Enjoy automated gameplay! 🎮
