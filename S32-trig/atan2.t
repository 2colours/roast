# WARNING:
# This is a generated file and should not be edited directly.
# look into generate-tests.pl instead

use v6;
use Test;
BEGIN { @*INC.push("t/spec/packages/") };
use TrigTestSupport;


# atan2 tests

# First, test atan2 with x = 1

for TrigTest::sines() -> $angle
{
    next if abs(cos($angle.num(Radians))) < 1e-6;     
	my $desired-result = sin($angle.num(Radians)) / cos($angle.num(Radians));

    # Num.atan2 tests
    is_approx($desired-result.Num.atan2.tan, $desired-result, 
              "Num.atan2() - {$angle.num(Radians)}");
    is_approx($desired-result.Num.atan2(1.Num).tan, $desired-result, 
              "Num.atan2(1.Num) - {$angle.num(Radians)}");
}

# check that the proper quadrant is returned

is_approx(atan2(4, 4), pi / 4, "atan2(4, 4) is pi / 4");
is_approx(atan2(-4, 4), -pi / 4, "atan2(-4, 4) is -pi / 4");
is_approx(atan2(4, -4), 3 * pi / 4, "atan2(4, -4) is 3pi / 4");
is_approx(atan2(-4, -4), -3 * pi / 4, "atan2(-4, -4) is -3pi / 4");

# Num tests
is_approx(atan2((-100).Num), -1.56079666010823, "atan2(Num)");
is_approx(atan2(:y((100).Num)), 1.56079666010823, "atan2(:y(Num))");

# Num vs Num tests
is_approx((100).Num.atan2((-10).Num), 1.67046497928606, "Num.atan2(Num)");
is_approx(atan2((0.1).Num, (100).Num), 0.000999999666666867, "atan2(Num, Num)");
is_approx(atan2(:y((1).Num), :x((-1).Num)), 2.35619449019234, "atan2(:y(Num), :x(Num))");

# Num vs Rat tests
is_approx((-100).Num.atan2((-10).Rat(1e-9)), -1.67046497928606, "Num.atan2(Rat)");
is_approx(atan2((-0.1).Num, (-100).Rat(1e-9)), -3.14059265392313, "atan2(Num, Rat)");
is_approx(atan2(:y((-100).Num), :x((1).Rat(1e-9))), -1.56079666010823, "atan2(:y(Num), :x(Rat))");

# Num vs Int tests
is_approx((-100).Num.atan2((100).Int), -0.785398163397448, "Num.atan2(Int)");
is_approx(atan2((-1).Num, (10).Int), -0.099668652491162, "atan2(Num, Int)");
is_approx(atan2(:y((0.1).Num), :x((-1).Int)), 3.04192400109863, "atan2(:y(Num), :x(Int))");

# Num vs Str tests
is_approx((1).Num.atan2((0.1).Str), 1.47112767430373, "Num.atan2(Str)");
is_approx(atan2((-10).Num, (1).Str), -1.47112767430373, "atan2(Num, Str)");
is_approx(atan2(:y((0.1).Num), :x((-100).Str)), 3.14059265392313, "atan2(:y(Num), :x(Str))");

# Num vs DifferentReal tests
is_approx((-1).Num.atan2(DifferentReal.new(-0.1)), -1.67046497928606, "Num.atan2(DifferentReal)");
is_approx(atan2((-100).Num, DifferentReal.new(1)), -1.56079666010823, "atan2(Num, DifferentReal)");
is_approx(atan2(:y((1).Num), :x(DifferentReal.new(-0.1))), 1.67046497928606, "atan2(:y(Num), :x(DifferentReal))");

# Rat tests
is_approx((-10).Rat(1e-9).atan2, -1.47112767430373, "Rat.atan2");
is_approx(atan2((-1).Rat(1e-9)), -0.785398163397448, "atan2(Rat)");
is_approx(atan2(:y((-0.1).Rat(1e-9))), -0.099668652491162, "atan2(:y(Rat))");

# Rat vs Num tests
is_approx((10).Rat(1e-9).atan2((1).Num), 1.47112767430373, "Rat.atan2(Num)");
is_approx(atan2((-10).Rat(1e-9), (-10).Num), -2.35619449019234, "atan2(Rat, Num)");
is_approx(atan2(:y((-1).Rat(1e-9)), :x((1).Num)), -0.785398163397448, "atan2(:y(Rat), :x(Num))");

# Rat vs Rat tests
is_approx((100).Rat(1e-9).atan2((-1).Rat(1e-9)), 1.58079599348156, "Rat.atan2(Rat)");
is_approx(atan2((-10).Rat(1e-9), (100).Rat(1e-9)), -0.099668652491162, "atan2(Rat, Rat)");
is_approx(atan2(:y((1).Rat(1e-9)), :x((-1).Rat(1e-9))), 2.35619449019234, "atan2(:y(Rat), :x(Rat))");

