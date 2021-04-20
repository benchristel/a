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
  Literal.new("a"),
  Literal.new("e"),
  Literal.new("i"),
  Literal.new("o"),
  Literal.new("ay"),
  Literal.new("ey"),
  Literal.new("oy"),
)

Initial = Alternatives.new(
  Literal.new("t"),
  Literal.new("d"),
  Literal.new("th"),
  Literal.new("s"),
  Literal.new("r"),
  Literal.new("l"),
  Literal.new("m"),
  Literal.new("n"),
  Literal.new("c"),
  Literal.new("g"),
  Literal.new("b"),
  Literal.new("p"),
  Literal.new("f"),
  Literal.new("fl"),
  Literal.new("ml"),
  Literal.new("pl"),
  Literal.new("bl"),
  Literal.new("dr"),
  Literal.new("tr"),
  Literal.new("nr"),
  Literal.new("thr"),
  Literal.new("h"),
  Literal.new("w"),
  Literal.new("ty"),
  Literal.new("y"),
)

Medial = Alternatives.new(
  Literal.new("t"),
  Literal.new("d"),
  Literal.new("th"),
  Literal.new("s"),
  Literal.new("r"),
  Literal.new("l"),
  Literal.new("m"),
  Literal.new("n"),
  Literal.new("nt"),
  Literal.new("nth"),
  Literal.new("nd"),
  Literal.new("ndr"),
  Literal.new("mbr"),
  Literal.new("mb"),
  Literal.new("ny"),
  Literal.new("nty"),
)

Final = Alternatives.new(
  Literal.new("n"),
  Literal.new("m"),
  Literal.new("r"),
  Literal.new("l"),
  Literal.new(""),
  Literal.new(""),
)

Root = Alternatives.new(
  Pattern.new(Initial, V, Medial, V, Final),
)

def word
  Root.generate
end

20.times { puts word }
