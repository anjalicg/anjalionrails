class WordgameController < ApplicationController
def index
unless session[:wordjumble]
	q=Wordjumble.find(:all)
	l=rand(q.length)
	if q[l]
		session[:wordjumble]=q[l].word
	end #End if 
end #End unless
@wordjumble = jumbles(session[:wordjumble])

vocab = Vocab.find(:all)
vl=rand(vocab.length)
if vocab[vl]
	@vocab=vocab[vl]
end #End of if for Vocabulary game

end

def hangman
@cat_list = Hangman.find(:all, :select=>"category").map {|cat| cat.category}.uniq
case request.method
when :post
	puts "Post of hangman"
	@category=params[:category]
	@all_blanks=false
puts "............... Hangman submission #{params} ..........."
when :get
case params[:category]
when "Countries" 
	q=Hangman.find(:all, :conditions=>{:category=>"Countries"})
	@category = "Countries"
	puts "Country session word #{session[:hangman]}"
when "Agatha Christie Novels"
	q=Hangman.find(:all, :conditions=>{:category=>"Agatha Christie Novels"})
	@category = "Agatha Christie Novels"
	puts "Agatha Christie Novels session word #{session[:hangman]}"
when default
puts "Something else"
end #End of category

l=rand(q.length)
if q[l]
	session[:hangman]=q[l].word
	@all_blanks=true
end #End if 
end #End of request.method
end

def vocab
vocab = Vocab.find(:all)
vl=rand(vocab.length)
if vocab[vl]
	@vocab=vocab[vl]
end #End of if 
case request.method
when :post
w=Vocab.find_by_word(params[:ques])
if w.ans == params[:ans]
flash[:notice_vocab] = "Congrats!! <strong> #{w.word} = #{w.ans} </strong>"
w.attempt +=1
w.correct +=1
w.save
else
flash[:error_vocab] = "<strong> #{w.word} = #{w.ans} </strong>"
w.attempt +=1
w.save
end
redirect_to :controller=>'wordgame', :action=>'index'
end #End of case
end

def wordjumble
case request.method
when :post
#puts "Inside word jumble post"
if session[:wordjumble].upcase == params[:wordgame][:jumble_ans].upcase
#puts "session word is equal"
#puts session[:wordjumble] , params[:wordgame][:jumble_ans]
flash[:notice_layout] = "Congrats!! Your guess was correct"
redirect_to :controller=>'wordgame', :action=>'new_game'
else 
#puts "session word is NOT equal"
#puts session[:wordjumble] , params[:wordgame][:jumble_ans]
flash[:error_layout] = "Sorry!! That was an incorrect guess. Please try again."
redirect_to :controller=>'wordgame', :action=>'index'
end #If end
end #End Case
end #End of function wordjumble

def new_game
reset_session
redirect_to :controller=>'wordgame', :action=>'index'
end

private
def jumbles(words)
	a_word=words.split(//)
	len=a_word.length
	ans=""
	while len > 0
		l=rand(len)
		ans+=a_word[l]
		a= a_word.delete_at(l)
		len=a_word.length
	end #End of while
	return ans
end #End of jumble

end #End of class
