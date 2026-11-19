# DA2 Access

Мод, который делает Dragon Age II доступной для незрячих игроков: игра говорит через экранный диктор.

English below.

## Что это

- DA2 Access подключается к игре и озвучивает её через ваш экранный диктор с помощью библиотеки Prism. Проверено с NVDA.
- Мод говорит по-русски. Тексты самой игры звучат на языке, выбранном в игре.
- Это ранняя тестовая версия. Пройдены создание персонажа и пролог, дальше игра ещё не проверялась. Пожалуйста, сообщайте о проблемах во вкладке Issues.
- Мод построен на коде соседнего проекта для Dragon Age: Origins: https://github.com/blindadventurer/DragonAgeOriginsAccess

## Что уже умеет

- Читает меню: стартовый экран, главное меню, создание персонажа (выбор героя, внешность, предыстория, сложность), паузу, сохранение, инвентарь, лист персонажа, обучающие подсказки.
- Читает реплики в диалогах.
- В мире есть сканер: список того, что вокруг, с расстоянием и направлением, по категориям.
- Автоходьба к выбранному объекту.
- Бой: список ближайших врагов, атака клавишей Enter, сообщения о здоровье и убитых.
- Панель быстрого доступа: названия умений и их готовность.

## Что нужно

- Dragon Age II версии 1.04 (все дополнения поддерживаются).
- Windows, экранный диктор (NVDA рекомендуется).
- Мод проверен только на файле игры DragonAge2.exe версии 1.04.8524.0. На других сборках (Steam, EA app) он может не заработать. Если так случилось, приложите журнал мода к сообщению об ошибке.
- Рекомендуется включить для DragonAge2.exe флаг Large Address Aware (доступ к 4 ГБ памяти), например программой 4GB Patch. Без него игра работает у самого предела памяти в 2 ГБ и может вылетать. Сделайте копию exe перед этим.

## Установка

1. Скачайте архив из раздела Releases справа на странице.
2. В архиве две папки: bin_ship и override.
3. Содержимое папки bin_ship скопируйте в папку bin_ship игры, например: C:\Games\Dragon Age 2\bin_ship. Там появятся файл dinput8.dll и папка scripts.
4. Файл da2access.gfx из папки override скопируйте в папку Документы\BioWare\Dragon Age 2\packages\core\override. Если папки override нет, создайте её.
5. Запустите игру как обычно.
6. При запуске вы услышите «Dragon Age 2 Access загружен».

Совет: игра по умолчанию приближает и отдаляет камеру клавишами Page Up и Page Down. Мод использует эти клавиши для сканера, поэтому лучше снять их с камеры в настройках управления игры.

## Удаление

- Из папки bin_ship игры удалите файл dinput8.dll, файл scripts\DA2Access.asi и папку scripts\DA2Access.
- Из папки Документы\BioWare\Dragon Age 2\packages\core\override удалите файл da2access.gfx.

## Основные клавиши

В меню:

- Стрелки вверх и вниз: двигаться по пунктам.
- Enter: нажать.
- Tab и Shift+Tab: следующая и предыдущая группа пунктов.
- Стрелки влево и вправо: менять значение в списках выбора (например, сложность).
- При выборе героя: пункт «Выбор героя», стрелки влево и вправо переключают героев, Enter выбирает.

В мире:

- Page Down и Page Up: следующий и предыдущий объект в сканере.
- Ctrl+Page Down и Ctrl+Page Up: категория сканера.
- Home: повторить текущий объект. В бою: состояние боя.
- Shift+Home: здоровье отряда.
- End: идти к выбранному объекту.
- Shift+End: позвать спутников к себе.
- Enter: действие с выбранным объектом: поговорить, открыть, атаковать.
- Правая и левая квадратная скобка (Ъ и Х): следующий и предыдущий ближайший враг.
- Delete: текст текущего задания.
- Backspace: панель быстрого доступа.
- Клавиши 1-0: умения игры, мод называет умение или его состояние.
- F1-F4: выбор персонажа отряда, мод называет его и здоровье.

## Журнал

Мод пишет журнал в bin_ship\scripts\DA2Access.log. Если что-то не так, приложите этот файл к сообщению об ошибке.

## Сборка из исходников

