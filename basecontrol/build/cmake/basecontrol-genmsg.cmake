# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "basecontrol: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ibasecontrol:/home/xcy/桌面/basecontrol/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(basecontrol_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/xcy/桌面/basecontrol/msg/WheelStatus.msg" NAME_WE)
add_custom_target(_basecontrol_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "basecontrol" "/home/xcy/桌面/basecontrol/msg/WheelStatus.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(basecontrol
  "/home/xcy/桌面/basecontrol/msg/WheelStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/basecontrol
)

### Generating Services

### Generating Module File
_generate_module_cpp(basecontrol
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/basecontrol
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(basecontrol_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(basecontrol_generate_messages basecontrol_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xcy/桌面/basecontrol/msg/WheelStatus.msg" NAME_WE)
add_dependencies(basecontrol_generate_messages_cpp _basecontrol_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(basecontrol_gencpp)
add_dependencies(basecontrol_gencpp basecontrol_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS basecontrol_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(basecontrol
  "/home/xcy/桌面/basecontrol/msg/WheelStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/basecontrol
)

### Generating Services

### Generating Module File
_generate_module_eus(basecontrol
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/basecontrol
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(basecontrol_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(basecontrol_generate_messages basecontrol_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xcy/桌面/basecontrol/msg/WheelStatus.msg" NAME_WE)
add_dependencies(basecontrol_generate_messages_eus _basecontrol_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(basecontrol_geneus)
add_dependencies(basecontrol_geneus basecontrol_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS basecontrol_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(basecontrol
  "/home/xcy/桌面/basecontrol/msg/WheelStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/basecontrol
)

### Generating Services

### Generating Module File
_generate_module_lisp(basecontrol
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/basecontrol
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(basecontrol_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(basecontrol_generate_messages basecontrol_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xcy/桌面/basecontrol/msg/WheelStatus.msg" NAME_WE)
add_dependencies(basecontrol_generate_messages_lisp _basecontrol_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(basecontrol_genlisp)
add_dependencies(basecontrol_genlisp basecontrol_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS basecontrol_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(basecontrol
  "/home/xcy/桌面/basecontrol/msg/WheelStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/basecontrol
)

### Generating Services

### Generating Module File
_generate_module_nodejs(basecontrol
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/basecontrol
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(basecontrol_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(basecontrol_generate_messages basecontrol_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xcy/桌面/basecontrol/msg/WheelStatus.msg" NAME_WE)
add_dependencies(basecontrol_generate_messages_nodejs _basecontrol_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(basecontrol_gennodejs)
add_dependencies(basecontrol_gennodejs basecontrol_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS basecontrol_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(basecontrol
  "/home/xcy/桌面/basecontrol/msg/WheelStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/basecontrol
)

### Generating Services

### Generating Module File
_generate_module_py(basecontrol
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/basecontrol
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(basecontrol_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(basecontrol_generate_messages basecontrol_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xcy/桌面/basecontrol/msg/WheelStatus.msg" NAME_WE)
add_dependencies(basecontrol_generate_messages_py _basecontrol_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(basecontrol_genpy)
add_dependencies(basecontrol_genpy basecontrol_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS basecontrol_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/basecontrol)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/basecontrol
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(basecontrol_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(basecontrol_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/basecontrol)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/basecontrol
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(basecontrol_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(basecontrol_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/basecontrol)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/basecontrol
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(basecontrol_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(basecontrol_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/basecontrol)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/basecontrol
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(basecontrol_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(basecontrol_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/basecontrol)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/basecontrol\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/basecontrol
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(basecontrol_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(basecontrol_generate_messages_py geometry_msgs_generate_messages_py)
endif()
