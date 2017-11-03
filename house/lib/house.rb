class House
  DATA =
    [ "the horse and the hound and the horn that belonged to",
      "the farmer sowing his corn that kept",
      "the rooster that crowed in the morn that woke",
      "the priest all shaven and shorn that married",
      "the man all tattered and torn that kissed",
      "the maiden all forlorn that milked",
      "the cow with the crumpled horn that tossed",
      "the dog that worried",
      "the cat that killed",
      "the rat that ate",
      "the malt that lay in",
      "the house that Jack built"]

  attr_reader :data
  def initialize(orderer: OriginalOrderer.new)
    @data = orderer.order(DATA)
  end

  def recite
    1.upto(12).collect {|i| line(i)}.join("\n")
  end

  def phrase(num=1)
    data.last(num).join(" ")
  end

  def line(num)
    "#{prefix} #{phrase(num)}.\n"
  end

  def prefix
    "This is"
  end
end

class RandomOrderer
  def order(data)
    data.shuffle
  end
end

class OriginalOrderer
  def order(data)
    data
  end
end

puts House.new(orderer: RandomOrderer.new).line(12)