class WordgameController < ApplicationController
def index
#Will try to implement this using hidden field instead of sessions
unless session[:wordjumble]
	q=Wordjumble.find(:all)
	l=rand(q.length)
	if q[l]
		session[:wordjumble]=jumbles(q[l].word)
	end #End if 
end #End unless
@wordjumble = session[:wordjumble]

vocab = Vocab.find(:all)
vl=rand(vocab.length)
if vocab[vl]
	@vocab=vocab[vl]
end #End of if for Vocabulary game

end
def vocab
vocab = Vocab.find(:all)
vl=rand(vocab.length)
if vocab[vl]
	@vocab=vocab[vl]
end #End of if for Vocabulary game
#puts params
case request.method
when :post
puts "Inside post........"
puts params
puts "Inside post.........."
w=Vocab.find_by_word(params[:ques])
puts w.word
if w.ans.to_i == params[:ans].to_i
flash[:notice_layout] = "Congrats!! Your guess was correct"
else
str="opt"+w.ans.to_s
correct=w.eval(str)
flash[:error_layout] = "Sorry!! That was an incorrect guess. #{w.word} means "
end
redirect_to :controller=>'wordgame', :action=>'index'
end #End of case
end

def wordjumble
case request.method
when :post
if session[:wordjumble].word.upcase == params[:wordgame][:jumble_ans].upcase
flash[:notice_layout] = "Congrats!! Your guess was correct"
redirect_to :controller=>'wordgame', :action=>'new_game'
else 
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
