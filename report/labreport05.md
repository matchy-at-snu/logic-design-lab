# Logic Design Lab Report 05

## Lab Part

A 2-bit ripple-carry adder (RCA) is simply "concatenating" two 1-bit full adders in serial. And (personally speaking) the easiest way to implement a full-adder is to implement using two half-adders.

Thus, my implementation of 2-bit RCA consists of the following 3 parts: half-adder, full-adder and RCA. The code was shown in the following subsections below.

### Code

#### Half Adder

```verilog
module half_adder(
    input A,
    input B,
    output Cout,
    output Sum
    );

assign Cout = A & B;
assign Sum = A ^ B;

endmodule
```

#### 1-bit Full Adder

```verilog
module full_adder_1bit(
    input A,
    input B,
    input Cin,
    output Cout,
    output Sum
    );

wire Sum_HA, C1, C2;
half_adder ha1(
    .A(A), .B(B), .Cout(C1), .Sum(Sum_HA)
);

half_adder ha2(
    .A(Cin), .B(Sum_HA), .Cout(C2), .Sum(Sum)
);

assign Cout = C1 | C2;

endmodule
```

#### 2-bit RCA

```verilog
module rca_2bit(
    input [1:0] A,
    input [1:0] B,
    input Cin,
    output Cout,
    output [1:0] S
    );

wire C;

full_adder_1bit FA1(
    .A(A[0]), .B(B[0]), .Cin(Cin), .Cout(C), .Sum(S[0])
);

full_adder_1bit FA2(
    .A(A[1]), .B(B[1]), .Cin(C), .Cout(Cout), .Sum(S[1])
);

endmodule
```

### Simulation

#### `Cin` equals `0`

![Cin=0](img/lab05/20220502022110.png)

#### `Cin` equals `1`

![Cin=1](img/lab05/20220502022240.png)

### FPGA Simulation

I assigned `P47`~`P51` (correspond to tactile switch 1~5) to `A1`, `A0`, `B1`, `B0` and `Cin` respectively. And I assigned `P91` (Red LED), `P92` (Yellow LED) and `P93` (Green LED) to `S1`, `S0` and `Cout`. On FPGA board, the pin configuration is marked in the figure below:

<img src="img/lab05/20220502024136.png" alt="Pin" style="zoom: 50%;" />

| Cin  | A0   | A1   | B1   | B0   | Cout | S1   | S0   | Figure                                                       |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ------------------------------------------------------------ |
| 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | It's shown in the figure above                               |
| 0    | 0    | 0    | 0    | 1    | 0    | 0    | 1    | <img src="img/lab05/image-20220502025330337.png" alt="image-20220502025330337" style="zoom:50%;" /> |
| 0    | 0    | 0    | 1    | 0    | 0    | 1    | 0    | <img src="img/lab05/image-20220502025541984.png" alt="image-20220502025541984" style="zoom:50%;" /> |
| 0    | 0    | 0    | 1    | 1    | 0    | 1    | 1    | <img src="img/lab05/image-20220502025746509.png" alt="image-20220502025746509" style="zoom:50%;" /> |
| 0    | 0    | 1    | 0    | 0    | 0    | 0    | 1    | <img src="img/lab05/image-20220502025909943.png" alt="image-20220502025909943" style="zoom: 50%;" /> |
| 0    | 0    | 1    | 0    | 1    | 0    | 1    | 0    | <img src="img/lab05/image-20220502030036569.png" alt="image-20220502030036569" style="zoom: 67%;" /> |
| 0    | 0    | 1    | 1    | 0    | 0    | 1    | 1    | <img src="img/lab05/image-20220502031231492.png" alt="image-20220502031231492" style="zoom:67%;" /> |
| 0    | 0    | 1    | 1    | 1    | 1    | 0    | 0    | <img src="img/lab05/image-20220502032146794.png" alt="image-20220502032146794" style="zoom:67%;" /> |
| 0    | 1    | 0    | 0    | 0    | 0    | 1    | 0    | <img src="img/lab05/image-20220502030231603.png" alt="image-20220502030231603" style="zoom:67%;" /> |
| 0    | 1    | 0    | 0    | 1    | 0    | 1    | 1    | <img src="img/lab05/image-20220502030726582.png" alt="image-20220502030726582" style="zoom: 67%;" /> |
| 0    | 1    | 0    | 1    | 0    | 1    | 0    | 0    | <img src="img/lab05/image-20220502031203720.png" alt="image-20220502031203720" style="zoom:67%;" /> |
| 0    | 1    | 0    | 1    | 1    | 1    | 0    | 1    | <img src="img/lab05/image-20220502032221422.png" alt="image-20220502032221422" style="zoom:67%;" /> |
| 0    | 1    | 1    | 0    | 0    | 0    | 1    | 1    | <img src="img/lab05/image-20220502030453447.png" alt="image-20220502030453447" style="zoom: 67%;" /> |
| 0    | 1    | 1    | 0    | 1    | 1    | 0    | 0    | <img src="img/lab05/image-20220502031500299.png" alt="image-20220502031500299" style="zoom:67%;" /> |
| 0    | 1    | 1    | 1    | 0    | 1    | 0    | 1    | <img src="img/lab05/image-20220502031138080.png" alt="image-20220502031138080" style="zoom: 67%;" /> |
| 0    | 1    | 1    | 1    | 1    | 1    | 1    | 0    | <img src="img/lab05/image-20220502032001784.png" alt="image-20220502032001784" style="zoom:67%;" /> |

