# Timoni

Measured with `/usr/bin/time -v timoni mod vet`

        Command being timed: "timoni mod vet"
        User time (seconds): 16.07
        System time (seconds): 0.30
        Percent of CPU this job got: 160%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 0:10.18
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 580060
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 0
        Minor (reclaiming a frame) page faults: 140497
        Voluntary context switches: 3640
        Involuntary context switches: 471
        Swaps: 0
        File system inputs: 0
        File system outputs: 3848
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0

# CUE

Measured with `/usr/bin/time -v cue cmd -t debug -t name=test -t namespace=test -t mv=1.0.0 -t kv=1.28.0 build'

    Command being timed: "cue cmd -t debug -t name=test -t namespace=test -t mv=1.0.0 -t kv=1.28.0 build"
    User time (seconds): 53.65
    System time (seconds): 0.59
    Percent of CPU this job got: 152%
    Elapsed (wall clock) time (h:mm:ss or m:ss): 0:35.55
    Average shared text size (kbytes): 0
    Average unshared data size (kbytes): 0
    Average stack size (kbytes): 0
    Average total size (kbytes): 0
    Maximum resident set size (kbytes): 1037592
    Average resident set size (kbytes): 0
    Major (requiring I/O) page faults: 0
    Minor (reclaiming a frame) page faults: 263022
    Voluntary context switches: 8109
    Involuntary context switches: 1704
    Swaps: 0
    File system inputs: 0
    File system outputs: 0
    Socket messages sent: 0
    Socket messages received: 0
    Signals delivered: 0
    Page size (bytes): 4096
    Exit status: 0
