require 'liquid'

# Capitalize all words of the input according to title rules
module Jekyll
  module CapitalizeTitle
    private

    ARTICLES = [ "the", "a", "an" ]
    COORD_CONJ = [ "and", "but", "for" ]
    PREPOSITIONS = [
        "aboard",
        "about",
        "above",
        "across",
        "after",
        "against",
        "along",
        "amid",
        "among",
        "around",
        "at",
        "before",
        "behind",
        "below",
        "beneath",
        "beside",
        "beyond",
        "by",
        "down",
        "during",
        "for",
        "from",
        "in",
        "inside",
        "into",
        "near",
        "of",
        "off",
        "on",
        "out",
        "outside",
        "over",
        "past",
        "through",
        "throughout",
        "to",
        "toward",
        "under"
    ]
    ALWAYS_CAP = [
        "bar",
        "mid",
        "nor",
        "off",
        "out",
        "per",
        "pro",
        "qua",
        "re",
        "so",
        "til",
        "up",
        "yet",
    ]

    def capitalize_title_rules(word)
        # AP style: words (including preps) with 4+ chars are capitalized
        if word.length >= 4
            return word.capitalize
        end

        low_word = word.downcase

        # NYT and Chicago always capitalize some words, even when used as a preposition
        if ALWAYS_CAP.include? low_word
            return word.capitalize
        end

        # lowercase articles, coordinating conjunctions, prepositions
        if (ARTICLES.include? low_word) || (COORD_CONJ.include? low_word) || (PREPOSITIONS.include? low_word)
            return low_word
        end

        # capitialize everything remaining
        return word.capitalize
    end

    public

    def capitalize_title(words)
        if words.nil? || words.empty?
          return words
        end
        #result = words.split(' ').map(&:capitalize_title_rules)
        result = words.split(' ').map { |aword| capitalize_title_rules(aword) }

        # capital first and last words as per Chicago, AP, NYT
        result[0] = result[0].capitalize
        result[-1] = result[-1].capitalize

        return result.join(' ')
      end
  end
end

Liquid::Template.register_filter(Jekyll::CapitalizeTitle)