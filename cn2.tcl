# This script is created by NSG2 beta1
# <http://wushoupong.googlepages.com/nsg>

#===================================
#     Simulation parameters setup
#===================================
set val(stop)   10.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator -multicast on] ;

#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile

set group [Node allocaddr] ;#allocate a multicast address
#===================================
#        Nodes Definition        
#===================================
#Create 5 nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

#===================================
#        Links Definition        
#===================================
#Createlinks between nodes
$ns duplex-link $n0 $n1 100.0Mb 10ms DropTail
$ns queue-limit $n0 $n1 50
$ns duplex-link $n0 $n2 100.0Mb 10ms DropTail
$ns queue-limit $n0 $n2 50
$ns duplex-link $n0 $n3 100.0Mb 10ms DropTail
$ns queue-limit $n0 $n3 50
$ns duplex-link $n4 $n0 100.0Mb 10ms DropTail
$ns queue-limit $n4 $n0 50

set mproto DM ;#configure multicast protocal
set mrhandle [$ns mrtproto $mproto] ;#all nodes will contain multicast agent
#Give node position (for NAM)
$ns duplex-link-op $n0 $n1 orient left-up
$ns duplex-link-op $n0 $n2 orient right
$ns duplex-link-op $n0 $n3 orient left-down
$ns duplex-link-op $n4 $n0 orient right

#===================================
#        Agents Definition     
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0   
$udp0 set dst_addr_ $group
$udp0 set dst_port_ 0
set rcvr1 [new Agent/LossMonitor] ; #creates a receiver agent at node1(lossmonitor is agent)
$ns attach-agent $n1 $rcvr1
$ns at 1.10 "$n1 join-group $rcvr1 $group" ; #join the group at simulation time 1.9
 $ns at 1.15 "$n1 leave-group $rcvr1 $group" ;
 
set rcvr2 [new Agent/LossMonitor]; #creates a receiver agent at node2(lossmonitor is agent)
$ns attach-agent $n2 $rcvr2
$ns at 1.12 "$n2 join-group $rcvr2 $group" ; #join the group at simulation time 1.12
$ns at 1.30 "$n2 leave-group $rcvr2 $group" ;

set rcvr3 [new Agent/LossMonitor] ;#creates a receiver agent at node3(lossmonitor is agent)
$ns attach-agent $n3 $rcvr3
$ns at 1.16 "$n3 join-group $rcvr3 $group" ; #join the group at simulation time 1.15
$ns at 1.28 "$n3 leave-group $rcvr3 $group" ; 

set rcvr4 [new Agent/LossMonitor]; #creates a receiver agent at node4(lossmonitor is agent)
$ns attach-agent $n4 $rcvr4
$ns at 1.20 "$n4 join-group $rcvr4 $group" ; #join the group at simulation time 1.9
$ns at 1.45 "$n4 leave-group $rcvr4 $group" ; #join the group at simulation time 1.9
#===================================

#===================================
#        Applications Definition        
#===================================
#Setup a CBR Application over UDP connection
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
$cbr0 set packetSize_ 1000
$cbr0 set rate_ 1.0Mb
$cbr0 set random_ null
$ns at 1.0 "$cbr0 start"
$ns at 2.0 "$cbr0 stop"


#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
