# Telnet Console

The purpose of the following document is to introduce developers to the Blippar SDK Telnet Console. Telnet console is a very useful debugging instrument, that allows easily to collect logs from SDK debug log remotely as well as the information about currently open blipp. You can find out more about the available functionality in the Telnet console menu that is displayed in case the connection was successful.

## Starting Telnet Console Client in the Custom SDK App

To start the telnet console you can do the following from the SDK:

### iOS - Objective C

    BOOL didStart = [BlipparSDK sharedInstance].debugConsole start];

### Android - Java

    boolean didStart = Blippar.getSDK().getDebugConsole().start();

In the rare case when the console fails to start, this normally means that there is a port conflict. Choose another port and try again.

Make a note of the port, on iOS it is set to _23_ by default and on Android it is set to _1123_.

## Connecting to the Telnet Console from Remote Client

To connect to the running telnet console on the device you must be on the same network as the device. Find out what the IP of that device is in the device wifi settings.

Now in Terminal (on OSX) type:

    telnet <ip> <port>

You will be presented with a menu screen that has a host of options, it operates just like regular telnet consoles.

At any point, type `menu`to get back to the main menu.

>As of OSX High Sierra (10.13.2), telnet is no longer bundled as part of the OS. You can download and install it manually or easily get it via homebrew: brew install telnet

## Blippar SDK Telnet Console Menu

Type `menu` in the remote Telnet client to see the list of available commands. It may differ for different SDK builds and licenses, so some of the commands may be not available to you.

All SDK instances allow to gather app and blipp logs through the Telnet console. By using the log command with different keys, listed in the console menu you can configure the amount of logs you will receive from the device.

## Stopping Telnet Console Client in the Custom SDK App

To stop the console again (this will disconnect your machine from the device) just the following:

### iOS - Objective C

    [[BlipparSDK sharedInstance].debugConsole stop];

### Android - Java

    Blippar.getSDK().getDebugConsole().stop();