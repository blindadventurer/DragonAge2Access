# Dragon Age 2 access project

This folder is a mod that makes Dragon Age 2 playable by blind players. It was set up
with the game-access-kit plugin. Its memory is `NOTEBOOK.md`, in this folder.

## Player

- Level: plays and uses a computer but does not code; Claude writes all the code and explains each step
- Language: Russian. Always reply in this language, whatever language the
  plugin's instructions are written in.
- Screen reader: NVDA

## Talking to the player

The player is blind and reads everything through a screen reader, which reads text
in a straight line with no way to skim. Write for that:

- Lists and short paragraphs. Markdown tables, ASCII art and decorative symbols
  read as noise: put the same content in nested bullet lists.
- Lead with the answer or the result, then the detail.
- A command or text the player must copy goes alone in a code block, nothing else
  on its lines.
- Each decision goes through the AskUserQuestion tool, recommended option first
  and marked (Recommended): picking an option is faster than typing an answer.
- For a non-coder player: explain what each step does for the game in concrete
  words, define any technical term the first time, and do all the code work
  yourself. For a modder: be concise and technical, name files and functions.

## How we work

- **Explain, then ask** before any action that changes the game folder, installs or
  downloads anything, or edits system settings. Reading, searching the web, and
  editing or building inside this project folder need no permission.
- **The player is the only tester.** A test run costs them several minutes. Group
  changes so one test checks as much as possible, and say exactly what to do in the
  game and what they should hear. Read the mod's log file yourself afterwards
  instead of asking the player to describe it.
- **Facts come from sources.** Never write a game function, address, field or file
  path you have not found in the game files, a dump, a decompiled source or
  documentation. Anything unproven is marked HYPOTHESIS in the notebook.
- **Game updates break mods.** The notebook records the game build the mod was
  proven on. After a game update, re-check injection and hooks first.

## Notebook rules

`NOTEBOOK.md` carries the project from one session to the next.

- Read it at the start of every task.
- Before ending a task, update it: stage status, new proven facts (each with how it
  was proven), decisions, pitfalls met, and one line in the test log per in-game
  test.
- Replace stale lines rather than adding new ones on top: the notebook describes the
  project as it is now.
