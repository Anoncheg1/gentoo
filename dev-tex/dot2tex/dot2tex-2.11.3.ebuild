# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9})

inherit distutils-r1

DESCRIPTION="A Graphviz to LaTeX converter"
HOMEPAGE="https://dot2tex.readthedocs.org/ https://github.com/kjellmf/dot2tex"
SRC_URI="https://github.com/kjellmf/dot2tex/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ~ia64 ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~ppc-macos ~x64-macos ~sparc-solaris"
IUSE="doc examples"

DEPEND="dev-python/pyparsing[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/pydot[${PYTHON_USEDEP}]
	media-gfx/graphviz"
DEPEND="${DEPEND}
	doc? ( dev-python/sphinx )"

python_compile_all() {
	if use doc ; then
		cd "${S}/docs"
		emake html
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	if use doc; then
		dodoc -r docs/_build/html
	fi
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
