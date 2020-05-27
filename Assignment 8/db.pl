flight(toronto, air_canada, london, 500, 360).
flight(toronto, united, london, 650, 420).
flight(toronto, air_canada, madrid, 900, 480).
flight(toronto, united, madrid, 950, 540).
flight(toronto, iberia, madrid, 800, 480).
flight(madrid, air_canada, barcelona, 100, 60).
flight(madrid, iberia, barcelona, 120, 65).
flight(madrid, iberia, valencia, 40, 50).
flight(madrid, iberia, malaga, 50, 60).
flight(malaga, iberia, valencia, 80, 120).
flight(barcelona, iberia, valencia, 110, 75).
flight(barcelona, iberia, london, 220, 240).
flight(paris, united, toulouse, 35, 120).

% print all possible flights in both directions 

printFlights(City1, City2) :-
	(flight(City1, Plane, City2, Price, Duration);
	flight(City1, Plane, City2, Price, Duration)),
	printFlight(City1, Plane, City2, Price, Duration),
	printFlight(City2, Plane, City1, Price, Duration).

% (a) Is there a flight from Toronto to Madrid?
path(X,Y) :- 
flight(X, _, Y, _, _)
-> nl, write('Yes, there is a flight from Toronto to Madrid');
   nl, write('No, there is no flight from Toronto to Madrid').

airport(toronto, 50, 60).
airport(london, 75, 80).
airport(madrid, 75, 45).
airport(valencia, 40, 20).
airport(barcelona, 40, 30).
airport(malaga, 50, 30).
airport(paris, 50, 60).
airport(toulouse, 40, 30).

% (b) A flight from city A to city B with airline C is cheap if its price is less than $400.
cheapflight(A, C, B) :-
(flight(A, C, B, X, _) ,
(X < 400) -> nl, write('It is cheap.');
nl, write('No, it is not cheap.')).

% (c) Is it possible to go from Toronto to Paris in two flights? 
torontoparistwoflight(_) :-
(flight(toronto, _, X, _, _), 
flight(X, _, paris, _, _)
-> nl, write('Yes, it is possible to go in two flights.');
   nl, write('No, it is not possible to go in two flights.')).

% (d) A flight from city A to city B with airline C is preferred if it’s cheap (see (b)) or it’s with Air Canada. 
pathprefer(A, C, B) :-
cheapflight(A, C, B) -> nl, write('Airline preferred is '), write(C) ;
nl, write('Air Canada is preferred').

% (e) If there is a flight from city A to city B with United, then there is a flight from city A to city B with Air Canada. 
check(A, B) :-
flight(A, united, B, _, _) -> ( flight(A, air_canada, B, _, _) 
-> nl, write('Yes, there is a flight from '), write(A), write(' to '), write(B), write(' with Air Canada.');
   nl, write('No, there is no flight from '), write(A), write(' to '), write(B), write(' with Air Canada.')).

printFlight(City1, Plane, City2, Price, Duration):-
	write('\n\nFlight Name:\n'),
   	write(Plane),
	write('\nDeparture From:\n'),
   	write(City1),
   	write('\nArrival To:\n'),
   	write(City2),
   	write('\nPrice:\n'),
   	write(Price),
   	write('\nDuration:\n'),
   	write(Duration).