
INSERT INTO series (title, description, start_date, end_date) VALUES
  ('Mr. Bean', 
   'A British sitcom starring Rowan Atkinson as the bumbling and eccentric Mr. Bean, who finds himself in bizarre situations with hilarious consequences.', 
   '1990-01-01', 
   '1995-12-31'),

  ('Mr. Bean: The Animated Series', 
   'An animated adaptation of the live-action show featuring Mr. Bean`s misadventures, his beloved Teddy, and his landlady Mrs. Wicket.', 
   '2002-01-05', 
   NULL),

  ('Mr. Bean: The Ultimate Collection', 
   'A special compilation of Mr. Bean`s best moments from the original TV series, including iconic sketches.', 
   '2006-01-01', 
   NULL),

  ('Mr. Bean`s Holiday', 
   'A feature film following Mr. Bean as he wins a holiday to France but gets into all sorts of trouble along the way.', 
   '2007-03-30', 
   NULL),

  ('Bean: The Ultimate Disaster Movie', 
   'A movie where Mr. Bean travels to America to guard a valuable painting but causes utter chaos.', 
   '1997-08-07', 
   NULL),

  ('Bean: The Movie Collection', 
   'A collection of both Mr. Bean movies, featuring his hilarious adventures in America and France.', 
   '2007-03-30', 
   NULL),

  ('Mr. Bean Live Performances', 
   'A compilation of Rowan Atkinson’s live performances as Mr. Bean, including rare and exclusive sketches.', 
   '1995-01-01', 
   NULL),

  ('Mr. Bean: The Lost Episodes', 
   'A set of lesser-known and unreleased Mr. Bean sketches that were not included in the main TV series.', 
   '2010-01-01', 
   NULL),

  ('The Best of Mr. Bean', 
   'A definitive collection of Mr. Bean’s funniest moments, remastered with additional commentary.', 
   '2015-12-01', 
   NULL),

  ('Mr. Bean: 30th Anniversary Special', 
   'A special celebrating 30 years of Mr. Bean, featuring classic clips and interviews with Rowan Atkinson.', 
   '2020-09-15', 
   NULL);

INSERT INTO reel_type (type_name) VALUES
  ('TV Episode'),
  ('Movie'),
  ('Animated Episode'),
  ('Compilation');


