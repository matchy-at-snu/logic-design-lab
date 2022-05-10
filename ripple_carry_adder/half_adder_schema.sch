<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="A" />
        <signal name="B" />
        <signal name="Sum" />
        <signal name="Carry" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Output" name="Sum" />
        <port polarity="Output" name="Carry" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="Carry" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_2">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="Sum" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="288" y="832" name="XLXI_1" orien="R0" />
        <instance x="288" y="624" name="XLXI_2" orien="R0" />
        <branch name="A">
            <wire x2="144" y1="256" y2="496" x1="144" />
            <wire x2="288" y1="496" y2="496" x1="144" />
            <wire x2="144" y1="496" y2="704" x1="144" />
            <wire x2="288" y1="704" y2="704" x1="144" />
            <wire x2="144" y1="704" y2="880" x1="144" />
        </branch>
        <branch name="B">
            <wire x2="224" y1="256" y2="560" x1="224" />
            <wire x2="288" y1="560" y2="560" x1="224" />
            <wire x2="224" y1="560" y2="768" x1="224" />
            <wire x2="224" y1="768" y2="1008" x1="224" />
            <wire x2="288" y1="768" y2="768" x1="224" />
        </branch>
        <iomarker fontsize="28" x="144" y="256" name="A" orien="R270" />
        <iomarker fontsize="28" x="224" y="256" name="B" orien="R270" />
        <branch name="Sum">
            <wire x2="640" y1="528" y2="528" x1="544" />
        </branch>
        <branch name="Carry">
            <wire x2="640" y1="736" y2="736" x1="544" />
        </branch>
        <iomarker fontsize="28" x="640" y="736" name="Carry" orien="R0" />
        <iomarker fontsize="28" x="640" y="528" name="Sum" orien="R0" />
    </sheet>
</drawing>