%% Assignment 2: Delhi Metro
%% Please fill the following details
%% Full Name: Sparsh Jain
%% Roll No: 111601026

%% Given below is the metro lines of New Delhi. Write a function
%% that given any two metro station prints out the route to take
%%
%% A route you can represent as a list [[x1,l1,x2],[x2,l2,x3]...]
%% where the entry [x,l,y] should be read as "from x take line l to
%% reach y and ...

%%
%% Remark: You code *should work* work even if the lines are changed.
%% In particular you should not assume anything about the names of the
%% station, or their ordering or the topology of the network. In other
%% words think of this red, blue and green line as a sample input to your
%% program.
%%
%% Hint you will need to work with junctions when there is not direct
%% connections between two points.
%%
%% For checking whether X is a junction you can use the setof/3
%% predicated, together with the length function.
%%
%% http://www.swi-prolog.org/pldoc/man?predicate=setof/3


line(red,
	[ rithala,
          rohini-east,
          rohini-west,
          pitam-pura,
          kohat-enclave,
          netaji-subash-place,
          keshav-puram,
          kanhaiya-nagar,
          indralok,
          shastri-nagar,
          pratap-nagar,
          pul-bangesh,
          tiz-hazari,
          kashmiri-gate,
          shastri-park,
          seelam-pur,
          welcome,
          shahdara,
          mansarovar-park,
          jhilmil,
          dilshad-garden
        ]
    ).
line(yellow,[ vishwa-vidayala
            , vidhan-sabha
            , civil-lines
            , kashmiri-gate
            , chandini-chowk
            , chawari-bazar
            , new-delhi
            , rajiv-chowk
            , patel-chowk
            , central-secretariat
            ]
    ).

line(blue,[ indraprastha
          , pragati-maidan
          , mandi-house
          , barakhamba-road
          , rajiv-chowk
          , ramakrishna-ashram-marg
          , jhandewala
          , karol-bagh
          , rajendra-place
          , patel-nagar
          , shadipur
          , kirti-nagar
          , moti-nagar
          , ramesh-nagar
          , rajouri-garden
          , tagore-garden
          , subhash-nagar
          , tilak-nagar
          , janakpuri-east
          , janakpuri-west
          , uttam-nagar-east
          , uttam-nagar-west
          , nawada
          , dwarka-mor
          , dwarka
          , sector-14-dwarka
          , sector-13-dwarka
          , sector-12-dwarka
          , sector-11-dwarka
          , sector-10-dwarka
          , sector-9-dwarka
          ]).

% % additional line added for testing
% line(gold, [indraprastha, vaishali]).

% functions head and last to return the head or the last element of a list
head(X, [X|_]).
last(X, [X]).
last(X, [_|V]) :- last(X, V).

% function member to check membership in a list
member(X, [X|_]).
member(X, [_|Z]) :- member(X, Z).

% functions before and after to check whether X occurs before or after Y in a list
before(X, Y, [X|Z]) :- member(Y, Z).
before(X, Y, [_|V]) :- before(X, Y, V).
after(X, Y, Z) :- before(Y, X, Z).

% function towards to give the extreme element of the list in the direction of Y from X
towards(X, Y, R, T) :- after(X, Y, R), head(T, R).
towards(X, Y, R, T) :- before(X, Y, R), last(T, R).

% function junction to give a list of junctions between two distinct color lines C1 and C2
junction(C1, C2, Js) :- setof(J, L2^C2^(line(C1, L1), line(C2, L2), C1\=C2, member(J, L1), member(J, L2)), Js).

% function path to give path from X to Y in the required format
path(X, Y, P) :- path(X, Y, [], P).
% V is a list of visited stations to prevent loops
path(X, Y, _, [[X, C, Y]|[]]) :- line(C, R), member(X, R), member(Y, R).
path(X, Y, V, [[X, C1, W]|P2]) :- line(C1, R), member(X, R), junction(C1, _, Z), member(W, Z), W\=X, not(member(W, V)), path(W, Y, [X|V], P2).

% function route to give path from X to Y as a list [[x1,l1,t1,x2],[x2,l2,t2,x3]...] 
% where entry [x, l, t, y] should be read as "from x, take the line l towards t to reach y" 
route(X, Y, R) :- route(X, Y, [], R).
% V is a list of visited stations to prevent loops
route(X, Y, _, [[X, C, T, Y]|[]]) :- line(C, R), member(X, R), member(Y, R), towards(X, Y, R, T).
route(X, Y, V, [[X, C1, T, W]|R2]) :- line(C1, R), member(X, R), junction(C1, _, Z), member(W, Z), W\=X, not(member(W, V)), route(W, Y, [X|V], R2), towards(X, W, R, T).

% These functions will keep giving you all the possible options as you press ';'
% Sometimes, first option may not be the optimal one, you might have to select the most optimal path yourself from the possible paths