module WordgameHelper

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

end
