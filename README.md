# Deviant

Deviant is gem that allows you to quickly and efficiently compute statistical
functions from streaming data without storing the entire set in memory, making
it ideal for long running jobs dealing with millions of values. Deviant objects
can be combined without loss of data so jobs can be parallelized as well.

## Installation

Add this line to your application's Gemfile:

    gem 'deviant'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deviant

## Usage

Create a new object:

    d = Deviant.new

Shift on some values:

    d << [1,2,3,4]
    d << 1.234

Mean:

    d.mean

Standard deviation:

    d.stddev

Variance:

    d.variance

Population standard deviaion:

    d.pstddev

Population variance:

    d.pvariance

Probability density function:

    d.pdf(2)

Cumulative distribution function:

    d.cdf(2)

Adding values instantiates a new object:

    e = d + 1

Adding another Deviant object combines the results:

    f = d + e

## Contributing

1. Fork it ( http://github.com/modosc/deviant/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
