# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/oozypilot84/OS-Final-2/OS2/OS2-FInal

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/oozypilot84/OS-Final-2/OS2/OS2-FInal/build

# Include any dependencies generated for this target.
include CMakeFiles/image_processor.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/image_processor.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/image_processor.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/image_processor.dir/flags.make

CMakeFiles/image_processor.dir/main.cpp.o: CMakeFiles/image_processor.dir/flags.make
CMakeFiles/image_processor.dir/main.cpp.o: ../main.cpp
CMakeFiles/image_processor.dir/main.cpp.o: CMakeFiles/image_processor.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/oozypilot84/OS-Final-2/OS2/OS2-FInal/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/image_processor.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/image_processor.dir/main.cpp.o -MF CMakeFiles/image_processor.dir/main.cpp.o.d -o CMakeFiles/image_processor.dir/main.cpp.o -c /home/oozypilot84/OS-Final-2/OS2/OS2-FInal/main.cpp

CMakeFiles/image_processor.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/image_processor.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/oozypilot84/OS-Final-2/OS2/OS2-FInal/main.cpp > CMakeFiles/image_processor.dir/main.cpp.i

CMakeFiles/image_processor.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/image_processor.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/oozypilot84/OS-Final-2/OS2/OS2-FInal/main.cpp -o CMakeFiles/image_processor.dir/main.cpp.s

# Object files for target image_processor
image_processor_OBJECTS = \
"CMakeFiles/image_processor.dir/main.cpp.o"

# External object files for target image_processor
image_processor_EXTERNAL_OBJECTS =

../bin/image_processor: CMakeFiles/image_processor.dir/main.cpp.o
../bin/image_processor: CMakeFiles/image_processor.dir/build.make
../bin/image_processor: CMakeFiles/image_processor.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/oozypilot84/OS-Final-2/OS2/OS2-FInal/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/image_processor"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/image_processor.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/image_processor.dir/build: ../bin/image_processor
.PHONY : CMakeFiles/image_processor.dir/build

CMakeFiles/image_processor.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/image_processor.dir/cmake_clean.cmake
.PHONY : CMakeFiles/image_processor.dir/clean

CMakeFiles/image_processor.dir/depend:
	cd /home/oozypilot84/OS-Final-2/OS2/OS2-FInal/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/oozypilot84/OS-Final-2/OS2/OS2-FInal /home/oozypilot84/OS-Final-2/OS2/OS2-FInal /home/oozypilot84/OS-Final-2/OS2/OS2-FInal/build /home/oozypilot84/OS-Final-2/OS2/OS2-FInal/build /home/oozypilot84/OS-Final-2/OS2/OS2-FInal/build/CMakeFiles/image_processor.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/image_processor.dir/depend

