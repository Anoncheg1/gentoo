# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Python module for doing approximate and phonetic matching of strings"
HOMEPAGE="https://github.com/jamesturk/jellyfish https://pypi.org/project/jellyfish/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	test? (
		dev-python/unicodecsv[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs --no-autodoc
distutils_enable_tests pytest

python_test() {
	cp -r testdata "${BUILD_DIR}" || die
	cd "${BUILD_DIR}" || die
	epytest lib/jellyfish/test.py
}
