#!/usr/bin/perl -w

open PERLFILE, "<speed.pl" or die;

seq 1 100 | do PERLFILE;