INSERT INTO reel (reel_type_id, series_id, title, description, release_date) VALUES
  -- TV Episodes from "Mr. Bean" (1990-1995)
  (1, 1, 'Mr. Bean', 
   'The first episode of Mr. Bean. He struggles with a maths exam, changes into his swimming trunks in a car park, and falls asleep in church.', 
   '1990-01-01'),

  (1, 1, 'The Return of Mr. Bean', 
   'Mr. Bean goes shopping, dines at a fancy restaurant, and has an amusing encounter with a magician.', 
   '1990-11-05'),

  (1, 1, 'The Curse of Mr. Bean', 
   'Mr. Bean visits a swimming pool, buys a sandwich in a park, and watches a horror movie at the cinema.', 
   '1990-12-30'),

  (1, 1, 'Merry Christmas, Mr. Bean', 
   'Mr. Bean celebrates Christmas in his unique way, including messing with a nativity scene and cooking a giant turkey.', 
   '1992-12-29'),

  (1, 1, 'Do-It-Yourself Mr. Bean', 
   'Mr. Bean hosts a disastrous New Year`s party and paints his apartment in the most chaotic way possible.', 
   '1994-01-10'),

  -- Movie for "Bean: The Ultimate Disaster Movie"
  (2, 2, 'Bean: The Ultimate Disaster Movie', 
   'Mr. Bean is sent to the US to oversee the unveiling of a priceless painting, causing chaos wherever he goes.', 
   '1997-08-07'),

  -- Movie for "Mr. Bean`s Holiday"
  (2, 4, 'Mr. Bean`s Holiday', 
   'Mr. Bean wins a trip to France and inadvertently separates a young boy from his father, leading to a series of hilarious misadventures.', 
   '2007-03-30'),

  -- Compilation for "Mr. Bean: The Ultimate Collection"
  (4, 3, 'Mr. Bean`s Greatest Hits', 
   'A compilation of Mr. Bean`s funniest moments from the TV series.', 
   '2006-06-01'),

  -- Animated Episodes from "Mr. Bean: The Animated Series"
  (3, 2, 'In The Wild', 
   'Mr. Bean goes on a camping trip, but things quickly go awry when he gets lost in the woods.', 
   '2002-01-05'),

  (3, 2, 'A Running Battle', 
   'Mr. Bean competes in a marathon, but his shortcuts lead to unexpected results.', 
   '2003-02-10'),

  (3, 2, 'Big TV', 
   'Mr. Bean buys a gigantic television, but getting it inside his apartment proves challenging.', 
   '2003-06-15'),

  (3, 2, 'Car Trouble', 
   'Mr. Bean`s car breaks down, leading to an unfortunate chain of events.', 
   '2004-11-23'),
   -- Additional reels for "Bean: The Movie Collection" (Series 6)
  (4, 6, 'Bean: The Movie Collection - Feature Cut', 
   'A special extended cut combining both Mr. Bean movies into a seamless cinematic experience.', 
   '2007-09-01'),

  -- Reels for "Mr. Bean Live Performances" (Series 7)
  (4, 7, 'Rowan Atkinson Live as Mr. Bean', 
   'A collection of live stage performances featuring Rowan Atkinson as Mr. Bean.', 
   '1995-02-10'),

  (4, 7, 'Mr. Bean at the Royal Variety Performance', 
   'Mr. Bean performs live in front of the Royal Family with his signature comedy.', 
   '1990-11-26'),

  (4, 7, 'Mr. Bean - The Stage Show', 
   'Rare footage of Mr. Bean performing in a live stage production.', 
   '1997-05-15'),

  -- Reels for "Mr. Bean: The Lost Episodes" (Series 8)
  (1, 8, 'Mr. Bean and the Wedding', 
   'An unaired episode where Mr. Bean accidentally disrupts a wedding ceremony.', 
   '2011-04-15'),

  (1, 8, 'Mr. Bean Goes to the Dentist', 
   'A lost sketch where Mr. Bean’s trip to the dentist takes a chaotic turn.', 
   '2010-08-20'),

  (1, 8, 'Mr. Bean’s Lost Luggage', 
   'A forgotten episode where Mr. Bean loses his suitcase at the airport.', 
   '2012-02-10'),

  (1, 8, 'Mr. Bean and the Haunted House', 
   'Mr. Bean spends the night in an old mansion, unaware of its spooky secrets.', 
   '2013-10-31'),

  -- Reels for "The Best of Mr. Bean" (Series 9)
  (4, 9, 'The Best of Mr. Bean - Volume 1', 
   'A remastered collection of Mr. Bean’s funniest moments from the TV series.', 
   '2015-12-10'),

  (4, 9, 'The Best of Mr. Bean - Volume 2', 
   'Another collection of Mr. Bean’s hilarious adventures, now in high definition.', 
   '2016-06-15'),

  (4, 9, 'Mr. Bean’s Funniest Pranks', 
   'A collection of Mr. Bean’s best pranks and gags from the TV show.', 
   '2017-03-20'),

  (4, 9, 'Mr. Bean’s Christmas Special Compilation', 
   'A compilation of all the Christmas-themed Mr. Bean episodes.', 
   '2018-12-01'),

  -- Reels for "Mr. Bean: 30th Anniversary Special" (Series 10)
  (4, 10, 'Mr. Bean: 30 Years of Laughter', 
   'A documentary featuring Rowan Atkinson reflecting on 30 years of Mr. Bean.', 
   '2020-09-15'),

  (4, 10, 'Mr. Bean: Fan-Favorite Sketches', 
   'A special episode with hand-picked favorite Mr. Bean moments by fans.', 
   '2020-10-05'),

  (4, 10, 'Mr. Bean - Behind the Scenes', 
   'An exclusive look at the making of Mr. Bean, featuring never-before-seen footage.', 
   '2021-01-25'),

  -- More Animated Episodes for "Mr. Bean: The Animated Series" (Series 2)
  (3, 2, 'The Big Sneeze', 
   'Mr. Bean catches a cold but refuses to let it slow him down.', 
   '2005-06-10'),

  (3, 2, 'Bean’s Wild Ride', 
   'Mr. Bean tries to fix his car, but things quickly spiral out of control.', 
   '2006-09-18'),

  (3, 2, 'Camping Chaos', 
   'A camping trip turns into disaster when Mr. Bean encounters a mischievous bear.', 
   '2007-05-04'),

  (3, 2, 'Ice Cream Trouble', 
   'Mr. Bean competes with a rival to get the last ice cream on a hot summer day.', 
   '2008-08-22');

