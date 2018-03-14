raspi-dashboard
===============

<p align="center">
<img src="artwork/dashboard.png" width="360" />
</p>

Boot a Raspberry Pi directly into a minimalistic, frameless browser.

[![Build Status](https://travis-ci.org/nils-werner/raspi-dashboard.svg?branch=master)](https://travis-ci.org/nils-werner/raspi-dashboard)

This project does not include any webserver or storage to save data to be shown. The data to be shown must be accessible over the network, provided by a different device or service, for example:

 - [Status Board at Panic](http://www.panic.com/blog/the-panic-status-board/)
 - [Geckoboard](http://www.geckoboard.com/)
 - [Dashing](http://shopify.github.io/dashing/)
 - [Keen IO](http://keen.github.io/dashboards/)
 - [Mozaik](http://mozaik.rocks/)
 - [Grafana](https://grafana.com/)
 - [Freeboard](http://freeboard.io/)
 - ...

Installation
------------

Create the package and install it using

    makepkg -si

Customization
-------------

    /home/display/.xinitrc

contains a line `qutebrowser http://www.google.com/`. The URL in this line will be loaded by the browser upon booting. Insert your URL here.

Readonly filesystem
-------------------

To protect your SD card against wear and tear, see [`arch-overlayroot`](https://github.com/nils-werner/arch-overlayroot) for a simple overlay based readonly file system solution.
