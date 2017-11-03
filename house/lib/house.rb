class House
    def recite
      1.upto(12).collect {|i| line(i)}.join("\n")
    end

    def phrase(num=1)
      ["the malt that lay in ", ""].last(num).join("")

      if num == 1
        ""
      else
        "the malt that lay in "
      end
    end

    def line(num)
      case num
      when 1..2
        "This is #{phrase(num)}the house that Jack built.\n"
      when 3
        "This is the rat that ate the malt that lay in the house that Jack built.\n"
      when 4
        "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      when 5
        "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      when 6
        "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      when 7
        "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      when 8
        "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      when 9
        "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      when 10
        "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      when 11
        "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      when 12
        "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      end
    end
  end