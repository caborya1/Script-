# REDYNHUB Feature Documentation

## Feature Overview

| Feature | Description | Configurable | Default Interval | Impact |
|---------|-------------|--------------|------------------|--------|
| **Auto Money** | Automatically collects coins, money, and cash scattered around the game world | ✅ | 1.0s | Medium |
| **Auto Collect** | Automatically collects gems, orbs, crystals, and other pickups | ✅ | 0.5s | Medium |
| **Auto Trade** | Automatically finds and trades with NPCs, merchants, and shops | ✅ | 5.0s | Low |
| **Auto Upgrade** | Automatically purchases and applies upgrades to your stats | ✅ | 2.0s | Medium |
| **Auto Speed** | Increases your character's walking speed | ✅ | Always Active | High |
| **Auto Rebirth** | Automatically rebirths when you reach the threshold | ✅ | Check every 5s | High |

## Detailed Feature Descriptions

### 💰 Auto Money
**How it works:**
- Scans the workspace for objects named "Coin", "Money", or "Cash"
- Teleports your character to each collectible
- Also attempts to fire remote events that might handle money collection
- Works with both physical coins and server-side collection systems

**Configuration:**
- `MoneyInterval`: 0.1 to 5 seconds (how often to scan)

**Best for:**
- Games with scattered coins
- Tycoon-style games
- Obby games with coin rewards

### 💎 Auto Collect
**How it works:**
- Searches for collectible items like gems, orbs, crystals, and pickups
- Teleports to each item's location
- Fires collection remote events
- More general than Auto Money

**Configuration:**
- `CollectInterval`: 0.1 to 3 seconds (how often to scan)

**Best for:**
- RPG games with collectibles
- Adventure games
- Dungeon crawlers

### 🤝 Auto Trade
**How it works:**
- Finds NPCs with names containing "trader", "merchant", or "shop"
- Teleports to their location
- Attempts to trigger trade interactions
- Fires trade-related remote events

**Configuration:**
- `TradeInterval`: 5.0 seconds (minimum time between trades)

**Best for:**
- Trading simulator games
- RPG games with merchants
- Economy-based games

### ⬆️ Auto Upgrade
**How it works:**
- Searches for upgrade remote events
- Automatically triggers upgrade functions
- Clicks upgrade buttons in your GUI
- Attempts to upgrade all available stats

**Configuration:**
- `UpgradeInterval`: 2.0 seconds (how often to check)

**Best for:**
- Incremental/idle games
- Clicker games
- Stat-based RPGs

### ⚡ Auto Speed
**How it works:**
- Continuously modifies your Humanoid.WalkSpeed
- Multiplies default speed (16) by your configured multiplier
- Updates every frame for smooth movement

**Configuration:**
- `SpeedMultiplier`: 1 to 5 (speed boost factor)

**Best for:**
- Any game where movement speed matters
- Large open-world games
- Games requiring fast navigation

**Warning:**
- Very high speeds (5x+) may be easily detected
- Can make some games harder to control
- May trigger anti-cheat in some games

### 🔄 Auto Rebirth
**How it works:**
- Checks your stats every 5 seconds
- Compares level/money against threshold
- Triggers rebirth when threshold is met
- Works with buttons or remote events

**Configuration:**
- `RebirthThreshold`: 100 to 10,000 (level/money required)

**Best for:**
- Prestige/rebirth simulator games
- Incremental games
- Games with reset mechanics

## Feature Compatibility

### ✅ High Compatibility
These features work in most Roblox games:
- Auto Money (physical coins)
- Auto Collect (physical items)
- Auto Speed

### ⚠️ Medium Compatibility
These features depend on game implementation:
- Auto Upgrade
- Auto Rebirth
- Auto Trade (with remote events)

### ❌ Game-Specific
These features may need customization:
- Auto Trade (specific NPC patterns)
- Games with custom anti-cheat
- Games with unusual remote event naming

## Performance Impact

| Feature | CPU Usage | Network Usage | Detection Risk |
|---------|-----------|---------------|----------------|
| Auto Money | Medium | Medium | Low |
| Auto Collect | Medium | Medium | Low |
| Auto Trade | Low | Low | Low |
| Auto Upgrade | Low | Medium | Low |
| Auto Speed | High | None | Medium |
| Auto Rebirth | Low | Low | Low |

## Recommendations

### For Beginners
1. Start with **Auto Money** only
2. Set intervals to default values
3. Monitor game response
4. Gradually enable other features

### For Advanced Users
1. Enable all features you need
2. Fine-tune intervals for your game
3. Adjust speed multiplier carefully
4. Set appropriate rebirth threshold

### Safety Tips
1. Don't use extremely low intervals (< 0.5s)
2. Keep speed multiplier reasonable (≤ 3x)
3. Monitor for lag or unusual behavior
4. Disable features if detected

## Troubleshooting by Feature

### Auto Money Not Working
- Game may use different object names
- Check if game has server-side collection
- Try increasing interval

### Auto Collect Not Working
- Collectibles may have unique names
- Check workspace for item names
- May need custom implementation

### Auto Trade Not Working
- Traders may have different names
- May require specific items/currency
- Check if trading is enabled in game

### Auto Upgrade Not Working
- Game may use unique upgrade system
- Check PlayerGui for upgrade buttons
- May require specific resources

### Auto Speed Not Working
- Game may lock WalkSpeed
- Anti-cheat may be blocking
- Try lower multiplier

### Auto Rebirth Not Working
- Threshold may be too low/high
- Game may have special requirements
- Check rebirth button location

## Advanced Customization

Want to customize for your specific game? Edit `REDYNHUB.lua`:

```lua
-- Example: Add custom money object names
if coin.Name == "Coin" or coin.Name == "Money" or 
   coin.Name == "YourCustomCoinName" then
    -- collection logic
end

-- Example: Add custom remote event names
if string.find(remoteName, "yourGameSpecificName") then
    -- remote logic
end
```

## Version History

See [CHANGELOG.md](CHANGELOG.md) for detailed version history.

---

**Need help?** Check [QUICKSTART.md](QUICKSTART.md) for setup instructions or [README.md](README.md) for full documentation.
