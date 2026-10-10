# mo-piano

## Deutsch

Eine kleine Klavier-Interaktion für RSG/RedM. Spieler können ein Klavier über `ox_target` auswählen, sich an die konfigurierte Position setzen und das `PROP_HUMAN_PIANO`-Scenario starten. Mit **Backspace** beenden sie die Animation.

### Voraussetzungen

- `rsg-core`
- `ox_lib`
- `ox_target`

### Installation

1. Lege den Ordner `mo-piano` in deinen Ressourcenordner.
2. Stelle sicher, dass die benötigten Ressourcen installiert und gestartet werden.
3. Fuege `ensure mo-piano` in die `server.cfg` ein.
4. Starte den Server oder die Resource neu.

Beispiel fuer die Startreihenfolge in der `server.cfg`:

```cfg
ensure ox_lib
ensure ox_target
ensure rsg-core
ensure mo-piano
```

### Verwendung

Ziele mit `ox_target` auf ein unterstütztes Klavier und wähle **Klavier spielen**. Die Option wird für alle Modelle aus `Config.Piano` registriert. Zum Aufstehen drücke **Backspace**.

### Konfiguration

Die Einstellungen stehen in `shared/config.lua`.

`Config.Piano` enthält die Modellnamen, an denen `ox_target` die Interaktion anbietet. Standardmäßig sind folgende Modelle eingetragen:

- `sha_man_piano02`
- `sha_man_piano01`
- `p_piano03x`
- `p_piano02x`
- `p_nbxpiano01x`
- `p_nbmpiano01x`
- `p_gen_piano01x_tc01`

`Config.DefaultPianoSeatOffset` legt den Sitzpunkt für alle Klaviere fest, für die kein eigener Eintrag existiert. `Config.PianoSeatOffsets` erlaubt abweichende Werte pro Modell.

Die Werte `x`, `y` und `z` sind lokale Offsets relativ zum Klaviermodell. `heading` wird zum Heading des Klaviers addiert. Passe diese Werte an, wenn der Spieler neben, zu hoch oder falsch herum sitzt.

Beispiel:

```lua
Config.PianoSeatOffsets = {
    ['p_piano03x'] = {
        x = 0.0,
        y = -0.75,
        z = 0.5,
        heading = 0.0
    }
}
```

### Hinweis

Die aktuelle Version startet die Piano-Animation. Eine freie Tastatur zum Spielen einzelner Noten oder eigene Klavier-Samples sind darin noch nicht enthalten.

---

## English

A simple piano interaction for RSG/RedM. Players can select a piano with `ox_target`, move to the configured seat position, and start the `PROP_HUMAN_PIANO` scenario. Press **Backspace** to stop the animation and stand up.

### Requirements

- `rsg-core`
- `ox_lib`
- `ox_target`

### Installation

1. Place the `mo-piano` folder in your resources directory.
2. Make sure the required resources are installed and started.
3. Add `ensure mo-piano` to your `server.cfg`.
4. Restart the server or the resource.

Example `server.cfg` start order:

```cfg
ensure ox_lib
ensure ox_target
ensure rsg-core
ensure mo-piano
```

### Usage

Use `ox_target` on a supported piano and select **Play piano**. The option is registered for every model listed in `Config.Piano`. Press **Backspace** to stand up.

### Configuration

Settings are in `shared/config.lua`.

`Config.Piano` contains the model names that receive the `ox_target` interaction. These models are included by default:

- `sha_man_piano02`
- `sha_man_piano01`
- `p_piano03x`
- `p_piano02x`
- `p_nbxpiano01x`
- `p_nbmpiano01x`
- `p_gen_piano01x_tc01`

`Config.DefaultPianoSeatOffset` sets the seat position for pianos without a model-specific entry. `Config.PianoSeatOffsets` lets you define different offsets for individual models.

The `x`, `y`, and `z` values are local offsets relative to the piano model. `heading` is added to the piano's heading. Adjust these values if the player sits beside the seat, too high, or facing the wrong direction.

Example:

```lua
Config.PianoSeatOffsets = {
    ['p_piano03x'] = {
        x = 0.0,
        y = -0.75,
        z = 0.5,
        heading = 0.0
    }
}
```

### Note

The current version starts the piano animation. It does not yet include playable individual notes, a piano keyboard, or custom piano samples.
