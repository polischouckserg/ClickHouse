option (USE_UNWIND "Enable libunwind (better stacktraces)" ON)

if (NOT CMAKE_SYSTEM MATCHES "Linux" OR ARCH_ARM OR ARCH_32)
    set (USE_UNWIND OFF)
endif ()

if (USE_UNWIND)
    add_subdirectory(contrib/libunwind-cmake)
    set (UNWIND_LIBRARIES unwind)
    set (EXCEPTION_HANDLING_LIBRARY ${UNWIND_LIBRARIES})

    message (STATUS "Using libunwind: ${UNWIND_LIBRARIES}")
else ()
    set (EXCEPTION_HANDLING_LIBRARY gcc_eh)
endif ()

message (STATUS "Using exception handler: ${EXCEPTION_HANDLING_LIBRARY}")
