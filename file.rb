def add(a,b)
	if a.class == String
		puts a + b.to_s
	elsif b.class == String
		puts a.to_s + b
	else
		puts a + b 
	end
	
end

add 1, 3