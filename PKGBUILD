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
  'autologin@.service'
  'sudoers-reboot'
)
sha256sums=(
  'df07fc62d1721bf0855fdf99c54ad9cabd7efd96b5b7fea783d5c486f6764919'
  'a9ac17ccd0cc6a7536de04af6dd7ec7385a8644443d70af429a892da21d9480f'
  'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
  '343a27c48c34f2a28e101a75643d5a2c5104571c4fb8a225d1c1c452fa905039'
  '7feffc28493d1226975027c9b9f7746e3a5496905cff2a16c1b27ec597837e7f'
  '34cfe15ffb83d3ec703813712d43f4f745cb7907eb7c28f348bd1b279f3bc20d'
  'edb8e65091c39cd8f31492ad1899393c4fc6620e0cab39c3bb56d87eb9ddda96'
  'f2afb4c5708c1804f0f37f8d979d3b95d2a3a98280ae982bec4ea743cf993204'
  'cee0668837c87eba884ad991086500b1608b1c7a131d530c1adad4c2a4df25ae'
  'fca3eafb0292e74b6d0639bdbd46ab7767d3d84b683e7985d2532e2627f5c9d7'
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
  install -Dm644 "$srcdir/config.py" "$pkgdir/home/display/.config/qutebrowser/config.py"
  install -Dm644 "$srcdir/state" "$pkgdir/home/display/.local/share/qutebrowser/state"
  install -dm750 "$pkgdir/etc/sudoers.d/"
  install -m440 "$srcdir/sudoers-reboot" "$pkgdir/etc/sudoers.d/display-reboot"
}