INSERT INTO location (name, address, country) VALUES
  ('Examination Hall', NULL, 'United Kingdom'),
  ('Church of St. Bean', NULL, 'United Kingdom'),
  ('Fancy Restaurant', NULL, 'United Kingdom'),
  ('Mr. Bean’s Apartment', NULL, 'United Kingdom'),
  ('Grierson Art Gallery', 'Los Angeles, CA', 'United States'),
  ('Heathrow Airport', 'London, UK', 'United Kingdom'),
  ('French Bistro', 'Paris', 'France'),
  ('Train Station', 'Paris', 'France'),
  ('Mr. Bean''s Apartment', NULL, 'United Kingdom'),
  ('Tow Yard', 'London, UK', 'United Kingdom');


INSERT INTO scene (reel_id, timestamp, duration, title, plot_description, filming_date, location_id) VALUES
  -- Scene from "Mr. Bean" (1990) - The Exam Scene
  (1, 0, 300, 'The Maths Exam', 
   'Mr. Bean struggles to complete his maths exam but realizes too late that he studied the wrong subject.', 
   '1990-01-01', 1),

  -- Scene from "Mr. Bean" (1990) - The Church Scene
  (1, 300, 600, 'Falling Asleep in Church', 
   'Mr. Bean tries to stay awake during a church service but fails miserably.', 
   '1990-01-01', 2),

  -- Scene from "The Return of Mr. Bean" - Restaurant Scene
  (2, 0, 500, 'Steak Tartare Disaster', 
   'Mr. Bean orders an expensive steak tartare but dislikes it, attempting to hide it around the restaurant.', 
   '1990-11-05', 3),

  -- Scene from "Merry Christmas, Mr. Bean" - The Turkey Scene
  (4, 0, 900, 'The Giant Turkey Mishap', 
   'Mr. Bean gets his head stuck inside a giant turkey while preparing Christmas dinner.', 
   '1992-12-29', 4),

  -- Scene at the Grierson Art Gallery
  (6, 0, 400, 'The Painting Unveiling', 
   'Mr. Bean is tasked with unveiling "Whistler`s Mother", but accidentally ruins the priceless painting.', 
   '1997-08-07', 5),

  -- Scene at the Airport
  (6, 400, 250, 'Bean vs. Airport Security', 
   'Mr. Bean struggles with airport security, causing chaos at the metal detector.', 
   '1997-08-07', 6),

  -- Scene in Paris
  (7, 0, 300, 'Mr. Bean in the French Bistro', 
   'Mr. Bean orders an expensive meal but doesn`t know how to eat oysters.', 
   '2007-03-30', 7),

  -- Scene on the Train
  (7, 300, 500, 'Bean Loses the Ticket', 
   'Mr. Bean`s train ticket gets stuck in a vending machine, leading to a hilarious chase.', 
   '2007-03-30', 8),

  -- Scene from "Big TV"
  (10, 0, 350, 'Mr. Bean and the Big TV', 
   'Mr. Bean struggles to get a gigantic television into his apartment.', 
   '2003-06-15', 9),

  -- Scene from "Car Trouble"
  (11, 0, 400, 'The Mini Gets Towed', 
   'Mr. Bean`s beloved Mini is mistakenly towed, and he tries to retrieve it in his unique way.', 
   '2004-11-23', 10),
   -- Scenes for "Mr. Bean" (1990)
  (1, 600, 400, 'The Bus Stop Confusion', 
   'Mr. Bean waits at a bus stop but keeps getting outmaneuvered by an old lady.', 
   '1990-01-01', 1),

  (1, 1000, 450, 'The Library Disaster', 
   'Mr. Bean visits the library but accidentally tears a rare book.', 
   '1990-01-01', 2),

  (1, 1450, 500, 'The Haircut Fiasco', 
   'Mr. Bean tries to give himself a haircut but ends up with a ridiculous look.', 
   '1990-01-01', 3),

  -- Scenes for "The Return of Mr. Bean" (1990)
  (2, 500, 350, 'Shopping Mayhem', 
   'Mr. Bean visits a department store and accidentally breaks the mannequins.', 
   '1990-11-05', 3),

  (2, 850, 400, 'Elevator Chaos', 
   'Mr. Bean gets stuck in an elevator with an impatient businessman.', 
   '1990-11-05', 4),

  (2, 1250, 450, 'The Lost Wallet', 
   'Mr. Bean loses his wallet and causes chaos trying to find it.', 
   '1990-11-05', 5),

  -- Scenes for "Merry Christmas, Mr. Bean" (1992)
  (4, 900, 300, 'The Christmas Window Display', 
   'Mr. Bean gets too involved in a department store’s nativity display.', 
   '1992-12-29', 4),

  (4, 1200, 450, 'The Turkey Disaster Part 2', 
   'Mr. Bean tries to serve the turkey but accidentally drops it out the window.', 
   '1992-12-29', 5),

  (4, 1650, 400, 'Gift Wrapping Mishap', 
   'Mr. Bean struggles to wrap Christmas presents in a unique (and messy) way.', 
   '1992-12-29', 6),

  -- Scenes for "Bean: The Movie" (1997)
  (6, 650, 500, 'Sleeping at the Meeting', 
   'Mr. Bean dozes off during a crucial meeting, with hilarious consequences.', 
   '1997-08-07', 5),

  (6, 1150, 350, 'Hotel Room Chaos', 
   'Mr. Bean accidentally destroys his hotel room while trying to set up his luggage.', 
   '1997-08-07', 6),

  (6, 1500, 450, 'The Art Heist', 
   'Mr. Bean sneaks into an art gallery to "fix" the ruined painting.', 
   '1997-08-07', 7),

  -- Scenes for "Mr. Bean’s Holiday" (2007)
  (7, 800, 450, 'The Beach Disaster', 
   'Mr. Bean struggles to change into his swimsuit on a crowded beach.', 
   '2007-03-30', 7),

  (7, 1250, 300, 'The Bicycle Ride', 
   'Mr. Bean "borrows" a child’s bicycle and struggles to ride it through Paris.', 
   '2007-03-30', 8),

  (7, 1550, 500, 'The Train Station Mix-Up', 
   'Mr. Bean accidentally switches train tickets with a stranger and boards the wrong train.', 
   '2007-03-30', 9),

  -- Scenes for "Mr. Bean: The Animated Series" (2003-2004)
  (10, 350, 400, 'The Flying Teddy', 
   'Teddy gets caught in the ceiling fan, and Mr. Bean tries to rescue him.', 
   '2003-06-15', 9),

  (10, 750, 350, 'The DIY Haircut', 
   'Mr. Bean attempts to cut his own hair but ends up with a disastrous result.', 
   '2003-06-15', 9),

  (10, 1100, 500, 'Bean vs. The Laundry Machine', 
   'Mr. Bean’s clothes shrink in the washing machine, and he has to improvise.', 
   '2003-06-15', 10),

  -- Scenes for "Car Trouble" (2004)
  (11, 400, 450, 'The Tow Truck Escape', 
   'Mr. Bean sneaks into the tow yard to retrieve his car but gets locked inside.', 
   '2004-11-23', 10),

  (11, 850, 500, 'The Traffic Jam', 
   'Mr. Bean causes a major traffic jam by trying to parallel park in the smallest space.', 
   '2004-11-23', 1),

  (11, 1350, 450, 'The Gas Station Trouble', 
   'Mr. Bean tries to refuel his Mini but causes havoc at the gas station.', 
   '2004-11-23', 2),

  -- Scenes for "Mr. Bean Live Performances"
  (12, 0, 500, 'Mr. Bean at the Airport', 
   'A live performance where Mr. Bean hilariously interacts with airport security.', 
   '1995-02-10', 6),

  (12, 500, 350, 'The Suitcase Mishap', 
   'Live show: Mr. Bean’s suitcase keeps getting swapped with someone else’s.', 
   '1995-02-10', 6),

  (12, 850, 450, 'Mr. Bean at the Cinema', 
   'A live show segment where Mr. Bean annoys a fellow moviegoer with his antics.', 
   '1995-02-10', 7),

  -- Scenes for "The Best of Mr. Bean" (2015)
  (13, 0, 600, 'Mr. Bean vs. The Photobooth', 
   'A collection of Mr. Bean’s best photo booth disasters.', 
   '2015-12-10', 1),

  (13, 600, 450, 'The Funniest Falls', 
   'A compilation of Mr. Bean’s most ridiculous trips and falls.', 
   '2015-12-10', 2),

  (13, 1050, 500, 'Bean’s Best Animal Moments', 
   'A highlight reel of Mr. Bean’s funniest interactions with animals.', 
   '2015-12-10', 3),

  -- Scenes for "Mr. Bean: 30th Anniversary Special" (2020)
  (14, 0, 700, 'Mr. Bean’s Interview', 
   'A behind-the-scenes look at Rowan Atkinson discussing the origins of Mr. Bean.', 
   '2020-09-15', NULL),

  (14, 700, 500, 'Bean’s Funniest Outtakes', 
   'Never-before-seen bloopers from Mr. Bean episodes.', 
   '2020-09-15', NULL),

  (14, 1200, 550, 'The Lost Episode', 
   'An unaired Mr. Bean sketch is shown for the first time.', 
   '2020-09-15', NULL);

