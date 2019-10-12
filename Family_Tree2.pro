parent("Andrey Suvorov","Sergey Suvorov","Valentina Tishenko").
parent("","Andrey Suvorov","").
parent("Alexey Suvorov","Sergey Suvorov","Valentina Tishenko").
parent("Yanina Kotilevskaya","Vladimir Kotelev","Nina Kotilevskaya").
parent("Sofya Suvorova","Alexey Suvorov","Yanina Kotilevskaya").
parent("Ksenia Suvorova","Alexey Suvorov","Yanina Kotilevskaya").
parent("Alexandr Suvorov","Alexey Suvorov","Yanina Kotilevskaya").
parent("","Alexandr Suvorov","").
parent("","","Sofya Suvorova").
parent("","","Ksenia Suvorova").

shyrin(X):-
	parent(_,_,X)->
		(parent(X,Y,Z),
		parent(X1,Y,Z),
		parent(_,X1,_)->
			write(X1)
		;false)
	;false.


relative(X,Y,Z):-
	(equal(X,"brother")->
		(parent(Y,A,B),
		parent(X1,A,B),
		parent(_,X1,_)->
			Z=X1
		;false)
	;equal(X,"sister")->	
		(parent(Y,A,B),
		parent(X1,A,B),
		parent(_,_,X1)->
			Z=X1
		;false)
	;equal(X,"mother")->	
		(parent(Y,A,B)->
			Z=B
		;false)
	;equal(X,"father")->	
		(parent(Y,A,B)->
			Z=A
		;false)
	;equal(X,"grandmother")->	
		(parent(Y,A,B),
		parent(A,Y1,Z1),parent(B,Y2,Z2)->
			(Z=Z1;Z=Z2)
		;false)
	;equal(X,"grandfather")->	
		(parent(Y,A,B),
		parent(A,Y1,Z1),parent(B,Y2,Z2)->
			(Z=Y1;Z=Y2)
		;false)
	;equal(X,"uncle")->	
		(parent(Y,A,B),
		parent(A,Y1,Z1),
		parent(B,Y2,Z2),
		parent(X1,Y1,Z1),
		parent(X2,Y2,Z2),
		parent(_,X1,_),parent(_,X2,_)->
			(Z=X1;Z=X2)
		;false)
	);
	(relative("brother",Y,Z)->
		X="brother"
	;relative("sister",Y,Z)->
		X="sister"
	;relative("mother",Y,Z)->
		X="mother"
	;relative("father",Y,Z)->
		X="father"
	;relative("grandmother",Y,Z)->
		X="grandmother"
	;relative("grandfather",Y,Z)->
		X="grandfather"
	;relative("uncle",Y,Z)->
		X="uncle")
.


?-relative("sister","Sofya Suvorova",Z),write(Z),nl.



