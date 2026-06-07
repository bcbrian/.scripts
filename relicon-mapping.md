# Relicon Handheld Mouse - Button Mapping

## Philosophy
With AI tools (Super Whisper, Claude, Cursor), the inputs needed to drive the computer are shrinking. The Relicon becomes a minimal, layer-based input device that covers the essentials.

## Available Hardware Inputs

| Input | Karabiner Event | Physical Location |
|-------|----------------|-------------------|
| Left click | `pointing_button: button1` | |
| Right click | `pointing_button: button2` | |
| Scroll wheel click | `pointing_button: button3` | |
| Side button (back) | `pointing_button: button4` | |
| Side button (forward) | `pointing_button: button5` | |
| Play/Pause | `consumer_key_code: play_or_pause` | |
| Volume Up | `consumer_key_code: volume_increment` | |
| Volume Down | `consumer_key_code: volume_decrement` | |
| Prev Track | `consumer_key_code: scan_previous_track` | |
| Next Track | `consumer_key_code: scan_next_track` | |
| Trackball | mouse movement | |
| Scroll wheel | scroll events | |

## Layer 0 (Default)

| Input | Action | Shortcut / Details |
|-------|--------|--------------------|
| button1 | Left click | Normal left click |
| button2 | Right click | Normal right click |
| button3 (tap) | Copy | Cmd+C |
| button3 (hold) | Paste | Cmd+V |
| button4 (tap) | Backspace | delete_or_backspace |
| button4 (double-tap) | **Activate Layer 1** | Toggle layer on |
| button5 (tap) | Enter | return_or_enter |
| button5 (hold) | Shift+Enter | New line without submit |
| play_or_pause (tap) | Super Whisper (voice control) | Option+Space |
| play_or_pause (hold) | Escape | escape |
| volume_increment (tap) | Up arrow | up_arrow |
| volume_increment (hold) | Show all windows | Mission Control |
| volume_decrement (tap) | Down arrow | down_arrow |
| volume_decrement (hold) | Spotlight search | Cmd+Space |
| scan_previous_track (tap) | Previous pane (iTerm) | Cmd+[ |
| scan_previous_track (hold) | Previous Space | Ctrl+Left |
| scan_next_track (tap) | Next pane (iTerm) | Cmd+] |
| scan_next_track (hold) | Next Space | Ctrl+Right |
| trackball | Mouse movement | |
| scroll wheel | Scroll | |

## Layer 1 (Activated by double-tap button4)

| Input | Action | Shortcut / Details |
|-------|--------|--------------------|
| button1 | Left click | Same as Layer 0 |
| button2 | Right click | Same as Layer 0 |
| button3 (tap) | Copy | Same as Layer 0 |
| button3 (hold) | Paste | Same as Layer 0 |
| button4 (tap) | Backspace | Same as Layer 0 |
| button4 (double-tap) | **Deactivate Layer 1** | Toggle layer off |
| button5 (tap) | Enter | Same as Layer 0 |
| button5 (hold) | Shift+Enter | Same as Layer 0 |
| play_or_pause | Ctrl+C (cancel/interrupt) | Ctrl+C |
| volume_increment (tap) | Split vertical (iTerm) | Cmd+D |
| volume_increment (hold) | Show all windows | Mission Control |
| volume_decrement (tap) | Split horizontal (iTerm) | Cmd+Shift+D |
| volume_decrement (hold) | Spotlight search | Cmd+Space |
| scan_previous_track | *(unmapped)* | |
| scan_next_track | *(unmapped)* | |
| trackball | *(unmapped)* | |
| scroll wheel | *(unmapped)* | |

## Ideas / Notes
- Layer 1 slots are open for future assignment
- All Layer 0 behaviors currently fall through to Layer 1 (no layer-specific overrides yet except toggle)
- Right click is untouched — no layer interaction
