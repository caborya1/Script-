# Feature Comparison

## File Overview

| File | Best For | Features | Size | Difficulty |
|------|----------|----------|------|------------|
| **main.lua** | Most Users | All features, auto-start | 9.7KB | ⭐ Easy |
| **loadstring.lua** | URL Loading | All features, compact | 7.8KB | ⭐ Easy |
| **AutoScriptGUI.lua** | Manual Control | All features + GUI | 5.7KB | ⭐⭐ Medium |
| **AutoScript.lua** | Developers | Core logic, customizable | 11KB | ⭐⭐⭐ Advanced |

## Which File Should I Use?

### Use `main.lua` if:
- You want everything to work automatically
- You're new to game scripting
- You want the simplest experience
- You don't need a GUI

### Use `loadstring.lua` if:
- You want to load the script from a URL
- You need a compact version
- You want to execute with loadstring
- You're sharing the script with others

### Use `AutoScriptGUI.lua` if:
- You want to toggle features on/off
- You prefer visual controls
- You want to disable some features
- You like to customize during gameplay

### Use `AutoScript.lua` if:
- You're a developer
- You want to modify the code
- You need the core logic only
- You want to build your own GUI

## Feature Matrix

| Feature | main.lua | loadstring.lua | AutoScriptGUI.lua | AutoScript.lua |
|---------|----------|----------------|-------------------|----------------|
| Auto Money | ✅ | ✅ | ✅ | ✅ |
| Auto Collect | ✅ | ✅ | ✅ | ✅ |
| Auto Trade | ✅ | ✅ | ✅ | ✅ |
| Auto Upgrade | ✅ | ✅ | ✅ | ✅ |
| Auto Speed | ✅ | ✅ | ✅ | ✅ |
| Auto Rebirth | ✅ | ✅ | ✅ | ✅ |
| GUI | ❌ | ❌ | ✅ | ❌ |
| Auto-Start | ✅ | ✅ | ✅ | ✅ |
| Notification | ✅ | ✅ | ❌ | ❌ |
| URL Loading | ❌ | ✅ | ❌ | ❌ |

## Execution Examples

### main.lua
```lua
-- Copy and paste the entire file into your executor
-- That's it! Everything starts automatically
```

### loadstring.lua
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/caborya1/Script-/main/loadstring.lua"))()
```

### AutoScriptGUI.lua
```lua
-- Copy and paste the entire file into your executor
-- Click on the GUI buttons to toggle features
```

### AutoScript.lua
```lua
-- Require it in your own script
local AutoScript = loadfile("AutoScript.lua")()
AutoScript:Start()

-- Or customize it
AutoScript.Config.SpeedMultiplier = 3
AutoScript.Config.RebirthThreshold = 5000000
AutoScript:Start()
```

## Performance Comparison

| File | Memory Usage | CPU Usage | Startup Time |
|------|--------------|-----------|--------------|
| main.lua | Low | Low | Instant |
| loadstring.lua | Low | Low | 1-2 seconds |
| AutoScriptGUI.lua | Medium | Low | Instant |
| AutoScript.lua | Low | Low | Instant |

## Recommendations

### For Beginners
Start with **main.lua** - it's the easiest to use and requires no configuration.

### For Advanced Users
Use **AutoScriptGUI.lua** for more control, or modify **AutoScript.lua** to create your custom version.

### For Sharing
Use **loadstring.lua** - it's easy to share a simple one-line command.

---

**Still Confused?** Just use `main.lua` - it works great! 🎮
