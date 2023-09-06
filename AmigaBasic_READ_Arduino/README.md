# AmigaBasic_to_Arduino II
A simple solution example to control your arduino from AMIGA!
Coming with a GUI interface.

# What is needed:
- An Arduino board.
- A passive buzzer
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

- You can keep the standard Serial port settings, and up to 9600bps!
  In WinUAE, select the COM Port connected to the USB_CH340 Driver or 
  Your Arduino driver, it can be on COM3: or any port. It does not
  matter!
  Remember to change the speed to 9600 inside the Amiga Program and 
  the Arduino Sketch supplied.
  
- Run WinUAE selecting the default configuration, add the kickstart rom,
  the ADF Floppy files mentioned before, set the Serial Port pointing
  to your arduino on COMx, don't check "RTS/CTS" nor "DIRECT" (see attached
  picture "Serial_Port_Settings" inside "WinUAE Settings" for more details.
  If you don't want to type the entire BASIC program by hand, I provided it
  inside the "AmigaBasic Binary File" folder. To copy it inside the "BasicDemos"
  directory of Extras Disk, check also "Add PC Drives at Startup".
  (See picture "Add_PC_Drives_At_Startup" inside "WinUAE Settings" Folder).

- When the Amiga Workbech is loaded, Run AmigaBasic from Amiga Extras Disk,
  put the files supplied inside "BINARY SRC FOR AMIGA"
  into the "BasicDemos" directory.
  Then run it.
  If everything is set up correctly, you should change the sound
  of buzzer
