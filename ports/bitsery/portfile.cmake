vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO VelocityRa/bitsery
	REF 7efcf8b6e85c4e887042bd78d2e0891dad25cd30 # kl branch
	SHA512 0aa378aee247a29011ca1a4bd1fc2559d97f35ed48ea6633cab5cb86ca10970389b8af785272cc7edb97aa7bea0ec1d72034c59c434a4abdd02255c3027affa3
	HEAD_REF master
	PATCHES fix-install-paths.patch
)

vcpkg_configure_cmake(
	SOURCE_PATH ${SOURCE_PATH}
	PREFER_NINJA
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets( CONFIG_PATH lib/cmake/${PORT} )

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
