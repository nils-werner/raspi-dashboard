pkgname=dashboard
pkgver=1.0
pkgrel=1
pkgdesc="Browser based dashboard display on Raspberry Pi"
arch=('any')
url="https://github.com/nils-werner/arch-overlayroot"
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
)
install=dashboard.install
source=(
  'bash_profile'
  'bashrc'
  'Xauthority'
  'xinitrc'
  'crontab'
  'dashboard.install'
  'autologin@.service'
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
)

build() {
  :
}

package() {
  install -Dm644 "$srcdir/autologin@.service" "$pkgdir/etc/systemd/system/display-autologin@.service"
  install -Dm644 "$srcdir/bash_profile" "$pkgdir/home/display/.bash_profile"
  install -Dm644 "$srcdir/bashrc" "$pkgdir/home/display/.bashrc"
  install -Dm644 "$srcdir/Xauthority" "$pkgdir/home/display/.Xauthority"
  install -Dm644 "$srcdir/xinitrc" "$pkgdir/home/display/.xinitrc"
  install -Dm644 "$srcdir/crontab" "$pkgdir/home/display/crontab"
  install -dm750 "$pkgdir/etc/sudoers.d/"
  install -m440 "$srcdir/sudoers-reboot" "$pkgdir/etc/sudoers.d/display-reboot"
}
