EXEC InsertSeries 'Mr. Bean', 
  'A British sitcom starring Rowan Atkinson as the bumbling and eccentric Mr. Bean, who finds himself in bizarre situations with hilarious consequences.', 
  '1990-01-01', 
  '1995-12-31';

EXEC InsertSeries 'Mr. Bean: The Animated Series', 
  'An animated adaptation of the live-action show featuring Mr. Bean`s misadventures, his beloved Teddy, and his landlady Mrs. Wicket.', 
  '2002-01-05', 
  NULL;

EXEC InsertSeries 'Mr. Bean: The Ultimate Collection', 
  'A special compilation of Mr. Bean`s best moments from the original TV series, including iconic sketches.', 
  '2006-01-01', 
  NULL;

EXEC InsertSeries 'Mr. Bean`s Holiday', 
  'A feature film following Mr. Bean as he wins a holiday to France but gets into all sorts of trouble along the way.', 
  '2007-03-30', 
  NULL;

EXEC InsertSeries 'Bean: The Ultimate Disaster Movie', 
  'A movie where Mr. Bean travels to America to guard a valuable painting but causes utter chaos.', 
  '1997-08-07', 
  NULL;

EXEC InsertReelType 'TV Episode';
EXEC InsertReelType 'Movie';
EXEC InsertReelType 'Animated Episode';
EXEC InsertReelType 'Compilation';

-- TV Episodes from "Mr. Bean" (1990-1995)
EXEC InsertReel 1, 1, 'Mr. Bean', 
  'The first episode of Mr. Bean. He struggles with a maths exam, changes into his swimming trunks in a car park, and falls asleep in church.', 
  '1990-01-01';

EXEC InsertReel 1, 1, 'The Return of Mr. Bean', 
  'Mr. Bean goes shopping, dines at a fancy restaurant, and has an amusing encounter with a magician.', 
  '1990-11-05';

EXEC InsertReel 1, 1, 'The Curse of Mr. Bean', 
  'Mr. Bean visits a swimming pool, buys a sandwich in a park, and watches a horror movie at the cinema.', 
  '1990-12-30';

EXEC InsertReel 1, 1, 'Merry Christmas, Mr. Bean', 
  'Mr. Bean celebrates Christmas in his unique way, including messing with a nativity scene and cooking a giant turkey.', 
  '1992-12-29';

EXEC InsertReel 1, 1, 'Do-It-Yourself Mr. Bean', 
  'Mr. Bean hosts a disastrous New Year`s party and paints his apartment in the most chaotic way possible.', 
  '1994-01-10';

-- Movie for "Bean: The Ultimate Disaster Movie"
EXEC InsertReel 2, 2, 'Bean: The Ultimate Disaster Movie', 
  'Mr. Bean is sent to the US to oversee the unveiling of a priceless painting, causing chaos wherever he goes.', 
  '1997-08-07';

-- Movie for "Mr. Bean`s Holiday"
EXEC InsertReel 2, 4, 'Mr. Bean`s Holiday', 
  'Mr. Bean wins a trip to France and inadvertently separates a young boy from his father, leading to a series of hilarious misadventures.', 
  '2007-03-30';

-- Compilation for "Mr. Bean: The Ultimate Collection"
EXEC InsertReel 4, 3, 'Mr. Bean`s Greatest Hits', 
  'A compilation of Mr. Bean`s funniest moments from the TV series.', 
  '2006-06-01';

-- Animated Episodes from "Mr. Bean: The Animated Series"
EXEC InsertReel 3, 2, 'In The Wild', 
  'Mr. Bean goes on a camping trip, but things quickly go awry when he gets lost in the woods.', 
  '2002-01-05';

EXEC InsertReel 3, 2, 'A Running Battle', 
  'Mr. Bean competes in a marathon, but his shortcuts lead to unexpected results.', 
  '2003-02-10';

EXEC InsertReel 3, 2, 'Big TV', 
  'Mr. Bean buys a gigantic television, but getting it inside his apartment proves challenging.', 
  '2003-06-15';

