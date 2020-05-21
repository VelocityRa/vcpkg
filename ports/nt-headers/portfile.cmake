include(vcpkg_common_functions)

vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO VelocityRa/nt-headers
	REF 676dabaa5e9509dcf679116a3fbf67c9bf6af4ab # kl branch
	SHA512 172bdaf3811102a8754796523432c59f6baefbdde71325f9727d451729c846b7ef565cd02f79604d6d32aee6b82873c213151a97a3dac1ff788de0986dceb225
	HEAD_REF kl
)

# Rename instead of copying from the build tree to save on time
file(RENAME ${SOURCE_PATH} ${CURRENT_PACKAGES_DIR}/include)

# Create dummy copyright file
file(TOUCH copyright)
file(INSTALL copyright DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
file(REMOVE copyright)
