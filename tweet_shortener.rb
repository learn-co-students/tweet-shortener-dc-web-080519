require "pry"

def dictionary
  {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet)
  # return array
  shortened = []

  # split tweet and look at each word
  tweet.split.each do |word|
    # if it's in the dictionary, push short version to return array
    # make sure to downcase so ALL word instances accounted for
    if dictionary.keys.include?(word.downcase)
      shortened << dictionary[word.downcase]
    # otherwise, push word to array unchanged
    else
      shortened << word
    end
  end
  # return array as string
  shortened.join(' ')
end

def bulk_tweet_shortener(tweet_array)
  # put each member of array after shortening
  tweet_array.each do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
  # check length and run substituter if too long
  if tweet.length > 140
    word_substituter(tweet)
  # otherwise just return original tweet
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  # shorten tweet
  new = selective_tweet_shortener(tweet)

  # if still too long, truncate to 137 characters + ellipse
  if new.length > 140
    new = new[0..136] + "..."
  end

  # return
  new
end
