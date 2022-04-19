# Logic Design Lab Report 04

## Lab Part

### Structural

#### Code

```verilog
module bcd_to_7_struct(
    input [3:0] NUM,
    output [6:0] SEG
    );

	wire A, B, C, D;
	wire N_A, N_B, N_C, N_D;

	assign D = NUM[0];
	assign C = NUM[1];
	assign B = NUM[2];
	assign A = NUM[3];

	not(N_D, NUM[0]);
	not(N_C, NUM[1]);
	not(N_B, NUM[2]);
	not(N_A, NUM[3]);

	wire [15:0] M;

	assign M[0] = N_A;
	nand (M[1], B, D);
	assign M[2] = N_C;
	nand (M[3], N_B, N_D);
	nand (M[4], N_C, N_D);
	nand (M[5], C, D);
	assign M[6] = B;
	assign M[7] = N_B;
	assign M[8] = C;
	assign M[9] = N_D;
	nand (M[10], B, N_C, D);
	nand (M[11], N_B, C);
	nand (M[12], B, N_C);
	nand (M[13], C, N_D);

	// C0
	nand (SEG[6], M[0], M[1], M[2], M[3]);

	// C1
	nand (SEG[5], M[4], M[5], M[6]);

	// C2
	nand (SEG[4], M[7], M[8], M[9]);

	// C3
	nand (SEG[3], M[0], M[3], M[13], M[10], M[11]);

	// C4
	nand (SEG[2], M[3], M[13]);

	// C5
	nand (SEG[1], M[0], M[7], M[4]);

	// C6
	nand (SEG[0], M[0], M[13], M[11], M[12]);

endmodule

```

#### Simulation

![structural](C:\Users\Match\Documents\matchyThings\_ise_projects\report\img\lab04\bcd_structural.png)

### Dataflow

#### Code

```verilog
module bcd_to_7_dataflow(
    input [3:0] NUM,
    output [6:0] SEG
    );

    assign SEG = (NUM == 4'b0000) ? 7'b1111110 :
				 (NUM == 4'b0001) ? 7'b0110000 :
				 (NUM == 4'b0010) ? 7'b1101101 :
				 (NUM == 4'b0011) ? 7'b1111001 :
				 (NUM == 4'b0100) ? 7'b0110011 :
				 (NUM == 4'b0101) ? 7'b1011011 :
				 (NUM == 4'b0110) ? 7'b1011111 :
				 (NUM == 4'b0111) ? 7'b1110010 :
				 (NUM == 4'b1000) ? 7'b1111111 :
				 (NUM == 4'b1001) ? 7'b1111011 :
				 7'b0000000;

endmodule

```

#### Simulation

![dataflow](C:\Users\Match\Documents\matchyThings\_ise_projects\report\img\lab04\bcd_dataflow.png)

### Behavior

#### Code

```verilog
module bcd_to_7_behavior(
    input [3:0] NUM,
    output [6:0] SEG
    );
	 
	wire [3:0] in;
	assign in = NUM;

	reg [6:0] out;
	assign SEG = out;

	always @(in) begin
		case (in)
			4'b0000: out = 7'b1111110;
			4'b0001: out = 7'b0110000;
			4'b0010: out = 7'b1101101;
			4'b0011: out = 7'b1111001;
			4'b0100: out = 7'b0110011;
			4'b0101: out = 7'b1011011;
			4'b0110: out = 7'b1011111;
			4'b0111: out = 7'b1110010;
			4'b1000: out = 7'b1111111;
			4'b1001: out = 7'b1111011;
			default:
				out = 7'b0000000;
		endcase
	end


endmodule
```

#### Simulation

![behavior](C:\Users\Match\Documents\matchyThings\_ise_projects\report\img\lab04\bcd_behavior.png)

## Homework Part

<img src="C:\Users\Match\Documents\matchyThings\_ise_projects\report\img\lab04\klingon_number.png" alt="image-20220419160519667" style="zoom:50%;" />

### Truth Table

| IN3  | IN2  | IN1  | IN0  | a    | b    | c    | d    | e    | f    | g    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0    | 0    | 0    | 0    | 1    | 1    | 1    | 1    | 1    | 1    | 0    |
| 0    | 0    | 0    | 1    | 1    | 0    | 0    | 0    | 0    | 0    | 0    |
| 0    | 0    | 1    | 0    | 1    | 0    | 0    | 0    | 0    | 0    | 1    |
| 0    | 0    | 1    | 1    | 1    | 0    | 0    | 1    | 0    | 0    | 1    |
| 0    | 1    | 0    | 0    | 0    | 1    | 0    | 0    | 0    | 1    | 1    |
| 0    | 1    | 0    | 1    | 0    | 0    | 1    | 1    | 1    | 0    | 1    |
| 0    | 1    | 1    | 0    | 0    | 1    | 0    | 0    | 1    | 0    | 1    |
| 0    | 1    | 1    | 1    | 0    | 0    | 1    | 0    | 0    | 1    | 1    |
| 1    | 0    | 0    | 0    | 0    | 1    | 1    | 0    | 1    | 1    | 0    |
| 1    | 0    | 0    | 1    | 0    | 1    | 1    | 0    | 1    | 1    | 1    |
| 1    | 0    | 1    | -    | -    | -    | -    | -    | -    | -    | -    |
| 1    | 1    | -    | -    | -    | -    | -    | -    | -    | -    | -    |

### Karnaugh Map

![kmap_a-d](C:\Users\Match\Documents\matchyThings\_ise_projects\report\img\lab04\kmap_a-d.png)

![kmap_e-g](C:\Users\Match\Documents\matchyThings\_ise_projects\report\img\lab04\kmap_e-g.jpg)

Simplified sum of minterms:

* a = IN2'IN3'
* b = IN3 + IN2IN0' + IN1'IN0'
* c = IN3 + IN2'IN1'IN0' + IN2IN0
* d = IN3'IN2'IN1'IN0' + IN2IN1'IN0 + IN2'IN1IN0
* e = IN2'IN1'IN0' + IN3 + IN2IN1'IN0 + IN2IN1'IN0 
* f = IN3 + IN1'IN0' + IN2IN1IN0
* g = IN2  + IN1 + IN3IN0'

### Verilog code

#### Structural

```verilog
```



#### Dataflow

```verilog
```



#### Behavior

```verilog
```



### Simulation result

#### Code

```verilog
```



#### Screenshot`
