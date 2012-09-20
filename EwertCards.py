from __future__ import division
from math import log
output= open('cards.tex', 'w')

CARDS = [
    ("Royal Flush", 4),
    ("Straight Flush", 36),
    ("Four of a Kind", 13*1*12*4),
    ("Full House", 13*4*12*6),
    ("Flush", 5108),
    ("Straight", 10200),
    ("Three of Kind", 54912),
    ("Two pair", 123552),
    ("One pair", 1098240),
    ("None", 1302540),
]
TOTAL = 2598960

for name, count in CARDS:
    spec = min( log(len(CARDS),2) + log(count,2), log(TOTAL, 2) )
    parts = [
        name,
        count,
        '%.3f' % log(TOTAL,2),
        '%.3f' % spec,
        '%.3f' % (log(TOTAL,2) - spec),
    ]
    print >> output, "&".join(map(str,parts)), "\\\\"

output.close()

output = open('cards2.tex', 'w')
for index in xrange(1, 10):
    c = log(TOTAL**index,2)
    s = index *  log(4,2) + log(len(CARDS),2)
    parts = [
            index,
            '%.3f' % c,
            '%.3f' % s,
            '%.3f' % (c -s)
        ]
    print >> output, "&".join(map(str,parts)), "\\\\"
