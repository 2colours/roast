use v6;

use Test;

plan 20;

# L<S04/"Statement-ending blocks"/"will terminate a statement">

# the 'empty statement' case responsible for the creation of this test file
eval_lives_ok(';', 'empty statement');

eval_lives_ok('my $x = 2', 'simple statement no semi');
eval_lives_ok('my $x =
9', 'simple statement on two lines no semi');
eval_lives_ok('my $x = 2;', 'simple statement with semi');
eval_lives_ok('{my $x = 2}', 'end of closure terminator');
eval_lives_ok('{my $x =
2;}', 'double terminator');
eval_lives_ok(';my $x = 2;{my $x = 2;;};', 'extra terminators');

eval-dies-ok('{my $x = 2;', 'open closure');
eval-dies-ok('my $x = ', 'incomplete expression');

{
    my $x = do {
        10
    } + 1;

    is($x, 11, "'} + 1' is in a single statement");

    my $y = do {
        10
    }
    + 1;

    is($y, 10, "}\\n + 1 are two statements");

    my $z = [];
    EVAL q'
        $z = do { 1 }
                + 2;
    ';

    is($z, 1, 'auto-curly applies inside array composer');
}

eval-dies-ok "42 if 23\nis 50; 1",
    "if postfix modifier and is() is parsed correctly";

# not sure this belong here, suggestions for better places are welcome
eval-dies-ok '(1) { $foo = 2 }', 'parens do not eat spaces after them';

# RT #79964
eval_lives_ok q:b"my &f;\nsub g() { }\n&f;", 'implicit terminator before & sigil';

# not sure this belong here, suggestions for better places are welcome
# RT #115842
{
    eval_lives_ok 'my @ := 0,', 'trailing comma allowed (1)';
    eval_lives_ok 'my @ := 0, ;', 'trailing comma allowed (2)';
    eval_lives_ok 'my @array = 1, 2, 3, ;', 'trailing comma allowed (3)';
    eval_lives_ok '1, 2, 3,', 'trailing comma allowed (4)';
    eval_lives_ok '0,', 'trailing comma allowed (5)';
}

# vim: ft=perl6
