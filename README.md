# Simple Game in Assembly Language

This assembly code implements a simple game in VGA graphics mode, where the player controls a character to avoid obstacles and score points.

## Features

- VGA graphics mode (mode 13h) for displaying graphics.
- Keyboard input handling for player movement.
- Collision detection between player and obstacles.
- Score tracking and display.
- Game over and restart functionality.

## Requirements

- DOS emulator or environment that supports running 16-bit DOS applications.
- Knowledge of assembly language programming.
- VGA-compatible display.

## Setup

1. **Running the Game**:
   - Ensure you have a DOS emulator or environment set up (e.g., DOSBox).
   - Compile and run the assembly code using a suitable assembler (e.g., TASM, MASM).

## Usage

- **Game Controls**:
  - Use the left and right arrow keys to move the player character.
  - Avoid collisions with obstacles falling from the top of the screen.
  - The game ends when a collision occurs. Press Enter to restart.

## Notes

- Adjust the keyboard scan codes (`cmp al, <scan_code>`) in the assembly code for different key mappings.
- This code assumes VGA graphics support and may not work on modern operating systems without emulation or compatibility layers.
- For development, refer to the assembly language documentation for your assembler and target environment.
