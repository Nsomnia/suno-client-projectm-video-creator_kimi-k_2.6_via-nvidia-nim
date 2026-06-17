cmake_minimum_required(VERSION 3.28)
project(
    suno-client-projectm-video-creator
    VERSION 0.1.0
    DESCRIPTION "Desktop application for Suno, projectM, and video creation"
    LANGUAGES CXX
)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
# ---------------------------------------------------------------------------
# CPM.cmake Bootstrap
# ---------------------------------------------------------------------------
set(CPM_DOWNLOAD_VERSION 0.40.2)
set(CPM_DOWNLOAD_LOCATION "${CMAKE_BINARY_DIR}/cmake/CPM_${CPM_DOWNLOAD_VERSION}.cmake")
if(NOT EXISTS "${CPM_DOWNLOAD_LOCATION}")
    message(STATUS "Downloading CPM.cmake v${CPM_DOWNLOAD_VERSION} ...")
    file(
        DOWNLOAD
        "https://github.com/cpm-cmake/CPM.cmake/releases/download/v${CPM_DOWNLOAD_VERSION}/CPM.cmake"
        "${CPM_DOWNLOAD_LOCATION}"
        SHOW_PROGRESS
    )
endif()
include("${CPM_DOWNLOAD_LOCATION}")
# ---------------------------------------------------------------------------
# Qt 6 Dependency
# ---------------------------------------------------------------------------
set(QT_MINIMUM_VERSION 6.8)
message(STATUS "Looking for Qt ${QT_MINIMUM_VERSION} (Core, Quick, QuickControls2, ShaderTools)")
find_package(Qt6 ${QT_MINIMUM_VERSION} QUIET COMPONENTS Core Quick QuickControls2 ShaderTools)
if(NOT Qt6_FOUND)
    message(FATAL_ERROR
        "Qt ${QT_MINIMUM_VERSION}+ was not found on the system.\n"
        "Please install Qt using one of the following methods:\n"
        "  Windows:\n"
        "    1. aqtinstall: pip install aqtinstall && aqt install-qt windows desktop ${QT_MINIMUM_VERSION} win64_msvc2022_64 -m qtdeclarative\n"
        "    2. Qt Online Installer: https://www.qt.io/download\n"
        "    3. vcpkg: vcpkg install qtbase qtdeclarative qtshadertools --triplet=x64-windows\n"
        "  Then set CMAKE_PREFIX_PATH to the Qt installation (e.g. C:/Qt/6.8.0/msvc2022_64).\n\n"
        "  Linux:\n"
        "    1. sudo pacman -S qt6-base cmake ninja base-devel | sudo apt install qt6 build-essentials cmake ninja\n"
    )
endif()
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTO_UIC ON)
# ---------------------------------------------------------------------------
# Executable Target
# ---------------------------------------------------------------------------
add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME}
    PRIVATE
        apps/main.cpp
)
target_link_libraries(${PROJECT_NAME}
    PRIVATE
        Qt6::Core
        Qt6::Quick
        Qt6::QuickControls2
        Qt6::ShaderTools
)
# ---------------------------------------------------------------------------
# QML Resources (development copy)
# ---------------------------------------------------------------------------
set(QML_IMPORT_PATH "${CMAKE_SOURCE_DIR}/qml" CACHE STRING "" FORCE)
set(QML2_IMPORT_PATH "${CMAKE_SOURCE_DIR}/qml" CACHE STRING "" FORCE)
add_custom_target(copy-qml ALL
    COMMAND ${CMAKE_COMMAND} -E copy_directory
        "${CMAKE_SOURCE_DIR}/qml"
        "${CMAKE_BINARY_DIR}/qml"
    COMMENT "Copying QML files to build directory"
)
add_dependencies(${PROJECT_NAME} copy-qml)
# ---------------------------------------------------------------------------
# Compiler Warnings
# ---------------------------------------------------------------------------
if(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE /W4 /WX-)
else()
    target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -Wpedantic)
endif()
# ---------------------------------------------------------------------------
# Install
# ---------------------------------------------------------------------------
install(TARGETS ${PROJECT_NAME}
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)
# ---------------------------------------------------------------------------
# Status
# ---------------------------------------------------------------------------
message(STATUS "")
message(STATUS "${PROJECT_NAME} v${PROJECT_VERSION}")
message(STATUS "  Qt version  : ${Qt6Core_VERSION}")
message(STATUS "  C++ standard: ${CMAKE_CXX_STANDARD}")
message(STATUS "  Build type  : ${CMAKE_BUILD_TYPE}")
message(STATUS "")
