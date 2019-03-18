class BanReservedValidator < ActiveModel::EachValidator
    WORDS = %w{
        index home new create edit update destroy session signin signout login logout
        signup email mail password registration unlock confirmation omniauth article
        comment favorite like page relationship user flash following follower helper
        html http http rspec gem gemfile json query delete remove nil config mysql 
    }

    def validate_each(record, attribute, value)
        if (WORDS + WORDS.map { |w| w.pluralize }).include?(value)
            record.errors[attribute] << 'に許可されていない文字列が含まれています。'
        end
    end
end