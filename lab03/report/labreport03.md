# Lab Report 03 -- Verilog practice

## Lab Practice Results

### v74x139 implementation

#### Structural Implementation of Half 74x139

##### Code

```verilog
module v74x139h_structural(
    input G_L,
    input A,
    input B,
    output [3:0] Y_L
    );

    wire N_A, N_B, N_G;

    not T1(N_G, G);
    not T2(N_A, A);
    not T3(N_B, B);

    nand T4(Y[0], N_G, N_A, N_B);
    nand T5(Y[1], N_G, A, N_B);
    nand T6(Y[2], N_G, N_A, B);
    nand T7(Y[3], N_G, A, B);

endmodule
```

##### Simulation

![image-20220412131636098](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412131636098.png)

#### Data flow implementation of Half 74x139

##### Code

```verilog
module v74x139h_dataflow(
    input G_L,
    input A,
    input B,
    output [3:0] Y_L
    );

     wire [1:0] sel;
     wire [3:0] out;

     assign sel = {B, A};
     assign Y_L = ~out;

     assign out = (sel == 2'b00 && G_L == 1'b0) ? 4'b0001 :
                      (sel == 2'b01 && G_L == 1'b0) ? 4'b0010 :
                      (sel == 2'b10 && G_L == 1'b0) ? 4'b0100 :
                      (sel == 2'b11 && G_L == 1'b0) ? 4'b1000 :
                      4'b0000;

endmodule
```

##### Simulation

![image-20220412125225222](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412125225222.png)

#### Behavioral Implementation of Half 74x139

##### Code

```verilog
module v74x139h_behavior(
    input G_L,
    input A,
    input B,
    output [3:0] Y_L
    );

    wire [1:0] sel;
    reg [3:0] out;

    assign sel = {B, A};
    assign Y_L = ~out;

     always@(G_L or sel)
        begin
            if (G_L == 1'b0)
                begin
                    case(sel)
                        2'b00 : out = 4'b0001;
                        2'b01 : out = 4'b0010;
                        2'b10 : out = 4'b0100;
                        2'b11 : out = 4'b1000;
                    endcase
                end
            else
                begin
                    out = 4'b0000;
                end
        end

endmodule
```

##### Simulation

![image-20220412130501526](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412130501526.png)

#### Unifying module

##### Code

```verilog
module v74x139(
    input G1,
    input G2,
    input B1,
    input B2,
    input A1,
    input A2,
    output [3:0] Y1,
    output [3:0] Y2
    );

    v74x139h_dataflow T1(.G_L(G1), .A(A1), .B(B1), .Y_L(Y1));
    v74x139h_behavior T2(.G_L(G2), .A(A2), .B(B2), .Y_L(Y2));

endmodule
```

##### Simulation

```verilog
module test_full;

    // Inputs
    reg G1;
    reg G2;
    reg B1;
    reg B2;
    reg A1;
    reg A2;

    // Outputs
    wire [3:0] Y1;
    wire [3:0] Y2;

    integer i;

    // Instantiate the Unit Under Test (UUT)
    v74x139 uut (
        .G1(G1),
        .G2(G2),
        .B1(B1),
        .B2(B2),
        .A1(A1),
        .A2(A2),
        .Y1(Y1),
        .Y2(Y2)
    );

    initial begin
        for (i = 0; i < 64; i = i + 1) begin
            G1 = (i >> 5) & 1;
            G2 = (i >> 4) & 1;
            B1 = (i >> 3) & 1;
            B2 = (i >> 2) & 1;
            A1 = (i >> 1) & 1;
            A2 = i & 1;
            #10;
        end
    end

endmodule

```

![image-20220412131516415](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412131516415.png)

### Implementation of 3-to-8 decoder using 2-to-4 decoder

#### Code

##### 2-to-4 decoder

```verilog
module decoder_2_to_4(
    input G,
    input S0,
    input S1,
    output [3:0] O
    );

    wire [1:0] sel;
    reg [3:0] out;

    assign sel = {S1, S0};
    assign O = out;

    always@(G or sel)
    begin
        if (G == 1'b1) begin
            case(sel)
                2'b00: out = 4'b0001;
                2'b01: out = 4'b0010;
                2'b10: out = 4'b0100;
                2'b11: out = 4'b1000;
            endcase
        end
        else begin
            out = 4'b0000;
        end

    end

endmodule
```

##### 3-to-8 decoder

```verilog
module decoder_3_to_8(
    input G,
    input [2:0] SEL,
    output [7:0] OUT
    );

	decoder_2_to_4 D1(.G(G & ~SEL[2]), .S0(SEL[0]), .S1(SEL[1]), .O(OUT[3:0]));
	decoder_2_to_4 D2(.G(G & SEL[2]), .S0(SEL[0]), .S1(SEL[1]), .O(OUT[7:4]));

endmodule
```

