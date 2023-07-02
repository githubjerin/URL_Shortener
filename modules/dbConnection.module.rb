require "mysql2"

class Connection
    def initialize
        @client = Mysql2::Client.new(
            :host => ENV['HOST'], 
            :username => ENV['DB_USERNAME'], 
            :password => ENV['DB_PASSWORD']
        )
    end

    def executeQuery(query = nil)
        if query
            return @client.query(query)
        else
            return false
        end
    end
end