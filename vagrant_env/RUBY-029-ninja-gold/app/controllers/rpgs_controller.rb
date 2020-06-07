class RpgsController < ApplicationController
    def index
        session['message'] = []
        unless session.include?("gold")
            session['all_messages'] = ""
            session['gold'] = 0
        else
            session['gold']+=session['gold_found'].to_i
        end
    end


    def process_gold
        case params['source']
        when 'house'
            session['gold_found'] = rand(2..5)
        when 'farm'
            session['gold_found'] = rand(10..20)
        when 'cave'
            session['gold_found'] = rand(5..10)
        when 'casino'
            session['gold_found'] = rand(-50..50)
        end

        session['message'].push("#{session['gold_found'].abs} gold was #{(session['gold_found'] > 0)? 'found':'lost'} at the #{params['source']}\n")
        session['message'].reverse_each{
            |msg|
            session['all_messages']+=msg
            puts session['all_messages']
        }

        redirect_to ("/")
    end

    def reset
        reset_session
        redirect_to "/"
    end
end
