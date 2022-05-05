from __future__ import (absolute_import, division, print_function)

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command

class show_in_finder(Command):
    """
    :show_in_finder

    Present selected files in finder
    """

    def execute(self):
        self.fm.run('open .', flags='f')