| Cin  | A0   | A1   | B1   | B0   | Cout | S1   | S0   | Figure                                                       |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ------------------------------------------------------------ |
| 1    | 0    | 0    | 0    | 0    | 0    | 0    | 1    | <img src="img/lab05/image-20220502030528777.png" alt="image-20220502030528777" style="zoom: 50%;" /> |
| 1    | 0    | 0    | 0    | 1    | 0    | 1    | 0    | <img src="img/lab05/image-20220502031846255.png" alt="image-20220502031846255" style="zoom:50%;" /> |
| 1    | 0    | 0    | 1    | 0    | 0    | 1    | 1    | <img src="img/lab05/image-20220502031625991.png" alt="image-20220502031625991" style="zoom:50%;" /> |
| 1    | 0    | 0    | 1    | 1    | 1    | 0    | 0    | <img src="img/lab05/image-20220502031649013.png" alt="image-20220502031649013" style="zoom:50%;" /> |
| 1    | 0    | 1    | 0    | 0    | 0    | 1    | 0    | <img src="img/lab05/image-20220502031356793.png" alt="image-20220502031356793" style="zoom:50%;" /> |
| 1    | 0    | 1    | 0    | 1    | 0    | 1    | 1    | <img src="img/lab05/image-20220502031604747.png" alt="image-20220502031604747" style="zoom:50%;" /> |
| 1    | 0    | 1    | 1    | 0    | 1    | 0    | 0    | <img src="img/lab05/image-20220502032452848.png" alt="image-20220502032452848" style="zoom:50%;" /> |
| 1    | 0    | 1    | 1    | 1    | 1    | 0    | 1    | <img src="img/lab05/image-20220502032301488.png" alt="image-20220502032301488" style="zoom:50%;" /> |
| 1    | 1    | 0    | 0    | 0    | 0    | 1    | 1    | <img src="img/lab05/image-20220502030638335.png" alt="image-20220502030638335" style="zoom:50%;" /> |
| 1    | 1    | 0    | 0    | 1    | 1    | 0    | 0    | <img src="img/lab05/image-20220502031540862.png" alt="image-20220502031540862" style="zoom:50%;" /> |
| 1    | 1    | 0    | 1    | 0    | 1    | 0    | 1    | <img src="img/lab05/image-20220502032523717.png" alt="image-20220502032523717" style="zoom:50%;" /> |
| 1    | 1    | 0    | 1    | 1    | 1    | 1    | 0    | <img src="img/lab05/image-20220502032606685.png" alt="image-20220502032606685" style="zoom:50%;" /> |
| 1    | 1    | 1    | 0    | 0    | 1    | 0    | 0    | <img src="img/lab05/image-20220502031312747.png" alt="image-20220502031312747" style="zoom:50%;" /> |
| 1    | 1    | 1    | 0    | 1    | 1    | 0    | 1    | <img src="img/lab05/image-20220502031049927.png" alt="image-20220502031049927" style="zoom:50%;" /> |
| 1    | 1    | 1    | 1    | 0    | 1    | 1    | 0    | <img src="img/lab05/image-20220502032510680.png" alt="image-20220502032510680" style="zoom:50%;" /> |
| 1    | 1    | 1    | 1    | 1    | 1    | 1    | 1    | <img src="img/lab05/image-20220502032616512.png" alt="image-20220502032616512" style="zoom:50%;" /> |

## Homework

### Code

```verilog
module alu(
    input [1:0] Select,
    input Mode,
    input A,
    input B,
    output Output
    );

wire [1:0] sel;
assign sel = Select;

reg out;
assign Output = out;

always @(sel or A or B or Mode) begin
    if (!Mode) begin
        case (sel)
            2'b00: out = A;
            2'b01: out = ~A;
            2'b10: out = A^B;
            2'b11: out = ~(A^B);
        endcase
    end
    else begin
        case (sel)
            2'b00: out = A;
            2'b01: out = ~A;
            2'b10: out = A + B;
            2'b11: out = (~A) + B;
        endcase
    end
end

endmodule
```

### Simulation

#### `Mode` is `0` (Logic mode)

![logic mode](img/lab05/20220502215800.png)

#### `Mode` is `1` (Arithmetic mode)

![arithmetic mode](img/lab05/20220502215917.png)

### FPGA Simulation

I assigned `P30` to `Mode`, `P31` and `P32` to `Select[1:0]`, `P33` to `A` AND `p41` to `B`. They correspond to switch 1~5 on DIP switch.

