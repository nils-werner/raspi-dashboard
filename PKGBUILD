pkgname=dashboard
pkgver=2.0
pkgrel=1
pkgdesc="Browser based dashboard display on Raspberry Pi"
arch=('any')
url="https://github.com/nils-werner/arch-dashboard/"
license=('MIT')
depends=(
  'sudo'
  'patch'
  'diffutils'
  'ratpoison'
  'qutebrowser'
  'ttf-freefont'
  'xorg-server'
  'xorg-xinit'
  'xf86-video-fbdev'
  'unclutter'
  'fbset'
  'cronie'
  'qt5-webkit'  # qtwebengine is currently broken
)
install=dashboard.install
source=(
  'bash_profile'
  'bashrc'
  'Xauthority'
  'xinitrc'
  'crontab'
  'config.py'
  'state'
  'dashboard.install'
  'dashboard@.service'
  'dashboard.sysusers'
  'dashboard.tmpfiles'
  'sudoers-reboot'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
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
  install -Dm644 "$srcdir/dashboard@.service" "$pkgdir/etc/systemd/system/dashboard@.service"
  install -Dm644 "${srcdir}/dashboard.sysusers" "${pkgdir}/usr/lib/sysusers.d/dashboard.conf"
  install -Dm644 "${srcdir}/dashboard.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/dashboard.conf"
  install -dm750 "$pkgdir/etc/sudoers.d/"
  install -m440 "$srcdir/sudoers-reboot" "$pkgdir/etc/sudoers.d/dashboard-reboot"
  install -Dm644 "$srcdir/bash_profile" "$pkgdir/usr/lib/dashboard/.bash_profile"
  install -Dm644 "$srcdir/bashrc" "$pkgdir/usr/lib/dashboard/.bashrc"
  install -Dm644 "$srcdir/Xauthority" "$pkgdir/usr/lib/dashboard/.Xauthority"
  install -Dm644 "$srcdir/xinitrc" "$pkgdir/usr/lib/dashboard/.xinitrc"
  install -Dm644 "$srcdir/crontab" "$pkgdir/usr/lib/dashboard/crontab"
  install -Dm644 "$srcdir/config.py" "$pkgdir/usr/lib/dashboard/.config/qutebrowser/config.py"
  install -Dm644 "$srcdir/state" "$pkgdir/usr/lib/dashboard/.local/share/qutebrowser/state"
}
