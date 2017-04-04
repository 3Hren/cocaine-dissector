# Examples

See `examples/locator.pcap` for captured locator request. There are three TCP PSH segments that contain `resolve` request captured.

```bash
esafronov@cocs01h:~/code/cocaine/cocaine$ tshark -r out.pcap -X lua_script:cocaine.lua
  1 0.000000000          ::1 -> ::1          TCP 88 [TCP segment of a reassembled PDU]
  2 0.000010000          ::1 -> ::1          TCP 86 10053 > 44613 [ACK] Seq=1 Ack=3 Win=11 Len=0 TSval=1057942015 TSecr=1057942015
  3 2.976384000          ::1 -> ::1          TCP 88 [TCP segment of a reassembled PDU]
  4 2.976391000          ::1 -> ::1          TCP 86 10053 > 44613 [ACK] Seq=1 Ack=5 Win=11 Len=0 TSval=1057942759 TSecr=1057942759
  5 12.312505000          ::1 -> ::1          COCAINE 92 44613 > 10053 [PSH, ACK] Seq=5 Ack=1 Win=11 Len=6 TSval=1057945093 TSecr=1057942759
  6 12.312512000          ::1 -> ::1          TCP 86 10053 > 44613 [ACK] Seq=1 Ack=11 Win=11 Len=0 TSval=1057945093 TSecr=1057945093
  7 12.312814000          ::1 -> ::1          COCAINE 449 10053 > 44613 [PSH, ACK] Seq=1 Ack=11 Win=11 Len=363 TSval=1057945093 TSecr=1057945093
  8 12.312832000          ::1 -> ::1          TCP 86 44613 > 10053 [ACK] Seq=11 Ack=364 Win=11 Len=0 TSval=1057945093 TSecr=1057945093
```

The verbose output gives a full description the protocol layer:

