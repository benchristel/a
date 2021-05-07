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
  Literal.new("á"),
  Literal.new("éi"),
  Literal.new("oa"),
  Literal.new("o"),
  Literal.new("u"),
  Literal.new("eá"),
  Literal.new("eó"),
  Literal.new("e"),
  Literal.new("i"),
  Literal.new("ióa"),
  Literal.new("iú"),
)

Initial = Alternatives.new(
  Literal.new("b"),
  Literal.new("br"),
  Literal.new("c"),
  Literal.new("cr"),
  Literal.new("chr"),
  Literal.new("d"),
  Literal.new("dr"),
  Literal.new("dh"),
  Literal.new("f"),
  Literal.new("fr"),
  Literal.new("g"),
  Literal.new("gr"),
  Literal.new("l"),
  Literal.new("m"),
  Literal.new("mr"),
  Literal.new("mh"),
  Literal.new("mhr"),
  Literal.new("n"),
  Literal.new("r"),
  Literal.new("s"),
  Literal.new("sc"),
  Literal.new("sl"),
  Literal.new("sm"),
  Literal.new("sn"),
  Literal.new("st"),
  Literal.new("t"),
  Literal.new("tr"),
)

Final = Alternatives.new(
  Literal.new("b"),
  Literal.new("c"),
  Literal.new("d"),
  Literal.new("dh"),
  Literal.new("f"),
  Literal.new("g"),
  Literal.new("gh"),
  Literal.new("l"),
  Literal.new("m"),
  Literal.new("n"),
  Literal.new("r"),
  Literal.new("s"),
  Literal.new("t"),
)

Syl = Pattern.new(Initial, V, Final)

Word = Alternatives.new(
  Syl,
  Pattern.new(Syl, Syl),
)

def root
  Word.generate.gsub(/[aeiou]([aeiou])/) { |match| match[1] }
end

def word
end

20.times { puts Word.generate }
