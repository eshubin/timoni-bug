# Timoni

Measured with `/usr/bin/time -v timoni mod vet`

        Command being timed: "timoni mod vet"
        User time (seconds): 13.70
        System time (seconds): 0.22
        Percent of CPU this job got: 158%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 0:08.79
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 398288
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 0
        Minor (reclaiming a frame) page faults: 96806
        Voluntary context switches: 3273
        Involuntary context switches: 745
        Swaps: 0
        File system inputs: 16
        File system outputs: 3760
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0

# CUE

Measured with `/usr/bin/time -v cue cmd -t debug -t name=test -t namespace=test -t mv=1.0.0 -t kv=1.28.0 build'

    Command being timed: "cue cmd -t debug -t name=test -t namespace=test -t mv=1.0.0 -t kv=1.28.0 build"
    User time (seconds): 39.28
    System time (seconds): 0.48
    Percent of CPU this job got: 156%
    Elapsed (wall clock) time (h:mm:ss or m:ss): 0:25.48
    Average shared text size (kbytes): 0
    Average unshared data size (kbytes): 0
    Average stack size (kbytes): 0
    Average total size (kbytes): 0
    Maximum resident set size (kbytes): 762016
    Average resident set size (kbytes): 0
    Major (requiring I/O) page faults: 0
    Minor (reclaiming a frame) page faults: 190805
    Voluntary context switches: 6578
    Involuntary context switches: 1520
    Swaps: 0
    File system inputs: 0
    File system outputs: 0
    Socket messages sent: 0
    Socket messages received: 0
    Signals delivered: 0
    Page size (bytes): 4096
    Exit status: 0