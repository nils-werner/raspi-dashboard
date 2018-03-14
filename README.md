raspi-dashboard
===============

<p align="center">
<img src="artwork/dashboard.png" width="360" />
</p>

[![Build Status](https://travis-ci.org/nils-werner/raspi-dashboard.svg?branch=master)](https://travis-ci.org/nils-werner/raspi-dashboard)

raspi-dashboard is a script to modify a Arch Linux installation running on a Raspberry Pi that automatically boots into a minimalistic, frameless browser when started

Please note that this project does not include any webserver or storage to save data to be shown. The data to be shown must be accessible over the network, provided by a different device or service, for example:

 - [Status Board at Panic](http://www.panic.com/blog/the-panic-status-board/)
 - [Geckoboard](http://www.geckoboard.com/)
 - [Shopify's dashing](http://shopify.github.io/dashing/)

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