INSERT INTO actor (name, bio, date_of_birth) VALUES
  ('Rowan Atkinson', 'British actor and comedian known for playing Mr. Bean.', '1955-01-06'),
  ('Matilda Ziegler', 'Actress who played Irma Gobb, Mr. Bean''s on-and-off girlfriend.', '1964-07-23'),
  ('Robin Driscoll', 'British actor and writer of Mr. Bean series.', '1951-06-28'),
  ('Jon Glover', 'Voice actor for Mr. Bean in the animated series.', '1952-12-20'),
  ('Richard Wilson', 'Actor who played the strict invigilator in the exam scene.', '1936-07-09'),
  ('Willem Dafoe', 'Played the arrogant American director in *Mr. Bean''s Holiday*.', '1955-07-22'),
  ('Jean Rochefort', 'French actor who played the railway conductor in *Mr. Bean''s Holiday*.', '1930-04-29');

INSERT INTO scene_actor (scene_id, actor_id)
VALUES
  (1, 1), (1, 5),   -- Rowan Atkinson & Richard Wilson
  (2, 1), (2, 3),   -- Rowan Atkinson & Robin Driscoll
  (3, 1), (3, 4),   -- Rowan Atkinson & Jon Glover
  (4, 2), (4, 6),   -- Matilda Ziegler & Willem Dafoe (Rowan Atkinson EXCLUDED)
  (5, 1), (5, 7),   -- Rowan Atkinson & Jean Rochefort
  (6, 3), (6, 7),   -- Robin Driscoll & Jean Rochefort (Rowan Atkinson EXCLUDED)
  (7, 1), (7, 4),   -- Rowan Atkinson & Jon Glover
  (8, 2), (8, 5),   -- Matilda Ziegler & Richard Wilson (Rowan Atkinson EXCLUDED)
  (9, 1), (9, 6),   -- Rowan Atkinson & Willem Dafoe
  (10, 4), (10, 7), -- Jon Glover & Jean Rochefort (Rowan Atkinson EXCLUDED)
  (11, 1), (11, 3), -- Rowan Atkinson & Robin Driscoll
  (12, 2), (12, 5), -- Matilda Ziegler & Richard Wilson (Rowan Atkinson EXCLUDED)
  (13, 1), (13, 6), -- Rowan Atkinson & Willem Dafoe
  (14, 1), (14, 2), -- Rowan Atkinson & Matilda Ziegler
  (15, 4), (15, 6), -- Jon Glover & Willem Dafoe (Rowan Atkinson EXCLUDED)
  (16, 1), (16, 3), -- Rowan Atkinson & Robin Driscoll
  (17, 1), (17, 7), -- Rowan Atkinson & Jean Rochefort
  (18, 1), (18, 6), -- Rowan Atkinson & Willem Dafoe
  (19, 1), (19, 4), -- Rowan Atkinson & Jon Glover
  (20, 1), (20, 2), -- Rowan Atkinson & Matilda Ziegler
  (21, 1), (21, 5), -- Rowan Atkinson & Richard Wilson
  (22, 3), (22, 6), -- Robin Driscoll & Willem Dafoe (Rowan Atkinson EXCLUDED)
  (23, 1), (23, 7), -- Rowan Atkinson & Jean Rochefort
  (24, 1), (24, 2), -- Rowan Atkinson & Matilda Ziegler
  (25, 5), (25, 6), -- Richard Wilson & Willem Dafoe (Rowan Atkinson EXCLUDED)
  (26, 1), (26, 4), -- Rowan Atkinson & Jon Glover
  (27, 1), (27, 3), -- Rowan Atkinson & Robin Driscoll
  (28, 1), (28, 2), -- Rowan Atkinson & Matilda Ziegler
  (29, 1), (29, 6), -- Rowan Atkinson & Willem Dafoe
  (30, 3), (30, 7), -- Robin Driscoll & Jean Rochefort (Rowan Atkinson EXCLUDED)
  (31, 1), (31, 4), -- Rowan Atkinson & Jon Glover
  (32, 1), (32, 5), -- Rowan Atkinson & Richard Wilson
  (33, 1), (33, 6), -- Rowan Atkinson & Willem Dafoe
  (34, 1), (34, 2), -- Rowan Atkinson & Matilda Ziegler
  (35, 1), (35, 3), -- Rowan Atkinson & Robin Driscoll
  (36, 4), (36, 5), -- Jon Glover & Richard Wilson (Rowan Atkinson EXCLUDED)
  (37, 1), (37, 7), -- Rowan Atkinson & Jean Rochefort
  (38, 1), (38, 6), -- Rowan Atkinson & Willem Dafoe
  (39, 1), (39, 2), -- Rowan Atkinson & Matilda Ziegler
  (40, 6), (40, 7); -- Willem Dafoe & Jean Rochefort (Rowan Atkinson EXCLUDED)


