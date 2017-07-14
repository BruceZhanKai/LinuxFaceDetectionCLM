cmake_minimum_required(VERSION 2.8.4)

#set(CMAKE_CXX_FLAGS " -fopenmp -mcpu=cortex-a15 -mfpu=neon-vfpv4 -mfloat-abi=hard -ffast-math  -std=c++11 -Wa,-mimplicit-it=thumb")
set(CMAKE_CXX_FLAGS " -std=c++11")

# define, up to you
project( libDetection )
#project( LocalPredict )

set(CMAKE_BUILD_TYPE Release)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake-modules)

set( OpenCV_DIR /home/bruce/opencv-2.4.12/release )
set(OpenCV_FOUND 1)
find_package( OpenCV REQUIRED )
#find_package( OpenCV /home/bruce/opencv-2.4.12/release/ )
find_package( Boost COMPONENTS filesystem system REQUIRED)


###find_package(Caffe)

#head file path  
include_directories(build/CLM_src)
include_directories(build/rifd)
include_directories(${CMAKE_BINARY_DIR})
include_directories(/usr/include) 
INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIRS})
LINK_DIRECTORIES(${Boost_LIBRARY_DIRS})	
include_directories(/home/bruce/dlib-18.18/dlib/build)

#include Point Grey
#include_directories(/home/ubuntu/flycapture.2.9.3.43_armhf/include)
#link_directories(/home/ubuntu/flycapture.2.9.3.43_armhf/lib)
include_directories(/usr/include/flycapture) 
link_directories(/usr/lib)

###include_directories(${Caffe_INCLUDE_DIRS})
###add_definitions(${Caffe_DEFINITIONS})
#add_definitions(-DENABLE_ASSERTS)


set(LIB_FILES
	libDetection.cpp
	${CMAKE_BINARY_DIR}/CLM_src/CCNF_patch_expert.cpp
	${CMAKE_BINARY_DIR}/CLM_src/CCNF_patch_expert.h
	${CMAKE_BINARY_DIR}/CLM_src/CLM.cpp
	${CMAKE_BINARY_DIR}/CLM_src/CLM.h
	${CMAKE_BINARY_DIR}/CLM_src/CLM_core.h
	${CMAKE_BINARY_DIR}/CLM_src/CLMParameters.h
	${CMAKE_BINARY_DIR}/CLM_src/CLMTracker.cpp
	${CMAKE_BINARY_DIR}/CLM_src/CLMTracker.h
	${CMAKE_BINARY_DIR}/CLM_src/CLM_utils.cpp
	${CMAKE_BINARY_DIR}/CLM_src/CLM_utils.h
	${CMAKE_BINARY_DIR}/CLM_src/DetectionValidator.cpp
	${CMAKE_BINARY_DIR}/CLM_src/DetectionValidator.h
	${CMAKE_BINARY_DIR}/CLM_src/Patch_experts.cpp
	${CMAKE_BINARY_DIR}/CLM_src/Patch_experts.h
	${CMAKE_BINARY_DIR}/CLM_src/PAW.cpp
	${CMAKE_BINARY_DIR}/CLM_src/PAW.h
	${CMAKE_BINARY_DIR}/CLM_src/PDM.cpp
	${CMAKE_BINARY_DIR}/CLM_src/PDM.h
	${CMAKE_BINARY_DIR}/CLM_src/SVR_patch_expert.cpp
	${CMAKE_BINARY_DIR}/CLM_src/SVR_patch_expert.h
	${CMAKE_BINARY_DIR}/rfid/CardReader.cpp
	${CMAKE_BINARY_DIR}/rfid/CardReader.h
	)
	
	
#source directory  
#aux_source_directory(${CMAKE_BINARY_DIR}/CLM_src CLM_LIST) 
#aux_source_directory(${CMAKE_BINARY_DIR}/rfid RFID_LIST) 
#add_executable( ${PROJECT_NAME} libDetection.cpp ${SRC_LIST})
add_library( ${PROJECT_NAME} SHARED ${LIB_FILES} )
#add_library( ${PROJECT_NAME} STATIC ${LIB_FILES} )
#add_executable( LocalPredict LocalPrediction.cpp)


FIND_LIBRARY( TBB_LIBRARY libtbb.so /usr/lib )
target_link_libraries( ${PROJECT_NAME} ${OpenCV_LIBS} ${TBB_LIBRARY} ${Boost_LIBRARIES} dlib)

###target_link_libraries( Test ${Caffe_LIBRARIES})
target_link_libraries( ${PROJECT_NAME} flycapture )

#target_link_libraries( LocalPredict ${OpenCV_LIBS})

#target_link_libraries( LocalPredict ${PROJECT_NAME} )
