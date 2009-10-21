IF(WIN32)
	SET(LIBEVENT_SOURCE_DIR "${CMAKE_SOURCE_DIR}/deps/libevent-1.4.11-stable")
	IF(EXISTS ${LIBEVENT_SOURCE_DIR})
		## write CMake file for libevent
			
		CONFIGURE_FILE(deps/libevent.config.h.cmake ${LIBEVENT_SOURCE_DIR}/config.h.cmake COPYONLY)
		CONFIGURE_FILE(deps/libevent.event-config.h.cmake ${LIBEVENT_SOURCE_DIR}/event-config.h.cmake COPYONLY)
		CONFIGURE_FILE(deps/libevent.CMakeLists.txt ${LIBEVENT_SOURCE_DIR}/CMakeLists.txt COPYONLY)
		## CONFIGURE_FILE(deps/libevent.event.h.cmake ${LIBEVENT_SOURCE_DIR}/event.h COPYONLY)
		## CONFIGURE_FILE(deps/libevent.evutil.h.cmake ${LIBEVENT_SOURCE_DIR}/evutil.h COPYONLY)
	
		ADD_SUBDIRECTORY(${LIBEVENT_SOURCE_DIR} build-libevent)
	
		SET(EVENT_INCLUDE_DIRS ${LIBEVENT_SOURCE_DIR} CACHE INTERNAL "")
		IF(EXISTS ${CMAKE_BINARY_DIR}/build-libevent/${CMAKE_BUILD_TYPE}/)
			SET(EVENT_LIBRARY_DIRS ${CMAKE_BINARY_DIR}/build-libevent/${CMAKE_BUILD_TYPE} CACHE INTERNAL "")
		ELSE(EXISTS ${CMAKE_BINARY_DIR}/build-libevent/${CMAKE_BUILD_TYPE}/)
			SET(EVENT_LIBRARY_DIRS ${CMAKE_BINARY_DIR}/build-libevent CACHE INTERNAL "")
		ENDIF(EXISTS ${CMAKE_BINARY_DIR}/build-libevent/${CMAKE_BUILD_TYPE}/)
		SET(EVENT_LIBRARIES event CACHE INTERNAL "")
	ELSE(EXISTS ${LIBEVENT_SOURCE_DIR})
		MESSAGE(FATAL_ERROR "Could not find dependency libevent-1.4.11-stable in ${LIBEVENT_SOURCE_DIR}")
	ENDIF(EXISTS ${LIBEVENT_SOURCE_DIR})
ENDIF(WIN32)
