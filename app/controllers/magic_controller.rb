class MagicController < ApplicationController
    def check
        cookies.signed[:secret_num] = rand(8)#magic result
        @secret_num = cookies.signed[:secret_num].to_i

        if (@secret_num == 0)
            @result = "No way"
        elsif (@secret_num == 1)
            @result = "Maybe"
        elsif (@secret_num == 2)
            @result = "Don't count on it"
        elsif (@secret_num == 3)
            @result = "My sources say no"
        elsif (@secret_num == 4)
            @result = "Outlook not so good"
        elsif (@secret_num == 5)
            @result = "Very doubtful"
        elsif (@secret_num >= 6 && @secret_num <= 8)
            @result = "I'll tell you tomorrow"
        end
    end
end
