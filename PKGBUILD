pkgname=dashboard
pkgver=3.0
pkgrel=1
pkgdesc="Browser based dashboard display on Raspberry Pi"
arch=('any')
url="https://github.com/nils-werner/arch-dashboard/"
license=('MIT')
depends=(
  'cage'
  'luakit'
)
source=(
  'dashboard@.service'
  'dashboard.sysusers'
  'dashboard.tmpfiles'
  'dashboard.pam'
  'scheduled-reboot.service'
  'scheduled-reboot.timer'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  :
}

package() {
  install -Dm644 "$srcdir/dashboard@.service" "$pkgdir/usr/lib/systemd/system/dashboard@.service"
  install -Dm644 "${srcdir}/dashboard.sysusers" "${pkgdir}/usr/lib/sysusers.d/dashboard.conf"
  install -Dm644 "${srcdir}/dashboard.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/dashboard.conf"
  install -Dm644 "${srcdir}/dashboard.pam" "${pkgdir}/etc/pam.d/dashboard"
  install -Dm644 "${srcdir}/scheduled-reboot.service" "${pkgdir}/usr/lib/systemd/system/scheduled-reboot.service"
  install -Dm644 "${srcdir}/scheduled-reboot.timer" "${pkgdir}/usr/lib/systemd/system/scheduled-reboot.timer"
}
