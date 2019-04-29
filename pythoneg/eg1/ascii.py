#!/bin/env python
# coding=gbk

special = {
    '\n': r'\n (换行符)',
    '\r': r'\r (回车符)',
    '\t': r'\t (制表符)',
    '\b': r'\b (退格符)',
    ' ': r'space(空格)',
    '\0': r'\0 (终止符)',
}

# line_format = '%-24s%-24s%-24s%s\n'
line_format = '%-24s%-24s%-24s%s'


def char2str(c):
    n = ord(c)
    if c in special:
        return special[c]
    if n <= 136 and n >= 33:
        return c
    return '\\x%x' % n


def cstyle(c):
    if (c == '\0'):
        return '\'\\0\''
    ret = repr(c)
    return ret.replace('\\x0', '\\x')


# f = open('ascii-table2.txt', 'w+')
# f.write(line_format % ('hex', 'dec', 'character', 'cstyle'))
print
line_format % ('hex', 'dec', 'character', 'cstyle')
for i in range(0, 128):
    line = line_format % ('0x%02x' % i, str(i), char2str(chr(i)), cstyle(chr(i)))
    # f.write(line)
    print(line)