INSERT INTO dialog (scene_id, actor_id, line_text, line_order) VALUES
  -- Exam Scene
  (1, 1, 'Oh no... I didn’t revise trigonometry!', 1),
  (1, 5, 'You may now begin the exam.', 2),
  (1, 1, '*Panics and tries to peek at neighbor’s paper*', 3),

  -- Church Scene
  (2, 1, '*Yawns and dozes off in church*', 1),
  (2, 3, 'Amen.', 2),
  (2, 1, '*Snores loudly and wakes himself up*', 3),

  -- Restaurant Scene
  (3, 1, 'Steak tartare? That sounds fancy!', 1),
  (3, 2, 'It’s raw! You have to eat it, Bean!', 2),
  (3, 1, '*Chews slowly, hides meat in napkin*', 3),

  -- Airport Scene (Mr. Bean’s Holiday)
  (6, 1, 'Where’s my passport? Oh dear.', 1),
  (6, 6, 'Sir, you cannot board without a valid passport.', 2),
  (6, 1, '*Checks every pocket, panics*', 3),

  -- Movie Premiere Scene
  (7, 6, 'This is my masterpiece!', 1),
  (7, 1, '*Thumbs up awkwardly*', 2),
  (7, 6, 'Who let him in here?', 3),

  -- Train Scene
  (8, 7, 'Sir, you must have a ticket.', 1),
  (8, 1, '*Holds up a completely useless ticket stub*', 2),
  (8, 7, 'This is for a different train.', 3),
  (8, 1, '*Nods, pretends to understand, stays seated*', 4),

  -- Hotel Check-in
  (9, 1, 'Hello! I have a reservation.', 1),
  (9, 4, 'Under what name, sir?', 2),
  (9, 1, '*Looks confused, shrugs*', 3),

  -- Beach Scene
  (10, 1, 'Perfect spot for a swim!', 1),
  (10, 3, 'Sir, no changing in public!', 2),
  (10, 1, '*Tries to put on swimsuit discreetly, fails*', 3),

  -- Police Station Scene
  (11, 5, 'Sir, do you know why you’re here?', 1),
  (11, 1, '*Shakes head innocently*', 2),
  (11, 5, 'Security cameras say otherwise.', 3),

  -- Art Gallery Scene
  (12, 1, '*Stares at painting intensely*', 1),
  (12, 2, 'Sir, please don’t touch that.', 2),
  (12, 1, '*Accidentally smudges paint, panics*', 3),

  -- Car Park Scene
  (13, 1, 'Just a little more…', 1),
  (13, 3, 'Sir, you can’t park there!', 2),
  (13, 1, '*Ignores, keeps adjusting*', 3),

  -- Mr. Bean’s Wedding Scene
  (14, 1, 'I do!', 1),
  (14, 2, 'Bean, you weren’t supposed to say that yet!', 2),
  (14, 1, '*Shrugs*', 3),

  -- Train Station Scene
  (15, 7, 'All aboard!', 1),
  (15, 1, '*Runs after train, barely makes it*', 2),

  -- French Café Scene
  (16, 1, 'Bonjour! Croissant, please.', 1),
  (16, 6, 'Would you like butter with that?', 2),
  (16, 1, '*Nods, doesn’t understand*', 3),

  -- Amusement Park Scene
  (17, 1, 'One ride, please!', 1),
  (17, 4, 'Sorry, sir, you’re too tall for the kiddie ride.', 2),
  (17, 1, '*Looks disappointed*', 3),

  -- Hospital Scene
  (18, 1, 'I think I swallowed a coin.', 1),
  (18, 5, 'That’s… not good.', 2),

  -- Elevator Scene
  (19, 1, '*Presses all the buttons*', 1),
  (19, 2, 'Really, Bean?', 2),

  -- Library Scene
  (20, 1, '*Opens book, rips page accidentally*', 1),
  (20, 6, 'Shhh!', 2),
  (20, 1, '*Gulps*', 3);