#### Simulation

![image-20220412152255087](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412152255087.png)

## Homework (4-to-1 MUX)

Simulation code for all the methods:

```verilog
module test_mux;

	// Inputs
	reg [3:0] I;
	reg A;
	reg B;

	// Outputs
	wire Y;

	integer i;

	// Instantiate the Unit Under Test (UUT)
	mux_4_to_1_behavior uut (
		.I(I),
		.A(A),
		.B(B),
		.Y(Y)
	);

	initial begin
		for (i = 0; i < 64; i = i + 1) begin
			I[0] = i & 1;
			I[1] = (i >> 1) & 1;
			I[2] = (i >> 2) & 1;
			I[3] = (i >> 3) & 1;
			B = (i >> 4) & 1;
			A = (i >> 5) & 1;
			#10;
      end

	end

endmodule
```

### Structural Method

#### Code

```verilog
module mux_4_to_1_structure(
    input [3:0] I,
    input A,
    input B,
    input Y
    );

	wire [3:0] G;
	wire [1:0] T;

	not(T[0], A);
	not(T[1], B);

	nand(G[0], I[0], T[0], T[1]);
	nand(G[1], I[1], T[0], B);
	nand(G[2], I[2], A, T[1]);
	nand(G[3], I[3], A, B);

	nand(Y, G[0], G[1], G[2], G[3]);

endmodule
```

#### Simulation

![image-20220412162209440](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412162209440.png)

![image-20220412162239503](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412162239503.png)

![image-20220412162251429](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412162251429.png)

![image-20220412162303646](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412162303646.png)

![image-20220412162313485](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412162313485.png)

### Dataflow Method

#### Code

```verilog
module mux_4_to_1_dataflow(
    input [3:0] I,
    input A,
    input B,
    output Y
    );

	wire [1:0] sel;
	reg out;

	assign sel = {B, A};
	assign Y =(sel == 2'b00 && I) ? I[0] :
				 (sel == 2'b01 && I) ? I[1] :
				 (sel == 2'b10 && I) ? I[2] :
				 (sel == 2'b11 && I) ? I[3] :
				 0;


endmodule
```

#### Simulation

![image-20220412160236226](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412160236226.png)

![image-20220412161246988](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412161246988.png)

![image-20220412161328155](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412161328155.png)

![image-20220412161342601](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412161342601.png)

![image-20220412161356457](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412161356457.png)

### Behavioral Method

#### Code

```verilog
module mux_4_to_1_behavior(
	 input [3:0] I,
	 input A,
	 input B,
	 output Y
	);

	 wire [1:0] sel;
	 reg out;
	 assign sel = {A, B};
	 assign Y = out;

	always @(I or sel) begin
		case (sel)
			2'b00: out = I[0];
			2'b01: out = I[1];
			2'b10: out = I[2];
			2'b11: out = I[3];
		endcase
	end

endmodule
```



#### Simulation

![image-20220412160359010](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412160359010.png)

![image-20220412161449603](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412161449603.png)

![image-20220412161505484](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412161505484.png)

![image-20220412161517978](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412161517978.png)

![image-20220412161532438](C:\Users\Match\AppData\Roaming\Typora\typora-user-images\image-20220412161532438.png)

## Discussion

### Pros and Cons of Each Designing Methods

#### Structural Method

##### Pros

* Structural method can directly describe the the detailed hardware layout
* Straightforward to understand the hardware structure
* Easiest for the compiler to generate design and apply optimizations

##### Cons

* Not very human-readable
* Cannot easily tell the functionality of the module from the code
* Tedious to write when the logic becomes complicated

#### Dataflow Method

##### Pros

* Instantiation of the truth table, very straightforward
* No need to do schematic design directly

##### Cons

* Tedious to implement when truth table is large or have memory elements
* Cannot easily tell the functionality of the module from the code

#### Behavioral Method

##### Pros

* Human readable
* Can easily tell the functionality of the module from the code
* Able to describe complicated logic

##### Cons

* Serial description is "counterintuitive" for FPGA compiler, difficult for compiler to apply optimizations
* Use registers more aggressively, potentially causes latency

### Why is `Verilog` designed in such a way?

Vector in `Verilog` has its highest index at its beginning instead of in the end like other languages.

```verilog
reg [3:0] vec;
```

This feature corresponds to the fact that a binary number also has its highest bits at the "beginning". Thus we can simply do such assignment without worrying about bit order:

```verilog
vec = 4'b1011
```
