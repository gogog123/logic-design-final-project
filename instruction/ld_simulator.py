import sys


def print_registers(reg):
    print('registers: ', end='')
    for i, r in enumerate(reg):
        print('{} '.format(r), end='')
    print('')


f = open(sys.argv[1], 'r')
instructions = f.readlines()
f.close()

register = [0] * 4
memory = []

for i in range(16):
    memory.append(i)

for i in range(0, -16, -1):
    memory.append(i)


for instr in instructions:
    opcode = instr[0:2]
    r1 = int(instr[2:4])
    r2 = int(instr[4:6])
    r3 = int(instr[6:8])

    if r1 == 11:
        r1 = 3
    elif r1 == 10:
        r1 = 2

    if r2 == 11:
        r2 = 3
    elif r2 == 10:
        r2 = 2

    if r3 == 10:
        r3 = -2
    elif r3 == 11:
        r3 = -1

    if opcode == '00':
        register[r3] = register[r1] + register[r2]
        print('reg write data: {}'.format(register[r1] + register[r2]))
        print_registers(register)
    elif opcode == '01':
        register[r2] = memory[register[r1] + r3]
        print('reg write data: {}'.format(memory[register[r1] + r3]))
        print_registers(register)
    elif opcode == '10':
        memory[register[r1] + r3] = register[r2]
        print('memory loaded: value {} to memory {}'.format(register[r2], r1 + r3))
    print()


