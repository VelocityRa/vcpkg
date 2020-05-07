vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ocornut/imgui
    REF 5116eee108986ba6f41eea6f8759eb6acc042670 # docking as of 05-05-20
    SHA512 17e6da59dcf867454babfd54a880deed32027e4a25cd386c267686181795037036e2ada3d22bd482541cd595b3af3ada357c3079d3e1615565f50f1d029720ed
    HEAD_REF docking
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
