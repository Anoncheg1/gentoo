# Copyright 2015-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS="no"

inherit distutils-r1

DESCRIPTION="Python module for native access to the systemd facilities"
HOMEPAGE="https://github.com/systemd/python-systemd"
SRC_URI="https://github.com/systemd/python-systemd/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ppc ~ppc64 ~sparc ~x86"

DEPEND="sys-apps/systemd:0="
RDEPEND="${DEPEND}
	!sys-apps/systemd[python(-)]
"

PATCHES=(
	"${FILESDIR}"/${P}-fix-py3.10.patch
)

distutils_enable_tests pytest

python_compile() {
	# https://bugs.gentoo.org/690316
	distutils-r1_python_compile -j1
}

python_test() {
	pushd "${BUILD_DIR}/lib" > /dev/null || die
	epytest -o cache_dir="${T}"
	popd > /dev/null || die
}
