# -*- coding: utf-8 -*-
require "deviant/version"

 class Deviant
  attr_accessor :n, :mean, :m2, :sum

  def initialize
    @n = 0.0
    @mean = 0.0
    @sum = 0.0
    @m2 = 0.0
  end

  def stddev
    Math.sqrt(variance)
  end

  def pstddev
    Math.sqrt(pvariance)
  end

  def variance
    if n.to_i > 1
      m2 / (n - 1)
    else
      0
    end.to_f
  end

 def pvariance
    if n.to_i > 0
      m2 / n
    else
      0
    end.to_f
  end

  def pdf(x)
    Math.exp(-(((x - mean)**2) / (2 * variance))) / (stddev * Math.sqrt(Math::PI * 2))
  end

  def cdf(x)
    (1 + Math.erf( (x - mean) / Math.sqrt(2 * variance))) / 2
  end

  def sigma(n)
    x = mean - n * stddev
    y = mean + n * stddev
    [ [x, y].min, [x,y].max ]
  end

  def + (arg)
    case arg
    when self.class
      merge arg
    else
      copy = Marshal.load(Marshal.dump(self))
      copy << arg
    end
  end

  def << (arg)
    case arg
    when self.class
      merge arg
    when Float
      update arg
    when Fixnum
      update arg.to_f
    when String
      unless arg.to_i == '0' && arg != '0'
        update arg.to_f
      else
        # todo, throw error here?
        nil
      end
    when Array
      arg.each do |i|
        self << i
      end
    end
    self
  end

  private

  def merge(b)
    a = self
    delta = b.mean - a.mean
    x = self.class.new
    x.n = a.n + b.n
    x.mean = a.mean + delta * b.n/x.n
    x.m2 = a.m2 + b.m2 + (delta ** 2) * a.n * b.n / x.n
    x.sum = x.n * x.mean
    x
  end

  def update(x)
    self.sum += x
    self.n = n + 1
    delta = x - mean
    self.mean = mean + delta/n
    self.m2 = m2 + delta * (x - mean)
  end

end