EXEC InsertReel 3, 2, 'Car Trouble', 
  'Mr. Bean`s car breaks down, leading to an unfortunate chain of events.', 
  '2004-11-23';

-- locations needed for the scenes
EXEC InsertLocation 'London University Hall', '123 Exam Road, London', 'UK';
EXEC InsertLocation 'St. James'' Church', '456 Church Lane, London', 'UK';
EXEC InsertLocation 'Fancy French Restaurant', '789 Fine Dining Street, London', 'UK';
EXEC InsertLocation 'Mr. Bean''s Apartment', '231 Flat Street, London', 'UK';
EXEC InsertLocation 'Grierson Art Gallery', '100 Museum Avenue, Los Angeles', 'USA';
EXEC InsertLocation 'Los Angeles International Airport', '1 World Way, Los Angeles', 'USA';
EXEC InsertLocation 'Le Petit Bistro', '25 Rue de Paris, Paris', 'France';
EXEC InsertLocation 'French Railway Station', '101 Gare du Nord, Paris', 'France';
EXEC InsertLocation 'Mr. Bean`s Apartment (Animated)', '231 Cartoon Flat, London', 'UK';
EXEC InsertLocation 'Car Repair Garage', '67 Auto Lane, London', 'UK';

-- scenes
-- Scene from "Mr. Bean" (1990) - The Exam Scene
EXEC InsertScene 1, 0, 'The Maths Exam', 
  'Mr. Bean struggles to complete his maths exam but realizes too late that he studied the wrong subject.', 
  '1990-01-01', 1;

-- Scene from "Mr. Bean" (1990) - The Church Scene
EXEC InsertScene 1, 900, 'Falling Asleep in Church', 
  'Mr. Bean tries to stay awake during a church service but fails miserably.', 
  '1990-01-01', 2;

-- Scene from "The Return of Mr. Bean" - Restaurant Scene
EXEC InsertScene 2, 600, 'Steak Tartare Disaster', 
  'Mr. Bean orders an expensive steak tartare but dislikes it, attempting to hide it around the restaurant.', 
  '1990-11-05', 3;

-- Scene from "Merry Christmas, Mr. Bean" - The Turkey Scene
EXEC InsertScene 4, 1200, 'The Giant Turkey Mishap', 
  'Mr. Bean gets his head stuck inside a giant turkey while preparing Christmas dinner.', 
  '1992-12-29', 4;

-- Scene at the Grierson Art Gallery
EXEC InsertScene 6, 300, 'The Painting Unveiling', 
  'Mr. Bean is tasked with unveiling "Whistler`s Mother", but accidentally ruins the priceless painting.', 
  '1997-08-07', 5;

-- Scene at the Airport
EXEC InsertScene 6, 50, 'Bean vs. Airport Security', 
  'Mr. Bean struggles with airport security, causing chaos at the metal detector.', 
  '1997-08-07', 6;

  -- Scene in Paris
EXEC InsertScene 7, 200, 'Mr. Bean in the French Bistro', 
  'Mr. Bean orders an expensive meal but doesn`t know how to eat oysters.', 
  '2007-03-30', 7;

-- Scene on the Train
EXEC InsertScene 7, 500, 'Bean Loses the Ticket', 
  'Mr. Bean`s train ticket gets stuck in a vending machine, leading to a hilarious chase.', 
  '2007-03-30', 8;

-- Scene from "Big TV"
EXEC InsertScene 10, 100, 'Mr. Bean and the Big TV', 
  'Mr. Bean struggles to get a gigantic television into his apartment.', 
  '2003-06-15', 9;

-- Scene from "Car Trouble"
EXEC InsertScene 11, 200, 'The Mini Gets Towed', 
  'Mr. Bean`s beloved Mini is mistakenly towed, and he tries to retrieve it in his unique way.', 
  '2004-11-23', 10;

