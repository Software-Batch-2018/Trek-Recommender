start :- choice, read_input.

choice :- write('Do you want to go trekking to mountains or lakes or for sightseeing? ').

read_input :- read(Option), process_input(Option).

process_input(Option) :- (Option == mountains), startm.

process_input(Option) :- (Option == lakes), startl.

process_input(Option) :- (Option == sightseeing), starts.

% startm chooses mountains
startm :- write('Do you agree to go above 3500m altitude? '), read(Altitude), write('Are you a beginner trekker?'), read(Beginner),
	   write('Are you okay with very challenging routes?'), read(Challenging),
       write('Is the length of your trek longer than 7 days?'), read(Length),
       choose_mountains(Altitude, Challenging, Length , Beginner, Mountains),
       write(Mountains), nl.
	   
% startl chooses lakes
startl :- write('Do you agree to go above 4000m altitude? '), read(Altitude),
	   write('Are you okay with very challenging routes?'), read(Challenging),
       choose_lakes(Altitude, Challenging, Lakes),
       write(Lakes), nl.

% starts chooses sightseeing
starts :- write('Do you agree to go above 3000m altitude? '), read(Altitude),
       write('Is the length of your trek longer than 4 days?'), read(Length),
       choose_sights(Altitude, Length , SightSeeing),
       write(SightSeeing), nl.

% Mountains

choose_mountains(Altitude, Challenging, Length, Beginner, 'Manaslu Circuit, Kanchanjunga Circuit, Gokyo Valley, Makalu Base Camp, NarPhu Valley') :-  
	yes(Altitude), yes(Challenging), yes(Length), no(Beginner).

choose_mountains(Altitude, Challenging, Length, Beginner, 'Langtang Valley, Annapurna Base Camp') :-  
	yes(Altitude), yes(Challenging), no(Length), no(Beginner).

choose_mountains(Altitude, Challenging, Length, Beginner, 'Everest Base Camp, Annapurna Circuit, Upper Mustang, Upper Dolpo') :-  
	yes(Altitude), no(Challenging), yes(Length), no(Beginner).

choose_mountains(Altitude, Challenging, Length, Beginner, 'Cant find such Treks :(') :-  
	yes(Altitude), no(Challenging), no(Length), no(Beginner).

choose_mountains(Altitude, _, _, _, 'Please Choose Sight seeing areas for lower altitude treks around mountains') :-  
	no(Altitude).

choose_mountains(Altitude, Challenging, Length, Beginner, 'Mardi Base Camp, Helambu , Poonhill') :-  
	yes(Altitude), no(Challenging), no(Length), yes(Beginner).

choose_mountains(_, _, _, _, 'Please be used to trekking and test yourself in easier routes as it will be hard for you.').

% Lakes

choose_lakes(Altitude, Challenging, 'Kajin Sara Lake, Tilicho Lake, Gokyo Lake, Gosaikunda' ) :- 
	yes(Altitude), yes(Challenging).

choose_lakes(Altitude, Challenging, 'Panch Pokhari in sindhupalchowk' ) :- 
	yes(Altitude), no(Challenging).

choose_lakes(Altitude, Challenging, 'Shey Phoksundo , Birendra Lake, Gangapurna Lake , Kalmachum Lake' ) :- 
	no(Altitude), yes(Challenging).

choose_lakes(_, _, 'Lakes around Lekhnath , Ghodaghodi Lake, Mai Pokhari').

% SightSeeing

choose_sights(Altitude, Length, 'Ghorepani Poonhill, Khopra Danda' ) :- 
	yes(Altitude), yes(Length).

choose_sights(Altitude, Length, 'Pikey Peak, Mohare Danda' ) :- 
	yes(Altitude), no(Length).

choose_sights(Altitude, Length, 'Tamang Heritage Trail, Royal Trek Annapurna region ' ) :- 
	no(Altitude), yes(Length).

choose_sights(_, _, 'Ghandruk , Dhampus , Panchase, Balthali Village').

yes(Challenging) :- Challenging = yes.
yes(Beginner) :- Beginner = yes.
yes(Length) :- Length = yes.
yes(Altitude) :- Altitude = yes.

no(Challenging) :- Challenging = no.
no(Beginner) :- Beginner = no.
no(Length) :- Length = no.
no(Altitude) :- Altitude = no.
