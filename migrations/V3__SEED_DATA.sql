
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
   '2004-11-23');

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
   '2004-11-23', 10);

INSERT INTO actor (name, bio, date_of_birth) VALUES
  ('Rowan Atkinson', 'British actor and comedian known for playing Mr. Bean.', '1955-01-06'),
  ('Matilda Ziegler', 'Actress who played Irma Gobb, Mr. Bean''s on-and-off girlfriend.', '1964-07-23'),
  ('Robin Driscoll', 'British actor and writer of Mr. Bean series.', '1951-06-28'),
  ('Jon Glover', 'Voice actor for Mr. Bean in the animated series.', '1952-12-20'),
  ('Richard Wilson', 'Actor who played the strict invigilator in the exam scene.', '1936-07-09'),
  ('Willem Dafoe', 'Played the arrogant American director in *Mr. Bean''s Holiday*.', '1955-07-22'),
  ('Jean Rochefort', 'French actor who played the railway conductor in *Mr. Bean''s Holiday*.', '1930-04-29');

INSERT INTO [scene_actor] (scene_id, actor_id) VALUES
  -- Rowan Atkinson (Mr. Bean) in every scene
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 1),
  (6, 1),
  (7, 1),
  (8, 1),
  (9, 1),
  (10, 1),
  -- Matilda Ziegler (Irma Gobb) in restaurant and apartment scenes
  (3, 2),
  (4, 2),
  -- Richard Wilson (Exam Invigilator) in the exam scene
  (1, 5),
  -- Willem Dafoe (Movie Director) in Mr. Bean’s Holiday
  (7, 6),
  -- Jean Rochefort (Train Conductor) in the railway scene
  (8, 7);

INSERT INTO [dialog] (scene_id, actor_id, line_text, line_order) VALUES
  -- Exam scene
  (1, 1, 'Oh no... I didn’t revise trigonometry!', 1),
  (1, 5, 'You may now begin the exam.', 2),
  -- Church scene
  (2, 1, '*Yawns and dozes off in church*', 1),
  -- Restaurant scene
  (3, 1, 'Steak tartare? That sounds fancy!', 1),
  (3, 2, 'It’s raw! You have to eat it, Bean!', 2),
  -- Airport scene (Mr. Bean’s Holiday)
  (6, 1, 'Where’s my passport? Oh dear.', 1),
  -- Movie premiere scene
  (7, 6, 'This is my masterpiece!', 1),
  (7, 1, '*Thumbs up awkwardly*', 2),
  -- Train scene
  (8, 7, 'Sir, you must have a ticket.', 1),
  (8, 1, '*Holds up a completely useless ticket stub*', 2);

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

INSERT INTO [rating] (user_id, scene_id, rating, timestamp) 
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
(15, 5, 5, '2025-02-17 19:30:00');
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




