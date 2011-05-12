import django

import config

if not open('prepared.txt').read().strip() == 'cool':
    raise Exception('Everything is bad and corrupt and total server fault')

if not config.halo:
    raise Exception('Config no halo!!!')

print 'Django version:', django.get_version()
