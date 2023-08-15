###python mcdonald_kreitman.py Dn_file Ds_file Pn_file Ps_file
## Ns=Dn
##Ss = Ds
##Nv = Pn
##Sv = Ps

import sys

def read_input_file(filename):
    with open(filename, 'r') as f:
        values = []
        for line in f:
            values.append(float(line.strip()))
        return values

def calculate_alpha(Dn, Ds, Pn, Ps):
    if Ss * Nv == 0:
        return 0
    else:
        return (Dn/Pn) / (Ds/Ps)

if len(sys.argv) != 5:
    print("Usage: python mcdonald_kreitman.py Dn_file Ds_file Pn_file Ps_file")
    sys.exit(1)

Dn_file = sys.argv[1]
Ds_file = sys.argv[2]
Pn_file = sys.argv[3]
Ps_file = sys.argv[4]

Dn = read_input_file(Ns_file)
Ds = read_input_file(Ds_file)
Pn = read_input_file(Pn_file)
Ps = read_input_file(Ps_file)

alpha = calculate_alpha(Dn[0], Ds[0], Pn[0], Ps[0])

print(alpha)
