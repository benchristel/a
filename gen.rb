#!/usr/bin/env ruby

class Literal
  def initialize(letter)
    @letter = letter
  end

  def generate
    @letter.to_s
  end
end

class Pattern
  def initialize(*subpatterns)
    @subpatterns = subpatterns
  end

  def generate
    @subpatterns.map(&:generate).join("")
  end
end

class Alternatives
  def initialize(*list)
    @list = list
  end

  def generate
    @list.sample.generate
  end
end

V = Alternatives.new(
  Literal.new("a"),
  Literal.new("e"),
  Literal.new("i"),
  Literal.new("o"),
)

LongVowel = Alternatives.new(
  Literal.new("a"),
  Literal.new("ay"),
  Literal.new("e"),
  Literal.new("ey"),
  Literal.new("i"),
  Literal.new("iy"),
  Literal.new("o"),
  Literal.new("oy"),
)

Initial = Alternatives.new(
  Literal.new("b"),
  Literal.new("br"),
  Literal.new("c"),
  Literal.new("d"),
  Literal.new("dr"),
  Literal.new("dw"),
  Literal.new("dy"),
  Literal.new("f"),
  Literal.new("fl"),
  Literal.new("fr"),
  Literal.new("g"),
  Literal.new("l"),
  Literal.new("m"),
  Literal.new("mr"),
  Literal.new("n"),
  Literal.new("nw"),
  Literal.new("r"),
  Literal.new("s"),
  Literal.new("t"),
  Literal.new("tr"),
  Literal.new("tw"),
  Literal.new("ty"),
  Literal.new("v"),
  Literal.new("vr"),
)

Medial = Alternatives.new(
  Literal.new("dy"),
  Literal.new("l"),
  Literal.new("ly"),
  Literal.new("m"),
  Literal.new("mb"),
  Literal.new("mbr"),
  Literal.new("my"),
  Literal.new("n"),
  Literal.new("nd"),
  Literal.new("ndr"),
  Literal.new("ndy"),
  Literal.new("nt"),
  Literal.new("ntr"),
  Literal.new("nty"),
  Literal.new("ny"),
  Literal.new("r"),
  Literal.new("ry"),
  Literal.new("s"),
  Literal.new("ty"),
)

Final = Alternatives.new(
  Literal.new("l"),
  Literal.new("n"),
  Literal.new("r"),
  Literal.new(""),
)

Root = Pattern.new(Initial, V, Final)
LongRoot = Pattern.new(Initial, LongVowel, Final)

Suffix = Alternatives.new(
  Literal.new("en"),
  Literal.new("ay"),
  Literal.new("ayen"),
  Literal.new("ve"),
  Literal.new("ven"),
  Literal.new("aya"),
)

Word = Alternatives.new(
  Pattern.new(Root, LongRoot),
  Pattern.new(LongRoot),
  Pattern.new(LongRoot, Suffix),
  Pattern.new(Root, LongRoot, Suffix),
)

def root
  Word.generate.gsub(/[aeiou]([aeiou])/) { |match| match[1] }
end

def word
end

20.times { puts Word.generate }
