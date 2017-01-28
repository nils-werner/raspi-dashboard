pkgname=dashboard
pkgver=0.1
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
  'dwb'
  'ttf-freefont'
  'xorg-server'
  'xorg-xinit'
  'xorg-utils'
  'xorg-server-utils'
  'xf86-video-fbdev'
  'unclutter'
  'xdotool'
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
)
sha256sums=(
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
  install -Dm644 "$srcdir/autologin@.service" "$pkgdir/etc/systemd/system/autologin@.service"
  install -Dm644 "$srcdir/bash_profile" "$pkgdir/home/display/.bash_profile"
  install -Dm644 "$srcdir/bashrc" "$pkgdir/home/display/.bashrc"
  install -Dm644 "$srcdir/Xauthority" "$pkgdir/home/display/.Xauthority"
  install -Dm644 "$srcdir/xinitrc" "$pkgdir/home/display/.xinitrc"
  install -Dm644 "$srcdir/crontab" "$pkgdir/home/display/crontab"
}
