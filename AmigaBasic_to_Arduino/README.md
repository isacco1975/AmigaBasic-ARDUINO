# AmigaBasic_to_Arduino
A simple solution example to control your arduino from AMIGA!

# What is needed:
- An Arduino board.
- Nr. 3 Leds (I used green, red, and yellow).
- Nr. 3 220 Ohm Resistors
- WinUAE or REAL Amiga Computer (I didn't try this mode!)
- Amiga Kickstart 1.2 or 1.3 rom for WinUAE
  (if you don't have a real Amiga System)
  (I can't provide Amiga Kickstarts as they are still sold as commercial products)
- Amiga Workbench (minimum 1.2) ADF Disk File or Real Disk (Real Amiga)
  (I Can't provide as it is still sold as commercial product)
- Amiga Extras ADF or Real Disk
  (I Can't provide as it is still sold as commercial product)

# HOW TO USE:
- Connect your arduino to your computer, then load the sketch provided
  inside the folder "ArduinoUNO_Sketch". Upload it into your board.

#OUTDATED INFO!!!
- Windows: Change settings of your COM port from your system. From Device Settings
  choose the arduino (usually is connected to COM3:) and then change to
  COM1 at 300bps. Maybe you will be prompted to restart the system after.
  
#NEW UPDATED INFO!!!
- You can keep the standard Serial port settings, and up to 9600bps!
  In WinUAE, select the COM Port connected to the USB_CH340 Driver or 
  Your Arduino driver, it can be on COM3: or any port. It does not
  matter!
  Remember to change the speed to 9600 inside the Amiga Program and 
  the Arduino Sketch supplied.
  
- Run WinUAE selecting the default configuration, add the kickstart rom,
  the ADF Floppy files mentioned before, set the Serial Port pointing
  to your arduino (usually it is on COM3), don't check "RTS/CTS" nor "DIRECT" (see attached
  picture "Serial_Port_Settings" inside "WinUAE Settings" for more details.
  If you don't want to type the entire BASIC program by hand, I provided it
  inside the "AmigaBasic Binary File" folder. To copy it inside the "BasicDemos"
  directory of Extras Disk, check also "Add PC Drives at Startup".
  (See picture "Add_PC_Drives_At_Startup" inside "WinUAE Settings" Folder).

- When the Amiga Workbech is loaded, Run AmigaBasic from Amiga Extras Disk,
  put the "PROGRAM" and "PROGRAM.info" file into the "BasicDemos" directory.
  Then run it.
  If everything is set up correctly, you should see all the leds turning
  ond an off sequentially.

- Leds are connected to pins: 13, 8, 11.