INSERT INTO [users] (username, email, password_hash, join_date) VALUES
  ('beanfan99', 'beanfan99@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 10:00:00'),
  ('irmaziegler', 'irma.ziegler@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 10:05:00'),
  ('comedylover', 'comedylover@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 10:10:00'),
  ('silentmovieguy', 'silentmovieguy@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 10:15:00'),
  ('laughoutloud', 'lolbean@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 10:20:00'),
  ('retroTVfan', 'retrotv@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 10:25:00'),
  ('rowanatkinsonfan', 'rowanbean@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 10:30:00'),
  ('classiccomedy', 'classiccomedy@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 10:35:00'),
  ('slapsticklover', 'slapstick@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 10:40:00'),
  ('tvbinger', 'tvbinger@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 10:45:00'),
  ('mrbeanfanatic', 'beanfanatic@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 10:50:00'),
  ('britishhumour', 'britishhumour@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 10:55:00'),
  ('lolmoments', 'lolmoments@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 11:00:00'),
  ('teddyfan', 'teddyfan@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 11:05:00'),
  ('nostalgicviewer', 'nostalgic@email.com', '$2b$12$ZfJBo4oeb/9VaTtPaIbRrOBB7gTpo5a1eABME1TV6oXHQ0Po.3c0m', '2025-02-17 11:10:00');

