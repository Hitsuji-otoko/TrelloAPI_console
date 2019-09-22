require 'trello'
require 'pry'
require 'dotenv/load'


def puts_todos
    configure
    cards = get_cards

    puts '---------------------------'
    puts '【TODO】' 
    puts '|カード名 :' + "#{@list_name}" + '|'
    cards.each do |card|
        puts card.name
    end
    puts '---------------------------'
end

def configure
    Trello.configure do |config|
        config.developer_public_key = ENV['DEVELOPER_PUBLIC_KEY']
        config.member_token = ENV['MEMBER_TOKEN']
    end
end

def get_cards
    member = Trello::Member.find(ENV['USER_ID'])
    boards = member.boards
    board = boards.find { |board| board.name == 'TODO'}
    list = board.lists[0]
    @list_name = list.name
    cards = list.cards
end

puts_todos
