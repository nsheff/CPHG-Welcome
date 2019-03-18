# My favorite commands

## Chris Dampier

### Basic Unix terminal commands for MacOS

To check battery level in Bluetooth devices:

    $ioreg -l | grep -E "BatteryPercent|Bluetooth Product Name"

To reconnect mouse when it gets lost:

    $open /Applications/System\ Preferences.app/Contents/MacOS/System\ Preferences

To connect to server:

    $ssh username@server.name.virginia.edu  #log in at /home/chd5n directory
    $ssh -Y username@server.name.virginia.edu  #allows graphic user interface with XQuartz

To mount remote file systems to local:

    #ssh
    $sudo mkdir /Volumes/remote/name1/
    $sudo sshfs -o allow_other,defer_permissions username@remote.file.system.name.xxx:/remote/directory/ /Volumes/remote/name1/

    #smb
    $sudo mkdir /Volumes/remote/name2/
    $sudo mount -t smbfs //username@remote.file.system.name.xxx/remote/directory /Volumes/remote/name2/

To stop Spotlight from indexing a particular volume:

    $sudo mdutil -i off /Volumes/remote

To check processes using a particular volume:

    $sudo lsof | grep 'volume_name'

To unmount a recalcitrant volume:

    $sudo kill PID; sudo umount volume_name

To set directory as read/write/execute for user and group:

    $chmod ug+rwx dir_name

To unpack tar:

    $tar -xvf filename  #x=extract; v=verbose; f=use archive file

To show only directories:

    $ls -d \*/  #for nonhidden
    $ls -ad \.*  #for hidden

To transfer files between servers and/or file systems:

    $scp username@source.server.name:source_path/filename username@destination.server.name:destination_path/filename
    $rsync -ahrvz username@source.server.name:source_path/filename username@destination.server.name:destination_path/filename
    #a=archive (preserves ownership and timestamp); h=human readable; r=recursive; v=verbose; z=compression

To transfer large files between servers and/or file systems:

    #globus.org --> University of Virginia --> eServices login
    #uva main node: uva#main-DTN

    #download globus connect
    $wget https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz
    $tar -xzf globusconnectpersonal-latest.tgz
    $cd globusconnectpersonal-x.y.z

To keep machine awake:

    #for duration of a given process
    $caffeinate -w PID

    #for a given amount of time (in seconds)
    $caffeinate -t seconds

To clone latest version of GitHub project:

    $git clone --depth=1 git://github.com/globus/globus-cli

To open a screen for processes in background:

    $screen -S new_screen_name  #S = socket

To exit the new screen:

    [control^] + [A] +[D] keys

To return to the new screen:

    $screen -r new_screen_name  #r = return

To list all screens running on account:

    $screen -ls

To exit from within screen:

    $exit

To run a bash script:

    $./filename
    #OR
    $bash filename

To open simple text editor:

    $nano filename

To check cores on local machine:

    $sysctl hw.physicalcpu hw.logicalcpu


### Basic Linux terminal commands for Rivanna

To get to scratch directory:

    $cd /scratch/username

To check to see available applications:

    $module avail

To load an application as a module:

    $module load application_name

    #example
    module load sratoolkit/2.8.0

To purge a previously loaded module:

    $module purge

To use a conda environment:

    $module load anaconda/5.2.0-py3.6
    $conda env list
    $source activate custom_env
    $source deactivate custom_env

To use R 3.5.1:

    $module load gcc/7.1.0
    $module load R/3.5.1

To modify path variable:

    $GLOBUS_CLI_INSTALL_DIR="$(python -c 'import site; print(site.USER_BASE)')/bin"
    $echo "GLOBUS_CLI_INSTALL_DIR=$GLOBUS_CLI_INSTALL_DIR"
    $export PATH="$GLOBUS_CLI_INSTALL_DIR:$PATH"
    $echo 'export PATH="'"$GLOBUS_CLI_INSTALL_DIR"':$PATH"' >> "$HOME/.bashrc"

To format sbatch script:

    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks=1
    #SBATCH --ntasks-per-node=1
    #SBATCH --cpus-per-task=1
    #SBATCH --mem=15000  #mem in megabytes  #a quick way to choose memory allocations is to set the memory to the maximum file size your application will process
    # #SBATCH --mem-per-cpu=  #mem in megabytes
    #SBATCH --time=10:00:00  #hours:minutes:seconds
    #SBATCH --partition=standard
    #SBATCH --account=cphg_accountname
    # #SBATCH	--job-name=test123
    #SBATCH	--mail-type=ALL (start/end/abortion)
    #SBATCH	--mail-user=username@virginia.edu

To check job queue:

    $squeue -o "%.5i %.2t %.4M %.5D %m"
    $scontrol show job ###

To check space on server:

    $sfsq

To check job completion details:

    $sacct -j <jobid> -o jobid,jobname,state,exitcode,derivedexitcode
    $sacct -j <jobid> -o jobid%16,jobname,AllocTres%21,MaxRSS,MaxVMSize,state%14,exitcode%8,derivedexitcode

To list groups user is in:

    $groups

To change current group ID during a login:

    $newgrp group_name

To explore filesystems mounted on Rivanna:

    $df -h
