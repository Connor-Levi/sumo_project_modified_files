#----------------------------------------------------------------
# Generated CMake target import file for configuration "None".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SUMO::libsumocpp" for configuration "None"
set_property(TARGET SUMO::libsumocpp APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(SUMO::libsumocpp PROPERTIES
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libsumocpp.so"
  IMPORTED_SONAME_NONE "libsumocpp.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS SUMO::libsumocpp )
list(APPEND _IMPORT_CHECK_FILES_FOR_SUMO::libsumocpp "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libsumocpp.so" )

# Import target "SUMO::libtracicpp" for configuration "None"
set_property(TARGET SUMO::libtracicpp APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(SUMO::libtracicpp PROPERTIES
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libtracicpp.so"
  IMPORTED_SONAME_NONE "libtracicpp.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS SUMO::libtracicpp )
list(APPEND _IMPORT_CHECK_FILES_FOR_SUMO::libtracicpp "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libtracicpp.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
