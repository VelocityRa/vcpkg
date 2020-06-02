vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO VelocityRa/imgui
    REF d19845c9ca362ccbbe371eaa26b2867854ff8800 # docking-tables as of 30-05-20
    SHA512 e2816ef9b8f367f3159a6d24fefb98aac47855e55d2641b40ee4c579263a58e7892542ceb4c786e5f1e61f2e4a4286c4e1ac4ba012446c64b495c73747ffb7c5
    HEAD_REF docking-tables
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    bindings       IMGUI_COPY_BINDINGS # should only be copied once, at most
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS_RELEASE
        ${FEATURE_OPTIONS}
    OPTIONS_DEBUG
        -DIMGUI_COPY_BINDINGS=OFF
        -DIMGUI_SKIP_HEADERS=ON
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()
vcpkg_fixup_cmake_targets()

file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