# Rat vs Int tests
is_approx((-100).Rat(1e-9).atan2((-100).Int), -2.35619449019234, "Rat.atan2(Int)");
is_approx(atan2((-1).Rat(1e-9), (10).Int), -0.099668652491162, "atan2(Rat, Int)");
is_approx(atan2(:y((-10).Rat(1e-9)), :x((-10).Int)), -2.35619449019234, "atan2(:y(Rat), :x(Int))");

# Rat vs Str tests
is_approx((-0.1).Rat(1e-9).atan2((-10).Str), -3.13159298690313, "Rat.atan2(Str)");
is_approx(atan2((10).Rat(1e-9), (-0.1).Str), 1.58079599348156, "atan2(Rat, Str)");
is_approx(atan2(:y((-10).Rat(1e-9)), :x((1).Str)), -1.47112767430373, "atan2(:y(Rat), :x(Str))");

# Rat vs DifferentReal tests
is_approx((-10).Rat(1e-9).atan2(DifferentReal.new(10)), -0.785398163397448, "Rat.atan2(DifferentReal)");
is_approx(atan2((100).Rat(1e-9), DifferentReal.new(10)), 1.47112767430373, "atan2(Rat, DifferentReal)");
is_approx(atan2(:y((-1).Rat(1e-9)), :x(DifferentReal.new(1))), -0.785398163397448, "atan2(:y(Rat), :x(DifferentReal))");

# Int tests
is_approx((-1).Int.atan2, -0.785398163397448, "Int.atan2");
is_approx(atan2((-100).Int), -1.56079666010823, "atan2(Int)");
is_approx(atan2(:y((100).Int)), 1.56079666010823, "atan2(:y(Int))");

# Int vs Num tests
is_approx((1).Int.atan2((0.1).Num), 1.47112767430373, "Int.atan2(Num)");
is_approx(atan2((100).Int, (-100).Num), 2.35619449019234, "atan2(Int, Num)");
is_approx(atan2(:y((-100).Int), :x((1).Num)), -1.56079666010823, "atan2(:y(Int), :x(Num))");

# Int vs Rat tests
is_approx((-1).Int.atan2((1).Rat(1e-9)), -0.785398163397448, "Int.atan2(Rat)");
is_approx(atan2((-10).Int, (-1).Rat(1e-9)), -1.67046497928606, "atan2(Int, Rat)");
is_approx(atan2(:y((100).Int), :x((0.1).Rat(1e-9))), 1.56979632712823, "atan2(:y(Int), :x(Rat))");

# Int vs Int tests
is_approx((1).Int.atan2((10).Int), 0.099668652491162, "Int.atan2(Int)");
is_approx(atan2((100).Int, (1).Int), 1.56079666010823, "atan2(Int, Int)");
is_approx(atan2(:y((10).Int), :x((100).Int)), 0.099668652491162, "atan2(:y(Int), :x(Int))");

# Int vs Str tests
is_approx((1).Int.atan2((-10).Str), 3.04192400109863, "Int.atan2(Str)");
is_approx(atan2((1).Int, (-10).Str), 3.04192400109863, "atan2(Int, Str)");
is_approx(atan2(:y((-10).Int), :x((1).Str)), -1.47112767430373, "atan2(:y(Int), :x(Str))");

# Int vs DifferentReal tests
is_approx((100).Int.atan2(DifferentReal.new(1)), 1.56079666010823, "Int.atan2(DifferentReal)");
is_approx(atan2((100).Int, DifferentReal.new(100)), 0.785398163397448, "atan2(Int, DifferentReal)");
is_approx(atan2(:y((100).Int), :x(DifferentReal.new(-10))), 1.67046497928606, "atan2(:y(Int), :x(DifferentReal))");

# Str tests
is_approx((0.1).Str.atan2, 0.099668652491162, "Str.atan2");
is_approx(atan2((1).Str), 0.785398163397448, "atan2(Str)");
is_approx(atan2(:y((-10).Str)), -1.47112767430373, "atan2(:y(Str))");

# Str vs Num tests
is_approx((-10).Str.atan2((-0.1).Num), -1.58079599348156, "Str.atan2(Num)");
is_approx(atan2((1).Str, (-1).Num), 2.35619449019234, "atan2(Str, Num)");
is_approx(atan2(:y((1).Str), :x((-0.1).Num)), 1.67046497928606, "atan2(:y(Str), :x(Num))");

