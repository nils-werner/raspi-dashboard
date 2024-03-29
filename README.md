raspi-dashboard
===============

<p align="center">
<img src="artwork/dashboard.png" width="360" />
</p>

Boot a Raspberry Pi directly into a minimalistic, frameless browser.

[![Build Status](https://travis-ci.org/nils-werner/raspi-dashboard.svg?branch=master)](https://travis-ci.org/nils-werner/raspi-dashboard)

This project does not include any webserver or storage to save data to be shown. The data to be shown must be accessible over the network, provided by a different device or service, for example:

 - [Status Board at Panic](https://www.panic.com/blog/the-panic-status-board/)
 - [Geckoboard](https://www.geckoboard.com/)
 - [Dashing](http://shopify.github.io/dashing/)
 - [Keen IO](https://keen.github.io/dashboards/)
 - [Mozaik](http://mozaik.rocks/)
 - [Grafana](https://grafana.com/)
 - [Freeboard](https://freeboard.io/)
 - ...

Installation
------------

Create the package and install it using

    makepkg -si

Enable the dashboard using

    systemctl enable --now dashboard.service

For peace of mind you can reboot the system every day by enabling

    systemctl enable --now scheduled-reboot.timer

Customization
-------------

Edit the dashboard service

    systemctl edit dashboard.service

and adjust the service to your liking. For example an instance with the screened turned to the right and no input devices:

    [Service]
    ExecStart=
    ExecStart=/usr/bin/cage -rd -- /usr/bin/luakit -U "https://duckduckgo.com/"
    Environment=WLR_LIBINPUT_NO_DEVICES=1

Readonly filesystem
-------------------

To protect your SD card against wear and tear, see [`arch-overlayroot`](https://github.com/nils-werner/arch-overlayroot) for a simple overlay based readonly file system solution.
