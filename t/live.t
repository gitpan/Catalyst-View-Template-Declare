#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 4;
use FindBin qw($Bin);
use lib "$Bin/lib";
use Catalyst::Test qw(TestApp);

is(get('/action_name'), "\n<p>This is the action_name template.</p>", 
     'action name works');
is(get('/test_stash'), "\n<p>Hello, World</p>", 
     'getting data from stash works');
is(get('/test_sub'), "\n<p>This is a subtemplate.</p>",
     'templates in other files work');
is(get('/test_includeother'), 
   "\n<p>This comes before the other template.</p>".
   "\n<p>This is a subtemplate.</p>",
   'a subtemplate that includes another subtemplate');
