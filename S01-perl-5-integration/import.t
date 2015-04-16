use v6;

use Test;
plan 1;

=begin pod

P5 module import test

=end pod

unless (try { EVAL("1", :lang<perl5>) }) {
    skip_rest;
    exit;
}

eval_lives_ok(q[
use Text::Wrap:from<Perl5> 'wrap';
is(wrap('foo', 'bar', 'baz'), 'foobaz', "import p5 module");
],"parse :from<perl5> syntax");

# vim: ft=perl6
