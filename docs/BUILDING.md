# Building Suno Client + projectM Video Creator

## Prerequisites

- CMake >= 3.28
- Ninja (recommended) or another generator (e.g. Visual Studio 2022)
- Qt 6.8+ (Core, Quick, QuickControls2, ShaderTools)

## Installing Qt

Qt is located via `find_package`; if Qt is not found, a `FATAL_ERROR` is raised with installation instructions.

### Option 1: aqtinstall (recommended)

```powershell
pip install aqtinstall
aqt install-qt windows desktop 6.8.0 win64_msvc2022_64 -m qtdeclarative
```

### Option 2: Qt Online Installer

Download from https://www.qt.io/download

### Option 3: vcpkg

```powershell
vcpkg install qtbase qtdeclarative qtshadertools --triplet=x64-windows
```

## Configuring

Ensure `CMAKE_PREFIX_PATH` points to your Qt installation, then run:

```powershell
$env:CMAKE_PREFIX_PATH="C:\Qt\6.8.0\msvc2022_64"
cmake -B build -S . -G Ninja
```

Or without Ninja:

```powershell
cmake -B build -S .
```

## Building

```powershell
cmake --build build
```

## Running

```powershell
cd build
.\suno-client-projectm-video-creator.exe
```

## Troubleshooting

- **Qt not found**: Double-check `CMAKE_PREFIX_PATH` and that the Qt installation contains the required modules.
- **No generator found**: Run `winget install --id=Kitware.CMake` and `winget install --id=Ninja-build.Ninja`.
