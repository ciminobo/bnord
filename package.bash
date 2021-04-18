#!/usr/bin/env bash
################################################################################
# bnord - Open a VPN connection to a NordVPN server.
# Copyright (C) 2021  Bo Cimino
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
################################################################################
set -e

version="$(grep Version DEBIAN/control | awk '{print $2}')"

pkgname="bnord_$version"

export PREFIX="$(pwd)/$pkgname"

mkdir $pkgname
make -e install
cp -r DEBIAN $pkgname
dpkg-deb --build $pkgname
