# Write your code here.
require 'pry'

def dictionary
    dictionary =
        {"hello" => "hi",
        "to" => "2",
        "two" => "2",
        "too" => "2",
        "for" => "4",
        "four" => "4",
        "be" => "b",
        "you" => "u",
        "at" => "@",
        "and" => "&"}
end

def word_substituter(tweet)
    tweet_array = tweet.split
    updatedtweet = tweet_array.map do |word|
        #binding.pry
        if dictionary.keys.include?(word.downcase)
            word.gsub(word, dictionary[word.downcase])
        else
            word
        end
    end.join(" ")
end

def bulk_tweet_shortener(tweetarray)
    tweetarray.each do |tweet|
        #binding.pry
        puts word_substituter(tweet)
    end
end

def selective_tweet_shortener(tweet)
        if tweet.length > 140
            word_substituter(tweet)
        else
            tweet
        end
end

def shortened_tweet_truncator(tweet)
    new_tweet = word_substituter(tweet)
    if new_tweet.length > 140
        new_tweet[0..136] + "..."
    else
        new_tweet
    end
end