EXEC InsertActor 'Rowan Atkinson', 'British actor and comedian known for playing Mr. Bean.', '1955-01-06';
EXEC InsertActor 'Matilda Ziegler', 'Actress who played Irma Gobb, Mr. Bean`s on-and-off girlfriend.', '1964-07-23';
EXEC InsertActor 'Robin Driscoll', 'British actor and writer of Mr. Bean series.', '1951-06-28';
EXEC InsertActor 'Jon Glover', 'Voice actor for Mr. Bean in the animated series.', '1952-12-20';
EXEC InsertActor 'Richard Wilson', 'Actor who played the strict invigilator in the exam scene.', '1936-07-09';
EXEC InsertActor 'Willem Dafoe', 'Played the arrogant American director in *Mr. Bean`s Holiday*.', '1955-07-22';
EXEC InsertActor 'Jean Rochefort', 'French actor who played the railway conductor in *Mr. Bean`s Holiday*.', '1930-04-29';

-- Rowan Atkinson (Mr. Bean) is in every scene
EXEC InsertSceneActor 1, 1;
EXEC InsertSceneActor 2, 1;
EXEC InsertSceneActor 3, 1;
EXEC InsertSceneActor 4, 1;
EXEC InsertSceneActor 5, 1;
EXEC InsertSceneActor 6, 1;
EXEC InsertSceneActor 7, 1;
EXEC InsertSceneActor 8, 1;
EXEC InsertSceneActor 9, 1;
EXEC InsertSceneActor 10, 1;

-- Matilda Ziegler (Irma Gobb) appears in restaurant and apartment scenes
EXEC InsertSceneActor 3, 2;
EXEC InsertSceneActor 4, 2;

-- Richard Wilson (Exam Invigilator) appears in the exam scene
EXEC InsertSceneActor 1, 5;

-- Willem Dafoe (Movie Director) appears in *Mr. Bean’s Holiday*
EXEC InsertSceneActor 7, 6;

-- Jean Rochefort (Train Conductor) appears in the railway scene
EXEC InsertSceneActor 8, 7;

-- Exam scene
EXEC InsertDialog 1, 1, 'Oh no... I didn’t revise trigonometry!', 1;
EXEC InsertDialog 1, 5, 'You may now begin the exam.', 2;

-- Church scene
EXEC InsertDialog 2, 1, '*Yawns and dozes off in church*', 1;

-- Restaurant scene
EXEC InsertDialog 3, 1, 'Steak tartare? That sounds fancy!', 1;
EXEC InsertDialog 3, 2, 'It’s raw! You have to eat it, Bean!', 2;

-- Airport scene (Mr. Bean’s Holiday)
EXEC InsertDialog 6, 1, 'Where’s my passport? Oh dear.', 1;

-- Movie premiere scene
EXEC InsertDialog 7, 6, 'This is my masterpiece!', 1;
EXEC InsertDialog 7, 1, '*Thumbs up awkwardly*', 2;

-- Train scene
EXEC InsertDialog 8, 7, 'Sir, you must have a ticket.', 1;
EXEC InsertDialog 8, 1, '*Holds up a completely useless ticket stub*', 2;

EXEC InsertUser 'beanfan99', 'beanfan99@email.com', '2025-02-17 10:00:00';
EXEC InsertUser 'irmaziegler', 'irma.ziegler@email.com', '2025-02-17 10:05:00';
EXEC InsertUser 'comedylover', 'comedylover@email.com', '2025-02-17 10:10:00';
EXEC InsertUser 'silentmovieguy', 'silentmovieguy@email.com', '2025-02-17 10:15:00';
EXEC InsertUser 'laughoutloud', 'lolbean@email.com', '2025-02-17 10:20:00';
EXEC InsertUser 'retroTVfan', 'retrotv@email.com', '2025-02-17 10:25:00';
EXEC InsertUser 'rowanatkinsonfan', 'rowanbean@email.com', '2025-02-17 10:30:00';
EXEC InsertUser 'classiccomedy', 'classiccomedy@email.com', '2025-02-17 10:35:00';
EXEC InsertUser 'slapsticklover', 'slapstick@email.com', '2025-02-17 10:40:00';
EXEC InsertUser 'tvbinger', 'tvbinger@email.com', '2025-02-17 10:45:00';
EXEC InsertUser 'mrbeanfanatic', 'beanfanatic@email.com', '2025-02-17 10:50:00';
EXEC InsertUser 'britishhumour', 'britishhumour@email.com', '2025-02-17 10:55:00';
EXEC InsertUser 'lolmoments', 'lolmoments@email.com', '2025-02-17 11:00:00';
EXEC InsertUser 'teddyfan', 'teddyfan@email.com', '2025-02-17 11:05:00';
EXEC InsertUser 'nostalgicviewer', 'nostalgic@email.com', '2025-02-17 11:10:00';