For output, I assigned `P93` (Green LED) to `Output`.

On FPGA board, the pin configuration is marked in the figure below:

![pin config](img/lab05/20220502221926.png)

| Mode | Select[1:0] | A    | B    | Output | Operation    | Figure                                                       |
| ---- | ----------- | ---- | ---- | ------ | ------------ | ------------------------------------------------------------ |
| 0    | 00          | 0    | 0    | 0      | F = A        | ![image-20220502230006807](img/lab05/image-20220502230006807.png) |
| 0    | 01          | 0    | 0    | 1      | F = ~A       | ![image-20220502225418300](img/lab05/image-20220502225418300.png) |
| 0    | 10          | 0    | 0    | 0      | F = A xor B  | ![image-20220502224251057](img/lab05/image-20220502224251057.png) |
| 0    | 11          | 0    | 0    | 1      | F = A xnor B | ![image-20220502224152984](img/lab05/image-20220502224152984.png) |
| 0    | 00          | 0    | 1    | 0      | F = A        | ![image-20220502225956807](img/lab05/image-20220502225956807.png) |
| 0    | 01          | 0    | 1    | 1      | F = ~A       | ![image-20220502225407349](img/lab05/image-20220502225407349.png) |
| 0    | 10          | 0    | 1    | 1      | F = A xor B  | ![image-20220502224231820](img/lab05/image-20220502224231820.png) |
| 0    | 11          | 0    | 1    | 0      | F = A xnor B | ![image-20220502223959634](img/lab05/image-20220502223959634.png) |
| 0    | 00          | 1    | 0    | 1      | F = A        | ![image-20220502225945873](img/lab05/image-20220502225945873.png) |
| 0    | 01          | 1    | 0    | 0      | F = ~A       | ![image-20220502225339560](img/lab05/image-20220502225339560.png) |
| 0    | 10          | 1    | 0    | 1      | F = A xor B  | ![image-20220502224217170](img/lab05/image-20220502224217170.png) |
| 0    | 11          | 1    | 0    | 0      | F = A xnor B | ![image-20220502223949405](img/lab05/image-20220502223949405.png) |
| 0    | 00          | 1    | 1    | 1      | F = A        | ![image-20220502225934721](img/lab05/image-20220502225934721.png) |
| 0    | 01          | 1    | 1    | 0      | F = ~A       | ![image-20220502224309223](img/lab05/image-20220502224309223.png) |
| 0    | 10          | 1    | 1    | 0      | F = A xor B  | ![image-20220502224205808](img/lab05/image-20220502224205808.png) |
| 0    | 11          | 1    | 1    | 1      | F = A xnor B | ![image-20220502223937543](img/lab05/image-20220502223937543.png) |
| 1    | 00          | 0    | 0    | 0      | F = A        | ![image-20220502223918944](img/lab05/image-20220502223918944.png) |
| 1    | 01          | 0    | 0    | 1      | F = ~A       | ![image-20220502223837741](img/lab05/image-20220502223837741.png) |
| 1    | 10          | 0    | 0    | 0      | F = A + B    | ![image-20220502223628145](img/lab05/image-20220502223628145.png) |
| 1    | 11          | 0    | 0    | 1      | F = ~A + B   | ![image-20220502223501312](img/lab05/image-20220502223501312.png) |
| 1    | 00          | 0    | 1    | 0      | F = A        | ![image-20220502223911274](img/lab05/image-20220502223911274.png) |
| 1    | 01          | 0    | 1    | 1      | F = ~A       | ![image-20220502223821989](img/lab05/image-20220502223821989.png) |
| 1    | 10          | 0    | 1    | 1      | F = A + B    | ![image-20220502223611899](img/lab05/image-20220502223611899.png) |
| 1    | 11          | 0    | 1    | 0      | F = ~A + B   | ![image-20220502223446520](img/lab05/image-20220502223446520.png) |
| 1    | 00          | 1    | 0    | 1      | F = A        | ![image-20220502223859446](img/lab05/image-20220502223859446.png) |
| 1    | 01          | 1    | 0    | 0      | F = ~A       | ![image-20220502223811802](img/lab05/image-20220502223811802.png) |
| 1    | 10          | 1    | 0    | 1      | F = A + B    | ![image-20220502223600290](img/lab05/image-20220502223600290.png) |
| 1    | 11          | 1    | 0    | 0      | F = ~A + B   | ![image-20220502223321141](img/lab05/image-20220502223321141.png) |
| 1    | 00          | 1    | 1    | 1      | F = A        | ![image-20220502223850974](img/lab05/image-20220502223850974.png) |
| 1    | 01          | 1    | 1    | 0      | F = ~A       | ![image-20220502223759212](img/lab05/image-20220502223759212.png) |
| 1    | 10          | 1    | 1    | 0      | F = A + B    | ![image-20220502223541763](img/lab05/image-20220502223541763.png) |
| 1    | 11          | 1    | 1    | 1      | F = ~A + B   | ![image-20220502223305281](img/lab05/image-20220502223305281.png) |
