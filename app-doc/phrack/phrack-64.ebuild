# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P=${PN}${PV}
DESCRIPTION="A Hacker magazine by the community, for the community"
HOMEPAGE="http://www.phrack.org/"
SRC_URI="http://www.phrack.org/archives/tgz/${MY_P}.tar.gz"

LICENSE="phrack"
SLOT="${PV}"
KEYWORDS="~alpha amd64 arm hppa ~ia64 ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE=""

S=${WORKDIR}/${PV}

src_install() {
	dodoc -r *
}
