# REDYNHUB Quick Start Guide

## ⚡ Quick Start

### Step 1: Copy the Loader
Copy this single line:
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/caborya1/Script-/main/loader.lua"))()
```

### Step 2: Execute
1. Open your Roblox executor
2. Paste the line into the executor
3. Click Execute

### Step 3: Configure
1. The GUI will appear on the right side
2. Toggle the features you want:
   - **Auto Money** - Collect coins automatically
   - **Auto Collect** - Collect gems/orbs automatically
   - **Auto Trade** - Auto trade with merchants
   - **Auto Upgrade** - Auto upgrade stats
   - **Auto Speed** - Movement speed boost
   - **Auto Rebirth** - Auto rebirth when ready
3. Adjust settings with the sliders
4. Click "START ALL"

## 🎯 Features Explained

### Auto Money
Automatically collects all money, coins, and cash in the game. Teleports to collect coins and uses remote events.

### Auto Collect
Collects gems, orbs, crystals, and other collectible items automatically.

### Auto Trade
Finds and interacts with traders, merchants, and shops automatically.

### Auto Upgrade
Automatically purchases upgrades for your stats and abilities.

### Auto Speed
Boosts your character's walking speed by a configurable multiplier (1-5x).

### Auto Rebirth
Automatically rebirths your character when you reach the configured threshold.

## 🔧 Settings Guide

### Money Interval (0.1-5s)
- Lower = Faster collection, more server requests
- Higher = Slower collection, less server load
- **Recommended: 1.0s**

### Collect Interval (0.1-3s)
- How often to scan for collectibles
- **Recommended: 0.5s**

### Speed Multiplier (1-5x)
- How much faster you move
- **Recommended: 2x** (too high may get detected)

### Rebirth Threshold (100-10000)
- Level or money needed before auto rebirth triggers
- **Recommended: 1000**

## ⚠️ Tips

1. **Start Small**: Enable one feature at a time to test
2. **Adjust Intervals**: If lagging, increase intervals
3. **Speed Warning**: Very high speed may be detected
4. **Save Position**: Disable before important actions
5. **Compatible Games**: Works best with standard Roblox games

## 🐛 Common Issues

**GUI not appearing?**
- Check console for errors
- Make sure executor supports GUI
- Try reloading

**Features not working?**
- Game may use custom remote patterns
- Try adjusting intervals
- Some games may block auto features

**Lag or crashes?**
- Increase intervals
- Disable some features
- Lower speed multiplier

## 📞 Support

Having issues? Check the main README for detailed troubleshooting or create an issue on GitHub.

---

**Version:** 1.0.0  
**Repository:** https://github.com/caborya1/Script-