INSERT INTO rating (user_id, scene_id, rating, timestamp) 
VALUES 
(1, 1, 5, '2025-02-17 12:30:00'),
(2, 3, 4, '2025-02-17 13:00:00'),
(3, 2, 3, '2025-02-17 13:30:00'),
(4, 4, 5, '2025-02-17 14:00:00'),
(5, 5, 2, '2025-02-17 14:30:00'),
(6, 1, 4, '2025-02-17 15:00:00'),
(7, 2, 5, '2025-02-17 15:30:00'),
(8, 3, 3, '2025-02-17 16:00:00'),
(9, 4, 5, '2025-02-17 16:30:00'),
(10, 5, 4, '2025-02-17 17:00:00'),
(11, 1, 3, '2025-02-17 17:30:00'),
(12, 2, 5, '2025-02-17 18:00:00'),
(13, 3, 2, '2025-02-17 18:30:00'),
(14, 4, 4, '2025-02-17 19:00:00'),
(15, 5, 5, '2025-02-17 19:30:00'),
(1, 6, 4, '2025-02-17 19:45:00'),
(2, 7, 3, '2025-02-17 20:00:00'),
(3, 8, 5, '2025-02-17 20:15:00'),
(4, 9, 2, '2025-02-17 20:30:00'),
(5, 10, 5, '2025-02-17 20:45:00'),
(6, 11, 3, '2025-02-17 21:00:00'),
(7, 12, 4, '2025-02-17 21:15:00'),
(8, 13, 2, '2025-02-17 21:30:00'),
(9, 14, 5, '2025-02-17 21:45:00'),
(10, 15, 4, '2025-02-17 22:00:00'),
(11, 16, 1, '2025-02-17 22:15:00'),
(12, 17, 3, '2025-02-17 22:30:00'),
(13, 18, 5, '2025-02-17 22:45:00'),
(14, 19, 2, '2025-02-17 23:00:00'),
(15, 20, 4, '2025-02-17 23:15:00'),
(1, 21, 5, '2025-02-17 23:30:00'),
(2, 22, 3, '2025-02-17 23:45:00'),
(3, 23, 4, '2025-02-18 00:00:00'),
(4, 24, 2, '2025-02-18 00:15:00'),
(5, 25, 5, '2025-02-18 00:30:00'),
(6, 26, 3, '2025-02-18 00:45:00'),
(7, 27, 4, '2025-02-18 01:00:00'),
(8, 28, 2, '2025-02-18 01:15:00'),
(9, 29, 5, '2025-02-18 01:30:00'),
(10, 30, 4, '2025-02-18 01:45:00'),
(11, 31, 1, '2025-02-18 02:00:00'),
(12, 32, 3, '2025-02-18 02:15:00'),
(13, 33, 5, '2025-02-18 02:30:00'),
(14, 34, 2, '2025-02-18 02:45:00'),
(15, 35, 4, '2025-02-18 03:00:00'),
(1, 36, 3, '2025-02-18 03:15:00'),
(2, 37, 5, '2025-02-18 03:30:00'),
(3, 38, 2, '2025-02-18 03:45:00'),
(4, 39, 4, '2025-02-18 04:00:00'),
(5, 40, 3, '2025-02-18 04:15:00');
GO

