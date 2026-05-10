cmake_minimum_required(VERSION 3.20)
project(AstralogMock)

# Find Python on the system (provided by the workflow)
find_package(Python3 REQUIRED COMPONENTS Interpreter)

# Step 1 — Install pip dependencies
add_custom_target(install_deps
    COMMAND ${Python3_EXECUTABLE} -m pip install -r ${CMAKE_SOURCE_DIR}/requirements.txt
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Installing Python dependencies..."
)

# Step 2 — Run the main script (depends on install_deps)
add_custom_target(run
    COMMAND ${Python3_EXECUTABLE} -m src.astralog_mock
        --rules  ${CMAKE_SOURCE_DIR}/input/rules.json
        --input  ${CMAKE_SOURCE_DIR}/input/telemetry_cleaned.csv
        --output ${CMAKE_SOURCE_DIR}/results
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Running astralog_mock..."
    DEPENDS install_deps
)

# Step 3 — Register pytest as a CTest test
enable_testing()
add_test(
    NAME    pytest
    COMMAND ${Python3_EXECUTABLE} -m pytest -v
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
)