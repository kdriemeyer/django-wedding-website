from django.core.management import BaseCommand
from guests import csv_import


class Command(BaseCommand):

    def add_arguments(self, parser):
        parser.add_argument(
            '-f', '--filename',
            dest='filename',
            default='guests/tests/data/Guests.csv',
            help='Path to the CSV guest list'
        )

    def handle(self, *args, **kwargs):
        try:
            with open(kwargs['filename']):
                pass
        except:
            print('Failed to open {}'.format(kwargs['filename']))
        else:
            csv_import.import_guests(kwargs['filename'])
