# logic-design-lab

## Resources

1. [Verilog Tutorial](https://www.chipverify.com/verilog/verilog-tutorial)
2. [Icarus Verilog](http://iverilog.icarus.com/) and its [test suite](https://github.com/steveicarus/ivtest)

## Xilinx ISE Files Explanation

### File with Known Functions

* `.xise`
  * Xilinx ISE configuration file. As is stated in every generated `.xise` file's comments:
    >  ISE source project file created by Project Navigator.
    >
    > This file contains project source information including a list of
    > project source files, project and process properties.  **This file**,
    > **along with the project source files, is sufficient to open and**
    > **implement in ISE Project Navigator**.

* `.v`
  * `Verilog` source files (Importance see above quote)
* `.sch`
  * Schema source file
* `.ucf`
  * As is described in the generated comments: "**PlanAhead Generated physical constraints**"
  * Should be preserved if you do not want to do pin assignment on the same FPGA board every time
* `.wfcg`
  * Simulated waveform file
  * Never saved it; but probably okay to save if reproducing waveform is necessary

### File with Unknown Function

And also not ignored by the `.gitignore` I compiled from the internet (thanks [github/gitignore](https://github.com/github/gitignore/blob/main/Global/XilinxISE.gitignore))

* `.jhd`
* `.cpj`