INSERT INTO [comment] (user_id, scene_id, comment_text, timestamp) 
VALUES 
(1, 1, 'This exam scene is legendary!', '2025-02-17 12:35:00'),
(2, 3, 'I always laugh when he falls asleep in church.', '2025-02-17 13:05:00'),
(3, 2, 'The steak tartare scene is so gross but hilarious.', '2025-02-17 13:40:00'),
(4, 4, 'One of the best Bean moments ever.', '2025-02-17 14:10:00'),
(5, 5, 'Mr. Bean at the airport is peak comedy.', '2025-02-17 14:40:00'),
(6, 1, 'Rowan Atkinson’s silent comedy is perfect.', '2025-02-17 15:10:00'),
(7, 2, 'Teddy is the real MVP of this scene!', '2025-02-17 15:40:00'),
(8, 3, 'Pure slapstick genius.', '2025-02-17 16:10:00'),
(9, 4, 'Mr. Bean’s expressions make everything funnier.', '2025-02-17 16:40:00'),
(10, 5, 'The car chase scene is amazing!', '2025-02-17 17:10:00'),
(11, 1, 'Can’t stop rewatching this episode.', '2025-02-17 17:40:00'),
(12, 2, 'So much nostalgia watching this again.', '2025-02-17 18:10:00'),
(13, 3, 'One of the funniest shows ever!', '2025-02-17 18:40:00'),
(14, 4, 'Teddy deserves his own episode.', '2025-02-17 19:10:00'),
(15, 5, 'This scene will never get old.', '2025-02-17 19:40:00');
GO




