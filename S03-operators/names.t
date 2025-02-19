use v6;
use Test;
plan 7;

is &infix:<+>(3, 8), 11, 'Can refer to &infix:<+>';
is  infix:<+>(3, 8), 11, 'Can refer to  infix:<+>';

is &infix:<->(3, 8), -5, 'Can refer to &infix:<->';
is  infix:<->(3, 8), -5, 'Can refer to  infix:<->';

is &infix:<cmp>(3, 4), Order::Less, 'Can refer to &infix:<cmp>';

#?rakudo.jvm todo 'Something wrong with stringification of &infix:<+> et al. -- only Sub+{is-pure} is reported'
ok ~&infix:<+> ~~ /infix/, 'String value of &infix:<+> contains "infix"';
ok ~&infix:<+> ~~ /\+/, 'String value of &infix:<+> contains "+"';

# vim: expandtab shiftwidth=4