# Str vs Rat tests
is_approx((-100).Str.atan2((10).Rat(1e-9)), -1.47112767430373, "Str.atan2(Rat)");
is_approx(atan2((100).Str, (-1).Rat(1e-9)), 1.58079599348156, "atan2(Str, Rat)");
is_approx(atan2(:y((0.1).Str), :x((-0.1).Rat(1e-9))), 2.35619449019234, "atan2(:y(Str), :x(Rat))");

# Str vs Int tests
is_approx((-100).Str.atan2((-1).Int), -1.58079599348156, "Str.atan2(Int)");
is_approx(atan2((-1).Str, (100).Int), -0.00999966668666524, "atan2(Str, Int)");
is_approx(atan2(:y((10).Str), :x((1).Int)), 1.47112767430373, "atan2(:y(Str), :x(Int))");

# Str vs Str tests
is_approx((-10).Str.atan2((-0.1).Str), -1.58079599348156, "Str.atan2(Str)");
is_approx(atan2((-1).Str, (-10).Str), -3.04192400109863, "atan2(Str, Str)");
is_approx(atan2(:y((100).Str), :x((-0.1).Str)), 1.57179632646156, "atan2(:y(Str), :x(Str))");

# Str vs DifferentReal tests
is_approx((-10).Str.atan2(DifferentReal.new(0.1)), -1.56079666010823, "Str.atan2(DifferentReal)");
is_approx(atan2((1).Str, DifferentReal.new(-10)), 3.04192400109863, "atan2(Str, DifferentReal)");
is_approx(atan2(:y((10).Str), :x(DifferentReal.new(-100))), 3.04192400109863, "atan2(:y(Str), :x(DifferentReal))");

# DifferentReal tests
is_approx(DifferentReal.new(-100).atan2, -1.56079666010823, "DifferentReal.atan2");
is_approx(atan2(DifferentReal.new(0.1)), 0.099668652491162, "atan2(DifferentReal)");
is_approx(atan2(:y(DifferentReal.new(-10))), -1.47112767430373, "atan2(:y(DifferentReal))");

# DifferentReal vs Num tests
is_approx(DifferentReal.new(-1).atan2((1).Num), -0.785398163397448, "DifferentReal.atan2(Num)");
is_approx(atan2(DifferentReal.new(0.1), (-1).Num), 3.04192400109863, "atan2(DifferentReal, Num)");
is_approx(atan2(:y(DifferentReal.new(-1)), :x((-0.1).Num)), -1.67046497928606, "atan2(:y(DifferentReal), :x(Num))");

# DifferentReal vs Rat tests
is_approx(DifferentReal.new(100).atan2((10).Rat(1e-9)), 1.47112767430373, "DifferentReal.atan2(Rat)");
is_approx(atan2(DifferentReal.new(-0.1), (10).Rat(1e-9)), -0.00999966668666524, "atan2(DifferentReal, Rat)");
is_approx(atan2(:y(DifferentReal.new(-10)), :x((-10).Rat(1e-9))), -2.35619449019234, "atan2(:y(DifferentReal), :x(Rat))");

# DifferentReal vs Int tests
is_approx(DifferentReal.new(100).atan2((10).Int), 1.47112767430373, "DifferentReal.atan2(Int)");
is_approx(atan2(DifferentReal.new(-1), (-1).Int), -2.35619449019234, "atan2(DifferentReal, Int)");
is_approx(atan2(:y(DifferentReal.new(-0.1)), :x((100).Int)), -0.000999999666666867, "atan2(:y(DifferentReal), :x(Int))");

# DifferentReal vs Str tests
is_approx(DifferentReal.new(1).atan2((-100).Str), 3.13159298690313, "DifferentReal.atan2(Str)");
is_approx(atan2(DifferentReal.new(-0.1), (-10).Str), -3.13159298690313, "atan2(DifferentReal, Str)");
is_approx(atan2(:y(DifferentReal.new(-1)), :x((10).Str)), -0.099668652491162, "atan2(:y(DifferentReal), :x(Str))");

# DifferentReal vs DifferentReal tests
is_approx(DifferentReal.new(0.1).atan2(DifferentReal.new(100)), 0.000999999666666867, "DifferentReal.atan2(DifferentReal)");
is_approx(atan2(DifferentReal.new(100), DifferentReal.new(-1)), 1.58079599348156, "atan2(DifferentReal, DifferentReal)");
is_approx(atan2(:y(DifferentReal.new(1)), :x(DifferentReal.new(100))), 0.00999966668666524, "atan2(:y(DifferentReal), :x(DifferentReal))");

done;

# vim: ft=perl6 nomodifiable
