
with open('test_full.v', 'r') as f:
    lines = f.readlines()

should_gen_output = False
with open('test_full_copy.v', 'w') as f:
    for line in lines:
        if should_gen_output:
            for i in range(0, 64):
                f.write(f'\tG1 = { (i >> 5) & 0b1 };\n')
                f.write(f'\tG2 = { (i >> 4) & 0b1 };\n')
                f.write(f'\tB1 = { (i >> 3) & 0b1 };\n')
                f.write(f'\tB2 = { (i >> 2) & 0b1 };\n')
                f.write(f'\tA1 = { (i >> 1) & 0b1 };\n')
                f.write(f'\tA2 = { i & 0b1 };\n')
                if i != 63:
                    f.write('\t#100;\n')
            should_gen_output = False
        elif not 'initial begin' in line:
            f.write(line)
        else:
            should_gen_output = True