-- Inserting user ratings
EXEC InsertRating 1, 1, 5, '2025-02-17 12:30:00'; -- beanfan99
EXEC InsertRating 2, 3, 4, '2025-02-17 13:00:00'; -- comedylover
EXEC InsertRating 3, 2, 3, '2025-02-17 13:30:00'; -- irmaziegler
EXEC InsertRating 4, 4, 5, '2025-02-17 14:00:00'; -- silentmovieguy
EXEC InsertRating 5, 5, 2, '2025-02-17 14:30:00'; -- laughoutloud
EXEC InsertRating 6, 1, 4, '2025-02-17 15:00:00'; -- retroTVfan
EXEC InsertRating 7, 2, 5, '2025-02-17 15:30:00'; -- rowanatkinsonfan
EXEC InsertRating 8, 3, 3, '2025-02-17 16:00:00'; -- classiccomedy
EXEC InsertRating 9, 4, 5, '2025-02-17 16:30:00'; -- slapsticklover
EXEC InsertRating 10, 5, 4, '2025-02-17 17:00:00'; -- tvbinger
EXEC InsertRating 11, 1, 3, '2025-02-17 17:30:00'; -- mrbeanfanatic
EXEC InsertRating 12, 2, 5, '2025-02-17 18:00:00'; -- britishhumour
EXEC InsertRating 13, 3, 2, '2025-02-17 18:30:00'; -- lolmoments
EXEC InsertRating 14, 4, 4, '2025-02-17 19:00:00'; -- teddyfan
EXEC InsertRating 15, 5, 5, '2025-02-17 19:30:00'; -- nostalgicviewer



EXEC InsertComment 1, 1, 'This exam scene is legendary!', '2025-02-17 12:35:00'; -- beanfan99
EXEC InsertComment 2, 3, 'I always laugh when he falls asleep in church.', '2025-02-17 13:05:00'; -- comedylover
EXEC InsertComment 3, 2, 'The steak tartare scene is so gross but hilarious.', '2025-02-17 13:40:00'; -- irmaziegler
EXEC InsertComment 4, 4, 'One of the best Bean moments ever.', '2025-02-17 14:10:00'; -- silentmovieguy
EXEC InsertComment 5, 5, 'Mr. Bean at the airport is peak comedy.', '2025-02-17 14:40:00'; -- laughoutloud
EXEC InsertComment 6, 1, 'Rowan Atkinson’s silent comedy is perfect.', '2025-02-17 15:10:00'; -- retroTVfan
EXEC InsertComment 7, 2, 'Teddy is the real MVP of this scene!', '2025-02-17 15:40:00'; -- rowanatkinsonfan
EXEC InsertComment 8, 3, 'Pure slapstick genius.', '2025-02-17 16:10:00'; -- classiccomedy
EXEC InsertComment 9, 4, 'Mr. Bean’s expressions make everything funnier.', '2025-02-17 16:40:00'; -- slapsticklover
EXEC InsertComment 10, 5, 'The car chase scene is amazing!', '2025-02-17 17:10:00'; -- tvbinger
EXEC InsertComment 11, 1, 'Can’t stop rewatching this episode.', '2025-02-17 17:40:00'; -- mrbeanfanatic
EXEC InsertComment 12, 2, 'So much nostalgia watching this again.', '2025-02-17 18:10:00'; -- britishhumour
EXEC InsertComment 13, 3, 'One of the funniest shows ever!', '2025-02-17 18:40:00'; -- lolmoments
EXEC InsertComment 14, 4, 'Teddy deserves his own episode.', '2025-02-17 19:10:00'; -- teddyfan
EXEC InsertComment 15, 5, 'This scene will never get old.', '2025-02-17 19:40:00'; -- nostalgicviewer