- Нужен Visual Studio с инструментами C++ для x86.
- Нужны Java и FFDec 26.5.0 (https://github.com/jindrapetrik/jpexs-decompiler), распакованный в папку vendor\ffdec-26.5.0. Им собирается Flash-агент для меню (src\agent).
- Нужен Python 3.
- build.ps1 собирает build\DA2Access.asi и build\da2access.gfx.
- deploy.ps1 собирает и копирует мод в игру. Путь к игре записан в начале файла.
- make_release.ps1 -Version X собирает архив релиза в папку release.
- Папка tools: скрипты на Python для изучения exe и архивов игры (нужны capstone и pefile).
- NOTEBOOK.md: рабочий журнал проекта: что доказано, что нет, история тестов.

## Лицензия

MIT, см. LICENSE. Prism распространяется по лицензии MPL-2.0, Ultimate ASI Loader по лицензии MIT.

Dragon Age II принадлежит Electronic Arts и BioWare. Этот проект с ними не связан.

---

# DA2 Access (English)

A mod that makes Dragon Age II playable for blind players: the game speaks through your screen reader.

## What it is

- DA2 Access hooks into the game and speaks it through your screen reader with the Prism library. Tested with NVDA.
- The mod's own messages are in Russian for now; the game's texts are spoken in the game's language. Translations are welcome.
- This is an early test version: character creation and the prologue have been played, the rest of the game not yet. Please report problems in Issues.
- Built on the code of the sister project for Dragon Age: Origins: https://github.com/blindadventurer/DragonAgeOriginsAccess

## Features

- Menus read aloud: start screens, main menu, character creation (hero, appearance, background, difficulty), pause menu, saving, inventory, character record, tutorial popups.
- Conversation lines read.
- An object scanner in the world: what is around you, with distance and direction, by category.
- Walking to the selected object by itself.
- Combat: nearest enemies list, attack with Enter, health and kill reports.
- Quickbar: ability names and readiness.

## Requirements

- Dragon Age II version 1.04 (DLC supported).
- Windows and a screen reader (NVDA recommended).
- Proven only on DragonAge2.exe 1.04.8524.0. Other builds (Steam, EA app) may not work; please attach the mod's log to a report.
- Setting the Large Address Aware flag on DragonAge2.exe (for example with 4GB Patch) is recommended: without it the game runs at its 2 GB memory limit and may crash. Back up the exe first.

## Install

1. Download the archive from Releases.
2. The archive holds two folders, bin_ship and override.
3. Copy the contents of bin_ship into the game's bin_ship folder: dinput8.dll and a scripts folder appear there.
4. Copy da2access.gfx from override into Documents\BioWare\Dragon Age 2\packages\core\override (create the folder if it is missing).
5. Start the game as usual.
6. You hear "Dragon Age 2 Access загружен" at start.

Tip: the game zooms the camera with Page Up and Page Down by default. The mod uses these keys for the scanner, so unbind them from the camera in the game's controls.

## Uninstall

Delete dinput8.dll, scripts\DA2Access.asi and the scripts\DA2Access folder from the game's bin_ship, and da2access.gfx from Documents\BioWare\Dragon Age 2\packages\core\override.

## Keys

Menus: Up and Down move, Enter presses, Tab and Shift+Tab jump between groups, Left and Right change list values. Hero choice: the "Выбор героя" item, Left and Right switch heroes, Enter picks.

World: Page Down / Page Up next and previous object, Ctrl+Page Down / Page Up category, Home repeat (in a fight: combat status), Shift+Home party health, End walk to the object, Shift+End call the companions, Enter act on the object (talk, open, attack), ] and [ next and previous nearest enemy, Delete current quest text, Backspace quickbar, 1-0 the game's abilities (named by the mod), F1-F4 select a party member.

## Log

The mod writes bin_ship\scripts\DA2Access.log. Attach it to bug reports.

## Building

Visual Studio with the x86 C++ tools, Java with FFDec 26.5.0 extracted to vendor\ffdec-26.5.0 (compiles the Flash menu agent in src\agent), and Python 3. build.ps1 builds build\DA2Access.asi and build\da2access.gfx, deploy.ps1 builds and copies into the game (game path at the top), make_release.ps1 -Version X makes the release archive. tools\ holds Python scripts that study the game's exe and archives (capstone, pefile). NOTEBOOK.md is the project's working log.

## Licence

MIT, see LICENSE. Prism is MPL-2.0, Ultimate ASI Loader is MIT. Dragon Age II belongs to Electronic Arts and BioWare; this project is not affiliated with them.
