# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /workspaces/QEMU_lm3s6965evb

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspaces/QEMU_lm3s6965evb/build

# Utility rule file for clean_all.

# Include the progress variables for this target.
include CMakeFiles/clean_all.dir/progress.make

CMakeFiles/clean_all:
	rm -f *.o *.elf *.map

clean_all: CMakeFiles/clean_all
clean_all: CMakeFiles/clean_all.dir/build.make

.PHONY : clean_all

# Rule to build all files generated by this target.
CMakeFiles/clean_all.dir/build: clean_all

.PHONY : CMakeFiles/clean_all.dir/build

CMakeFiles/clean_all.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/clean_all.dir/cmake_clean.cmake
.PHONY : CMakeFiles/clean_all.dir/clean

CMakeFiles/clean_all.dir/depend:
	cd /workspaces/QEMU_lm3s6965evb/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspaces/QEMU_lm3s6965evb /workspaces/QEMU_lm3s6965evb /workspaces/QEMU_lm3s6965evb/build /workspaces/QEMU_lm3s6965evb/build /workspaces/QEMU_lm3s6965evb/build/CMakeFiles/clean_all.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/clean_all.dir/depend