```bash
esafronov@cocs01h:~/code/cocaine/cocaine$ tshark -r out.pcap -X lua_script:cocaine.lua -V
Frame 1: 88 bytes on wire (704 bits), 88 bytes captured (704 bits) on interface 0
    Interface id: 0
    Encapsulation type: Ethernet (1)
    Arrival Time: Apr  4, 2017 11:08:57.671488000 MSK
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1491293337.671488000 seconds
    [Time delta from previous captured frame: 0.000000000 seconds]
    [Time delta from previous displayed frame: 0.000000000 seconds]
    [Time since reference or first frame: 0.000000000 seconds]
    Frame Number: 1
    Frame Length: 88 bytes (704 bits)
    Capture Length: 88 bytes (704 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ipv6:tcp:cocaine]
Ethernet II, Src: 00:00:00_00:00:00 (00:00:00:00:00:00), Dst: 00:00:00_00:00:00 (00:00:00:00:00:00)
    Destination: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Source: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Type: IPv6 (0x86dd)
Internet Protocol Version 6, Src: ::1 (::1), Dst: ::1 (::1)
    0110 .... = Version: 6
        [0110 .... = This field makes the filter "ip.version == 6" possible: 6]
    .... 0000 0000 .... .... .... .... .... = Traffic class: 0x00000000
        .... 0000 00.. .... .... .... .... .... = Differentiated Services Field: Default (0x00000000)
        .... .... ..0. .... .... .... .... .... = ECN-Capable Transport (ECT): Not set
        .... .... ...0 .... .... .... .... .... = ECN-CE: Not set
    .... .... .... 0000 0000 0000 0000 0000 = Flowlabel: 0x00000000
    Payload length: 34
    Next header: TCP (6)
    Hop limit: 64
    Source: ::1 (::1)
    Destination: ::1 (::1)
    [Source GeoIP: Unknown]
    [Destination GeoIP: Unknown]
Transmission Control Protocol, Src Port: 44613 (44613), Dst Port: 10053 (10053), Seq: 1, Ack: 1, Len: 2
    Source port: 44613 (44613)
    Destination port: 10053 (10053)
    [Stream index: 0]
    Sequence number: 1    (relative sequence number)
    [Next sequence number: 3    (relative sequence number)]
    Acknowledgment number: 1    (relative ack number)
    Header length: 32 bytes
    Flags: 0x018 (PSH, ACK)
        000. .... .... = Reserved: Not set
        ...0 .... .... = Nonce: Not set
        .... 0... .... = Congestion Window Reduced (CWR): Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..0. .... = Urgent: Not set
        .... ...1 .... = Acknowledgment: Set
        .... .... 1... = Push: Set
        .... .... .0.. = Reset: Not set
        .... .... ..0. = Syn: Not set
        .... .... ...0 = Fin: Not set
    Window size value: 11
    [Calculated window size: 11]
    [Window size scaling factor: -1 (unknown)]
    Checksum: 0x002a [validation disabled]
        [Good Checksum: False]
        [Bad Checksum: False]
    Options: (12 bytes), No-Operation (NOP), No-Operation (NOP), Timestamps
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        Timestamps: TSval 1057942015, TSecr 1057933090
            Kind: Timestamp (8)
            Length: 10
            Timestamp value: 1057942015
            Timestamp echo reply: 1057933090
    [SEQ/ACK analysis]
        [Bytes in flight: 2]
    TCP segment data (2 bytes)

Frame 2: 86 bytes on wire (688 bits), 86 bytes captured (688 bits) on interface 0
    Interface id: 0
    Encapsulation type: Ethernet (1)
    Arrival Time: Apr  4, 2017 11:08:57.671498000 MSK
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1491293337.671498000 seconds
    [Time delta from previous captured frame: 0.000010000 seconds]
    [Time delta from previous displayed frame: 0.000010000 seconds]
    [Time since reference or first frame: 0.000010000 seconds]
    Frame Number: 2
    Frame Length: 86 bytes (688 bits)
    Capture Length: 86 bytes (688 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ipv6:tcp]
Ethernet II, Src: 00:00:00_00:00:00 (00:00:00:00:00:00), Dst: 00:00:00_00:00:00 (00:00:00:00:00:00)
    Destination: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Source: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Type: IPv6 (0x86dd)
Internet Protocol Version 6, Src: ::1 (::1), Dst: ::1 (::1)
    0110 .... = Version: 6
        [0110 .... = This field makes the filter "ip.version == 6" possible: 6]
    .... 0000 0000 .... .... .... .... .... = Traffic class: 0x00000000
        .... 0000 00.. .... .... .... .... .... = Differentiated Services Field: Default (0x00000000)
        .... .... ..0. .... .... .... .... .... = ECN-Capable Transport (ECT): Not set
        .... .... ...0 .... .... .... .... .... = ECN-CE: Not set
    .... .... .... 0000 0000 0000 0000 0000 = Flowlabel: 0x00000000
    Payload length: 32
    Next header: TCP (6)
    Hop limit: 64
    Source: ::1 (::1)
    Destination: ::1 (::1)
    [Source GeoIP: Unknown]
    [Destination GeoIP: Unknown]
Transmission Control Protocol, Src Port: 10053 (10053), Dst Port: 44613 (44613), Seq: 1, Ack: 3, Len: 0
    Source port: 10053 (10053)
    Destination port: 44613 (44613)
    [Stream index: 0]
    Sequence number: 1    (relative sequence number)
    Acknowledgment number: 3    (relative ack number)
    Header length: 32 bytes
    Flags: 0x010 (ACK)
        000. .... .... = Reserved: Not set
        ...0 .... .... = Nonce: Not set
        .... 0... .... = Congestion Window Reduced (CWR): Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..0. .... = Urgent: Not set
        .... ...1 .... = Acknowledgment: Set
        .... .... 0... = Push: Not set
        .... .... .0.. = Reset: Not set
        .... .... ..0. = Syn: Not set
        .... .... ...0 = Fin: Not set
    Window size value: 11
    [Calculated window size: 11]
    [Window size scaling factor: -1 (unknown)]
    Checksum: 0x0028 [validation disabled]
        [Good Checksum: False]
        [Bad Checksum: False]
    Options: (12 bytes), No-Operation (NOP), No-Operation (NOP), Timestamps
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        Timestamps: TSval 1057942015, TSecr 1057942015
            Kind: Timestamp (8)
            Length: 10
            Timestamp value: 1057942015
            Timestamp echo reply: 1057942015
    [SEQ/ACK analysis]
        [This is an ACK to the segment in frame: 1]
        [The RTT to ACK the segment was: 0.000010000 seconds]

Frame 3: 88 bytes on wire (704 bits), 88 bytes captured (704 bits) on interface 0
    Interface id: 0
    Encapsulation type: Ethernet (1)
    Arrival Time: Apr  4, 2017 11:09:00.647872000 MSK
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1491293340.647872000 seconds
    [Time delta from previous captured frame: 2.976374000 seconds]
    [Time delta from previous displayed frame: 2.976374000 seconds]
    [Time since reference or first frame: 2.976384000 seconds]
    Frame Number: 3
    Frame Length: 88 bytes (704 bits)
    Capture Length: 88 bytes (704 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ipv6:tcp:cocaine]
Ethernet II, Src: 00:00:00_00:00:00 (00:00:00:00:00:00), Dst: 00:00:00_00:00:00 (00:00:00:00:00:00)
    Destination: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Source: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Type: IPv6 (0x86dd)
Internet Protocol Version 6, Src: ::1 (::1), Dst: ::1 (::1)
    0110 .... = Version: 6
        [0110 .... = This field makes the filter "ip.version == 6" possible: 6]
    .... 0000 0000 .... .... .... .... .... = Traffic class: 0x00000000
        .... 0000 00.. .... .... .... .... .... = Differentiated Services Field: Default (0x00000000)
        .... .... ..0. .... .... .... .... .... = ECN-Capable Transport (ECT): Not set
        .... .... ...0 .... .... .... .... .... = ECN-CE: Not set
    .... .... .... 0000 0000 0000 0000 0000 = Flowlabel: 0x00000000
    Payload length: 34
    Next header: TCP (6)
    Hop limit: 64
    Source: ::1 (::1)
    Destination: ::1 (::1)
    [Source GeoIP: Unknown]
    [Destination GeoIP: Unknown]
Transmission Control Protocol, Src Port: 44613 (44613), Dst Port: 10053 (10053), Seq: 3, Ack: 1, Len: 2
    Source port: 44613 (44613)
    Destination port: 10053 (10053)
    [Stream index: 0]
    Sequence number: 3    (relative sequence number)
    [Next sequence number: 5    (relative sequence number)]
    Acknowledgment number: 1    (relative ack number)
    Header length: 32 bytes
    Flags: 0x018 (PSH, ACK)
        000. .... .... = Reserved: Not set
        ...0 .... .... = Nonce: Not set
        .... 0... .... = Congestion Window Reduced (CWR): Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..0. .... = Urgent: Not set
        .... ...1 .... = Acknowledgment: Set
        .... .... 1... = Push: Set
        .... .... .0.. = Reset: Not set
        .... .... ..0. = Syn: Not set
        .... .... ...0 = Fin: Not set
    Window size value: 11
    [Calculated window size: 11]
    [Window size scaling factor: -1 (unknown)]
    Checksum: 0x002a [validation disabled]
        [Good Checksum: False]
        [Bad Checksum: False]
    Options: (12 bytes), No-Operation (NOP), No-Operation (NOP), Timestamps
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        Timestamps: TSval 1057942759, TSecr 1057942015
            Kind: Timestamp (8)
            Length: 10
            Timestamp value: 1057942759
            Timestamp echo reply: 1057942015
    [SEQ/ACK analysis]
        [Bytes in flight: 2]
    TCP segment data (2 bytes)

Frame 4: 86 bytes on wire (688 bits), 86 bytes captured (688 bits) on interface 0
    Interface id: 0
    Encapsulation type: Ethernet (1)
    Arrival Time: Apr  4, 2017 11:09:00.647879000 MSK
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1491293340.647879000 seconds
    [Time delta from previous captured frame: 0.000007000 seconds]
    [Time delta from previous displayed frame: 0.000007000 seconds]
    [Time since reference or first frame: 2.976391000 seconds]
    Frame Number: 4
    Frame Length: 86 bytes (688 bits)
    Capture Length: 86 bytes (688 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ipv6:tcp]
Ethernet II, Src: 00:00:00_00:00:00 (00:00:00:00:00:00), Dst: 00:00:00_00:00:00 (00:00:00:00:00:00)
    Destination: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Source: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Type: IPv6 (0x86dd)
Internet Protocol Version 6, Src: ::1 (::1), Dst: ::1 (::1)
    0110 .... = Version: 6
        [0110 .... = This field makes the filter "ip.version == 6" possible: 6]
    .... 0000 0000 .... .... .... .... .... = Traffic class: 0x00000000
        .... 0000 00.. .... .... .... .... .... = Differentiated Services Field: Default (0x00000000)
        .... .... ..0. .... .... .... .... .... = ECN-Capable Transport (ECT): Not set
        .... .... ...0 .... .... .... .... .... = ECN-CE: Not set
    .... .... .... 0000 0000 0000 0000 0000 = Flowlabel: 0x00000000
    Payload length: 32
    Next header: TCP (6)
    Hop limit: 64
    Source: ::1 (::1)
    Destination: ::1 (::1)
    [Source GeoIP: Unknown]
    [Destination GeoIP: Unknown]
Transmission Control Protocol, Src Port: 10053 (10053), Dst Port: 44613 (44613), Seq: 1, Ack: 5, Len: 0
    Source port: 10053 (10053)
    Destination port: 44613 (44613)
    [Stream index: 0]
    Sequence number: 1    (relative sequence number)
    Acknowledgment number: 5    (relative ack number)
    Header length: 32 bytes
    Flags: 0x010 (ACK)
        000. .... .... = Reserved: Not set
        ...0 .... .... = Nonce: Not set
        .... 0... .... = Congestion Window Reduced (CWR): Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..0. .... = Urgent: Not set
        .... ...1 .... = Acknowledgment: Set
        .... .... 0... = Push: Not set
        .... .... .0.. = Reset: Not set
        .... .... ..0. = Syn: Not set
        .... .... ...0 = Fin: Not set
    Window size value: 11
    [Calculated window size: 11]
    [Window size scaling factor: -1 (unknown)]
    Checksum: 0x0028 [validation disabled]
        [Good Checksum: False]
        [Bad Checksum: False]
    Options: (12 bytes), No-Operation (NOP), No-Operation (NOP), Timestamps
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        Timestamps: TSval 1057942759, TSecr 1057942759
            Kind: Timestamp (8)
            Length: 10
            Timestamp value: 1057942759
            Timestamp echo reply: 1057942759
    [SEQ/ACK analysis]
        [This is an ACK to the segment in frame: 3]
        [The RTT to ACK the segment was: 0.000007000 seconds]

Frame 5: 92 bytes on wire (736 bits), 92 bytes captured (736 bits) on interface 0
    Interface id: 0
    Encapsulation type: Ethernet (1)
    Arrival Time: Apr  4, 2017 11:09:09.983993000 MSK
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1491293349.983993000 seconds
    [Time delta from previous captured frame: 9.336114000 seconds]
    [Time delta from previous displayed frame: 9.336114000 seconds]
    [Time since reference or first frame: 12.312505000 seconds]
    Frame Number: 5
    Frame Length: 92 bytes (736 bits)
    Capture Length: 92 bytes (736 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ipv6:tcp:cocaine]
Ethernet II, Src: 00:00:00_00:00:00 (00:00:00:00:00:00), Dst: 00:00:00_00:00:00 (00:00:00:00:00:00)
    Destination: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Source: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Type: IPv6 (0x86dd)
Internet Protocol Version 6, Src: ::1 (::1), Dst: ::1 (::1)
    0110 .... = Version: 6
        [0110 .... = This field makes the filter "ip.version == 6" possible: 6]
    .... 0000 0000 .... .... .... .... .... = Traffic class: 0x00000000
        .... 0000 00.. .... .... .... .... .... = Differentiated Services Field: Default (0x00000000)
        .... .... ..0. .... .... .... .... .... = ECN-Capable Transport (ECT): Not set
        .... .... ...0 .... .... .... .... .... = ECN-CE: Not set
    .... .... .... 0000 0000 0000 0000 0000 = Flowlabel: 0x00000000
    Payload length: 38
    Next header: TCP (6)
    Hop limit: 64
    Source: ::1 (::1)
    Destination: ::1 (::1)
    [Source GeoIP: Unknown]
    [Destination GeoIP: Unknown]
Transmission Control Protocol, Src Port: 44613 (44613), Dst Port: 10053 (10053), Seq: 5, Ack: 1, Len: 6
    Source port: 44613 (44613)
    Destination port: 10053 (10053)
    [Stream index: 0]
    Sequence number: 5    (relative sequence number)
    [Next sequence number: 11    (relative sequence number)]
    Acknowledgment number: 1    (relative ack number)
    Header length: 32 bytes
    Flags: 0x018 (PSH, ACK)
        000. .... .... = Reserved: Not set
        ...0 .... .... = Nonce: Not set
        .... 0... .... = Congestion Window Reduced (CWR): Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..0. .... = Urgent: Not set
        .... ...1 .... = Acknowledgment: Set
        .... .... 1... = Push: Set
        .... .... .0.. = Reset: Not set
        .... .... ..0. = Syn: Not set
        .... .... ...0 = Fin: Not set
    Window size value: 11
    [Calculated window size: 11]
    [Window size scaling factor: -1 (unknown)]
    Checksum: 0x002e [validation disabled]
        [Good Checksum: False]
        [Bad Checksum: False]
    Options: (12 bytes), No-Operation (NOP), No-Operation (NOP), Timestamps
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        Timestamps: TSval 1057945093, TSecr 1057942759
            Kind: Timestamp (8)
            Length: 10
            Timestamp value: 1057945093
            Timestamp echo reply: 1057942759
    [SEQ/ACK analysis]
        [Bytes in flight: 6]
    TCP segment data (6 bytes)
[3 Reassembled TCP Segments (10 bytes): #1(2), #3(2), #5(6)]
    [Frame: 1, payload: 0-1 (2 bytes)]
    [Frame: 3, payload: 2-3 (2 bytes)]
    [Frame: 5, payload: 4-9 (6 bytes)]
    [Segment count: 3]
    [Reassembled TCP length: 10]
    [Reassembled TCP Data: 94010091a46e6f646590]
Cocaine RPC Protocol
    Id: 1
    Type: 0
    Frame: {1,0,{"node"},{}}

Frame 6: 86 bytes on wire (688 bits), 86 bytes captured (688 bits) on interface 0
    Interface id: 0
    Encapsulation type: Ethernet (1)
    Arrival Time: Apr  4, 2017 11:09:09.984000000 MSK
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1491293349.984000000 seconds
    [Time delta from previous captured frame: 0.000007000 seconds]
    [Time delta from previous displayed frame: 0.000007000 seconds]
    [Time since reference or first frame: 12.312512000 seconds]
    Frame Number: 6
    Frame Length: 86 bytes (688 bits)
    Capture Length: 86 bytes (688 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ipv6:tcp]
Ethernet II, Src: 00:00:00_00:00:00 (00:00:00:00:00:00), Dst: 00:00:00_00:00:00 (00:00:00:00:00:00)
    Destination: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Source: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Type: IPv6 (0x86dd)
Internet Protocol Version 6, Src: ::1 (::1), Dst: ::1 (::1)
    0110 .... = Version: 6
        [0110 .... = This field makes the filter "ip.version == 6" possible: 6]
    .... 0000 0000 .... .... .... .... .... = Traffic class: 0x00000000
        .... 0000 00.. .... .... .... .... .... = Differentiated Services Field: Default (0x00000000)
        .... .... ..0. .... .... .... .... .... = ECN-Capable Transport (ECT): Not set
        .... .... ...0 .... .... .... .... .... = ECN-CE: Not set
    .... .... .... 0000 0000 0000 0000 0000 = Flowlabel: 0x00000000
    Payload length: 32
    Next header: TCP (6)
    Hop limit: 64
    Source: ::1 (::1)
    Destination: ::1 (::1)
    [Source GeoIP: Unknown]
    [Destination GeoIP: Unknown]
Transmission Control Protocol, Src Port: 10053 (10053), Dst Port: 44613 (44613), Seq: 1, Ack: 11, Len: 0
    Source port: 10053 (10053)
    Destination port: 44613 (44613)
    [Stream index: 0]
    Sequence number: 1    (relative sequence number)
    Acknowledgment number: 11    (relative ack number)
    Header length: 32 bytes
    Flags: 0x010 (ACK)
        000. .... .... = Reserved: Not set
        ...0 .... .... = Nonce: Not set
        .... 0... .... = Congestion Window Reduced (CWR): Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..0. .... = Urgent: Not set
        .... ...1 .... = Acknowledgment: Set
        .... .... 0... = Push: Not set
        .... .... .0.. = Reset: Not set
        .... .... ..0. = Syn: Not set
        .... .... ...0 = Fin: Not set
    Window size value: 11
    [Calculated window size: 11]
    [Window size scaling factor: -1 (unknown)]
    Checksum: 0x0028 [validation disabled]
        [Good Checksum: False]
        [Bad Checksum: False]
    Options: (12 bytes), No-Operation (NOP), No-Operation (NOP), Timestamps
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        Timestamps: TSval 1057945093, TSecr 1057945093
            Kind: Timestamp (8)
            Length: 10
            Timestamp value: 1057945093
            Timestamp echo reply: 1057945093
    [SEQ/ACK analysis]
        [This is an ACK to the segment in frame: 5]
        [The RTT to ACK the segment was: 0.000007000 seconds]

Frame 7: 449 bytes on wire (3592 bits), 449 bytes captured (3592 bits) on interface 0
    Interface id: 0
    Encapsulation type: Ethernet (1)
    Arrival Time: Apr  4, 2017 11:09:09.984302000 MSK
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1491293349.984302000 seconds
    [Time delta from previous captured frame: 0.000302000 seconds]
    [Time delta from previous displayed frame: 0.000302000 seconds]
    [Time since reference or first frame: 12.312814000 seconds]
    Frame Number: 7
    Frame Length: 449 bytes (3592 bits)
    Capture Length: 449 bytes (3592 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ipv6:tcp:cocaine]
Ethernet II, Src: 00:00:00_00:00:00 (00:00:00:00:00:00), Dst: 00:00:00_00:00:00 (00:00:00:00:00:00)
    Destination: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Source: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Type: IPv6 (0x86dd)
Internet Protocol Version 6, Src: ::1 (::1), Dst: ::1 (::1)
    0110 .... = Version: 6
        [0110 .... = This field makes the filter "ip.version == 6" possible: 6]
    .... 0000 0000 .... .... .... .... .... = Traffic class: 0x00000000
        .... 0000 00.. .... .... .... .... .... = Differentiated Services Field: Default (0x00000000)
        .... .... ..0. .... .... .... .... .... = ECN-Capable Transport (ECT): Not set
        .... .... ...0 .... .... .... .... .... = ECN-CE: Not set
    .... .... .... 0000 0000 0000 0000 0000 = Flowlabel: 0x00000000
    Payload length: 395
    Next header: TCP (6)
    Hop limit: 64
    Source: ::1 (::1)
    Destination: ::1 (::1)
    [Source GeoIP: Unknown]
    [Destination GeoIP: Unknown]
Transmission Control Protocol, Src Port: 10053 (10053), Dst Port: 44613 (44613), Seq: 1, Ack: 11, Len: 363
    Source port: 10053 (10053)
    Destination port: 44613 (44613)
    [Stream index: 0]
    Sequence number: 1    (relative sequence number)
    [Next sequence number: 364    (relative sequence number)]
    Acknowledgment number: 11    (relative ack number)
    Header length: 32 bytes
    Flags: 0x018 (PSH, ACK)
        000. .... .... = Reserved: Not set
        ...0 .... .... = Nonce: Not set
        .... 0... .... = Congestion Window Reduced (CWR): Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..0. .... = Urgent: Not set
        .... ...1 .... = Acknowledgment: Set
        .... .... 1... = Push: Set
        .... .... .0.. = Reset: Not set
        .... .... ..0. = Syn: Not set
        .... .... ...0 = Fin: Not set
    Window size value: 11
    [Calculated window size: 11]
    [Window size scaling factor: -1 (unknown)]
    Checksum: 0x0193 [validation disabled]
        [Good Checksum: False]
        [Bad Checksum: False]
    Options: (12 bytes), No-Operation (NOP), No-Operation (NOP), Timestamps
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        Timestamps: TSval 1057945093, TSecr 1057945093
            Kind: Timestamp (8)
            Length: 10
            Timestamp value: 1057945093
            Timestamp echo reply: 1057945093
    [SEQ/ACK analysis]
        [Bytes in flight: 363]
Cocaine RPC Protocol
    Id: 1
    Type: 0
    Frame [truncated]: {1,0,{{{"2a02:6b8:0:1a16:556::201",10386}},1,{{"pause_app",{},{{"error",{}},[0]={"value",{}}}},{"list",{},{{"error",{}},[0]={"value",{}}}},{"info",{},{{"error",{}},[0]={"value",{}}}},{"control",{{"error",{}},{"close",{}}

Frame 8: 86 bytes on wire (688 bits), 86 bytes captured (688 bits) on interface 0
    Interface id: 0
    Encapsulation type: Ethernet (1)
    Arrival Time: Apr  4, 2017 11:09:09.984320000 MSK
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1491293349.984320000 seconds
    [Time delta from previous captured frame: 0.000018000 seconds]
    [Time delta from previous displayed frame: 0.000018000 seconds]
    [Time since reference or first frame: 12.312832000 seconds]
    Frame Number: 8
    Frame Length: 86 bytes (688 bits)
    Capture Length: 86 bytes (688 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ipv6:tcp]
Ethernet II, Src: 00:00:00_00:00:00 (00:00:00:00:00:00), Dst: 00:00:00_00:00:00 (00:00:00:00:00:00)
    Destination: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Source: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Address: 00:00:00_00:00:00 (00:00:00:00:00:00)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Type: IPv6 (0x86dd)
Internet Protocol Version 6, Src: ::1 (::1), Dst: ::1 (::1)
    0110 .... = Version: 6
        [0110 .... = This field makes the filter "ip.version == 6" possible: 6]
    .... 0000 0000 .... .... .... .... .... = Traffic class: 0x00000000
        .... 0000 00.. .... .... .... .... .... = Differentiated Services Field: Default (0x00000000)
        .... .... ..0. .... .... .... .... .... = ECN-Capable Transport (ECT): Not set
        .... .... ...0 .... .... .... .... .... = ECN-CE: Not set
    .... .... .... 0000 0000 0000 0000 0000 = Flowlabel: 0x00000000
    Payload length: 32
    Next header: TCP (6)
    Hop limit: 64
    Source: ::1 (::1)
    Destination: ::1 (::1)
    [Source GeoIP: Unknown]
    [Destination GeoIP: Unknown]
Transmission Control Protocol, Src Port: 44613 (44613), Dst Port: 10053 (10053), Seq: 11, Ack: 364, Len: 0
    Source port: 44613 (44613)
    Destination port: 10053 (10053)
    [Stream index: 0]
    Sequence number: 11    (relative sequence number)
    Acknowledgment number: 364    (relative ack number)
    Header length: 32 bytes
    Flags: 0x010 (ACK)
        000. .... .... = Reserved: Not set
        ...0 .... .... = Nonce: Not set
        .... 0... .... = Congestion Window Reduced (CWR): Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..0. .... = Urgent: Not set
        .... ...1 .... = Acknowledgment: Set
        .... .... 0... = Push: Not set
        .... .... .0.. = Reset: Not set
        .... .... ..0. = Syn: Not set
        .... .... ...0 = Fin: Not set
    Window size value: 11
    [Calculated window size: 11]
    [Window size scaling factor: -1 (unknown)]
    Checksum: 0x0028 [validation disabled]
        [Good Checksum: False]
        [Bad Checksum: False]
    Options: (12 bytes), No-Operation (NOP), No-Operation (NOP), Timestamps
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        No-Operation (NOP)
            Type: 1
                0... .... = Copy on fragmentation: No
                .00. .... = Class: Control (0)
                ...0 0001 = Number: No-Operation (NOP) (1)
        Timestamps: TSval 1057945093, TSecr 1057945093
            Kind: Timestamp (8)
            Length: 10
            Timestamp value: 1057945093
            Timestamp echo reply: 1057945093
    [SEQ/ACK analysis]
        [This is an ACK to the segment in frame: 7]
        [The RTT to ACK the segment was: 0.000018000 seconds]
```

Note that reassembled section:
```bash
[3 Reassembled TCP Segments (10 bytes): #1(2), #3(2), #5(6)]
    [Frame: 1, payload: 0-1 (2 bytes)]
    [Frame: 3, payload: 2-3 (2 bytes)]
    [Frame: 5, payload: 4-9 (6 bytes)]
    [Segment count: 3]
    [Reassembled TCP length: 10]
    [Reassembled TCP Data: 94010091a46e6f646590]
Cocaine RPC Protocol
    Id: 1
    Type: 0
    Frame: {1,0,{"node"},{}}
```

To completely eliminate layers other than cocaine use `-YCocaine` option.
