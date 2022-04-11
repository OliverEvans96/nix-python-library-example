from distutils.core import setup

setup(
    name='flower-power',
    version='0.1',
    license='None (All rights reserved)',
    description="Example python library packaged with nix",
    packages={'flower_power'},
    install_requires=[
        'requests'
    ]
)
