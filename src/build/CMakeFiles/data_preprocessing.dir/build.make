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
CMAKE_SOURCE_DIR = /home/vdrvar/development/bitcoin_fraud_detection/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/vdrvar/development/bitcoin_fraud_detection/src/build

# Include any dependencies generated for this target.
include CMakeFiles/data_preprocessing.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/data_preprocessing.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/data_preprocessing.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/data_preprocessing.dir/flags.make

CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.o: CMakeFiles/data_preprocessing.dir/flags.make
CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.o: ../data_preprocessing.cpp
CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.o: CMakeFiles/data_preprocessing.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vdrvar/development/bitcoin_fraud_detection/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.o -MF CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.o.d -o CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.o -c /home/vdrvar/development/bitcoin_fraud_detection/src/data_preprocessing.cpp

CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/vdrvar/development/bitcoin_fraud_detection/src/data_preprocessing.cpp > CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.i

CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/vdrvar/development/bitcoin_fraud_detection/src/data_preprocessing.cpp -o CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.s

# Object files for target data_preprocessing
data_preprocessing_OBJECTS = \
"CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.o"

# External object files for target data_preprocessing
data_preprocessing_EXTERNAL_OBJECTS =

data_preprocessing: CMakeFiles/data_preprocessing.dir/data_preprocessing.cpp.o
data_preprocessing: CMakeFiles/data_preprocessing.dir/build.make
data_preprocessing: CMakeFiles/data_preprocessing.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vdrvar/development/bitcoin_fraud_detection/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable data_preprocessing"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/data_preprocessing.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/data_preprocessing.dir/build: data_preprocessing
.PHONY : CMakeFiles/data_preprocessing.dir/build

CMakeFiles/data_preprocessing.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/data_preprocessing.dir/cmake_clean.cmake
.PHONY : CMakeFiles/data_preprocessing.dir/clean

CMakeFiles/data_preprocessing.dir/depend:
	cd /home/vdrvar/development/bitcoin_fraud_detection/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vdrvar/development/bitcoin_fraud_detection/src /home/vdrvar/development/bitcoin_fraud_detection/src /home/vdrvar/development/bitcoin_fraud_detection/src/build /home/vdrvar/development/bitcoin_fraud_detection/src/build /home/vdrvar/development/bitcoin_fraud_detection/src/build/CMakeFiles/data_preprocessing.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/data_preprocessing.dir/depend
