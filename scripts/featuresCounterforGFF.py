#!/usr/bin/env python

import pandas as pd
import argparse

parser = argparse.ArgumentParser(prog='featuresCounterForGFF.py', description='count features in gff files', add_help=True)
parser.add_argument('-feature', dest='feature', metavar='<feature>', help='type (rRNA, tRNA)', required=True)
parser.add_argument('-file', dest='file', metavar='<gff file>', help='.gff', required=True)
parser.add_argument('-v', '--version', action='version', version='%(prog)s v0.1')

### parser
'''
args = parser.parse_args()
feature = args.feature
file = args.file
'''

def count_features(feature, file):
    gff = pd.read_csv(file, sep="\t")
    gff.columns = ["Chromossome", "source", "type", "start", "end", "length", "strand", "idk", "evalue"]
    df = gff.groupby(feature)['start'].nunique().sort_values(ascending=False).reset_index(name='total')
    return df

feature = "type"
file = "/home/felipe/Documents/Vellozia/Vintermedia/infernal/removedRibosomalVintermedia.cmscan.tblout.gff"

pd.set_option('display.max_rows', None)
pd.set_option('display.max_columns', None)
pd.set_option('display.width', None)
pd.set_option('display.max_colwidth', -1)

print(count_features(feature, file))
