# Z5_Premium_Dual_AOSP
--AOSP Nougat (7.0) ROM for Xperia Z5 Premium Dual--

If you would like to use my work, please include me as a contributer and let me know what you've made!

TO BUILD FULL OS, YOU WILL NEED AT LEAST 300 GB OF FREE STORAGE SPACE!

To start from scratch go to:

How to build AOSP Nougat for unlocked Xperia devices - Sony Developer World Mobile

http://developer.sonymobile.com/open-devices/aosp-build-instructions/how-to-build-aosp-nougat-for-unlocked-xperia-devices/

Something to Remember before Building:

Find the "codename" for your device since that is how your device is referenced in the code!
	For example: Z5 Preimium DUAL codenames: satsuki/E6883/kitakami-satsuki


Duplicating my souce tree (linux directions):

1 Create the directory you are going to work in (Mine is AOSP/satsuki/7.0/)

2 Install the following programs via command line:

	sudo apt-get install openjdk-8-jdk
	sudo apt-get install bison g++-multilib git gperf libxml2-utils make zlib1g-dev:i386 zip

3 Download Repo tool (this can be used for ANY AOSP build in the future)
	
	mkdir ~/bin
	curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
	chmod a+x ~/bin/repo

	Set PATH to Repo Tool

	Open the bashrc file included in the repo tool:
	sudo nano ~/.bashrc
	
	To set the right path for your local bin folder, paste the following code to a new line at the very bottom of
	the bashrc file, and then save the file using Ctrl+X:
	
	export PATH=~/bin:$PATH

	Reload bash variables to include the new path:
	source ~/.bashrc

4 Initilazie the AOSP Source

	Using the terminal, cd in to your working directory. We will be downloading TWO working directories (one for kernel and one for the OS) (Mine is AOSP/7.0/r17 and AOSP/7.0/r24)
	
	Run the following in the terminal:

	mkdir ./r17/android
	cd ./r17/android
	repo init -u https://android.googlesource.com/platform/manifest -b android-7.0.0_r17

	mkdir ./r24/android
	cd ./r24/android
	repo init -u https://android.googlesource.com/platform/manifest -b android-7.0.0_r24

		This will initialize the source tree that you will be syncing from!


	Download/git pull my source into a different folder!

	Download the software binaries for your device here:
	http://developer.sonymobile.com/open-devices/list-of-devices-and-resources/

	Then:
	Copy kernel, device and .repo from my source  to the r17/android folder	
	Copy device, .repo and frameworks from my source to the r24/android folder

	Finally:
	Copy the vendor file from the software binaries zip to both the r17/android AND r24/android folder.

	Run the following command:
	repo sync

		This is a large download (40GB or more)! Let this download overnight or while you're out during the day!


5 Go to the Sony Developer World Mobile Link above, Scroll to the "Add necessary patches from the AOSP upstream branch" section, and follow the directions there.

	Sony states: "Note! This information will be updated continuously for new Android versions and new devices, so
	you should always check the AOSP section on Developer World for the latest patches."

6 Run the following code:
	source build/envsetup.sh && lunch
		choose your device model (this case it is e6883 around number 34)
		
		This selects the configuration file(s) needed for your device

	make -j# -> change # to any number between 1 and 5. The lower the number, the better change of debugging errors
	if you're watching the screen.
		
		Another long step! (approx 1+ hours, depending on your hardware) Do this step overnight or while you're
		away from the computer.


7 Flash the new software!

	navigate to ./out/target/product/<device> -> replace <device> with the codename of your device

	Plug your phone into fastboot mode

	Run the following commands as superuser (sudo su)

	fastboot flash -S 256M system system.img
	fastboot flash -S 256M userdata userdata.img
	fastboot flash -S 256M boot boot.img

		"-S 256M" limits the files sent over at one time to 256MB. This was set by Sony so I suggest following
		it!

	Your first boot may take a while, please be patient!

--Congrats! You're now running the purest version of android!!--
		
	
